From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Sep 2018 23:35:27 +0200
Subject: [Buildroot] [git commit] qt5virtualkeyboard: add hashes of
 3rd-party licenses
Message-ID: <20180905213444.B8FC68292B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3da00bdea5bdb1a516bad485e8a2232b16db507
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add missing license hashes for those three third-parties:

	- src/virtualkeyboard/3rdparty/openwnn/NOTICE
	- src/virtualkeyboard/3rdparty/pinyin/NOTICE
	- src/virtualkeyboard/3rdparty/tcime/COPYING

Fixes:

	>>> qt5virtualkeyboard 5.11.1 Collecting legal info
	LICENSE.GPL3: OK (sha256: 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903)
	ERROR: No hash found for src/virtualkeyboard/3rdparty/openwnn/NOTICE
	ERROR: No hash found for src/virtualkeyboard/3rdparty/pinyin/NOTICE
	ERROR: No hash found for src/virtualkeyboard/3rdparty/tcime/COPYING
	src/virtualkeyboard/3rdparty/lipi-toolkit/MIT_LICENSE.txt: OK (sha256: 7a45a9769d19545480a241230e6ea520b5156fac00930dcd69b6886749743d10)

In order to make this possible, we use a different hash file for the
old version (2.0, used with Qt 5.6) and new (5.11, used with Qt 5.11)
versions of qt5virtualkeyboard.

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5virtualkeyboard/2.0/qt5virtualkeyboard.hash | 5 +++++
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash     | 4 +++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5virtualkeyboard/2.0/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/2.0/qt5virtualkeyboard.hash
new file mode 100644
index 0000000000..266fc3b695
--- /dev/null
+++ b/package/qt5/qt5virtualkeyboard/2.0/qt5virtualkeyboard.hash
@@ -0,0 +1,5 @@
+# Hashes for license files:
+sha256 6148d2793ca4e62ba3935a27bd3e46971a5d7c871dbe8f2687a867bd2c2589fb src/virtualkeyboard/3rdparty/lipi-toolkit/license.txt
+sha256 05cc719deafd0ab083b03296bb2911de10d116953b626a7629b9ca59938038b1 src/virtualkeyboard/3rdparty/openwnn/NOTICE
+sha256 b5830d96fb5a7e7e7ebcc295f352846b4b998e78fdc8f9aa68e134d2e4b39986 src/virtualkeyboard/3rdparty/pinyin/NOTICE
+sha256 ca3dd653e13c4a935622cfce00dc4e2d7a8295b64da99bd1d4f2a8ddb6b0956e src/virtualkeyboard/3rdparty/tcime/COPYING
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
index 8d70cd803d..9270366b93 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
@@ -7,4 +7,6 @@ sha256 5b330dcc770976a2cfb8d85711d72a57c9764c1a9efb889c91e81f6071bbbf9b  qtvirtu
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
 sha256 7a45a9769d19545480a241230e6ea520b5156fac00930dcd69b6886749743d10 src/virtualkeyboard/3rdparty/lipi-toolkit/MIT_LICENSE.txt
-sha256 6148d2793ca4e62ba3935a27bd3e46971a5d7c871dbe8f2687a867bd2c2589fb src/virtualkeyboard/3rdparty/lipi-toolkit/license.txt
+sha256 05cc719deafd0ab083b03296bb2911de10d116953b626a7629b9ca59938038b1 src/virtualkeyboard/3rdparty/openwnn/NOTICE
+sha256 b5830d96fb5a7e7e7ebcc295f352846b4b998e78fdc8f9aa68e134d2e4b39986 src/virtualkeyboard/3rdparty/pinyin/NOTICE
+sha256 9400a6128693d2f25653698e695f554660c71efccc8c21af28bf143e35199db6 src/virtualkeyboard/3rdparty/tcime/COPYING
