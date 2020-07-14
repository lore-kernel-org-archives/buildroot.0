From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Tue, 14 Jul 2020 11:57:50 -0500
Subject: [Buildroot] [PATCH v2 2/2] package/qemu: add usb-redir support
In-Reply-To: <20200714165750.33726-1-jared.bents@rockwellcollins.com>
References: <20200714165750.33726-1-jared.bents@rockwellcollins.com>
Message-ID: <20200714165750.33726-2-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

update to add usb-redir support to qemu if usbredir is enabled

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
--
v1->v2: N/A. Update in v2 was to handle suboptions for vnc support.
        No change for usb-redir support.
---
 package/qemu/qemu.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index ff234622f4..d08dcdc057 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -141,6 +141,13 @@ else
 QEMU_OPTS += --disable-spice
 endif
 
+ifeq ($(BR2_PACKAGE_USBREDIR),y)
+QEMU_OPTS += --enable-usb-redir
+QEMU_DEPENDENCIES += usbredir
+else
+QEMU_OPTS += --disable-usb-redir
+endif
+
 # Override CPP, as it expects to be able to call it like it'd
 # call the compiler.
 define QEMU_CONFIGURE_CMDS
@@ -173,7 +180,6 @@ define QEMU_CONFIGURE_CMDS
 			--disable-docs \
 			--disable-rbd \
 			--disable-libiscsi \
-			--disable-usb-redir \
 			--disable-strip \
 			--disable-sparse \
 			--disable-mpath \
-- 
2.17.1
