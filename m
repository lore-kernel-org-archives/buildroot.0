From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 18 Oct 2014 16:47:03 +0200
Subject: [Buildroot] [PATCH 4/5] acpid: Use new FOO_INIT_SYSV_FILES variable
In-Reply-To: <1413643624-14757-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1413643624-14757-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1413643624-14757-5-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the update of pkg-generic, we don't need to define the
FOO_INSTALL_INIT_SYSV function.
In its place, we need to define FOO_INIT_SYSV_FILES with the full path
to the init script.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/acpid/acpid.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index 7a6a478..488034d 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -9,11 +9,7 @@ ACPID_SOURCE = acpid-$(ACPID_VERSION).tar.xz
 ACPID_SITE = http://downloads.sourceforge.net/project/acpid2
 ACPID_LICENSE = GPLv2+
 ACPID_LICENSE_FILES = COPYING
-
-define ACPID_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 package/acpid/S02acpid \
-		$(TARGET_DIR)/etc/init.d/S02acpid
-endef
+ACPID_INIT_SYSV_FILES = package/acpid/S02acpid
 
 define ACPID_SET_EVENTS
 	mkdir -p $(TARGET_DIR)/etc/acpi/events
-- 
2.1.1
