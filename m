From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] lshw: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161022132038.B263E819A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa9ee8138f0c2c77edef100fbb8370ea7683dc5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
