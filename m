From: Mirza Krak <mirza.krak@northern.tech>
Date: Mon, 20 Aug 2018 15:09:04 +0200
Subject: [Buildroot] [[PATCH v2 04/14] package/mender: create directory
 containing Mender state script
In-Reply-To: <20180820130914.22377-1-mirza.krak@northern.tech>
References: <20180820130914.22377-1-mirza.krak@northern.tech>
Message-ID: <20180820130914.22377-5-mirza.krak@northern.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mender state-scripts are essentially "hooks" that can be provided to
influence the update flow.

They should be placed inside /etc/mender/scripts and the directory must
contain a file containing the current state-script format version. It is
currently "2".

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
---
 package/mender/mender.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 71f92ce048..acf50e0092 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -12,6 +12,9 @@ define MENDER_INSTALL_CONFIG_FILES
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/data/uboot
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/uboot
 
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/mender/scripts
+	echo -n "2" > $(TARGET_DIR)/etc/mender/scripts/version
+
 	$(INSTALL) -D -m 0644 package/mender/mender.conf \
 		$(TARGET_DIR)/etc/mender/mender.conf
 	$(INSTALL) -D -m 0644 package/mender/tenant.conf \
-- 
2.11.0
