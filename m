From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 17 Feb 2016 01:28:46 +0100
Subject: [Buildroot] problem adding new package libcapn
In-Reply-To: <20160216224543.6a2a3558@free-electrons.com>
References: <56C10733.8040706@proximus.be> <56C3970E.5090405@mind.be>
 <20160216224543.6a2a3558@free-electrons.com>
Message-ID: <56C3BEBE.5040901@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16-02-16 22:45, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 16 Feb 2016 22:39:26 +0100, Arnout Vandecappelle wrote:
> 
>>> 1) I am not sure how the git submodule update --init is handled in buildroot.
>>
>>  If you need it, then you have to:
>>
>> - add an EXTRA_DOWNLOADS of the tarball (using the github macro);
>>
>> - add a POST_EXTRACT_HOOKS to extract the tarball in the right subdirectory.
> 
> I have the impression that this 'git submodule' thing is used more and
> more, and that Buildroot not having support to automatically fetch
> submodules is causing troubles to a number of people.

 I think what we really see more and more is that packages are distributed
straight from git instead of through release tarballs. Tarballs often have the
submodules handled properly.

> 
> Not later than today, a colleague of mine also asked me about this,
> since he is packaging something that uses submodules.
> 
> But very often, submodules are used to "bundle" libraries that should
> rather be packaged as separate packages.

 But in that case there is often a tight dependency between them, which makes
unbundling tough and usually unwanted by upstream. WebEngine is the perfect example.

 Actually, we are doing a kind of bundling as well (or at least, having tight
dependencies) by fixating a specific version of each package, and worse yet by
patching them.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
