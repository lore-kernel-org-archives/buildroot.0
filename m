Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32E6C433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 20:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 597C983EFB;
	Sat, 28 May 2022 20:40:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9s-wFCBDphx3; Sat, 28 May 2022 20:40:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42FDD831F5;
	Sat, 28 May 2022 20:40:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA56E1BF3C1
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 20:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 921184021C
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 20:40:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b1H1rsfep2Tt for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 20:40:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF78640192
 for <buildroot@buildroot.org>; Sat, 28 May 2022 20:40:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 6B7B486326; Sat, 28 May 2022 20:29:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 22:13:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6891d182b7761a9259423acbeb2488c21d53fdc4
X-Git-Newrev: d3ee0c781e44f03349795fc65e28d26085ec30d3
X-Patchwork-Hint: ignore
Message-Id: <20220528202917.6B7B486326@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libfreeimage: fix musl build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2891249352720333434=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2891249352720333434==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d3ee0c781e44f03349795fc65e28d26085ec30d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following musl build failure:

In file included from /nvmedata/autobuild/instance-12/output-1/per-package/libfreeimage/host/armeb-buildroot-linux-musleabi/sysroot/usr/include/pthread.h:31,
                 from /nvmedata/autobuild/instance-12/output-1/per-package/libfreeimage/host/armeb-buildroot-linux-musleabi/include/c++/9.4.0/armeb-buildroot-linux-musleabi/bits/gthr-default.h:35,
                 from /nvmedata/autobuild/instance-12/output-1/per-package/libfreeimage/host/armeb-buildroot-linux-musleabi/include/c++/9.4.0/armeb-buildroot-linux-musleabi/bits/gthr.h:148,
                 from /nvmedata/autobuild/instance-12/output-1/per-package/libfreeimage/host/armeb-buildroot-linux-musleabi/include/c++/9.4.0/ext/atomicity.h:35,
                 from /nvmedata/autobuild/instance-12/output-1/per-package/libfreeimage/host/armeb-buildroot-linux-musleabi/include/c++/9.4.0/bits/basic_string.h:39,
                 from /nvmedata/autobuild/instance-12/output-1/per-package/libfreeimage/host/armeb-buildroot-linux-musleabi/include/c++/9.4.0/string:55,
                 from Source/Utilities.h:44,
                 from Source/FreeImage/PluginPSD.cpp:27:
Source/FreeImage/PluginPSD.cpp: In function 'BOOL Save(FreeImageIO*, FIBITMAP*, fi_handle, int, int, void*)':
Source/FreeImage/PluginPSD.cpp:130:10: error: cannot convert 'std::nullptr_t' to 'BOOL' {aka 'int'} in return
  130 |   return NULL;
      |          ^~~~

