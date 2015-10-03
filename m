From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  3 Oct 2015 07:28:18 -0300
Subject: [Buildroot] [PATCH 2/2] dhcpcd: move libexecdir
In-Reply-To: <1443868098-15805-1-git-send-email-gustavo@zacarias.com.ar>
References: <1443868098-15805-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1443868098-15805-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The default is $PREFIX/libexec which ends up in an ugly and non-standard
/libexec dir in the target.
Move it to $PREFIX/lib/dhcpcd which is far more nicer and suitable.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dhcpcd/dhcpcd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index de169b5..66928e2 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -23,6 +23,7 @@ define DHCPCD_CONFIGURE_CMDS
 	(cd $(@D); \
 	$(TARGET_CONFIGURE_OPTS) ./configure \
 		--os=linux \
+		--libexecdir=/lib/dhcpcd \
 		$(DHCPCD_CONFIG_OPTS) )
 endef
 
-- 
2.4.9
