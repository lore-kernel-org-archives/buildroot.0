From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun, 24 May 2020 23:28:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: enable hash checks
 for svn tarbals
Message-ID: <20200524212831.25032-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With commit 89f5e989323ace815a32fced27eaefee2f4666de support for
reproducible archives was added. Thus archives generated from svn do no
longer needs to be added to BR_NO_CHECK_HASH_FOR.

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 946dc6d561..f9385177ac 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -577,7 +577,7 @@ ifndef $(2)_DL_OPTS
  endif
 endif
 
-ifneq ($$(filter bzr cvs hg svn,$$($(2)_SITE_METHOD)),)
+ifneq ($$(filter bzr cvs hg,$$($(2)_SITE_METHOD)),)
 BR_NO_CHECK_HASH_FOR += $$($(2)_SOURCE)
 endif
 
-- 
2.20.1
