From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Aug 2016 14:24:39 +0200
Subject: [Buildroot] [git commit] flex: add security patch
Message-ID: <20160810122443.D0BD480E27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e8b92cec64dbb0dfe57435d3333b359355e3267
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2016-6354 - buffer overflow in generated code (yy_get_next_buffer).

Patch status: upstream backport.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/flex/0002-fix-CVE-2016-6354.patch | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/package/flex/0002-fix-CVE-2016-6354.patch b/package/flex/0002-fix-CVE-2016-6354.patch
new file mode 100644
index 0000000..b0c780b
--- /dev/null
+++ b/package/flex/0002-fix-CVE-2016-6354.patch
@@ -0,0 +1,25 @@
+From a5cbe929ac3255d371e698f62dc256afe7006466 Mon Sep 17 00:00:00 2001
+From: Will Estes <westes575@gmail.com>
+Date: Sat, 27 Feb 2016 11:56:05 -0500
+Subject: [PATCH] Fixed incorrect integer type
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+Status: upstream
+
+ flex.skl | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/flex.skl b/src/flex.skl
+index 36a526a..64f853d 100644
+--- a/flex.skl
++++ b/flex.skl
+@@ -1703,7 +1703,7 @@ int yyFlexLexer::yy_get_next_buffer()
+ 
+ 	else
+ 		{
+-			yy_size_t num_to_read =
++			int num_to_read =
+ 			YY_CURRENT_BUFFER_LVALUE->yy_buf_size - number_to_move - 1;
+ 
+ 		while ( num_to_read <= 0 )
