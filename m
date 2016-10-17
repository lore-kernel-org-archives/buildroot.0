From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:46 -0300
Subject: [Buildroot] [PATCH 59/93] lshw: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-60-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/lshw/lshw.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
index 9227584..32c0bc0 100644
--- a/package/lshw/lshw.mk
+++ b/package/lshw/lshw.mk
@@ -16,7 +16,9 @@ endif
 
 LSHW_MAKE_OPTS = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" AR="$(TARGET_AR)" \
 	RPM_OPT_FLAGS="$(LSHW_CFLAGS)" all
-LSHW_MAKE_ENV = LIBS="$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)"
+LSHW_MAKE_ENV = \
+	$(TARGET_MAKE_ENV) \
+	LIBS="$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)"
 LSHW_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
 define LSHW_BUILD_CMDS
-- 
2.7.3
