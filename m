From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Sep 2014 23:09:02 +0200
Subject: [Buildroot] [git commit] whois: Fix unmet dependencies
Message-ID: <20140919211333.596289D6FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0790de59cdc36fa0efe36df05fe7cbdae3f46dad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix :
   BR2_PACKAGE_WHOIS selects BR2_PACKAGE_GETTEXT which has unmet direct dependencies (BR2_USE_WCHAR)

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/whois/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/whois/Config.in b/package/whois/Config.in
index 40b6590..95e3dc6 100644
--- a/package/whois/Config.in
+++ b/package/whois/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_WHOIS
 	bool "whois"
+	depends on BR2_USE_WCHAR # gettext
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
 	  Improved whois client.
 
 	  http://www.linux.it/~md/software/
+
+comment "whois needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
