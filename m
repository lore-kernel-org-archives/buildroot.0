From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Jul 2015 00:19:49 +0200
Subject: [Buildroot] [PATCH v6 07/16] package/opencv: disable all
 modules by default
In-Reply-To: <20150626153646.GE27480@free.fr>
References: <1435262397-888-1-git-send-email-s.martin49@gmail.com>
 <1435262397-888-8-git-send-email-s.martin49@gmail.com>
 <20150626153646.GE27480@free.fr>
Message-ID: <559AFF05.30604@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/26/15 17:36, Yann E. MORIN wrote:
> Samuel, All,
> 
> On 2015-06-25 21:59 +0200, Samuel Martin spake thusly:
>> This change allows to reduce the size of the default OpenCV package, so
>> the final root filesystem.
>>
>> However, this will break any existing defconfig enabling OpenCV. Indeed,
>> a minimal OpenCV  package will be built, whereas, prior to applying this
>> patches, a full-featured one would have been built instead.
>>
>> Cc: "Yann E. Morin" <yann.morin.1998@free.fr>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> Although I'm usually not opposed to getting the smallest possible config
> as a default, however as you say this one breaks existing defconfigs.
> 
> OTOH, do we really care?

 I think we break defconfigs (as in, the result of 'make savedefconfig') fairly
often without really noticing. An obvious example is the kernel headers version.
But also for example with the ARM ABI rework (I'm not 100% sure but I think
there are defconfigs that would have changed).

 So I think breaking defconfigs is OK. To update to a new buildroot version you
should start from a full .config, not a defconfig.

 Regards,
 Arnout


> 
> Anyway, I won't ack this one, but I am not opposed to it being merged
> either.

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
