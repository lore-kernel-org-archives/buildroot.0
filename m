From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 04 Aug 2014 21:54:21 +0200
Subject: [Buildroot]
	=?utf-8?q?Fw=3A_Build_failed_in_Jenkins=3A_buildroot_?=
	=?utf-8?q?=C2=BB__raspberrypi=5Fdefconfig_=23320?=
References: <20140804084458.60f38d5d@free-electrons.com>
Message-ID: <XnsA37FDED614C14berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20140804084458.60f38d5d at free-electrons.com: 

> cannot stat
> '<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_de
> fconfig/ws/output/build/linux-0b8e8118dd2c9440bb7a2da1a19e15e324d3c09b/ar
> ch/arm/configs/bcmrpi_quick_defconfig'>: No such file or directory make:

Hi,

sent a patch to bump kernel again:
http://patchwork.ozlabs.org/patch/376429/

There is a, imho, weird thing about the git repo for raspberry linux:

Looking at the two last commits in
https://github.com/raspberrypi/linux/commits/rpi-3.12.y

- Linux 3.12.26
d83a3234d2e1e2a55e7f2430fc9ca29a9bd315e7

and

- Merge remote-tracking branch 'stable/linux-3.12.y' into rpi-3.12.y
353043394c99ed37a4075da228af64468fdf6c06

The former does not contain bcmrpi_quick_defconfig
https://github.com/raspberrypi/linux/tree/d83a3234d2e1e2a55e7f2430fc9ca29a9
bd315e7/arch/arm/configs

The later one contains bcmrpi_quick_defconfig however
https://github.com/raspberrypi/linux/tree/353043394c99ed37a4075da228af64468
fdf6c06/arch/arm/configs

although the commit 
https://github.com/raspberrypi/linux/commit/7b45dd4ca24cd47b5cfa887934ed7d2
fa420e6d4 introducing the file contains the tag rpi-3.12.y, according to 
the github web interface.

Maybe I have yet to learn something about github, but now the kernel 
compiles again, still does Kodi 14.0a2-Helix.

Regards, Bernd
