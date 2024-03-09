Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF48FC54E41
	for <buildroot@archiver.kernel.org>; Sat,  9 Mar 2024 13:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 549C9815AD;
	Sat,  9 Mar 2024 13:39:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lQ0ZSZAu5UqU; Sat,  9 Mar 2024 13:39:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EA6A81FCB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EA6A81FCB;
	Sat,  9 Mar 2024 13:39:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 775891BF300
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 13:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65205401E1
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 13:39:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D3cK1xqMrPOj for <buildroot@lists.busybox.net>;
 Sat,  9 Mar 2024 13:39:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A203840103
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A203840103
 for <buildroot@buildroot.org>; Sat,  9 Mar 2024 13:39:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C19D88165; Sat,  9 Mar 2024 13:39:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Mar 2024 14:35:29 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: e1eb85c3ce03046e0eb40b303e70c91d25894fe3
X-Git-Newrev: b913cfc2b5a4fd28d4f33b367dd6a2fe63b20949
X-Patchwork-Hint: ignore
Message-Id: <20240309133935.9C19D88165@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] utils/check-package: use
 https for the manual URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=b913cfc2b5a4fd28d4f33b367dd6a2fe63b20949
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit dfed5acb5610c90115235a78433e798a6a692b29)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
