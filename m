From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 27 Apr 2021 00:08:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/uftrace: add missing dependency to
 comment
Message-ID: <20210426220815.521759-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit f06d79255fbf0607200f1cc50a5dd87839295be3 forgot to add
BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS dependency to threads comment

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/uftrace/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uftrace/Config.in b/package/uftrace/Config.in
index 9af7ee8c28..6de9b840ba 100644
--- a/package/uftrace/Config.in
+++ b/package/uftrace/Config.in
@@ -23,4 +23,5 @@ config BR2_PACKAGE_UFTRACE
 	  https://github.com/namhyung/uftrace
 
 comment "uftrace needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.30.2
