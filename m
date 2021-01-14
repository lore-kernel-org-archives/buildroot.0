From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Jan 2021 21:52:38 +0100
Subject: [Buildroot] [git commit] package/at: bump to version 3.2.1
Message-ID: <20210114203424.7B4CB87787@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bbc5268616ae7d0d87d0c41774f0a0c76f3657cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is only one commit between version 3.2.1 and current commit
7c74fa1aece6bc6db351763dc012193d5d634b7e which updates the release file:

https://salsa.debian.org/debian/at/-/commit/6a9efb7dd2bd6a5e5249d9f29938acc639618e9c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/at/at.hash | 2 +-
 package/at/at.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/at/at.hash b/package/at/at.hash
index c266f1ec1a..c5daf4ef86 100644
--- a/package/at/at.hash
+++ b/package/at/at.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  cf00bc31a595dcacec1fee817460c81a1e0fb046e5c0984a13ca13c0f8fb779c  at-7c74fa1aece6bc6db351763dc012193d5d634b7e-br1.tar.gz
+sha256  62123a6fcf02b2606673afca80c2874358b83880c12db7f276a7c6cc70068cb2  at-upstream-3.2.1.tar.bz2
 
 sha256  01dccc0975aa9ba1a9f83e7c5e04f16077353d3c72a0a759b8846ee7a5b2b616  Copyright
 sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
diff --git a/package/at/at.mk b/package/at/at.mk
index dbf649c0be..6ac82e2de3 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-AT_VERSION = 7c74fa1aece6bc6db351763dc012193d5d634b7e
-AT_SITE = https://salsa.debian.org/debian/at.git
-AT_SITE_METHOD = git
+AT_VERSION = 3.2.1
+AT_SOURCE = at-upstream-$(AT_VERSION).tar.bz2
+AT_SITE = https://salsa.debian.org/debian/at/-/archive/upstream/$(AT_VERSION)
 AT_AUTORECONF = YES
 AT_DEPENDENCIES = $(if $(BR2_PACKAGE_FLEX),flex) host-bison host-flex
 AT_LICENSE = GPL-2.0+, GPL-3.0+, ISC
