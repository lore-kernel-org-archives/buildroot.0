From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 May 2017 16:08:55 +0200
Subject: [Buildroot] [PATCH 1/3] package/mplayer: disable inline sse on
 i386
In-Reply-To: <20170513150918.25427-1-bernd.kuhls@t-online.de>
References: <20170513150918.25427-1-bernd.kuhls@t-online.de>
Message-ID: <20170514160855.2dea324b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 13 May 2017 17:09:16 +0200, Bernd Kuhls wrote:
> Fixes
> 
> libavcodec/x86/ac3dsp_init.c: In function 'ac3_downmix_sse':
> libavcodec/x86/ac3dsp_init.c:161:9: error: can't find a register in class 'GENERAL_REGS' while reloading 'asm'
> libavcodec/x86/ac3dsp_init.c:165:9: error: can't find a register in class 'GENERAL_REGS' while reloading 'asm'
> libavcodec/x86/ac3dsp_init.c:161:9: error: 'asm' operand has impossible constraints
> libavcodec/x86/ac3dsp_init.c:165:9: error: 'asm' operand has impossible constraints
> libavcodec/x86/ac3dsp_init.c:174:9: error: 'asm' operand has impossible constraints
> 
> found by autobuilder job
> http://autobuild.buildroot.net/results/9f5/9f5a497c6242860fb67a5aa2996c3509f49a4564//
> 
> Please note that this patch alone will not fix all build errors, sse2
> and mmxext show similar errors and are fixed by follow-up patches.

All of this is very messy. Why isn't the ffmpeg code building properly
on x86 ? It's a major platform, shouldn't x86 just work ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
