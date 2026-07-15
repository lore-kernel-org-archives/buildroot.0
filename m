Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477BCC44507
	for <buildroot@archiver.kernel.org>; Wed, 15 Jul 2026 19:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 408176074C;
	Wed, 15 Jul 2026 19:35:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pAbB4eBde-L7; Wed, 15 Jul 2026 19:35:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44AB360718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784144152;
	bh=C8QQlvPLPbt6QhRz1QRTtzKVH2SrlP/29lvb3xAnmJ4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=szRio4HoKFn75ZEDiIIIR3wKv4loyyX8Si8qCTvMrhVGtlLMmvMaRZTvn2vnQ2pwj
	 yYTazymGJVAGZ2EOLLt3rFHPx1KJQePrkWhJ+4stuYnRs5VUpwX7FLYOHJn+RqeAfZ
	 s6vPnl7cPlFY4vdRMrZfMtugiAZ8g5rh0M1cddQSX/nRGt4bwsW07f3E2BNF6eC+U+
	 1s4wkmqk9syfeX0Ae8m1mhxv1vRCmuPW1XUDP/e8EL0ETpoIOOLiBZXfQzzdt0h9nt
	 luaPgr5SMx8W39obb1coGBzwR9aCt2VFhESccgK9AYdjpGWtVJ1IFHz04GsL3Yw6jH
	 KpZN59vPwrjRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44AB360718;
	Wed, 15 Jul 2026 19:35:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CF7B1F6
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 232D5605CF
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:35:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DGj9lhod8mRg for <buildroot@buildroot.org>;
 Wed, 15 Jul 2026 19:35:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A21D2605E4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A21D2605E4
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:35:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46B9288999; Wed, 15 Jul 2026 19:35:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Jul 2026 21:33:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 03d7221d5f2d9d3ed2d78bdf23ff9c1a3178431b
X-Git-Newrev: 931803d24d37243af45c76fb8087e77141caa544
X-Patchwork-Hint: ignore
Message-Id: <20260715193512.46B9288999@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/download.html: remove old
 stable
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/931803d24d37243af45c76fb8087e77141caa544
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Now 2026.05.1 is released, we no longer need to advertise the EOL old
stable.

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 docs/website/download.html | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 57183da23c..35d8c28dae 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -70,32 +70,6 @@
             <a href="/downloads/buildroot-2026.05.1.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
-        <tr>
-          <th>Old stable (EOL)</th>
-          <th>2026.02.x</th>
-          <td>June 2026</td>
-          <td>
-            2026.02.3<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02.3/CHANGES">
-              Changelog
-            </a>
-          </td>
-          <td>2026-06-16</td>
-          <td>
-            <a href="/downloads/buildroot-2026.02.3.tar.gz">
-              <img src="images/zip.png" width="24" alt="">
-              .tar.gz
-            </a><br/>
-            <a href="/downloads/buildroot-2026.02.3.tar.gz.sign">[PGP sig]</a>
-          </td>
-          <td>
-            <a href="/downloads/buildroot-2026.02.3.tar.xz">
-              <img src="images/package.png" width="24" alt="">
-              .tar.xz
-            </a><br/>
-            <a href="/downloads/buildroot-2026.02.3.tar.xz.sign">[PGP sig]</a>
-          </td>
-        </tr>
         <tr>
           <th>Long-term support</th>
           <th>2025.02.x</th>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
