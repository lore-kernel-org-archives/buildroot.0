From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Jul 2018 21:49:55 +0200
Subject: [Buildroot] [git commit] bind: security bump to 9.11.4
Message-ID: <20180717195322.0FEB188833@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b36577a2669310c1b1a6722e012a1049e3793d1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2018-5738: When recursion is enabled but the allow-recursion
and allow-query-cache ACLs are not specified, they should be limited to
local networks, but they were inadvertently set to match the default
allow-query, thus allowing remote queries.

Update license file hash; copyright year update.

Add reference to tarball signature key.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.hash | 7 ++++---
 package/bind/bind.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 199db704fe..78f8015521 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,3 +1,4 @@
-# Verified from http://ftp.isc.org/isc/bind9/9.11.2-P1/bind-9.11.2-P1.tar.gz.sha256.asc
-sha256 cec31548832fca3f85d95178d4019b7d702039e8595d4c93914feba337df1212 bind-9.11.2-P1.tar.gz
-sha256 d3906dfe153e2c48440d3ca1d5319f5e89b4b820cdfc5d0779c23d7ac2b175e9 COPYRIGHT
+# Verified from https://ftp.isc.org/isc/bind9/9.11.4/bind-9.11.4.tar.gz.asc
+# with key BE0E9748B718253A28BB89FFF1B11BF05CF02E57
+sha256 595070b031f869f8939656b5a5d11b121211967f15f6afeafa895df745279617 bind-9.11.4.tar.gz
+sha256 336f3c40e37a1a13690efb4c63e20908faa4c40498cc02f3579fb67d3a1933a5 COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 392ef321c2..c4429ef6cc 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.11.2-P1
+BIND_VERSION = 9.11.4
 BIND_SITE = http://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
