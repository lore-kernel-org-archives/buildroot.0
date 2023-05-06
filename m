Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCFEC77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 15:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C68683FEA;
	Sat,  6 May 2023 15:10:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C68683FEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ylYmrTai1XDt; Sat,  6 May 2023 15:10:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A323283F34;
	Sat,  6 May 2023 15:10:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A323283F34
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 268301BF36C
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AF9E60797
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:10:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AF9E60797
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cWnZdQKSDkZp for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 15:10:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59E4860757
 for <buildroot@buildroot.org>; Sat,  6 May 2023 15:10:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59E4860757
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 49D7E85E05; Sat,  6 May 2023 15:10:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 6 May 2023 17:09:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f2a676dcfff886104e83170c274a2e97e9d32aba
X-Git-Newrev: b4a82b0111ed67eacd91a2b9658e9b059444ab4a
X-Patchwork-Hint: ignore
Message-Id: <20230506151034.49D7E85E05@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gptfdisk: add upstrream tag info
 on new patch
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b4a82b0111ed67eacd91a2b9658e9b059444ab4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gptfdisk/0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch b/package/gptfdisk/0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch
index 1642343d06..250c071582 100644
--- a/package/gptfdisk/0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch
+++ b/package/gptfdisk/0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch
@@ -8,6 +8,7 @@ poptGetArg can return NULL if there are no additional arguments, which
 makes strdup dereference NULL on strlen
 
 Signed-off-by: Stefan Agner <stefan@agner.ch>
+Upstream: https://sourceforge.net/p/gptfdisk/code/ci/f5de3401b974ce103ffd93af8f9d43505a04aaf9
 ---
  gptcl.cc | 6 ++++--
  1 file changed, 4 insertions(+), 2 deletions(-)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
