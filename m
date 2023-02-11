Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96190C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 10:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FEEE41731;
	Sat, 11 Feb 2023 10:04:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FEEE41731
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pBiYDeunNFc4; Sat, 11 Feb 2023 10:04:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DB4C403BE;
	Sat, 11 Feb 2023 10:04:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DB4C403BE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D052E1BF279
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 10:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A233160644
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 10:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A233160644
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LXtV9AC21DPm for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 10:04:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4161605A4
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 10:04:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4161605A4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D126684456; Sat, 11 Feb 2023 10:04:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 11:02:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f25b0b6d1dcc8580f6b880eb57872b5c4064b89f
X-Git-Newrev: 9d1b223b91b08acdb52611864ae5921b9f3c757b
X-Patchwork-Hint: ignore
Message-Id: <20230211100400.D126684456@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-waf: add missing $
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d1b223b91b08acdb52611864ae5921b9f3c757b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We want to have $(@D) expanded at the time the recipe is run, so like
all other variables, we need to $$-expand it.

Fixes: 1b4d7f6e13212b4c65ec2832681719fd960e75e6
Fixes: http://autobuild.buildroot.org/results/b6f/b6fd3a866af182edc7831492aecc8323f377b826

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-waf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
index 0e752072c8..c3e965bdf3 100644
--- a/package/pkg-waf.mk
+++ b/package/pkg-waf.mk
@@ -42,7 +42,7 @@ define inner-waf-package
 # otherwise waf errors out with:
 # Waf script 'X' and library 'Y' do not match
 define WAF_PACKAGE_REMOVE_WAF_LIB
-	$(RM) -fr $(@D)/waf $(@D)/waflib
+	$(RM) -fr $$(@D)/waf $$(@D)/waflib
 endef
 
 # We need host-python3 to run waf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
