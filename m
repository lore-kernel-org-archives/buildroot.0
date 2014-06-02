From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Jun 2014 21:46:23 +0200
Subject: [Buildroot] [git commit] tvheadend: Rebase
	tvheadend-001-no-auto-download-dvbscans.patch
Message-ID: <20140602195724.54F729CE7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=438926e62b67ef61650c7029a76394251af971a5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/d10/d10b4ebf3c21a55413a30d7ce1cb9ec9790bd9bd/

Needed since this commit
https://github.com/tvheadend/tvheadend/commit/a46a6d0dd39db8e3ad546a73c57ece91f92ee5b5

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../tvheadend-001-no-auto-download-dvbscans.patch  |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
