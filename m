From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 23 Oct 2019 12:23:28 +0200
Subject: [Buildroot] [PATCH 2/4] package/libnss: fix build warning
In-Reply-To: <20191023102330.20842-1-giulio.benetti@benettiengineering.com>
References: <20191023102330.20842-1-giulio.benetti@benettiengineering.com>
Message-ID: <20191023102330.20842-2-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch to fix build warning due to uninitialized variable.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
https://bugzilla.mozilla.org/show_bug.cgi?id=1590678
---
 ...ve-Wmaybe-uninitialized-warning-in-t.patch | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/libnss/0004-Bug-1590678-Remove-Wmaybe-uninitialized-warning-in-t.patch

diff --git a/package/libnss/0004-Bug-1590678-Remove-Wmaybe-uninitialized-warning-in-t.patch b/package/libnss/0004-Bug-1590678-Remove-Wmaybe-uninitialized-warning-in-t.patch
new file mode 100644
index 0000000000..956abeb4a5
--- /dev/null
+++ b/package/libnss/0004-Bug-1590678-Remove-Wmaybe-uninitialized-warning-in-t.patch
@@ -0,0 +1,27 @@
+From 24bcc8860310149da1524dbf25f3bc77f6476b11 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 23 Oct 2019 11:58:12 +0200
+Subject: [PATCH] Bug 1590678 - Remove -Wmaybe-uninitialized warning in
+ tls13esni.c
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ nss/lib/ssl/tls13esni.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/nss/lib/ssl/tls13esni.c b/nss/lib/ssl/tls13esni.c
+index 4d2e12d62..a7ce6f568 100644
+--- a/nss/lib/ssl/tls13esni.c
++++ b/nss/lib/ssl/tls13esni.c
+@@ -728,7 +728,7 @@ tls13_ServerDecryptEsniXtn(const sslSocket *ss, const PRUint8 *in, unsigned int
+ {
+     sslReader rdr = SSL_READER(in, inLen);
+     PRUint64 suite;
+-    const ssl3CipherSuiteDef *suiteDef;
++    const ssl3CipherSuiteDef *suiteDef = NULL;
+     SSLAEADCipher aead = NULL;
+     TLSExtension *keyShareExtension;
+     TLS13KeyShareEntry *entry = NULL;
+-- 
+2.20.1
+
-- 
2.20.1
