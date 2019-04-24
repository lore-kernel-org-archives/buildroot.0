From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 22:17:10 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/stunnel: security
 bump to version 5.53
Message-ID: <20190424201454.5ADBC82B77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6f55425e46af7d370c072e79a7149b69aa51a54b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

- Update hash of COPYING (update in year:
  https://github.com/mtrojnar/stunnel/commit/bb693862a3497bde442ffa37e7c20f1e2f5534ea)
- Include a Security bugfix released in version 5.48: Fixed requesting
  client certificate when specified as a global option.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9f69da705de8661d5d45cf4ad89cfa01538d3e01)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stunnel/stunnel.hash | 6 +++---
 package/stunnel/stunnel.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
index d3b9451ce9..999a4500ed 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,5 +1,5 @@
-# From https://www.stunnel.org/downloads/stunnel-5.44.tar.gz.sha256
-sha256	990a325dbb47d77d88772dd02fbbd27d91b1fea3ece76c9ff4461eca93f12299	stunnel-5.44.tar.gz
+# From https://www.stunnel.org/downloads/stunnel-5.53.tar.gz.sha256
+sha256	80439896ee14269eb70bc8bc669433c7d619018a62c9f9c5c760a24515302585	stunnel-5.53.tar.gz
 # Locally calculated
-sha256	c43821865591e4d893906e2801b5ec4de58e51978f5563a61475cd0adc0bec4d	COPYING
+sha256	81d0b7244f44ef81dd0b299cf681037c5a42d468b8533e53aff6d1ac84c97dc8	COPYING
 sha256	1ee2b290e92c211b08df10e9fcaf32596cdb22b8eae731b18c2c074a4a83eebe	COPYRIGHT.GPL
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 9a81373a54..adfa0748ae 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STUNNEL_VERSION_MAJOR = 5
-STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).44
+STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).53
 STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/$(STUNNEL_VERSION_MAJOR).x
 STUNNEL_DEPENDENCIES = host-pkgconf openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
