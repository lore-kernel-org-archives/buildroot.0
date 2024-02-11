Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A56C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 15:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C59264047B;
	Sun, 11 Feb 2024 15:31:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9cDL4PR47d0j; Sun, 11 Feb 2024 15:31:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFBF3403A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFBF3403A4;
	Sun, 11 Feb 2024 15:31:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 154261BF39A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0399040543
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:31:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 23h8kIjrptPG for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 15:31:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B49840537
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B49840537
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 15:31:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3302187482; Sun, 11 Feb 2024 15:31:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 16:28:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ebeb4f435303bf6802b647ac83373d5ed9980de5
X-Git-Newrev: dfed5acb5610c90115235a78433e798a6a692b29
X-Patchwork-Hint: ignore
Message-Id: <20240211153111.3302187482@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/check-package: use https for the
 manual URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=dfed5acb5610c90115235a78433e798a6a692b29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/check-package | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/check-package b/utils/check-package
index 105902303e..de41891b56 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -69,7 +69,7 @@ def parse_args():
                         help='override the default list of ignored warnings')
 
     parser.add_argument("--manual-url", action="store",
-                        default="http://nightly.buildroot.org/",
+                        default="https://nightly.buildroot.org/",
                         help="default: %(default)s")
     parser.add_argument("--verbose", "-v", action="count", default=0)
     parser.add_argument("--quiet", "-q", action="count", default=0)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
