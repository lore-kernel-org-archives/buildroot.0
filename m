From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 16:12:58 +0200
Subject: [Buildroot] [git commit branch/next] whois: add libidn2 support
Message-ID: <20180520141552.99F6C81239@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=387a362de24b3c55c504c58442609d3adfadf48f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

libidn2 support is enabled since February 2017 (5.2.15):
https://github.com/rfc1036/whois/commit/8ed6d730959b1f988dd43a511c40b9419bb2b0db

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
