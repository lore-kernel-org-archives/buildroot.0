From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Oct 2014 16:45:51 +0200
Subject: [Buildroot] [git commit] stunnel: security bump to version 5.06
Message-ID: <20141017144625.4A3BBBD48E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=95093f1e6af4f2be6119bddf4dbaf35b1be50d3a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disables SSLv2 & SSLv3 by default to mitigate poodle.
Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stunnel/stunnel.hash |    2 ++
 package/stunnel/stunnel.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
new file mode 100644
index 0000000..89af571
--- /dev/null
+++ b/package/stunnel/stunnel.hash
@@ -0,0 +1,2 @@
+# From http://www.stunnel.org/pipermail/stunnel-announce/2014-October/000084.html
+sha256	098c2b6db0793ea4fa5b6767ce6ef1853e9f6cc2f32133024be55f6a460b1a40	stunnel-5.06.tar.gz
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 26c7dac..7be0cc7 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STUNNEL_VERSION = 5.03
+STUNNEL_VERSION = 5.06
 STUNNEL_SITE = http://ftp.nluug.nl/pub/networking/stunnel/archive/5.x
 STUNNEL_DEPENDENCIES = openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork
