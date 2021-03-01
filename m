From: Christian Stewart <christian@paral.in>
Date: Mon,  1 Mar 2021 03:59:03 -0800
Subject: [Buildroot] [PATCH v2 1/1] package/openssh: security bump to
 version 8.4p1
Message-ID: <20210301115903.10828-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Baruch Siach <baruch@tkos.co.il>

Fixes CVE-2020-15778: scp in OpenSSH through 8.3p1 allows command injection in
the scp.c toremote function, as demonstrated by backtick characters in the
destination argument. NOTE: the vendor reportedly has stated that they
intentionally omit validation of "anomalous argument transfers" because that
could "stand a great chance of breaking existing workflows."

https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-15778

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/openssh/openssh.hash | 2 +-
 package/openssh/openssh.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 1d7dc14fb6..3e0dddf54a 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
 # From https://www.openssh.com/txt/release-8.3 (base64 encoded)
-sha256  f2befbe0472fe7eb75d23340eb17531cb6b3aac24075e2066b41f814e12387b2  openssh-8.3p1.tar.gz
+sha256  5a01d22e407eb1c05ba8a8f7c654d388a13e9f226e4ed33bd38748dafa1d2b24  openssh-8.4p1.tar.gz
 # Locally calculated
 sha256  73d0db766229670c7b4e1ec5e6baed54977a0694a565e7cc878c45ee834045d7  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index edcbfc2f62..c74f5af8ed 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-OPENSSH_VERSION = 8.3p1
-OPENSSH_CPE_ID_VERSION = 8.3
-OPENSSH_CPE_ID_UPDATE = p1
+OPENSSH_VERSION = 8.4p1
+OPENSSH_CPE_ID_VERSION = 8.4
+OPENSSH_CPE_ID_VERSION_MINOR = p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3-Clause, BSD-2-Clause, Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
-- 
2.30.1
