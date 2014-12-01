From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 23:17:20 +0100
Subject: [Buildroot] [git commit] iostat: remove legacy code
Message-ID: <20141201223450.4E2A880048@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ffe945be4b705871b3497b2b70db8415cf67b95d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some custom iostat-source target was mistakenly left in place when the
iostat package was migrated to gentargets in commit
ee77963588b09babfd71befb0b5eb9fd1e776bbc, back 4 years ago. This
commit removes this unnecessary custom target.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iostat/iostat.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/iostat/iostat.mk b/package/iostat/iostat.mk
index d19a15a..d28dc1b 100644
--- a/package/iostat/iostat.mk
+++ b/package/iostat/iostat.mk
@@ -9,8 +9,6 @@ IOSTAT_SITE = http://www.linuxinsight.com/files
 IOSTAT_LICENSE = GPL
 IOSTAT_LICENSE_FILES = LICENSE
 
-iostat-source: $(DL_DIR)/$(IOSTAT_SOURCE)
-
 define IOSTAT_BUILD_CMDS
 	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
 endef
