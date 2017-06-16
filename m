From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 16 Jun 2017 06:32:52 +0300
Subject: [Buildroot] [PATCH 07/14] swupdate: don't link with librt
In-Reply-To: <cover.1497583686.git.baruch@tkos.co.il>
References: <cover.1497583686.git.baruch@tkos.co.il>
Message-ID: <cd2b0e9d7375fa32be84640681ad8ae0e108384d.1497583686.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot no longer supports toolchains with glibc older than 2.17, so there
is no need to link with librt for clock_* system calls.

Cc: J?rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/swupdate/swupdate.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/swupdate/swupdate.config b/package/swupdate/swupdate.config
index 643347013d6a..51869bb9d931 100644
--- a/package/swupdate/swupdate.config
+++ b/package/swupdate/swupdate.config
@@ -26,7 +26,7 @@ CONFIG_CROSS_COMPILE=""
 CONFIG_SYSROOT=""
 CONFIG_EXTRA_CFLAGS=""
 CONFIG_EXTRA_LDFLAGS=""
-CONFIG_EXTRA_LDLIBS="rt"
+CONFIG_EXTRA_LDLIBS=""
 
 #
 # Debugging Options
-- 
2.11.0
