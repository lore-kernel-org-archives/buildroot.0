From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Nov 2015 20:59:55 +0100
Subject: [Buildroot] [PATCH v7] board: add support for Intel Galileo Gen
	2
In-Reply-To: <1447175442.3010.65.camel@intel.com>
References: <1445359684.18938.6.camel@intel.com> <56314C13.5030302@mind.be>
 <1447175442.3010.65.camel@intel.com>
Message-ID: <56424CBB.2080306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10-11-15 18:10, Kinsella, Ray wrote:
[snip]
>>  Why not just hard link all of these instead of loading them as modules? The
>> drivers that differ between the two modules are so small that it's not going to
>> make a significant difference in kernel size.
> 
> Ok I will figure out which ones are not model specific and hard link
> them.  I seem to have some memory the model specific ones are mutually
> exclusive, they shouldn't be loaded at the same time, will need to
> verify.

 If that's the case, please mention it in the commit log.

 Regards,
 Arnout

> 
>>  Perhaps add a comment here that this version is needed for the -Wl,... option.
> Agreed,
> 
>>  Can we use ext4 instead?
> Agreed,
> 
>>
>>> +BR2_TARGET_ROOTFS_EXT2_LABEL="rootfs.ext2"
>>
>>  That's not needed.
> Ok.
> 
> Ray K
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
