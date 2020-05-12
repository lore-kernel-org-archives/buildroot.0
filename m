From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 May 2020 10:42:03 +0200
Subject: [Buildroot] [git commit] package/c-ares: security bump to version
 1.16.1
Message-ID: <20200512082850.DD64C8E15C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42a0b2d2d9e8d04f1a44b50cfe29db3ac9eac6f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Prevent possible use-after-free and double-free in ares_getaddrinfo() if
ares_destroy() is called prior to ares_getaddrinfo() completing.

https://c-ares.haxx.se/changelog.html#1_16_1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/c-ares/c-ares.hash | 2 +-
 package/c-ares/c-ares.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
index d4fe483ae6..04a87402e9 100644
--- a/package/c-ares/c-ares.hash
+++ b/package/c-ares/c-ares.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  de058ad7c128156e2db6dc98b8a359924d6f210a1b99dd36ba15c8f839a83a89  c-ares-1.16.0.tar.gz
+sha256  d08312d0ecc3bd48eee0a4cc0d2137c9f194e0a28de2028928c0f6cae85f86ce  c-ares-1.16.1.tar.gz
 
 # Hash for license file
 sha256  db4eb63fe09daebdf57d3f79b091bb5ee5070c0d761040e83264e648d307af4c  LICENSE.md
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index e8723bf784..f07a7e566f 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ARES_VERSION = 1.16.0
+C_ARES_VERSION = 1.16.1
 C_ARES_SITE = http://c-ares.haxx.se/download
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
