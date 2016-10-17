From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:22 -0300
Subject: [Buildroot] [PATCH 35/93] softether: use $(HOST_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-36-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/softether/softether.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/softether/softether.mk b/package/softether/softether.mk
index 9f98774..da7d129 100644
--- a/package/softether/softether.mk
+++ b/package/softether/softether.mk
@@ -34,9 +34,9 @@ HOST_SOFTETHER_DEPENDENCIES = host-pkgconf host-openssl host-readline
 # target build creates the file hamcore.se2 which needs the host variant of
 # hamcorebuilder, for details see http://www.vpnusers.com/viewtopic.php?p=5426
 define HOST_SOFTETHER_BUILD_CMDS
-	$(MAKE) -C $(@D)/src/Mayaqua
-	$(MAKE) -C $(@D)/src/Cedar
-	$(MAKE) -C $(@D)/src/hamcorebuilder
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/src/Mayaqua
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/src/Cedar
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/src/hamcorebuilder
 endef
 
 define HOST_SOFTETHER_INSTALL_CMDS
-- 
2.7.3
