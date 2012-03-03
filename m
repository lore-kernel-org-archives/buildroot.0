From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Mar 2012 17:00:48 +0000
Subject: [Buildroot] Kernel and buildroot in 1MB
In-Reply-To: <4F525794.5010406@yahoo.co.uk>
References: <4F4EC83C.7090208@yahoo.co.uk> <201203031529.36487.arnout@mind.be>
 <4F525794.5010406@yahoo.co.uk>
Message-ID: <201203031700.49091.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hoi Biff,

 Please always respond to the list (which should happen automatically
when you press reply) and please don't top-post.

On Saturday 03 March 2012 17:40:36 bifferos wrote:
> Yes, I'm fairly new to buildroot, so it was all a bit of a hack!

 A lot of good work starts as a hack :-)

> However, I haven't really finished yet, and wanted to get RTAI working 
> in the same system.  Unfortunately HAL patches are not available for 
> that kernel, so I planned to switch to 2.6.37.6 where they do work.  
> There is also a HAL patch for 2.6.38.8, however I had some difficulties 
> to get RTAI cross-compiling with that version.
> 
> My instructions need to be corrected, because BR2_PREFER_STATIC_LINK 
> does the job much better than my hack.  It only consumes about 20k extra 
> (compressed) over my hand-crafted minimal rootfs, although I noticed 
> that it still creates applet links regardless of whether the given 
> applets have been selected for build.  Probably not a significant space 
> overhead, just slightly confusing.

 That shouldn't happen!  The applet links are created by the busybox
build system and should be based on the busybox configuration.  Which
applets are wrongly linked?  Can you find in the build log where they
were created?  Or possibly they're a left-over from a previous build;
did you run a make clean?


> One thing that could be improved in buildroot, is some setting to give 
> the minimum required busybox functionality for it to function without 
> error.

 We could add a busybox_minimal config.

> I *think* this is something like:
> 
> cat
> run-parts
> init
> support for shadow passwords
> getty
> login
> mount
> umount
> swapoff
> ifupdown
> hostname
> killall
> hush -> support for for, while, until
> hush -> support for case ... esac
> 
> Of course, having utilities like 'ls' is also pretty useful, but not 
> required :).  I think it was the 'shadow passwords' that had be confused 
> for a while because you don't get any error message about it when you 
> try to log in (which is what you would expect).
> 
> Thanks for the patch, I'll try to adapt it for the earlier kernel and 
> re-submit it.

 Actually, we prefer to have a minimal working config in buildroot, so
without RTAI.  And with the latest stable kernel (that's why I moved
back from 3.3-rc1 to 3.2.x).


> regards,
> Biff.

[snip]

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120303/c638e683/attachment-0001.html>
