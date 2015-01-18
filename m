From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 18 Jan 2015 20:53:10 +0100
Subject: [Buildroot] [PATCH v2 5/5] package/rpm: use 'none' for location path
In-Reply-To: <1421610790-18508-1-git-send-email-romain.naour@openwide.fr>
References: <1421610790-18508-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1421610790-18508-5-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The recognized keywords are:
(location path: "external:internal:none")

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
v2: no change

 package/rpm/rpm.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index fda10f2..42a3b64 100644
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
 
 # xz payload support needs a toolchain w/ C++
-- 
1.9.3
