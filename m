Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF59DCCD18A
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 16:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8057A846D6;
	Fri, 10 Oct 2025 16:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MLdDHc6mT_TQ; Fri, 10 Oct 2025 16:23:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28738847EE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28738847EE;
	Fri, 10 Oct 2025 16:23:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7766C226
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 16:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EB2240F0B
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 16:23:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nXRS6cHkLSSO for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 16:23:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 779A840F25
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 779A840F25
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 16:23:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 673E686F50; Fri, 10 Oct 2025 16:23:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Oct 2025 18:18:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d79f712ce4a89f4100088d1c1865985fb0b0f6a
X-Git-Newrev: b9d3a0418be38a237a51bb8aacce5bda40e2bddc
X-Patchwork-Hint: ignore
Message-Id: <20251010162330.673E686F50@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/refpolicy: fix upstream URL in
 help text
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b9d3a0418be38a237a51bb8aacce5bda40e2bddc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The previous URL [1] currently redirects to [2], which as of this
commit is about two months old and contains a readme that just says
"PoC by Callgh0st". When the package was added with commit [3]
the help text URL matched REFPOLICY_SITE, so presumably the help was
forgotten when the site URL was updated in [4], and there has been
some kind of hostile takeover of the former upstream repository since.

[1] https://github.com/TresysTechnology/refpolicy
[2] https://github.com/Exact-Realty/refpolicy
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/bb442abdf18d6a4673ffa1f19e2a62f36c5d3038
[4] https://gitlab.com/buildroot.org/buildroot/-/commit/cfa018d9f300b07c9c01a5b1aeca49ee177dd0dc

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
[Julien: add commit ID which forgot to update the package homepage]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/refpolicy/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index 8ae8f0448d..7aea39b223 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -26,7 +26,7 @@ config BR2_PACKAGE_REFPOLICY
 	  policies is not correct.  Individual policies would need to
 	  be tweaked to get everything functioning properly.
 
-	  https://github.com/TresysTechnology/refpolicy
+	  https://github.com/SELinuxProject/refpolicy
 
 if BR2_PACKAGE_REFPOLICY
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
