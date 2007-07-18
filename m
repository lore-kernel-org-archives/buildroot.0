From: Jerry Richards <jerryr@tonecommander.com>
Date: Wed, 18 Jul 2007 11:19:46 -0700
Subject: [Buildroot] Buildroot Build Procedure
Message-ID: <000b01c7c968$39211680$2c48a8c0@greyhawk.tonecommander.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

My understanding is my buildroot/Makefile will re-build the toolchain and
the
buildroot/build_mipsel_nofpu/linux-2.6.10_dev-malta-mips2_fp_len/Makefile
will re-build my kernel.  This is correct?

I also want to write some applications to the root filesystem prior to
compressing it (i.e. to CRAMFS or SQUASHFS).

Since the buildroot make creates the compressed filesystem, I find I must
run it twice (steps 2 & 7, below) as shown in the following complete
re-build:

	1) In <>/buildroot, execute "make clean".
	2) In <>/buildroot, execute "make".
	3) In <>/buildroot/build_m*/lin*, execute "make clean".
	4) In <>/buildroot/build_m*/lin*, execute "make".
	5) In <>/apps, execute "make clean".
	6) In <>/apps, execute "make".
	7) Copy application(s) to <>/buildroot/build_m*/root/...
	8) In <>/buildroot, execute "make".   <------- TO CREATE COMPRESSED FS
	9) Done.

Is this the correct procedure?  Is there a shortcut I'm missing?

Then, if I want to just do a build (not re-build) of everything I should do
the following?

	2) In <>/buildroot, execute "make".
	4) In <>/buildroot/build_m*/lin*, execute "make".
	6) In <>/apps, execute "make".
	7) Copy application(s) to <>/buildroot/build_m*/root/...
	8) In <>/buildroot, execute "make".   <------- TO CREATE COMPRESSED FS
	9) Done.

Best Regards,
Jerry
