From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Tue, 22 Dec 2020 16:07:35 +0100
Subject: [Buildroot] [PATCH 14/15] package/haveged: add SELinux module
In-Reply-To: <20201222150736.319593-1-maxime.chevallier@bootlin.com>
References: <20201222150736.319593-1-maxime.chevallier@bootlin.com>
Message-ID: <20201222150736.319593-15-maxime.chevallier@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support for haveged is added by the services/entropyd module in the
SELinux refpolicy.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
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
-- 
2.25.4
