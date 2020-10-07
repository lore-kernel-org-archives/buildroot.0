From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Wed,  7 Oct 2020 22:10:19 +0200
Subject: [Buildroot] [PATCH] DEVELOPERS: Fix warning with get-developers
Message-ID: <1602101419-7932-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is a typo between 'N' (for Firstname Lastname <email>) & 'F'
(for file pattern or directory)

$: ./utils/get-developers outgoing/*
WARNING: 'Sven Fischer <sven@leiderfischer.de>' doesn't match any file

Fixes: e7ebc7cd0905d7 ("package/qt5/qt5remoteobjects: new package")

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 DEVELOPERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 354b856..3eceebf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2538,8 +2538,8 @@ F:	configs/rock_pi_n10_defconfig
 F:	configs/rockpro64_defconfig
 F:	package/arm-gnu-a-toolchain/
 
-F:	Sven Fischer <sven@leiderfischer.de>
-N:	package/qt5/qt5remoteobjects/
+N:	Sven Fischer <sven@leiderfischer.de>
+F:	package/qt5/qt5remoteobjects/
 
 N:	Sven Haardiek <sven.haardiek@iotec-gmbh.de>
 F:	package/lcdproc/
-- 
2.7.4
