From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 19 Dec 2016 16:50:38 -0300
Subject: [Buildroot] [PATCH] samba4: security bump to version 4.4.8
Message-ID: <20161219195038.19344-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2016-2123 - Samba NDR Parsing ndr_pull_dnsp_name Heap-based Buffer
Overflow Remote Code Execution Vulnerability.
CVE-2016-2125 - Unconditional privilege delegation to Kerberos servers
in trusted realms.
CVE-2016-2126 - Flaws in Kerberos PAC validation can trigger privilege
elevation.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba4/samba4.hash | 2 +-
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index d6433f7..1e36d73 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	a69d6612e4a421640242ca66c4dbb0e4c20281e77dc24970a332770814d45c7c	samba-4.4.7.tar.gz
+sha256	0e54de8a22b77f9712578029639331b51f818b70e194766c98475a5b99470fbf	samba-4.4.8.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 71cb426..778902f 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.4.7
+SAMBA4_VERSION = 4.4.8
 SAMBA4_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.10.2
