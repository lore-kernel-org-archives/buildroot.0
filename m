From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Apr 2021 12:11:58 +0200
Subject: [Buildroot] [git commit] package/uftrace: add missing dependency to
 comment
Message-ID: <20210428094628.77C7D81594@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74a8e8670a96f281c4348fee2903a295a304f3d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit f06d79255fbf0607200f1cc50a5dd87839295be3 forgot to add
BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS dependency to threads comment

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
