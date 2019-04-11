From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 11 Apr 2019 10:02:10 +0200
Subject: [Buildroot] [PATCH] package/python3: fix host and target legal-info
 failure
Message-ID: <20190411080210.6791-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After version bump LICENSE sha256 was not recalculated and generates
python3-legal-info and host-python3-legal-info failure.

Update package hash file with new locally calculated sha256.

Fixes:
http://autobuild.buildroot.net/results/741/741c1d7ea94ff875420af0bd417dbfe737487750/
http://autobuild.buildroot.net/results/615/615286c1b71a74279e156b05c6e34694bf9ea5de/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/python3/python3.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 9a7904c1d5..d5209c23cc 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -2,4 +2,4 @@
 md5		93df27aec0cd18d6d42173e601ffbbfd Python-3.7.3.tar.xz
 # Locally computed
 sha256 da60b54064d4cfcd9c26576f6df2690e62085123826cff2e667e72a91952d318 Python-3.7.3.tar.xz
-sha256 b9a6d9320b8f2693e8d41e496ce56caadacaddcca9be2a64a61749278f425cf2 LICENSE
+sha256 a77d71d6be6f9032e6b6e5d2cf6da68f9eeab9036edfbc043633c8979cd5e82c LICENSE
-- 
2.17.1
