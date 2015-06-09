From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 22:53:19 +0200
Subject: [Buildroot] [git commit] stunnel: add STUNNEL_VERSION_MAJOR variable
Message-ID: <20150609205336.01CF881D83@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=670a833b57cb14e1f519bc23e94c939c48ebe2cb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/stunnel/stunnel.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 2d35e75..3f5b9aa 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-STUNNEL_VERSION = 5.17
-STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/5.x
+STUNNEL_VERSION_MAJOR = 5
+STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).17
+STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/$(STUNNEL_VERSION_MAJOR).x
 STUNNEL_DEPENDENCIES = openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
 	--disable-libwrap
