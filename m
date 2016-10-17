From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:05 -0300
Subject: [Buildroot] [PATCH 18/93] cryptopp: use $(HOST_CONFIGURE_OPTS) when
	calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-19-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/cryptopp/cryptopp.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index df07cf6..dc53e07 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -22,11 +22,11 @@ HOST_CRYPTOPP_MAKE_OPTS = \
 	CXXFLAGS="$(HOST_CXXFLAGS) -fPIC"
 
 define HOST_CRYPTOPP_BUILD_CMDS
-	$(MAKE) -C $(@D) $(HOST_CRYPTOPP_MAKE_OPTS) shared
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(HOST_CRYPTOPP_MAKE_OPTS) shared
 endef
 
 define HOST_CRYPTOPP_INSTALL_CMDS
-	$(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr install
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr install
 endef
 
 $(eval $(host-generic-package))
-- 
2.7.3
