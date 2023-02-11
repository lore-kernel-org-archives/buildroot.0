Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D0DC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F5BF4F597;
	Tue, 21 Feb 2023 00:47:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F5BF4F597
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EYR-euyMw-NN; Tue, 21 Feb 2023 00:47:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CC374F59E;
	Tue, 21 Feb 2023 00:47:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CC374F59E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C60D1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D899E4180B
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D899E4180B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DlKIBk0LiCpy for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 398E641802
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 398E641802
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 36A8686496; Mon, 20 Feb 2023 20:52:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 12:00:55 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9d1b223b91b08acdb52611864ae5921b9f3c757b
X-Git-Newrev: 33107962eb29d2d33fcf4bed429d5239c1b2d278
X-Patchwork-Hint: ignore
Message-Id: <20230220205258.36A8686496@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pkg-waf: add one more
 missing $
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
