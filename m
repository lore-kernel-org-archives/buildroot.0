From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jun 2017 09:58:18 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] bind: security bump to
	version 9.11-P1
Message-ID: <20170626081139.52E467FB5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d72e70367572294e50955c3ea42bb2095f3b7f46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

Fixes the following security issues:

CVE-2017-3140 is a denial-of-service vulnerability affecting 9.9.10,
9.10.5, 9.11.0->9.11.1, 9.9.10-S1, and 9.10.5-S1 when configured with
Response Policy Zones (RPZ) utilizing NSIP or NSDNAME rules.

https://kb.isc.org/article/AA-01495/74/CVE-2017-3140

CVE-2017-3141 is a Windows privilege escalation vector affecting
9.2.6-P2+, 9.3.2-P1+, 9.4.x, 9.5.x, 9.6.x, 9.7.x, 9.8.x, 9.9.0->9.9.10,
9.10.0->9.10.5, 9.11.0->9.11.1, 9.9.3-S1->9.9.10-S1, and 9.10.5-S1.  The
BIND Windows installer failed to properly quote the service paths,
possibly allowing a local user to achieve privilege escalation, if
allowed by file system permissions.

https://kb.isc.org/article/AA-01496/74/CVE-2017-3141

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit e14d89d5e08c47e4e93074cd85cb412af9eafa5e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 9a7fb44..3f0dda5 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,2 +1,2 @@
-# Verified from http://ftp.isc.org/isc/bind9/9.11.1/bind-9.11.1.tar.gz.sha256.asc
-sha256 22050095f5c82a1385cc4174190ac60392670bbc5d63d592ecae52a214bc10b2  bind-9.11.1.tar.gz
+# Verified from http://ftp.isc.org/isc/bind9/9.11.1-P1/bind-9.11.1-P1.tar.gz.sha256.asc
+sha256 6b1b3e88d51b8471bd6aee24a8cea70817e850a5901315dc506f9dde275ca638 bind-9.11.1-P1.tar.gz
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 9c67601..b588eb5 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.11.1
+BIND_VERSION = 9.11.1-P1
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
