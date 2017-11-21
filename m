From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Nov 2017 23:43:13 +0100
Subject: [Buildroot] [PATCH] samba4: security bump to version 4.6.11
Message-ID: <20171121224313.26215-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues:

 - CVE-2017-14746:
   All versions of Samba from 4.0.0 onwards are vulnerable to a use after
   free vulnerability, where a malicious SMB1 request can be used to
   control the contents of heap memory via a deallocated heap pointer. It
   is possible this may be used to compromise the SMB server.

 - CVE-2017-15275:
   All versions of Samba from 3.6.0 onwards are vulnerable to a heap
   memory information leak, where server allocated heap memory may be
   returned to the client without being cleared.

   There is no known vulnerability associated with this error, but
   uncleared heap memory may contain previously used data that may help
   an attacker compromise the server via other methods. Uncleared heap
   memory may potentially contain password hashes or other high-value
   data.

For more details, see the release notes:
https://www.samba.org/samba/history/samba-4.6.11.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 2 +-
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 6821144d1d..3bf46d3bcc 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 5913a569b54c6bc261bc245d7326fabfcba42839d15a82db48c047de1eb19626  samba-4.6.10.tar.gz
+sha256 051b7ab0fa088d77dc0df039ff5d6b8fd998372f0c29ecb455b149457c20ed1d  samba-4.6.11.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 40436ca731..7836df5beb 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.6.10
+SAMBA4_VERSION = 4.6.11
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.11.0
