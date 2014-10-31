From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 31 Oct 2014 22:39:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/openssl: drop libdl from more
	pc files
References: <1411835343-32736-1-git-send-email-bernd.kuhls@t-online.de>
 <20141029234038.7f3d1c11@free-electrons.com>
Message-ID: <XnsA3D7E68546F3CberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20141029234038.7f3d1c11 at free-electrons.com:

> Is there some other package needed in the game to reproduce the issue?

Hi,

yes, libssh2 is also needed to trigger the bug, but openssl is the package to 
be fixed. Please try with this defconfig:

BR2_bfin=y
BR2_BINFMT_FLAT=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_LIBSSH2=y
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_LIBCURL=y
# BR2_TARGET_ROOTFS_TAR is not set

Regards, Bernd
