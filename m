From: Marcelo Gutierrez <kuyurix@gmail.com>
Date: Thu, 27 Feb 2014 17:08:33 -0300
Subject: [Buildroot] [PATCH 1/1] ti-gfx: bump to version 5_01_00_01
In-Reply-To: <87vbw2dmqi.fsf@dell.be.48ers.dk>
References: <52fd38fd.870eec0a.7f7f.13a5@mx.google.com>
 <20140223193116.GI32759@free.fr>
 <87mwhhob73.fsf@dell.be.48ers.dk> <87vbw2dmqi.fsf@dell.be.48ers.dk>
Message-ID: <CA+kK6Wt1obEVFsk_G_RPrhn6ViVxXVRq11JvT3mrqW0dQUWuCA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter, all

Ehh, but the newclkapi patch no longer applies:
>
> Applying ti-gfx-newclkapi.patch using patch:
> patching file GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c
> Hunk #1 FAILED at 153.
> Hunk #2 FAILED at 167.
> Hunk #3 FAILED at 233.
> Hunk #4 FAILED at 246.
> Hunk #5 succeeded at 540 (offset 166 lines).
> Hunk #6 FAILED at 444.
> Hunk #7 FAILED at 490.
> 6 out of 7 hunks FAILED -- saving rejects to file
> GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c.rej
> Patch failed!  Please fix ti-gfx-newclkapi.patch!
> make: *** [/home/peko/source/buildroot/
> output/build/ti-gfx-5_01_00_01/.stamp_patched] Error 1
>
> Could you please send a patch to fix it?
>

I wonder if we need to apply that patch?

All I can say that SGX version works great on BBB(ti-kernel 3.12 using
beaglebone_defconfig)

Regards,
Marcelo




2014-02-26 10:31 GMT-03:00 Peter Korsgaard <peter@korsgaard.com>:

> >>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:
>
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  >> Marcelo, All,
>  >> On 2014-02-13 18:38 +0000, kuyurix at gmail.com spake thusly:
>  >>> From: Marcelo Gutierrez <kuyurix@gmail.com>
>  >>>
>  >>> Signed-off-by: Marcelo Gutierrez <kuyurix@gmail.com>
>
>  >> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
>  >> Notes:
>
>  >> - The version pointed to by Spencer was 5.00.x, and was a beta
>  >> version, and only contained the hardfp variant. The version in
>  >> this patch is 5.01.x, is not marked as beta, and contains both
>  >> the hardfp and softfp variants.
>
>  >> - With 4.10.x and before, the *_$(TI_GFX_VERSION).bin archive would
>  >> contain a huge load of stuff we did not need, and was roughly
>  >> 1.7GiB big. But with 5.01.x, this file is now back to a more
>  >> acceptable size, roughly 140MiB (although it still contains way
>  >> much more than we need).
>
>  > Sounds good. Committed to next, thanks both.
>
> Ehh, but the newclkapi patch no longer applies:
>
> Applying ti-gfx-newclkapi.patch using patch:
> patching file GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c
> Hunk #1 FAILED at 153.
> Hunk #2 FAILED at 167.
> Hunk #3 FAILED at 233.
> Hunk #4 FAILED at 246.
> Hunk #5 succeeded at 540 (offset 166 lines).
> Hunk #6 FAILED at 444.
> Hunk #7 FAILED at 490.
> 6 out of 7 hunks FAILED -- saving rejects to file
> GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c.rej
> Patch failed!  Please fix ti-gfx-newclkapi.patch!
> make: ***
> [/home/peko/source/buildroot/output/build/ti-gfx-5_01_00_01/.stamp_patched]
> Error 1
>
> Could you please send a patch to fix it?
>
> I also see that 5_01_01_01 is out:
>
>
> http://tigraphics.blogspot.be/2014/02/1q-2014-linux-graphics-sdk-release.html
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140227/f9743bad/attachment.html>
