From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Wed, 16 Mar 2011 17:07:08 +0100
Subject: [Buildroot] [PATCHv2] fetch/git: clone the repository as bare
In-Reply-To: <1300193398-15217-1-git-send-email-plagnioj@jcrosoft.com>
References: <1300193398-15217-1-git-send-email-plagnioj@jcrosoft.com>
Message-ID: <1300291628-7478-1-git-send-email-plagnioj@jcrosoft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this will reduce the space used and speed up the clone
as we will generate an archive later which does need the tree checkouted

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
v2:

Fix subject

Best Regards,
J.
 package/Makefile.package.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 84687d5..bf4e1b4 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -105,7 +105,7 @@ endif
 define DOWNLOAD_GIT
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 	(pushd $(DL_DIR) > /dev/null && \
-	$(GIT) clone $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
+	$(GIT) clone --bare $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
 	pushd $($(PKG)_BASE_NAME) > /dev/null && \
 	$(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) | \
 		gzip -c > $(DL_DIR)/$($(PKG)_SOURCE) && \
-- 
1.7.4.1
