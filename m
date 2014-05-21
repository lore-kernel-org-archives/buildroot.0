From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 May 2014 10:39:41 +0200
Subject: [Buildroot] [git commit] acpid: replace "echo -e" with printf
Message-ID: <20140521084903.0215E9CC4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b9bc5fe407c519b048faea22468d59cadec49a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

printf is POSIX-compliant, echo -e is not.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/acpid/acpid.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
 
