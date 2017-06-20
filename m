From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 22:13:03 +0200
Subject: [Buildroot] [git commit] swupdate: don't link with librt
Message-ID: <20170620201445.365B87FED4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87f8ff6d2d376fcd7f2a15346d1901f93addf9f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot no longer supports toolchains with glibc older than 2.17, so there
is no need to link with librt for clock_* system calls.

Cc: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/swupdate/swupdate.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/swupdate/swupdate.config b/package/swupdate/swupdate.config
index 6433470..51869bb 100644
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
