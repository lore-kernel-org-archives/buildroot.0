From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 13:29:05 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/glibc: bump
 version for additional post-2.28 security fixes
Message-ID: <20191223122041.D24288DF97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b341c7497f83128ecd8e3fe1eaa007d00701d26b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security vulnerability:

 - CVE-2019-19126: ld.so failed to ignore the LD_PREFER_MAP_32BIT_EXEC
   environment variable during program execution after a security
   transition, allowing local attackers to restrict the possible mapping
   addresses for loaded libraries and thus bypass ASLR for a setuid
   program.  Reported by Marcin Ko??cielnicki.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../glibc.hash                                                          | 2 +-
 package/glibc/glibc.mk                                                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glibc/glibc-2.28-110-g57922433fa038faa6e37798b9655f85a94978d89/glibc.hash b/package/glibc/glibc-2.28-133-g6578d89c170cc7b524b9bccafffd5b4207bf646f/glibc.hash
similarity index 69%
rename from package/glibc/glibc-2.28-110-g57922433fa038faa6e37798b9655f85a94978d89/glibc.hash
rename to package/glibc/glibc-2.28-133-g6578d89c170cc7b524b9bccafffd5b4207bf646f/glibc.hash
index 734621d9b1..0e2d05be33 100644
--- a/package/glibc/glibc-2.28-110-g57922433fa038faa6e37798b9655f85a94978d89/glibc.hash
+++ b/package/glibc/glibc-2.28-133-g6578d89c170cc7b524b9bccafffd5b4207bf646f/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  8cfd8c4564b20e610b41e24cdab85d5b208453c51b06a64603e9ef3f86d6de0a  glibc-glibc-2.28-110-g57922433fa038faa6e37798b9655f85a94978d89.tar.gz
+sha256  8cb918cef45112554dd5efdbe4e3d4bb2909708a2b115a3b612b22bd7c670859  glibc-glibc-2.28-133-g6578d89c170cc7b524b9bccafffd5b4207bf646f.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 94ffe9eb42..dcf0126569 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -13,7 +13,7 @@ GLIBC_SITE = $(call github,riscv,riscv-glibc,$(GLIBC_VERSION))
 else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master
-GLIBC_VERSION = glibc-2.28-110-g57922433fa038faa6e37798b9655f85a94978d89
+GLIBC_VERSION = glibc-2.28-133-g6578d89c170cc7b524b9bccafffd5b4207bf646f
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
