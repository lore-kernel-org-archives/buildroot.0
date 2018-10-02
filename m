From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue,  2 Oct 2018 23:43:18 +0200
Subject: [Buildroot] [PATCH] linux-firmware: fix build failure on legal-info
Message-ID: <20181002214318.85312-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In linux-firmware.hash WHENCE sha256 is wrong causing make legal-info to
fail.

Recalculate locally and update it.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/linux-firmware/linux-firmware.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index ba0de28848..ca6ad8f59d 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -27,5 +27,5 @@ sha256 8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e LICENSE.
 sha256 be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc LICENSE.qcom
 sha256 fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f LICENSE.radeon
 sha256 2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9 LICENSE.sdma_firmware
-sha256 a2cb7fe112a70132b423aa5db5fdb206bb0bfb89b2fbeb2c38a60ed7da57a3ba WHENCE
+sha256 ef38a9a8bb4b0f72b369d337426eea63ef8fc9d48453f127028d935f7dbc5820 WHENCE
 sha256 fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a qcom/NOTICE.txt
-- 
2.17.1
