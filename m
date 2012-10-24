From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 24 Oct 2012 09:17:02 +0200
Subject: [Buildroot] [PATCHv2 05/10] at91bootstrap3: add -update-config
	target
In-Reply-To: <1351063027-13800-1-git-send-email-arnout@mind.be>
References: <1351063027-13800-1-git-send-email-arnout@mind.be>
Message-ID: <1351063027-13800-6-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/at91bootstrap3/at91bootstrap3.mk |    7 +++++++
 1 file changed, 7 insertions(+)

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
-- 
1.7.10.4
