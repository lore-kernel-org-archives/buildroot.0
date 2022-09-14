Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB64BECAAD3
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 21:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C7014181F;
	Wed, 14 Sep 2022 21:12:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C7014181F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rhtOgbV8NhFA; Wed, 14 Sep 2022 21:12:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2E8C41814;
	Wed, 14 Sep 2022 21:12:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2E8C41814
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A08881C1148
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 21:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B8A24026F
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 21:11:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B8A24026F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2mpExj1QcLsS for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 21:11:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81F9140124
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 21:11:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81F9140124
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 69FA083A01; Wed, 14 Sep 2022 21:11:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Sep 2022 22:21:20 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: e39aced8fd35c3abea58723aaca816dc091edafa
X-Git-Newrev: cdbf759e676b84c157182068e943cbc11ce02a6e
X-Patchwork-Hint: ignore
Message-Id: <20220914211146.69FA083A01@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/libfreeimage: fix
 patch CRLF line endings
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
Content-Type: multipart/mixed; boundary="===============4371182022047998271=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4371182022047998271==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=cdbf759e676b84c157182068e943cbc11ce02a6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

libfreeimage is a mixed CRLF-LF source code. The patch introduced by
commit d3ee0c781e44 (package/libfreeimage: fix musl build) was missing
the CRLF where they were needed (because patchwork mangles them?).

Fix the three hunks in two files that have the issue.

Reported-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5b4db6b70ff599bcf79fdef642fc93fd96c5bddc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

--===============4371182022047998271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4371182022047998271==--
