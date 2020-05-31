From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 May 2020 23:14:49 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/bind: security
 bump to version 9.11.19
Message-ID: <20200531211436.2C10185F2E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1b267a26bc183b27241f1d582ec6d3dfa250884
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes the following security issues:

- (9.11.18) DNS rebinding protection was ineffective when BIND 9 is
  configured as a forwarding DNS server.  Found and responsibly reported by
  Tobias Klein.  [GL #1574]

- (9.11.19) To prevent exhaustion of server resources by a maliciously
  configured domain, the number of recursive queries that can be triggered
  by a request before aborting recursion has been further limited.  Root and
  top-level domain servers are no longer exempt from the
  max-recursion-queries limit.  Fetches for missing name server address
  records are limited to 4 for any domain.  This issue was disclosed in
  CVE-2020-8616.  [GL #1388]

- (9.11.19) Replaying a TSIG BADTIME response as a request could trigger an
  assertion failure.  This was disclosed in CVE-2020-8617.  [GL #1703]

Also update the COPYRIGHT hash for a change of copyright year and adjust the
spacing for the new agreements.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 89a5d2162762490727c515692baa1257ba73179e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.hash | 6 +++---
 package/bind/bind.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 53b5ce3a47..4eb3aff3b1 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.11.13/bind-9.11.13.tar.gz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.11.19/bind-9.11.19.tar.gz.asc
 # with key AE3FAC796711EC59FC007AA474BB6B9A4CBB3D38
-sha256 fd3f3cc9fcfcdaa752db35eb24598afa1fdcc2509d3227fc90a8631b7b400f7d bind-9.11.13.tar.gz
-sha256 cd02c93b8dcda794f55dfd1231828d69633072a98eee4874f9cf732d22d9dcde COPYRIGHT
+sha256  0dee554a4caa368948b32da9a0c97b516c19103bc13ff5b3762c5d8552f52329  bind-9.11.19.tar.gz
+sha256  da2aec2b7f6f0feb16bcb080e2c587375fd3195145f047e4d92d112f5b9db501  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 89d83d4d54..362a26dce6 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.11.13
+BIND_VERSION = 9.11.19
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
