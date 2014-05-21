From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 21 May 2014 10:25:09 +0200
Subject: [Buildroot] [PATCH v2 1/2] acpid: replace "echo -e" with printf
Message-ID: <1400660710-15758-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

printf is POSIX-compliant, echo -e is not.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
Changes v1 -> v2:
    - Added trailing \n (Peter Korsgaard)
---
 package/acpid/acpid.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index 1f4ec31..7a6a478 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -17,7 +17,7 @@ endef
 
 define ACPID_SET_EVENTS
 	mkdir -p $(TARGET_DIR)/etc/acpi/events
-	/bin/echo -e "event=button[ /]power\naction=/sbin/poweroff" \
+	printf "event=button[ /]power\naction=/sbin/poweroff\n" \
 		>$(TARGET_DIR)/etc/acpi/events/powerbtn
 endef
 
-- 
2.0.0.rc0