Fixes:
 - http://autobuild.buildroot.org/results/f9c4ba83a506d374d8a28673aac619d8ff80f3da

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../libfreeimage/0004-fixed-C-11-warnings.patch    | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/package/libfreeimage/0004-fixed-C-11-warnings.patch b/package/libfreeimage/0004-fixed-C-11-warnings.patch
new file mode 100644
index 0000000000..449af621d0
--- /dev/null
+++ b/package/libfreeimage/0004-fixed-C-11-warnings.patch
@@ -0,0 +1,94 @@
+fixed C++11 warnings
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from: https://sourceforge.net/p/freeimage/svn/1896]
+
+Index: trunk/Source/FreeImage/CacheFile.cpp
+===================================================================
+--- trunk/Source/FreeImage/CacheFile.cpp	(révision 1895)
++++ trunk/Source/FreeImage/CacheFile.cpp	(révision 1896)
+@@ -147,10 +147,14 @@
+ 				m_current_block->data = new BYTE[BLOCK_SIZE];
+ 
+ 				fseek(m_file, m_current_block->nr * BLOCK_SIZE, SEEK_SET);
+-				fread(m_current_block->data, BLOCK_SIZE, 1, m_file);
+-
+-				m_page_cache_mem.splice(m_page_cache_mem.begin(), m_page_cache_disk, it->second);
+-				m_page_map[nr] = m_page_cache_mem.begin();
++				if (fread(m_current_block->data, BLOCK_SIZE, 1, m_file) == 1) {
++					m_page_cache_mem.splice(m_page_cache_mem.begin(), m_page_cache_disk, it->second);
++					m_page_map[nr] = m_page_cache_mem.begin();
++				}
++				else {
++					FreeImage_OutputMessageProc(FIF_UNKNOWN, "Failed to lock a block in CacheFile");
++					return NULL;
++				}
+ 			}
+ 
+ 			// if the memory cache size is too large, swap an item to disc
+Index: trunk/Source/FreeImage/MultiPage.cpp
+===================================================================
+--- trunk/Source/FreeImage/MultiPage.cpp	(révision 1895)
++++ trunk/Source/FreeImage/MultiPage.cpp	(révision 1896)
+@@ -271,8 +271,8 @@
+ 					}
+ 				}
+ 
+-				std::auto_ptr<FIMULTIBITMAP> bitmap (new FIMULTIBITMAP);
+-				std::auto_ptr<MULTIBITMAPHEADER> header (new MULTIBITMAPHEADER);
++				std::unique_ptr<FIMULTIBITMAP> bitmap (new FIMULTIBITMAP);
++				std::unique_ptr<MULTIBITMAPHEADER> header (new MULTIBITMAPHEADER);
+ 				header->m_filename = filename;
+ 				// io is default
+ 				header->node = node;
+@@ -339,8 +339,8 @@
+ 				PluginNode *node = list->FindNodeFromFIF(fif);
+ 			
+ 				if (node) {
+-					std::auto_ptr<FIMULTIBITMAP> bitmap (new FIMULTIBITMAP);
+-					std::auto_ptr<MULTIBITMAPHEADER> header (new MULTIBITMAPHEADER);
++					std::unique_ptr<FIMULTIBITMAP> bitmap (new FIMULTIBITMAP);
++					std::unique_ptr<MULTIBITMAPHEADER> header (new MULTIBITMAPHEADER);
+ 					header->io = *io;
+ 					header->node = node;
+ 					header->fif = fif;
+Index: trunk/Source/FreeImage/PSDParser.cpp
+===================================================================
+--- trunk/Source/FreeImage/PSDParser.cpp	(révision 1895)
++++ trunk/Source/FreeImage/PSDParser.cpp	(révision 1896)
+@@ -97,7 +97,7 @@
+ template <int N>
+ class PSDGetValue {
+ public:
+-	static inline int get(const BYTE * iprBuffer) {} // error
++	static inline int get(const BYTE * iprBuffer) { return -1; } // error
+ };
+ 
+ template <>
+Index: trunk/Source/FreeImage/PluginPSD.cpp
+===================================================================
+--- trunk/Source/FreeImage/PluginPSD.cpp	(révision 1895)
++++ trunk/Source/FreeImage/PluginPSD.cpp	(révision 1896)
+@@ -127,7 +127,7 @@
+ static BOOL DLL_CALLCONV
+ Save(FreeImageIO *io, FIBITMAP *dib, fi_handle handle, int page, int flags, void *data) {
+ 	if(!handle) {
+-		return NULL;
++		return FALSE;
+ 	}
+ 	try {
+ 		psdParser parser;
+Index: trunk/Source/FreeImage/PluginHDR.cpp
+===================================================================
+--- trunk/Source/FreeImage/PluginHDR.cpp	(révision 1895)
++++ trunk/Source/FreeImage/PluginHDR.cpp	(révision 1896)
+@@ -244,7 +244,8 @@
+ 		}
+ 		else if((buf[0] == '#') && (buf[1] == 0x20)) {
+ 			header_info->valid |= RGBE_VALID_COMMENT;
+-			strcpy(header_info->comment, buf);
++			strncpy(header_info->comment, buf, HDR_MAXLINE - 1);
++			header_info->comment[HDR_MAXLINE - 1] = '\0';
+ 		}
+ 	}
+ 	if(!bHeaderFound || !bFormatFound) {

--===============2891249352720333434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2891249352720333434==--
