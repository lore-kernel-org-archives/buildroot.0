From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sun, 10 Aug 2008 10:46:34 +0200
Subject: [Buildroot] [PATCH 2b/2] Vim: bump to 7.1.295
In-Reply-To: <200807240020.57641.markus.heidelberg@web.de>
References: <200807230146.01380.markus.heidelberg@web.de>
	<200807240020.57641.markus.heidelberg@web.de>
Message-ID: <200808101046.34802.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

what about the following Vim patches, I sent on 23./24.07.?
[PATCH 1/2] Vim: don't use "extra" archive
[PATCH 2/2] Vim: bump to 7.1.330

I'm unsure about the file packages/editors/vim/configure.patch. What's its
purpose?  <VIM>/src/auto/configure is created by autoconf 2.61, the original by
2.59. I don't think this patch is needed.

I created a new patch that only updates Vim up to 7.1.295. An update to
configure.patch is not necessary, it applies with offset and fuzz. 7.1.296
introduces selinux support and needs an update of configure.patch.

By the way Vim-7.2 has been released yesterday, configure is created by
autoconf 2.62. Is configure.patch still needed, if it ever was?

But I wonder whether there really exist users of Vim in Buildroot. Who uses it
without runtime files because of the error that PATCH 1/2 fixes?



diff --git a/package/editors/vim/patches b/package/editors/vim/patches
index 856a8db..7161e2e 100644
--- a/package/editors/vim/patches
+++ b/package/editors/vim/patches
@@ -231,3 +231,40 @@
 250
 251
 252
+253
+254
+255
+256
+257
+258
+259
+260
+261
+262
+263
+264
+265
+266
+267
+268
+269
+270
+271
+272
+273
+274
+276
+277
+279
+281
+284
+286
+287
+288
+289
+290
+291
+292
+293
+294
+295
