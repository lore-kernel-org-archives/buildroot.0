From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Dec 2017 10:01:53 +0100
Subject: [Buildroot] [git commit] iproute2: fix configure output file name
Message-ID: <20171218090428.85D058081A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f822cd793b07fff3db17b3898b858f003ead70d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

iproute2 renamed the configure script output file to config.mk. Update
the config tweaking code accordingly.

The configure script now detects xtables correctly, drop this part.

Add a comment to explain the TC_CONFIG_XT disable tweak.

Cc: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iproute2/iproute2.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index c01917d..15bb132 100644
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
 
