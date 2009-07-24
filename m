From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jul 2009 23:30:08 +0200
Subject: [Buildroot] [PATCH 07/13] matchbox: fix dependencies
In-Reply-To: <cover.1248471011.git.thomas.petazzoni@free-electrons.com>
References: <cover.1248471011.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d776138bfff0d0c2c6e8332960ec8d70ee6e9e0b.1248471011.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A dependency on BR2_PACKAGE_XORG7 is enough, no need to depend on
BR2_PACKAGE_XORG_XSERVER.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/matchbox/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index b57a4a2..afa5684 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_MATCHBOX
 	bool "MatchBox Window Manager"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE
-- 
1.6.0.4
