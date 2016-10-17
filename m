From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:07:01 -0300
Subject: [Buildroot] [PATCH 74/93] perl: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-75-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/perl/perl.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 29b4455..fa051b9 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -80,15 +80,15 @@ define PERL_CONFIGURE_CMDS
 endef
 
 define PERL_BUILD_CMDS
-	$(MAKE1) -C $(@D) all
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) all
 endef
 
 define PERL_INSTALL_STAGING_CMDS
-	$(MAKE1) -C $(@D) DESTDIR="$(STAGING_DIR)" install.perl
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR="$(STAGING_DIR)" install.perl
 endef
 
 define PERL_INSTALL_TARGET_CMDS
-	$(MAKE1) -C $(@D) DESTDIR="$(TARGET_DIR)" install.perl
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR="$(TARGET_DIR)" install.perl
 endef
 
 HOST_PERL_CONF_OPTS = \
-- 
2.7.3
