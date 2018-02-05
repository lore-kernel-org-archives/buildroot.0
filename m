From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Feb 2018 08:30:38 +0100
Subject: [Buildroot] [git commit] gcc: or1k: use 20170218 tag instead of
 branch
Message-ID: <20180205073041.CCF85855F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e478ad1e5da84240f5a8dea01e6be56a9c8dca99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As pointed out by Joel Stanley:
https://patchwork.ozlabs.org/patch/863011/

Github now longer provides the exact same tarball for the or1k musl-5.4.0
tarball, breaking the build.  Even more, musl-5.4.0 is the name of a git
branch, not a tag.

Fix both problems by changing to the or1k-musl-5.4.0-20170218 tag, which
points to the exact same git commit.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Tested-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/Config.in.host                                              | 2 +-
 package/gcc/gcc.hash                                                    | 2 +-
 .../gcc/{musl-5.4.0 => or1k-musl-5.4.0-20170218}/100-uclibc-conf.patch  | 0
 .../301-missing-execinfo_h.patch                                        | 0
 .../850-libstdcxx-uclibc-c99.patch                                      | 0
 .../gcc/{musl-5.4.0 => or1k-musl-5.4.0-20170218}/860-cilk-wchar.patch   | 0
 .../930-libgcc-disable-split-stack-nothreads.patch                      | 0
 7 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 8432515d73..309ddf572a 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -81,7 +81,7 @@ config BR2_GCC_VERSION
 	default "6.4.0"     if BR2_GCC_VERSION_6_X
 	default "7.3.0"     if BR2_GCC_VERSION_7_X
 	default "arc-2017.09-release" if BR2_GCC_VERSION_ARC
-	default "musl-5.4.0" if BR2_GCC_VERSION_OR1K
+	default "or1k-musl-5.4.0-20170218" if BR2_GCC_VERSION_OR1K
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 4966b18f59..fd38cfaad1 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -10,4 +10,4 @@ sha512  ad41a7e4584e40e92cdf860bc0288500fbaf5dfb7e8c3fcabe9eba809c87bcfa85b46c19
 # Locally calculated (fetched from Github)
 sha512  c30addd3c4dc66b90749a0f99b257c8a8e7966d27f286057b6b66f4a70ca22a1ee50d92882c4db13307d769a6fb28e1e2a2bab749a692cf3f89ef0c38f145efa  gcc-arc-2017.09-release.tar.gz
 # Locally calculated (fetched from Github)
-sha512  841101f7de45f327bf2e92f3efc73ca88a021e4b9b541458ce80a16e55882bd8606a8492d75c57c589ee2c10d42ae2865b67690155d7289a541df1d68096402f  gcc-musl-5.4.0.tar.gz
+sha512  2de7cf47333a4092b02d3bb98f4206f14966f1d139a724d09cf3b22f8a43ae0c704f33e6477d6367a03c29b265480dc900169e9d417006c5d46f0ae446b8c6f1  gcc-or1k-musl-5.4.0-20170218.tar.gz
diff --git a/package/gcc/musl-5.4.0/100-uclibc-conf.patch b/package/gcc/or1k-musl-5.4.0-20170218/100-uclibc-conf.patch
similarity index 100%
rename from package/gcc/musl-5.4.0/100-uclibc-conf.patch
rename to package/gcc/or1k-musl-5.4.0-20170218/100-uclibc-conf.patch
diff --git a/package/gcc/musl-5.4.0/301-missing-execinfo_h.patch b/package/gcc/or1k-musl-5.4.0-20170218/301-missing-execinfo_h.patch
similarity index 100%
rename from package/gcc/musl-5.4.0/301-missing-execinfo_h.patch
rename to package/gcc/or1k-musl-5.4.0-20170218/301-missing-execinfo_h.patch
diff --git a/package/gcc/musl-5.4.0/850-libstdcxx-uclibc-c99.patch b/package/gcc/or1k-musl-5.4.0-20170218/850-libstdcxx-uclibc-c99.patch
similarity index 100%
rename from package/gcc/musl-5.4.0/850-libstdcxx-uclibc-c99.patch
rename to package/gcc/or1k-musl-5.4.0-20170218/850-libstdcxx-uclibc-c99.patch
diff --git a/package/gcc/musl-5.4.0/860-cilk-wchar.patch b/package/gcc/or1k-musl-5.4.0-20170218/860-cilk-wchar.patch
similarity index 100%
rename from package/gcc/musl-5.4.0/860-cilk-wchar.patch
rename to package/gcc/or1k-musl-5.4.0-20170218/860-cilk-wchar.patch
diff --git a/package/gcc/musl-5.4.0/930-libgcc-disable-split-stack-nothreads.patch b/package/gcc/or1k-musl-5.4.0-20170218/930-libgcc-disable-split-stack-nothreads.patch
similarity index 100%
rename from package/gcc/musl-5.4.0/930-libgcc-disable-split-stack-nothreads.patch
rename to package/gcc/or1k-musl-5.4.0-20170218/930-libgcc-disable-split-stack-nothreads.patch
