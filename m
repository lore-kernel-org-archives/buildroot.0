From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 18 Jan 2015 12:35:00 +0100
Subject: [Buildroot] [PATCH 3/3] package/rpm: use 'none' for location path
In-Reply-To: <1421580900-15186-1-git-send-email-romain.naour@openwide.fr>
References: <1421580900-15186-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1421580900-15186-3-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The recognized keywords are:
(location path: "external:internal:none")

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/rpm/rpm.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index ce7189e..6725ca4 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -34,14 +34,14 @@ ifeq ($(BR2_PACKAGE_PCRE),y)
 RPM_DEPENDENCIES += pcre
 RPM_CONF_OPTS += --with-pcre=external
 else
-RPM_CONF_OPTS += --with-pcre=no
+RPM_CONF_OPTS += --with-pcre=none
 endif
 
 ifeq ($(BR2_PACKAGE_FILE),y)
 RPM_DEPENDENCIES += file
 RPM_CONF_OPTS += --with-file=external
 else
-RPM_CONF_OPTS += --with-file=no
+RPM_CONF_OPTS += --with-file=none
 endif
 
 ifeq ($(BR2_PACKAGE_RPM_XZ_PAYLOADS),y)
-- 
1.9.3
