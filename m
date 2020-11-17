From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Nov 2020 20:57:50 +0100
Subject: [Buildroot] [git commit] package/c-ares: security bump to version
 1.17.0
Message-ID: <20201117200204.5F4AA86A8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7a369a907f988cf193b06fd4a7ce5547976c21a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- avoid read-heap-buffer-overflow in ares_parse_soa_reply found during
  fuzzing
- Avoid theoretical buffer overflow in RC4 loop comparison
- Empty hquery->name could lead to invalid memory access
- ares_parse_{a,aaaa}_reply() could return a larger *naddrttls than was
  passed in

https://c-ares.haxx.se/changelog.html#1_17_0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/c-ares/c-ares.hash | 2 +-
 package/c-ares/c-ares.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
index 04a87402e9..a24f3d72ea 100644
--- a/package/c-ares/c-ares.hash
+++ b/package/c-ares/c-ares.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  d08312d0ecc3bd48eee0a4cc0d2137c9f194e0a28de2028928c0f6cae85f86ce  c-ares-1.16.1.tar.gz
+sha256  1cecd5dbe21306c7263f8649aa6e9a37aecb985995a3489f487d98df2b40757d  c-ares-1.17.0.tar.gz
 
 # Hash for license file
 sha256  db4eb63fe09daebdf57d3f79b091bb5ee5070c0d761040e83264e648d307af4c  LICENSE.md
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index f07a7e566f..d3510b3c81 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ARES_VERSION = 1.16.1
+C_ARES_VERSION = 1.17.0
 C_ARES_SITE = http://c-ares.haxx.se/download
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
