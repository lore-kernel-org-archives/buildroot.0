Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EA1C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 07:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A30F830B8;
	Sun,  7 Aug 2022 07:16:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A30F830B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Ogkx_hEGdiJ; Sun,  7 Aug 2022 07:16:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C47583051;
	Sun,  7 Aug 2022 07:16:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C47583051
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DF8211BF29A
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 07:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B673E83051
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 07:16:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B673E83051
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b1UU_MK4DmAW for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 07:16:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C971D82FAE
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 07:16:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C971D82FAE
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1FF8686D16; Sun,  7 Aug 2022 07:02:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 Aug 2022 09:11:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 09463cb4e9152d1adf4e0d72f0774081961c41ff
X-Git-Newrev: 5b4db6b70ff599bcf79fdef642fc93fd96c5bddc
X-Patchwork-Hint: ignore
Message-Id: <20220807070205.1FF8686D16@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libfreeimage: fix patch CRLF line
 endings
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
Content-Type: multipart/mixed; boundary="===============0487156225637528649=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0487156225637528649==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5b4db6b70ff599bcf79fdef642fc93fd96c5bddc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libfreeimage is a mixed CRLF-LF source code. The patch introduced by
commit d3ee0c781e44 (package/libfreeimage: fix musl build) was missing
the CRLF where they were needed (because patchwork mangles them?).

Fix the three hunks in two files that have the issue.

Reported-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../libfreeimage/0004-fixed-C-11-warnings.patch    | 76 +++++++++++-----------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/package/libfreeimage/0004-fixed-C-11-warnings.patch b/package/libfreeimage/0004-fixed-C-11-warnings.patch
index 449af621d0..cf9c47303a 100644
--- a/package/libfreeimage/0004-fixed-C-11-warnings.patch
+++ b/package/libfreeimage/0004-fixed-C-11-warnings.patch
@@ -8,50 +8,50 @@ Index: trunk/Source/FreeImage/CacheFile.cpp
 --- trunk/Source/FreeImage/CacheFile.cpp	(révision 1895)
 +++ trunk/Source/FreeImage/CacheFile.cpp	(révision 1896)
 @@ -147,10 +147,14 @@
- 				m_current_block->data = new BYTE[BLOCK_SIZE];
- 
- 				fseek(m_file, m_current_block->nr * BLOCK_SIZE, SEEK_SET);
--				fread(m_current_block->data, BLOCK_SIZE, 1, m_file);
--
--				m_page_cache_mem.splice(m_page_cache_mem.begin(), m_page_cache_disk, it->second);
--				m_page_map[nr] = m_page_cache_mem.begin();
-+				if (fread(m_current_block->data, BLOCK_SIZE, 1, m_file) == 1) {
-+					m_page_cache_mem.splice(m_page_cache_mem.begin(), m_page_cache_disk, it->second);
-+					m_page_map[nr] = m_page_cache_mem.begin();
-+				}
-+				else {
-+					FreeImage_OutputMessageProc(FIF_UNKNOWN, "Failed to lock a block in CacheFile");
-+					return NULL;
-+				}
- 			}
- 
- 			// if the memory cache size is too large, swap an item to disc
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
 Index: trunk/Source/FreeImage/MultiPage.cpp
 ===================================================================
 --- trunk/Source/FreeImage/MultiPage.cpp	(révision 1895)
 +++ trunk/Source/FreeImage/MultiPage.cpp	(révision 1896)
 @@ -271,8 +271,8 @@
- 					}
- 				}
- 
--				std::auto_ptr<FIMULTIBITMAP> bitmap (new FIMULTIBITMAP);
--				std::auto_ptr<MULTIBITMAPHEADER> header (new MULTIBITMAPHEADER);
-+				std::unique_ptr<FIMULTIBITMAP> bitmap (new FIMULTIBITMAP);
-+				std::unique_ptr<MULTIBITMAPHEADER> header (new MULTIBITMAPHEADER);
- 				header->m_filename = filename;
- 				// io is default
- 				header->node = node;
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
 @@ -339,8 +339,8 @@
- 				PluginNode *node = list->FindNodeFromFIF(fif);
- 			
- 				if (node) {
--					std::auto_ptr<FIMULTIBITMAP> bitmap (new FIMULTIBITMAP);
--					std::auto_ptr<MULTIBITMAPHEADER> header (new MULTIBITMAPHEADER);
-+					std::unique_ptr<FIMULTIBITMAP> bitmap (new FIMULTIBITMAP);
-+					std::unique_ptr<MULTIBITMAPHEADER> header (new MULTIBITMAPHEADER);
- 					header->io = *io;
- 					header->node = node;
- 					header->fif = fif;
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
 Index: trunk/Source/FreeImage/PSDParser.cpp
 ===================================================================
 --- trunk/Source/FreeImage/PSDParser.cpp	(révision 1895)

--===============0487156225637528649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0487156225637528649==--
