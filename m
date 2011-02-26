From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 26 Feb 2011 09:51:37 +0000 (UTC)
Subject: [Buildroot] [Bug 3325] ffmpeg fails to build
In-Reply-To: <bug-3325-163@https.bugs.busybox.net/>
References: <bug-3325-163@https.bugs.busybox.net/>
Message-ID: <20110226095137.ED1168F780@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3325

--- Comment #1 from S?rgio <sergio@sergiomb.no-ip.org>  ---
(In reply to comment #0)
> In file included from libavcodec/x86/dsputil_mmx.c:31:0:
> libavcodec/x86/mmx.h:24:2: warning: #warning Everything in this header is
> deprecated, use plain __asm__()! New code using this header will be rejected.
> In file included from libavcodec/x86/dsputil_mmx.c:1772:0:
> libavcodec/x86/h264dsp_mmx.c: In function 'put_h264_qpel4_h_lowpass_3dnow':
> libavcodec/x86/h264dsp_mmx.c:2058:1: error: can't find a register in class
> 'GENERAL_REGS' while reloading 'asm'
> libavcodec/x86/h264dsp_mmx.c:2058:1: error: 'asm' operand has impossible
> constraints
> make[1]: *** [libavcodec/x86/dsputil_mmx.o] Error 1
> make[1]: Leaving directory `/mnt/usb/repos/buildroot/output/build/ffmpeg-0.5.3'
> make: *** [/mnt/usb/repos/buildroot/output/build/ffmpeg-0.5.3/.stamp_built]
> Error 2


this have similarities to https://bugs.busybox.net/show_bug.cgi?id=2839
So "try using gcc 4.3.x instead of the (experimental) 4.5.x, this will probably
fix
most of your constraint issues."

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
