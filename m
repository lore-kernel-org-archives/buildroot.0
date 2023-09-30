Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145C2E77371
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 13:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A446482137;
	Sat, 30 Sep 2023 13:48:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A446482137
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VxU8c-1Q6U0N; Sat, 30 Sep 2023 13:47:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C91478233E;
	Sat, 30 Sep 2023 13:47:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C91478233E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 64D7C1BF2F9
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BA97418AD
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:47:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BA97418AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tfN2SRRs_GVT for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 13:47:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37CCB4188D
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 13:47:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37CCB4188D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 201DC839FF; Sat, 30 Sep 2023 13:47:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 15:45:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 952e320a1b30b41c26fc547ec500e99520d869ea
X-Git-Newrev: 683446ed9f133d00c85ddfcf44094bcb3baeab56
X-Patchwork-Hint: ignore
Message-Id: <20230930134756.201DC839FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: fix
 docs/manual/adding-packages-meson.txt reference
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

commit: https://git.buildroot.net/buildroot/commit/?id=683446ed9f133d00c85ddfcf44094bcb3baeab56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 32cec3be976 (docs/manual: rename *.txt as *.adoc) renamed the manual
files but forgot to update the reference in the DEVELOPERS file, causing
check-package to warn:

WARNING: 'docs/manual/adding-packages-meson.txt' doesn't match any file, line 851

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index a027958331..e65c436157 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -848,7 +848,7 @@ F:	package/bayer2rgb-neon/
 F:	package/gstreamer1/gst1-plugins-bayer2rgb-neon/
 
 N:	Eric Le Bihan <eric.le.bihan.dev@free.fr>
-F:	docs/manual/adding-packages-meson.txt
+F:	docs/manual/adding-packages-meson.adoc
 F:	package/adwaita-icon-theme/
 F:	package/darkhttpd/
 F:	package/eudev/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
