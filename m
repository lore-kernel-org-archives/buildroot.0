From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sat,  9 Oct 2010 12:52:54 +0200
Subject: [Buildroot] [PATCH 7/7] libtool: avoid to patch ltmain.sh script in
	host-libtool package
In-Reply-To: <1286621574-10872-1-git-send-email-llandwerlin@gmail.com>
References: <1286621574-10872-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1286621574-10872-8-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/libtool/libtool.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index b57bca9..60fee9f 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -16,6 +16,8 @@ endef
 
 HOST_LIBTOOL_POST_INSTALL_HOOKS += HOST_LIBTOOL_CUSTOM_INSTALL
 
+HOST_LIBTOOL_LIBTOOL_PATCH = NO
+
 $(eval $(call AUTOTARGETS,package,libtool))
 $(eval $(call AUTOTARGETS,package,libtool,host))
 
-- 
1.7.1
