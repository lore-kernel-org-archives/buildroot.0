From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Nov 2013 23:33:35 +0100
Subject: [Buildroot] [git commit] libglib2: the system PCRE needs to have
	UTF and UCP enabled
Message-ID: <20131201201519.C08809BE44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d038784c19eb650b8bb5767d8a6d32522177a108
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If glib2 is compiled with the system PCRE instead of the included
copy, then that system PCRE needs to have support for UTF-8 and
Unicode properties enabled. Otherwise you will get such warnings
at run-time:

GLib-CRITICAL **: PCRE library is compiled without UTF8 support
GLib-CRITICAL **: PCRE library is compiled without UTF8 properties support

Signed-off-by: Sven Neumann <neumann@teufel.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libglib2/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index 3590d72..0e4664c 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBFFI
+	select BR2_PACKAGE_PCRE_UCP if BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_ZLIB
 	depends on BR2_USE_WCHAR # gettext
 	depends on BR2_TOOLCHAIN_HAS_THREADS
