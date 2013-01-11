From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 11 Jan 2013 18:25:54 +0100
Subject: [Buildroot] [git commit] package/dvb-apps: requires largefiles
Message-ID: <20130111180851.8D12D9703E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc06757bed3fb41ff57b5fb05d53f7bcf79414b7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes (for example):
    http://autobuild.buildroot.net/results/5e12820c6537b176c49671a65afcbdb86c5154c9

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
