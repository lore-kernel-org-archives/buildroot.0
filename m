From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Mar 2021 17:06:26 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/redis: security
 bump to version 5.0.12 (CVE-2021-21309)
Message-ID: <20210313154332.3E13587899@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=523a6427ed3627647f73c2f3876fd87e53759e1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

References:
https://github.com/redis/redis/security/advisories/GHSA-hgj8-vff2-7cjf
https://nvd.nist.gov/vuln/detail/CVE-2021-21309

"Impact:

    An integer overflow bug in 32-bit Redis version 4.0 or newer could be
    exploited to corrupt the heap and potentially result with remote code
    execution.

    Redis 4.0 or newer uses a configurable limit for the maximum supported
    bulk input size. By default, it is 512MB which is a safe value for all
    platforms.

    If the limit is significantly increased, receiving a large request from
    a client may trigger several integer overflow scenarios, which would
    result with buffer overflow and heap corruption. We believe this could
    in certain conditions be exploited for remote code execution.

    By default, authenticated Redis users have access to all configuration
    parameters and can therefore use the ???CONFIG SET proto-max-bulk-len??? to
    change the safe default, making the system vulnerable.

    This problem only affects 32-bit Redis (on a 32-bit system, or as a
    32-bit executable running on a 64-bit system).

Patches

    The problem is fixed in version 6.2, and the fix is back ported to
    6.0.11 and 5.0.11. Make sure you use one of these versions if you're
    running 32-bit Redis.
"

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
[Peter: update to 5.0.12 to fix build on !glibc]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 73e28fac0d..03b89757d0 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/antirez/redis-hashes/blob/master/README
-sha256 e30a5e7d1593a715cdda2a82deb90190816d06c9d1dc1ef5b36874878c683382  redis-5.0.10.tar.gz
+sha256 7040eba5910f7c3d38f05ea5a1d88b480488215bdbd2e10ec70d18380108e31e  redis-5.0.12.tar.gz
 
 # Locally calculated
 sha256 cbf420a3672475a6e2765e3c0984c1f81efe0212afb94a3c998ee63bfd661063  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 5ab1d34fd2..e294c0bd5c 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 5.0.10
+REDIS_VERSION = 5.0.12
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
