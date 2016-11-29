From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Nov 2016 00:28:39 +0100
Subject: [Buildroot] [PATCH] package/tvheadend: bump version to
 v4.1-2345 and fix version reporting
In-Reply-To: <20161128220315.1924903c@free-electrons.com>
References: <20161128103231.21626-1-damjan.marion@gmail.com>
 <20161128220315.1924903c@free-electrons.com>
Message-ID: <43658324-6d70-5223-0d86-fb85c5a2d822@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-11-16 22:03, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 28 Nov 2016 11:32:31 +0100, Damjan Marion wrote:
>> tvheadedend tracks version information based on git version
>> numbers. As tvheadend is downloaded as tarball form github
>> it was reporting version 0.0.0~unknown.
>>
>> Signed-off-by: Damjan Marion <damjan.marion@gmail.com>
> 
> Could you split the bump and the version fix reporting in two separate
> patches?
> 
>> -TVHEADEND_VERSION = 50a370707aedf5c127e92bb517c378aa8ac04657
>> +TVHEADEND_VERSION = v4.1-2345-g04ff649
> 
> Please keep this as a full hash, like it used to be. It should still
> work fine with the version reporting, if you write this version to
> $(@D)/rpm/version, like you're doing below.

 I'd like to challenge this. We prefer hashes instead of tags because tags may
still be changed while a hash is guaranteed stable. However, the same can be
said of tarballs. For tarballs we have the hashes to detect such a situation,
for VCS downloads we can do the same (if we check hashes).

 In this particular case, however, it's a github-helper URL so it is a stable
tarball with a hash, so there is no reason not to use a tag.

 Here, it's not actually a tag, but rather than a 'describe' on top of a tag.
Still, it uniquely identifies a commit, and it's more descriptive than just the
sha1. For example, with the describe, you can immediately see between two
versions which one is the most recent one[1]. So I do think there is value in
providing a 'describe' version rather than just a sha1.

 There's one issue, however. v4.1-2345-g04ff649 works now because 04ff649 is a
unique abbreviation. But when later another commit is generated that starts with
04ff649, you need to use v4.1-2345-g04ff649a. So I guess it should be
v4.1-2345-g04ff649a4c13229ebcaa9828fa04339a49842dd5.

 Regards,
 Arnout


[1] Well, not entirely, because v4.1.10 may be more recent than 4.2.6, but still
it's more descriptive.

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
