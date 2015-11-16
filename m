From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Nov 2015 23:03:37 +0100
Subject: [Buildroot] [git commit] package/gauche: force to use internal
	libatomic_ops
Message-ID: <20151116220431.5715280054@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e97eab114e07c439a1c67aeada58c827f7c4615c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Force to use internal libatomic_ops of gauche, since the external
libatomic_ops packaged in Buildroot is not compatible with gauche.

Fixes:

  http://autobuild.buildroot.org/results/a97/a979f6a58f0fbb1896830461d6c384f4a65c9429/

[Thomas: tweak commit log.]

Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gauche/gauche.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/gauche/gauche.mk b/package/gauche/gauche.mk
index b887c6a..95a448b 100644
--- a/package/gauche/gauche.mk
+++ b/package/gauche/gauche.mk
@@ -12,6 +12,7 @@ GAUCHE_LICENSE_FILES = COPYING
 GAUCHE_DEPENDENCIES = host-gauche
 
 HOST_GAUCHE_CONF_OPTS = --without-zlib
+GAUCHE_CONF_OPTS = --without-libatomic-ops
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 GAUCHE_CONF_OPTS += --with-zlib=$(STAGING_DIR)
