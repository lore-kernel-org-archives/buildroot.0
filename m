From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Sep 2020 21:57:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/libcap: needs MMU
In-Reply-To: <20200913165048.2685092-1-fontaine.fabrice@gmail.com>
References: <20200913165048.2685092-1-fontaine.fabrice@gmail.com>
Message-ID: <20200913215759.52b621f5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 13 Sep 2020 18:50:48 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libcap uses fork() since version 2.33 and
> https://git.kernel.org/pub/scm/linux/kernel/git/morgan/libcap.git/commit/?id=ef485973d5547431782f9e5f4323eabfebb38622
> 
> So add MMU dependency to avoid the following build failure on
> applications using libcap without MMU such as ntp:
> 
> /tmp/instance-0/output-1/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: /tmp/instance-0/output-1/host/bin/../arm-buildroot-uclinux-uclibcgnueabi/sysroot/usr/lib/libcap.a(cap_proc.o): in function `cap_launch':
> /tmp/instance-0/output-1/build/libcap-2.42/libcap/cap_proc.c:912: undefined reference to `fork'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/89f39dae01c07977062b909079bfcd45a68060d3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I've applied, but after dropping the BR2_USE_MMU dependency on the
BR2_PACKAGE_LIBCAP_TOOLS option, since it was no longer needed. As
suggested by Baruch, I've added a note in the commit log to say that
all reverse dependencies of libcap already have a BR2_USE_MMU
dependency.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
