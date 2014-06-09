From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 15:06:13 +0200
Subject: [Buildroot] [git commit] lsof: do not remove WIDECHARINCL definition
Message-ID: <20140609130707.E70A99CF7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=566a7bef7ca59e064d1ffc4ba6e84bf35fbc9384
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

WIDECHARINCL is enabled by HASWIDECHAR, so removing its definition if
BR2_USE_WCHAR is not set is useless.

Signed-off-by: Beno??t Th??baudeau <benoit.thebaudeau@advansee.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lsof/lsof.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index ccef3fb..dcdb7cf 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -27,8 +27,6 @@ ifeq ($(BR2_USE_WCHAR),)
 define LSOF_CONFIGURE_WCHAR_FIXUPS
 	$(SED) 's,^#define[[:space:]]*HASWIDECHAR.*,#undef HASWIDECHAR,' \
 		$(@D)/machine.h
-	$(SED) 's,^#define[[:space:]]*WIDECHARINCL.*,,' \
-		$(@D)/machine.h
 endef
 endif
 
