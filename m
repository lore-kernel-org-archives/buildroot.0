From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 10:13:10 +0100
Subject: [Buildroot] [git commit] package/{dovecot,
 dovecot-pigeonhole}: bump version to 2.3.4, 0.5.4
Message-ID: <20181202071558.722FF82855@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c47cabd179579c681df86f37db4bfb9ee70c41f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to bump both packages in one commit:

https://dovecot.org/pipermail/dovecot-news/2018-November/000392.html

 Adjustments to several changes in Dovecot v2.3.4 make this Pigeonhole
 release dependent on that Dovecot release; it will not compile against
 older Dovecot versions. And, conversely, you need to upgrade
 Pigeonhole when upgrading Dovecot to v2.3.4.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dovecot-pigeonhole/dovecot-pigeonhole.hash | 2 +-
 package/dovecot-pigeonhole/dovecot-pigeonhole.mk   | 2 +-
 package/dovecot/dovecot.hash                       | 2 +-
 package/dovecot/dovecot.mk                         | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
index b20ab0dcf4..5ad9406ad2 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
@@ -1,3 +1,3 @@
 # Locally computed after checking signature
-sha256 e02f2741c05f9e2af1c5f46da35efb74997f9d4b941ba68936206d310ddf2622  dovecot-2.3-pigeonhole-0.5.3.tar.gz
+sha256 547999e67a001abc5e654c7e35653d3fe057fa9a47a24257e39a79c41ef08516  dovecot-2.3-pigeonhole-0.5.4.tar.gz
 sha256 fc9e9522216f2a9a28b31300e3c73c1df56acc27dfae951bf516e7995366b51a  COPYING
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index 2647426e36..184204673b 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOVECOT_PIGEONHOLE_VERSION = 0.5.3
+DOVECOT_PIGEONHOLE_VERSION = 0.5.4
 DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.3-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
 DOVECOT_PIGEONHOLE_SITE = https://pigeonhole.dovecot.org/releases/2.3
 DOVECOT_PIGEONHOLE_LICENSE = LGPL-2.1
diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index 5f982a7943..c4abc18bea 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-sha256 15af27ee25258afb4ad9581f8df681be998b763597086bbae54ca7d77a066d8e  dovecot-2.3.3.tar.gz
+sha256 d91b76eff8df6185c1799f1b279f780105bdeeea27e3286b42f4cab18efbef05  dovecot-2.3.4.tar.gz
 sha256 a363b132e494f662d98c820d1481297e6ae72f194c2c91b6c39e1518b86240a8  COPYING
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256 52b8c95fabb19575281874b661ef7968ea47e8f5d74ba0dd40ce512e52b3fc97  COPYING.MIT
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 17cdc22e53..45c9f67c3c 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.3
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).3
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).4
 DOVECOT_SITE = https://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, BSD-3-Clause, Unicode-DFS-2015
