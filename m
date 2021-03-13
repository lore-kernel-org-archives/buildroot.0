From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Mar 2021 15:59:41 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/openssh: security
 bump to version 8.4p1
Message-ID: <20210313143654.6780283F07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b062da66af1c28b6b7e467e27988a8d206432b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes CVE-2020-15778: scp in OpenSSH through 8.3p1 allows command injection in
the scp.c toremote function, as demonstrated by backtick characters in the
destination argument. NOTE: the vendor reportedly has stated that they
intentionally omit validation of "anomalous argument transfers" because that
could "stand a great chance of breaking existing workflows."

https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-15778

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6609cd0d8894771126cd82d95deb10180cb6cf41)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 1d7dc14fb6..840467f50a 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-8.3 (base64 encoded)
-sha256  f2befbe0472fe7eb75d23340eb17531cb6b3aac24075e2066b41f814e12387b2  openssh-8.3p1.tar.gz
+# From https://www.openssh.com/txt/release-8.4 (base64 encoded)
+sha256  5a01d22e407eb1c05ba8a8f7c654d388a13e9f226e4ed33bd38748dafa1d2b24  openssh-8.4p1.tar.gz
 # Locally calculated
 sha256  73d0db766229670c7b4e1ec5e6baed54977a0694a565e7cc878c45ee834045d7  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 860e738ab6..1361702f5c 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION = 8.3p1
+OPENSSH_VERSION = 8.4p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3-Clause, BSD-2-Clause, Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
