From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 14:09:20 +0100
Subject: [Buildroot] [git commit] package/haveged: add SELinux module
Message-ID: <20201229134644.35DC082830@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3de1eed00d20729131b3a01185a9f8911738e6cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for haveged is added by the services/entropyd module in the
SELinux refpolicy.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/haveged/haveged.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
index 924b499fa9..3980f80132 100644
--- a/package/haveged/haveged.mk
+++ b/package/haveged/haveged.mk
@@ -8,6 +8,7 @@ HAVEGED_VERSION = 1.9.13
 HAVEGED_SITE = $(call github,jirka-h,haveged,v$(HAVEGED_VERSION))
 HAVEGED_LICENSE = GPL-3.0+
 HAVEGED_LICENSE_FILES = COPYING
+HAVEGED_SELINUX_MODULES = entropyd
 
 ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
 HAVEGED_CONF_OPTS += --enable-clock_gettime=yes
