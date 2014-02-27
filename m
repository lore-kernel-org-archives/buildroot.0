From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 27 Feb 2014 21:16:28 +0100
Subject: [Buildroot] Qt5 and gpu-viv-bin-mx6q problem
In-Reply-To: <CACP2RPZb4V-hv61+eSq_pAaah8jmzXCFVr7hMN_jR=VzQDzFOA@mail.gmail.com>
References: <CACP2RPZb4V-hv61+eSq_pAaah8jmzXCFVr7hMN_jR=VzQDzFOA@mail.gmail.com>
Message-ID: <530F9D1C.7020100@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/27/14 09:22, Massimiliano Marretta wrote:
> Dear,
> 
> I have some problem to obtain a buildroot with Qt5 and gpu-viv-bin-mx6q.
> Where is the correct combination of toolchain and floating point strategy ?
> 
> I try some combination of toolchains with the last stable version of
> buildroot (2013.11).
> 
> - If I use the last codebanch toolchain the gpu-viv-bin-mx6q examples and
> the Qt5 qmlscene crash with segmentation fault.

 That's the combination I used successfully in the past:

BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109=y
BR2_PACKAGE_GPU_VIV_BIN_MX6Q=y
BR2_PACKAGE_QT5BASE_LINUXFB=y
BR2_PACKAGE_QT5BASE_DIRECTFB=y

 This was with an old buildroot however (2012.08 with a lot of additional
patches).

> - If I use the last buildroot linaro toolchain 4.8-2013.09, the system
> not start because the kernel is to old ( 3.0.35 ).
> - If I use the toolchain linaro-4.7-2013.01 the Qt5 qmlscene exit without
> message and gpu-viv-bin-mx6q examples not start with the message program
> not found.

 I think that gpu-viv-bin-mx6q are softfp libraries, so they won't work
with Linaro (hardfp) toolchains. I'm surprised that qt5 builds at all in
that case...


 Regards,
 Arnout

> 
> Best Regards,
> Massimiliano Marretta      
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
