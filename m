From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Dec 2013 23:29:56 +0100
Subject: [Buildroot] [PATCH 2/3] package/lvm2: add a host variant
In-Reply-To: <cover.1386023329.git.yann.morin.1998@free.fr>
References: <cover.1386023329.git.yann.morin.1998@free.fr>
Message-ID: <2b1fe40bc107d5e954a460aa195518fe51f11de6.1386023329.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Will be needed later for host-parted.

We need to force --with-confdir and --with-default-system-dir, otherwise
lvm2 tries to install /etc/lvm/profile which we can't do, and don't want
to do.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/lvm2/lvm2.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 2761100..eada3ec 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -50,4 +50,9 @@ else
 LVM2_CONF_OPT += --disable-applib
 endif
 
+HOST_LVM2_CONF_OPT += \
+	--with-confdir=$(HOST_DIR)/etc \
+	--with-default-system-dir=$(HOST_DIR)/etc/lvm
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.8.1.2
