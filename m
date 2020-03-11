From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Wed, 11 Mar 2020 14:35:04 +0100
Subject: [Buildroot] [PATCH] package/collectd: make network crypto support
 discoverable
Message-ID: <20200311133504.13911-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

before it was completely non-obvious how to get crypto support
in collectd's network module

this introduces a collectd config option which makes sure
gcrypt is built, and can't be accidentally unselected
resulting in an accidental non-crypto build of collectd

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 package/collectd/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 303b5dc01b..4b34ec60eb 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -603,6 +603,13 @@ config BR2_PACKAGE_COLLECTD_NETWORK
 	help
 	  Send/receive values from other instances of collectd.
 
+config BR2_PACKAGE_COLLECTD_NETWORK_GCRYPT
+	bool "crypto support"
+	depends on BR2_PACKAGE_COLLECTD_NETWORK
+	select BR2_PACKAGE_LIBGCRYPT
+	help
+	  Enable crypto support
+
 config BR2_PACKAGE_COLLECTD_RRDTOOL
 	bool "rrdtool"
 	depends on BR2_USE_WCHAR # rrdtool
-- 
2.17.1
