From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu,  8 Nov 2012 09:36:11 +0100
Subject: [Buildroot] [PATCH v3 05/10] at91bootstrap3: add -update-config
	target
In-Reply-To: <1352363776-23638-1-git-send-email-arnout@mind.be>
References: <1352363776-23638-1-git-send-email-arnout@mind.be>
Message-ID: <1352363776-23638-5-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
---
v3: update documentation as well
---
 boot/at91bootstrap3/at91bootstrap3.mk |    7 +++++++
 docs/manual/customize-store.txt       |    6 +++---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index 74f08e8..bb6ef09 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -65,3 +65,10 @@ $(error No at91bootstrap3 configuration file specified, check your BR2_TARGET_AT
 endif
 endif
 endif
+
+ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_CUSTOM_CONFIG),y)
+at91bootstrap3-update-config: at91bootstrap3-configure
+	cp -f $(AT91BOOTSTRAP3_DIR)/.config $(AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE)
+else
+at91bootstrap3-update-config: ;
+endif
diff --git a/docs/manual/customize-store.txt b/docs/manual/customize-store.txt
index 3eb76ef..6c799ee 100644
--- a/docs/manual/customize-store.txt
+++ b/docs/manual/customize-store.txt
@@ -61,11 +61,11 @@ configuration files easier.
   path specified by +BR2_UCLIBC_CONFIG+.
 * +make ctng-update-config+ saves the crosstool-NG configuration to the
   patch specified by +BR2_TOOLCHAIN_CTNG_CONFIG+.
+* +make at91bootstrap3-update-config+ saves the at91bootstrap3
+  configuration to the path specified by
+  +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE+.
 * +make barebox-update-defconfig+ saves the barebox configuration to the
   path specified by +BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE+.
-* For at91bootstrap3, no helper exists so you
-  have to copy the config file manually to
-  +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE+.
 
 Creating your own board support
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 
1.7.10.4
