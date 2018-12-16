From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 22:34:55 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/swupdate: Update
 to version 2018.11
Message-ID: <20181216213052.8EC6F84F16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=668db8596d1294cfbd813f9e05653e057fff0775
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Update to version 2018.11 to resolve the following build failure:

corelib/channel_curl.c: In function ???channel_map_curl_error???:
corelib/channel_curl.c:298:2: error: duplicate case value
  case CURLE_SSL_CACERT:
  ^
corelib/channel_curl.c:297:2: error: previously used here
  case CURLE_PEER_FAILED_VERIFICATION:
  ^

when building with CONFIG_DOWNLOAD=y. This issue is happening since
the libcurl bump to 7.62.0.

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1040b1863404d8c35fb81912be68bd92f5c4a6a8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/swupdate/swupdate.hash | 3 ++-
 package/swupdate/swupdate.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index efc637976a..339f40e1bb 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256  19156bb30c3517a0ff9c918a38062df3cfa70f02f8162da4971a2f47d108688e  swupdate-2018.03.tar.gz
+sha256  a65884ca18523cde1b0744d952d6f91462dbd4ad07941305f5684c6d4ec833dc  swupdate-2018.11.tar.gz
+sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index abf46c9256..6285437aaa 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2018.03
+SWUPDATE_VERSION = 2018.11
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPL-2.0+, LGPL-2.1+, MIT
 SWUPDATE_LICENSE_FILES = COPYING
