From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  1 May 2018 22:40:38 +0200
Subject: [Buildroot] [PATCH 7/7] whois: add libidn2 support
In-Reply-To: <20180501204038.20000-1-fontaine.fabrice@gmail.com>
References: <20180501204038.20000-1-fontaine.fabrice@gmail.com>
Message-ID: <20180501204038.20000-7-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libidn2 support is enabled since February 2017 (5.2.15):
https://github.com/rfc1036/whois/commit/8ed6d730959b1f988dd43a511c40b9419bb2b0db

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/whois/whois.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 22117cf3aa..18071ab6bd 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -27,6 +27,11 @@ WHOIS_DEPENDENCIES += libidn
 WHOIS_MAKE_ENV += HAVE_LIBIDN=1
 endif
 
+ifeq ($(BR2_PACKAGE_LIBIDN2),y)
+WHOIS_DEPENDENCIES += libidn2
+WHOIS_MAKE_ENV += HAVE_LIBIDN2=1
+endif
+
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
 WHOIS_BUILD_TARGETS =
 WHOIS_INSTALL_TARGETS = install
-- 
2.14.1
