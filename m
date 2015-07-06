From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Jul 2015 01:04:15 +0200
Subject: [Buildroot] [PATCH] pkg-kconfig: .config target needs to take
 into account package dependencies
In-Reply-To: <20150705153034.74fd2b66@free-electrons.com>
References: <1435956134-9543-1-git-send-email-arnout@mind.be>
 <20150703220237.GI3652@free.fr> <20150705153034.74fd2b66@free-electrons.com>
Message-ID: <559B096F.80607@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/05/15 15:30, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 4 Jul 2015 00:02:37 +0200, Yann E. MORIN wrote:
> 
>>> +# Generating the .config file is part of the configure step of the package
>>> +# infrastructure, so it should be ordered like it. IOW, it should take over
>>> +# its dependencies.
>>> +$$($(2)_DIR)/.config: | $$($(2)_FINAL_DEPENDENCIES)
>>
>> OK, I see the point.
>>
>> However, when Thomas DS. and I did the infra, we explicitly avoided this
>> dependency, for a simple reason: we did not want to have to build the
>> dependencies of a package just to 'menuconfig' it, like so:
>>
>>     make menuconfig   <- enable kernel
>>     make linux-menuconfig
>>
>> Currently, all we need at that moment is that linux be downloaded,
>> extracted and patched, then we can show the menuconfig.
>>
>> With your proposed patch, it means all the Linux dependencies
>> (host-kmod, lzop...) will have to be built before we can show the
>> menuconfig. This was the situation we were in before we had the
>> kconfig-package infra, and it is *very* frustrating... :-(
> 
> I agree that having to build all dependencies of linux just to run
> "make linux-menuconfig" is a bit annoying. So finding a solution to
> keep this behavior would be nice.

 OK, fair enough, marked as rejected.

 This does warrant a comment in pkg-kconfig.mk to avoid rehashing this in the
future.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
