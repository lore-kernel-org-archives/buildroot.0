From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 13:24:17 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/bind: security
 bump to version 9.11.13
Message-ID: <20191203121616.619B683CF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9232697502a80e8586ac67d74e3f4c928aee62a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security vulnerabilities:

- CVE-2019-6477: TCP-pipelined queries can bypass tcp-clients limit

For details, see the release notes:
https://downloads.isc.org/isc/bind9/9.11.13/RELEASE-NOTES-bind-9.11.13.html

(9.11.11..12 were not released)

Upstream moved to a 2019-2020 signing key, so update comment in hash file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0432e5713a63142bdb4344b6fdfaa7adc1cd1d81)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.hash | 6 +++---
 package/bind/bind.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 999c6602a8..53b5ce3a47 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.11.10/bind-9.11.10.tar.gz.asc
-# with key 156890685EA0DF6A1371EF2017CC5DB1F0088407
-sha256 b2bb840cda20e6771ae8c054007b4ec12e1bb6aa6bfe79102890eb94956a70c3 bind-9.11.10.tar.gz
+# Verified from https://ftp.isc.org/isc/bind9/9.11.13/bind-9.11.13.tar.gz.asc
+# with key AE3FAC796711EC59FC007AA474BB6B9A4CBB3D38
+sha256 fd3f3cc9fcfcdaa752db35eb24598afa1fdcc2509d3227fc90a8631b7b400f7d bind-9.11.13.tar.gz
 sha256 cd02c93b8dcda794f55dfd1231828d69633072a98eee4874f9cf732d22d9dcde COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 4ac81f1d24..efe4abde9c 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.11.10
+BIND_VERSION = 9.11.13
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
