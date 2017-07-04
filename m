From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 00:14:49 +0200
Subject: [Buildroot] [git commit] package/ratpoison: needs MMU
Message-ID: <20170704221201.EE281818CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7af85ffdc7ba904f8e6bde35e1f02b149a265293
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/10c/10c0a41275ba53473c89881990ba608b7550b23a

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ratpoison/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ratpoison/Config.in b/package/ratpoison/Config.in
index 0c78a1f..7b72429 100644
--- a/package/ratpoison/Config.in
+++ b/package/ratpoison/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RATPOISON
 	bool "ratpoison"
+	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_LIBERATION
