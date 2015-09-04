From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Sep 2015 16:07:37 +0200
Subject: [Buildroot] [git commit] bind: security bump to version 9.9.7-P3
Message-ID: <20150904140747.1F75C81E40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=38d1a66bda57cb4c47156021ee976c2583b55822
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2015-5722 - denial-of-service vector which can be exploited remotely
against a BIND server that is performing validation on DNSSEC-signed
records.
CVE-2015-5986 - denial-of-service vector which can be used against a
BIND server that is performing recursion and (under limited conditions)
an authoritative-only nameserver.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.hash |    4 ++--
 package/bind/bind.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 6bc2d1b..4c9fc40 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,2 +1,2 @@
-# Verified from ftp://ftp.isc.org/isc/bind9/9.9.7-P2/bind-9.9.7-P2.tar.gz.sha256.asc
-sha256	f5f433567e5f68d61460d86f691471259a49b6d10d7422acbd88b7fdb038b518	bind-9.9.7-P2.tar.gz
+# Verified from ftp://ftp.isc.org/isc/bind9/9.9.7-P3/bind-9.9.7-P3.tar.gz.sha256.asc
+sha256	cb737dce18350890f350dd7d3bc836c62ea440103dfde184c09bc18cfad8a844	bind-9.9.7-P3.tar.gz
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 6201991..95051d1 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.9.7-P2
+BIND_VERSION = 9.9.7-P3
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
 BIND_CONFIG_SCRIPTS = bind9-config isc-config.sh
