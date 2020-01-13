From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jan 2020 08:33:02 +0100
Subject: [Buildroot] [git commit] package/ti-cgt-pru: specify need for
 32-bit host libraries
Message-ID: <20200113072331.7B6088138C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=efea700bb80f3d695be1fb99d5da5a00a98c1d96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/787/7875507cc1009c9a495695f9d9ecb974530a3f72

The downloaded source for the ti-cgt-pru package is an installer that
requires 32-bit host libraries for extraction. Specify this dependency
in the package configuration [1].

[1] http://lists.busybox.net/pipermail/buildroot/2020-January/271416.html

Signed-off-by: Ash Charles <ashcharles@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ti-cgt-pru/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ti-cgt-pru/Config.in.host b/package/ti-cgt-pru/Config.in.host
index a36633705d..eab3cd72d5 100644
--- a/package/ti-cgt-pru/Config.in.host
+++ b/package/ti-cgt-pru/Config.in.host
@@ -7,6 +7,7 @@ config BR2_PACKAGE_HOST_TI_CGT_PRU_ARCH_SUPPORTS
 config BR2_PACKAGE_HOST_TI_CGT_PRU
 	bool "host ti-cgt-pru"
 	depends on BR2_PACKAGE_HOST_TI_CGT_PRU_ARCH_SUPPORTS
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  This package provides the Code Generation Tools for the PRU
 	  unit found on some TI processors e.g. AM3358.
