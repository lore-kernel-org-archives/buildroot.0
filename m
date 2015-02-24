From: guillaume william brs <guillaume.bressaix@gmail.com>
Date: Mon, 23 Feb 2015 20:57:08 -0700
Subject: [Buildroot] FFTW optimized for ARM and NEON FPU
Message-ID: <54EBF694.6090705@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am working on a cortex-a9 (zynq SoC, mainly zc706)
I faced fairly slow computations of FFT using this library with the 
default configuration (20MFlops).

I modified package/fftw.mk to optimize the library compilation as long 
as an FPU is available,
NEON in this case: this increased the number of MFlops to 500-600.

-- 
guillaume william bres-saix
software engineer
NIST - Time & Frequency div.
325 Broadway, Boulder, CO 80305.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: fftw.patch
Type: text/x-diff
Size: 665 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150223/11a9087c/attachment.bin>
