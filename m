From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 22:25:21 +0200
Subject: [Buildroot] [git commit] zeromq: Remove useless space
Message-ID: <20150713202528.5702D81974@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7706f2b2b1b29fd6c6ae700516d483ff95e8b774
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Be coherent with all the other ifeq check where there's no space.
From the doc of Make, it should not cause any trouble, but coherence has
its own merit.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zeromq/zeromq.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 623a12e..029fab2 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -36,7 +36,7 @@ ZEROMQ_CONF_OPTS += --with-system-pgm
 endif
 
 # ZeroMQ uses libsodium if it's available.
-ifeq ($(BR2_PACKAGE_LIBSODIUM), y)
+ifeq ($(BR2_PACKAGE_LIBSODIUM),y)
 ZEROMQ_DEPENDENCIES += libsodium
 ZEROMQ_CONF_OPTS += --with-libsodium="$(STAGING_DIR)/usr"
 else
