From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  2 Jun 2014 21:44:07 +0200
Subject: [Buildroot] [PATCH 1/1] tvheadend: Rebase
	tvheadend-001-no-auto-download-dvbscans.patch
Message-ID: <1401738247-29191-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/d10/d10b4ebf3c21a55413a30d7ce1cb9ec9790bd9bd/

Needed since this commit
https://github.com/tvheadend/tvheadend/commit/a46a6d0dd39db8e3ad546a73c57ece91f92ee5b5

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/tvheadend-001-no-auto-download-dvbscans.patch |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend-001-no-auto-download-dvbscans.patch b/package/tvheadend/tvheadend-001-no-auto-download-dvbscans.patch
index f14f302..18bff39 100644
--- a/package/tvheadend/tvheadend-001-no-auto-download-dvbscans.patch
+++ b/package/tvheadend/tvheadend-001-no-auto-download-dvbscans.patch
@@ -15,7 +15,7 @@ diff -durN tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/configure tvh
  #
  # DVB scan
  #
--if enabled linuxdvb && enabled dvbscan; then
+-if enabled dvbscan; then
 -  printf "${TAB}" "fetching dvb-scan files ..."
 -  "${ROOTDIR}/support/getmuxlist"
 -  if [ $? -ne 0 ]; then
@@ -25,7 +25,7 @@ diff -durN tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/configure tvh
 -  echo "ok"
 -fi
 +# For buildroot, we already installed those files via the dvb-apps package
-+#if enabled linuxdvb && enabled dvbscan; then
++#if enabled dvbscan; then
 +#  printf "${TAB}" "fetching dvb-scan files ..."
 +#  "${ROOTDIR}/support/getmuxlist"
 +#  if [ $? -ne 0 ]; then
-- 
1.7.10.4
