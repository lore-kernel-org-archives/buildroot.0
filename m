From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  8 Jan 2013 20:11:50 +0100
Subject: [Buildroot] [PATCH 1/2] package/dvb-apps: requires largefiles
In-Reply-To: <cover.1357672284.git.yann.morin.1998@free.fr>
References: <cover.1357672284.git.yann.morin.1998@free.fr>
Message-ID: <20276649bfceb884061dda4c1352ca0072eb63cd.1357672284.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes (for example):
    http://autobuild.buildroot.net/results/5e12820c6537b176c49671a65afcbdb86c5154c9

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/dvb-apps/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/dvb-apps/Config.in b/package/dvb-apps/Config.in
index 5d0b6f5..ca8dc54 100644
--- a/package/dvb-apps/Config.in
+++ b/package/dvb-apps/Config.in
@@ -8,8 +8,12 @@ config BR2_PACKAGE_DVB_APPS
 
 if BR2_PACKAGE_DVB_APPS
 
+comment "dvb-apps utils needs LARGEFILE support in the toolchain"
+	depends on !BR2_LARGEFILE
+
 config BR2_PACKAGE_DVB_APPS_UTILS
 	bool "dvb-apps utilities"
+	depends on BR2_LARGEFILE
 	help
 	  A small number of DVB test and utility programs,
 	  including szap and dvbscan.
-- 
1.7.2.5
