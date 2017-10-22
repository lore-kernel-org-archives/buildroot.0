From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Oct 2017 13:56:01 +0200
Subject: [Buildroot] [PATCH] openssl: unconditionally define
	BR2_PACKAGE_PROVIDES_HOST_OPENSSL
Message-ID: <20171022115601.9220-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/207/207d0ca1fe5328e675246c851fcb0d5685f8c0bd/
http://autobuild.buildroot.net/results/546/546a56d6dd39e5e9ecfe25fd36a00510e6c0c45b/

host-openssl may be used without openssl being enabled for the target, so
move BR2_PACKAGE_PROVIDES_HOST_OPENSSL outside the BR2_PACKAGE_OPENSSL
conditional.

While we're at it, add a comment explaining what this magic config symbol does.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssl/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index df1d117257..e33320afc5 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -76,8 +76,9 @@ config BR2_PACKAGE_PROVIDES_OPENSSL
 	default "libopenssl"  if BR2_PACKAGE_LIBOPENSSL
 	default "libressl"  if BR2_PACKAGE_LIBRESSL
 
+endif
+
+# ensure libopenssl is used for the host variant
 config BR2_PACKAGE_PROVIDES_HOST_OPENSSL
 	string
 	default "host-libopenssl"
-
-endif
-- 
2.11.0
