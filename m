From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Jul 2013 18:02:58 +0200
Subject: [Buildroot] [git commit] strongswan: scripts need charon or tools
Message-ID: <20130731160445.D42169A1A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e4cdd6c3c2737baf67c21180d79283606a633fe9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/007/007e75362cbe4693e36d5a7ab96c539d1f3b00fc/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/strongswan/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 98f8da2..e8cd1c4 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -110,6 +110,7 @@ config BR2_PACKAGE_STRONGSWAN_TOOLS
 
 config BR2_PACKAGE_STRONGSWAN_SCRIPTS
 	bool "Enable additional utilities (found in directory scripts)"
+	depends on BR2_PACKAGE_STRONGSWAN_CHARON || BR2_PACKAGE_STRONGSWAN_TOOLS
 	default y
 
 endif
