From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 12:27:43 +0200
Subject: [Buildroot] [git commit] bitstream: fix hash file
Message-ID: <20181008102747.44F058E2DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e73bbef07f0f42cc2b0ad38acaf0231755a230cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit d52e17701d73749fe81495b7c956268362ca0bbd
("package/bitstream: bump version to 1.4"), the hash file of the
bitstream package was not properly updated, with the md5 line being
wrong. This commit fixes this problem, which was noticed by
check-package:

package/bitstream/bitstream.hash:2: expected three fields (http://nightly.buildroot.org/#adding-packages-hash)
package/bitstream/bitstream.hash:2: hash size does not match type (http://nightly.buildroot.org/#adding-packages-hash)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bitstream/bitstream.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bitstream/bitstream.hash b/package/bitstream/bitstream.hash
index 6a384e302d..89da7c6fd0 100644
--- a/package/bitstream/bitstream.hash
+++ b/package/bitstream/bitstream.hash
@@ -1,5 +1,5 @@
 # From https://get.videolan.org/bitstream/1.4/bitstream-1.4.tar.bz2.md5
-md5 https://get.videolan.org/bitstream/1.4/bitstream-1.4.tar.bz2.md5
+md5 dfb1449194250b2d364d54b5bbac858d  bitstream-1.4.tar.bz2
 # From https://get.videolan.org/bitstream/1.4/bitstream-1.4.tar.bz2.sha256
 sha256 b2484940d3b8733bec9dd1ec1731de428261dff31c9f95874264be9dc9ce786b  bitstream-1.4.tar.bz2
 # Locally computed
