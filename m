From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 31 Oct 2018 10:52:14 +0100
Subject: [Buildroot] [git commit] lighttpd: adjust Config.in to make
 check-package happy
Message-ID: <20181031095117.912A283807@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=71f4f97d0aebe36c6399822840fe5301a5339b10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit b9d75c717e01aed474b7567c969236418e87eda8 ("lighttpd: add
optional pam support") introduced a new Config.in option, but
check-package was not happy about it:

package/lighttpd/Config.in:30: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
package/lighttpd/Config.in:31: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
package/lighttpd/Config.in:32: attributes order: type, default, depends on, select, help (http://nightly.buildroot.org/#_config_files)
package/lighttpd/Config.in:32: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
package/lighttpd/Config.in:33: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
package/lighttpd/Config.in:34: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

This commit fixes those indentation and ordering issues.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lighttpd/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 0f37422aea..7d75663629 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -27,11 +27,11 @@ config BR2_PACKAGE_LIGHTTPD_OPENSSL
 	  Enable OpenSSL support for lighttpd.
 
 config BR2_PACKAGE_LIGHTTPD_PAM
-       bool "pam authentication support"
-       depends on BR2_PACKAGE_LINUX_PAM
-       default y
-       help
-         Enable PAM authentication support for lighttpd.
+	bool "pam authentication support"
+	default y
+	depends on BR2_PACKAGE_LINUX_PAM
+	help
+	  Enable PAM authentication support for lighttpd.
 
 config BR2_PACKAGE_LIGHTTPD_ZLIB
 	bool "zlib support"
