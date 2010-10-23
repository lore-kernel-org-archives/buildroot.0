From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Oct 2010 13:35:02 +0200
Subject: [Buildroot] [PATCH 07/12] libtool: avoid to patch ltmain.sh script
	in host-libtool package
In-Reply-To: <cover.1287833623.git.thomas.petazzoni@free-electrons.com>
References: <cover.1287833623.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f0e7dcab1ac286d1b8af3db1f10c769c0dcb4a02.1287833623.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
1.7.0.4
