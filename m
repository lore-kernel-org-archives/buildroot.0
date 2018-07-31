From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Jul 2018 23:51:10 +0200
Subject: [Buildroot] [git commit] linux-firmware: fix hash for WHENCE
 license file
Message-ID: <20180731214738.EC2D98B37D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dcefb157e186b0d33d5bfc99ca6e5db218072d8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 51435be1f1e8d4f7f50c95a406ecde6cb0e22418 ("linux-firmware: bump
version to latest 8d69bab") bumped the linux-firmware package, but
forgot to update the hash file accordingly for the license files.

Especially, the WHENCE file contains the list of all licenses for the
different firmware, so it gets updated pretty much whenever a new
firmware is added or a firmware is updated.

Update its hash to fix legal-info for the linux-firmware package, and
therefore fix:

  http://autobuild.buildroot.net/results/9795ac912d1bbe66386be9286f1703cdbe0a8898/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/linux-firmware.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index d0dfe93f2a..ede2068c6d 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -27,5 +27,5 @@ sha256 8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e LICENSE.
 sha256 be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc LICENSE.qcom
 sha256 fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f LICENSE.radeon
 sha256 2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9 LICENSE.sdma_firmware
-sha256 9703115e298649dfad003d7d3d55f4b2bd417e28f19e9cf6d5c6f9a906a2c4d9 WHENCE
+sha256 a2cb7fe112a70132b423aa5db5fdb206bb0bfb89b2fbeb2c38a60ed7da57a3ba WHENCE
 sha256 fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a qcom/NOTICE.txt
