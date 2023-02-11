Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA67C636CC
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 11:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13CE3403A2;
	Sat, 11 Feb 2023 11:05:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13CE3403A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1XB9S_kJ319R; Sat, 11 Feb 2023 11:05:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52191402E5;
	Sat, 11 Feb 2023 11:05:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52191402E5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D3EFB1BF5A8
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 11:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB18781F89
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 11:05:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB18781F89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eQb--RNzR9xy for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 11:05:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D7E181F88
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 11:05:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D7E181F88
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1795846E4; Sat, 11 Feb 2023 11:05:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 12:00:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d1b223b91b08acdb52611864ae5921b9f3c757b
X-Git-Newrev: 33107962eb29d2d33fcf4bed429d5239c1b2d278
X-Patchwork-Hint: ignore
Message-Id: <20230211110517.F1795846E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-waf: add one more missing $
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

commit: https://git.buildroot.net/buildroot/commit/?id=33107962eb29d2d33fcf4bed429d5239c1b2d278
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Further fix on top on 9d1b223b91b0 (package/pkg-waf: add missing $).

Repeat after me: all variables in an inner-package macro must be
expanded, except for: parameters, pkgdir, and pkgname.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-waf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
index c3e965bdf3..0529bb6dda 100644
--- a/package/pkg-waf.mk
+++ b/package/pkg-waf.mk
@@ -42,7 +42,7 @@ define inner-waf-package
 # otherwise waf errors out with:
 # Waf script 'X' and library 'Y' do not match
 define WAF_PACKAGE_REMOVE_WAF_LIB
-	$(RM) -fr $$(@D)/waf $$(@D)/waflib
+	$$(RM) -fr $$(@D)/waf $$(@D)/waflib
 endef
 
 # We need host-python3 to run waf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
