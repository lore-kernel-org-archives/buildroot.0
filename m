From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu,  3 Jun 2021 02:58:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/lvm2: remove endif that prevents
 Buildroot to use Makefiles at all
In-Reply-To: <20210603005805.216004-1-giulio.benetti@benettiengineering.com>
References: <20210603005805.216004-1-giulio.benetti@benettiengineering.com>
Message-ID: <20210603005805.216004-2-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit [1] breaks Buildroot Makefile since a Makefile endif has been left
with no sense giving following error:
package/lvm2/lvm2.mk:61: *** extraneous 'endif'.  Stop.

So let's remove that forgotten endif.

[1]: https://git.buildroot.net/buildroot/commit/?id=8a313b019c7d7e898186a8b08f9c25ae0194fa16

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/lvm2/lvm2.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 70787fe91b..5ce79768b6 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -58,8 +58,6 @@ LVM2_INSTALL_STAGING_OPTS += install_device-mapper
 LVM2_INSTALL_TARGET_OPTS += install_device-mapper
 endif
 
-endif
-
 ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 LVM2_CONF_ENV += ac_cv_flag_HAVE_PIE=no
 endif
-- 
2.25.1
