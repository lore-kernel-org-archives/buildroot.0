Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42787C77B7A
	for <buildroot@archiver.kernel.org>; Tue, 30 May 2023 19:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA00C41799;
	Tue, 30 May 2023 19:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA00C41799
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SA1u0ptyPT4p; Tue, 30 May 2023 19:44:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C329F41718;
	Tue, 30 May 2023 19:44:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C329F41718
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9BFF81BF966
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 19:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7641060B92
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 19:44:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7641060B92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2snGT9VRYTPa for <buildroot@lists.busybox.net>;
 Tue, 30 May 2023 19:44:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABDE060AE2
 for <buildroot@buildroot.org>; Tue, 30 May 2023 19:44:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABDE060AE2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97B4286A7D; Tue, 30 May 2023 19:44:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 May 2023 21:35:44 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: e1845fdd25304f36b8e1b3350fa5dcfd344c105e
X-Git-Newrev: 412e5f7c99c524a7c18234ac04a22a4b3a537307
X-Patchwork-Hint: ignore
Message-Id: <20230530194424.97B4286A7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/gptfdisk: add
 upstrream tag info on new patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=412e5f7c99c524a7c18234ac04a22a4b3a537307
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b4a82b0111ed67eacd91a2b9658e9b059444ab4a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
