From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Aug 2014 23:02:58 +0200
Subject: [Buildroot] [git commit] toolchain: fix 3.16 selection for custom
	version
Message-ID: <20140806210309.3D8EA9D3C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e3d3a49a831fcf45fb850be263c0c5c7abf32c8d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix d'oh typo from 911516f1b6dec4b2985a1f454949f8d9d10f6ef5 that
prevents custom version string 3.16 headers from working properly.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 0af5974..4d9378e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -82,7 +82,7 @@ choice
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_16
 	bool "3.16.x"
-	select BR2_PACKAGE_HEADERS_AT_LEAST_3_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_15
 	bool "3.15.x"
