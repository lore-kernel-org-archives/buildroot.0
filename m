From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:07:02 -0300
Subject: [Buildroot] [PATCH 75/93] perl: use $(HOST_MAKE_ENV) when calling
	$(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-76-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/perl/perl.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index fa051b9..9c1389c 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -101,11 +101,11 @@ define HOST_PERL_CONFIGURE_CMDS
 endef
 
 define HOST_PERL_BUILD_CMDS
-	$(MAKE) -C $(@D)
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define HOST_PERL_INSTALL_CMDS
-	$(MAKE) -C $(@D) INSTALL_DEPENDENCE='' install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) INSTALL_DEPENDENCE='' install
 endef
 
 $(eval $(generic-package))
-- 
2.7.3
