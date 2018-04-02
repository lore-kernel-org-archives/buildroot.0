From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Apr 2018 16:09:56 +0200
Subject: [Buildroot] [git commit] support/download: make sure the download
 folder is created
Message-ID: <20180402141058.4B46782586@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08252b545783951a36590db38e51afd49f647f3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

At the moment, it means that we make sure that BR2_DL_DIR is created, in
the future, it will make sure that BR2_DL_DIR/PKG_NAME/ is created.

[Peter: drop trailing / on mkdir]
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-download.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 3f525ee5e4..3f35661a16 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -88,6 +88,7 @@ endif
 endif
 
 define DOWNLOAD
+	$(Q)mkdir -p $($(PKG)_DL_DIR)
 	$(Q)$(if $(filter bzr cvs hg svn,$($(PKG)_SITE_METHOD)),
 		BR_NO_CHECK_HASH_FOR=$(notdir $(call qstrip,$(1)))) \
 	$(EXTRA_ENV) $(DL_WRAPPER) \
