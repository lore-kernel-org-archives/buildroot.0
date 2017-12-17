From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 17 Dec 2017 23:48:24 +0200
Subject: [Buildroot] [PATCH 2/2] iproute2: fix configure output file name
In-Reply-To: <12bbbd716a1599907414d2a419430a7ad10e5520.1513547304.git.baruch@tkos.co.il>
References: <12bbbd716a1599907414d2a419430a7ad10e5520.1513547304.git.baruch@tkos.co.il>
Message-ID: <8ee7fc92d5c3a7a0b04202d7f4c8043cd32e3724.1513547304.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

iproute2 renamed the configure script output file to config.mk. Update
the config tweaking code accordingly.

The configure script now detects xtables correctly, drop this part.

Add a comment to explain the TC_CONFIG_XT disable tweak.

Cc: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/iproute2/iproute2.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index c01917dffef0..15bb132c5001 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -31,9 +31,8 @@ define IPROUTE2_WITH_IPTABLES
 endef
 else
 define IPROUTE2_WITH_IPTABLES
-	# em_ipset needs xtables, but configure misdetects it
-	echo "TC_CONFIG_IPSET:=n" >>$(@D)/Config
-	echo "TC_CONFIG_XT:=n" >>$(@D)/Config
+	# m_xt.so is built unconditionally
+	echo "TC_CONFIG_XT:=n" >>$(@D)/config.mk
 endef
 endif
 
-- 
2.15.1
