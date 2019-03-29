From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Mar 2019 14:44:52 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/glibc: bump
 version for additional post-2.28 security fixes
Message-ID: <20190329134850.204C788335@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1cf12ba63164e2d495680f63978c80e59ad824e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security vulnerabilities:

  CVE-2019-6488: On x32, the size_t parameter may be passed in the lower
  32 bits of a 64-bit register with with non-zero upper 32 bit.  When it
  happened, accessing the 32-bit size_t value as the full 64-bit register
  in the assembly string/memory functions would cause a buffer overflow.
  Reported by H.J. Lu.

  CVE-2019-7309: x86-64 memcmp used signed Jcc instructions to check
  size.  For x86-64, memcmp on an object size larger than SSIZE_MAX
  has undefined behavior.  On x32, the size_t argument may be passed
  in the lower 32 bits of the 64-bit RDX register with non-zero upper
  32 bits.  When it happened with the sign bit of RDX register set,
  memcmp gave the wrong result since it treated the size argument as
  zero.  Reported by H.J. Lu.

  CVE-2016-10739: The getaddrinfo function could successfully parse IPv4
  addresses with arbitrary trailing characters, potentially leading to data
  or command injection issues in applications.

  CVE-2019-9169: Attempted case-insensitive regular-expression match
  via proceed_next_node in posix/regexec.c leads to heap-based buffer
  over-read.  Reported by Hongxu Chen.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../glibc.hash                                                          | 2 +-
 package/glibc/glibc.mk                                                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glibc/glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1/glibc.hash b/package/glibc/glibc-2.28-94-g4aeff335ca19286ee2382d8eba794ae5fd49281a/glibc.hash
similarity index 69%
rename from package/glibc/glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1/glibc.hash
rename to package/glibc/glibc-2.28-94-g4aeff335ca19286ee2382d8eba794ae5fd49281a/glibc.hash
index e83b1caf4c..442ef0d7aa 100644
--- a/package/glibc/glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1/glibc.hash
+++ b/package/glibc/glibc-2.28-94-g4aeff335ca19286ee2382d8eba794ae5fd49281a/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  ebf04c7b00153d6df8beceec0666d4b13e1ac613b40d5774d1b8c6f61c1686e6  glibc-glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1.tar.gz
+sha256  295d436aac4dc45afc3b440f85fc4556c03b1140ca0f625ee015c8156d2f52ae  glibc-glibc-2.28-94-g4aeff335ca19286ee2382d8eba794ae5fd49281a.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index ec5b3cedc9..cb6f8097dc 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -13,7 +13,7 @@ GLIBC_SITE = $(call github,riscv,riscv-glibc,$(GLIBC_VERSION))
 else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master
-GLIBC_VERSION = glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1
+GLIBC_VERSION = glibc-2.28-94-g4aeff335ca19286ee2382d8eba794ae5fd49281a
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
