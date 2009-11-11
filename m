From: Gordon Smith <spider.karma+busybox.net@gmail.com>
Date: Wed, 11 Nov 2009 13:01:31 -0700
Subject: [Buildroot] Problem: Custom kernel version results in mangled KVER
	in module directory.
Message-ID: <2df568dc0911111201w64f1c313hcfe22d8460e353e6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For example, menuconfig
? Kernel
??? Linux Kernel Version (Linux <custom> version)
??? (2.6.27.35) Linux Tarball version
??? (2.6.27.35) Linux Version

results in
? project_build_i686/lsdtm/linux-2.6.27.35/drivers
  project_build_i686/lsdtm/root/lib/modules/2.6.272.6.27.35/kernel/drivers

The KVER 2.6.272.6.27.35 is unexpected.

Meanwhile
? Kernel
??? Linux Kernel Version (Linux <custom> version)
??? (2.6.27.35) Linux Tarball version
??? () Linux Version

results in:
  project_build_i686/lsdtm/linux-/drivers
  project_build_i686/lsdtm/root/lib/modules/2.6.27.35/kernel/drivers


This is buildroot 2009.08.
