From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 18:17:36 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/nginx: security
 bump to version 1.16.1
Message-ID: <20190902161338.DC1BF81056@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fdb1e8eb0f3bde77e7b823400d4ab57cef4c7f66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Fixes the following security issues:

       Security: when using HTTP/2 a client might cause excessive memory
       consumption and CPU usage (CVE-2019-9511, CVE-2019-9513,
       CVE-2019-9516).

For details, see the advisory:
https://mailman.nginx.org/pipermail/nginx-announce/2019/000249.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 24309ef4ab7f5c9b85233ebd98ccc6657f70f271)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nginx/nginx.hash | 2 +-
 package/nginx/nginx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index c322a64db2..4df7906eea 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	4fd376bad78797e7f18094a00f0f1088259326436b537eb5af69b01be2ca1345	nginx-1.16.0.tar.gz
+sha256	f11c2a6dd1d3515736f0324857957db2de98be862461b5a542a3ac6188dbe32b	nginx-1.16.1.tar.gz
 # License files, locally calculated
 sha256	28ad30e2f64bd89ac1287b4606906bb99ed04d9f4e13fb6564a0be9c8a23f509	LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index eed7602570..08adcaec51 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.16.0
+NGINX_VERSION = 1.16.1
 NGINX_SITE = http://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
