From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 10 Jan 2011 09:28:43 -0500
Subject: [Buildroot] [PATCH 5/7] portmap: respect target CFLAGS
In-Reply-To: <1294669725-5379-1-git-send-email-vapier@gentoo.org>
References: <1294669718-5339-1-git-send-email-vapier@gentoo.org>
	<1294669725-5379-1-git-send-email-vapier@gentoo.org>
Message-ID: <1294669725-5379-5-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 package/portmap/portmap.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
index 4a5fe62..bebafce 100644
--- a/package/portmap/portmap.mk
+++ b/package/portmap/portmap.mk
@@ -15,6 +15,7 @@ PORTMAP_FLAGS += NO_FORK=1
 endif
 
 define PORTMAP_BUILD_CMDS
+	CFLAGS="$(TARGET_CFLAGS)" \
 	$(MAKE) CC="$(TARGET_CC)" -C $(@D) $(PORTMAP_FLAGS)
 endef
 
-- 
1.7.4.rc1
