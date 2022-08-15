Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD920C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6170440A96;
	Mon, 15 Aug 2022 09:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6170440A96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id syaU_4vBk-Ci; Mon, 15 Aug 2022 09:19:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9DD1540A8B;
	Mon, 15 Aug 2022 09:19:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DD1540A8B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 196D61BF990
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE0C5415FA
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE0C5415FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SiKWHEtG9Oox for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:17:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A021041680
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A021041680
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B6D3D875A3; Mon, 15 Aug 2022 09:02:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 11:04:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d8a83fd1f7615f7fdd2f230dc6a360f0840733b
X-Git-Newrev: b828d531ae1c72466e2f45cd59aea686e0ae7322
X-Patchwork-Hint: ignore
Message-Id: <20220815090238.B6D3D875A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zeek: drop bogus PYTHON3_HASHLIB
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b828d531ae1c72466e2f45cd59aea686e0ae7322
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Package python3-hashlib does not exist in the tree.
So drop the reference to it added by commit:
'ea36681572 package/zeek: new package'

Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zeek/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/zeek/Config.in b/package/zeek/Config.in
index 123fedb339..f2a769621f 100644
--- a/package/zeek/Config.in
+++ b/package/zeek/Config.in
@@ -26,7 +26,6 @@ config BR2_PACKAGE_ZEEK_ZEEKCTL
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
 	select BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON3_CURSES
-	select BR2_PACKAGE_PYTHON3_HASHLIB
 	select BR2_PACKAGE_PYTHON3_SQLITE
 	select BR2_PACKAGE_PYTHON3_ZLIB
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
