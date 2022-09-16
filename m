Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011BEC54EE9
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 11:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA5EC842B9;
	Fri, 16 Sep 2022 11:50:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA5EC842B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qF5CtpHezIIf; Fri, 16 Sep 2022 11:50:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB828842B3;
	Fri, 16 Sep 2022 11:50:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB828842B3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5E9891BF2B9
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CB1F41C06
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:46:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CB1F41C06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0FKagNDDTr0h for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 11:46:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7A2D41C9C
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7A2D41C9C
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E521083CC3; Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 12:28:52 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: ce866e54d2dc2b5567ffcad775729d7a7126259c
X-Git-Newrev: 794eac41cc8e116fedf5b6700cc9d0e494fd5c04
X-Patchwork-Hint: ignore
Message-Id: <20220916114645.E521083CC3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/ranger: drop
 bogus BR2_PACKAGE_PYTHON_PYC_ONLY
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

commit: https://git.buildroot.net/buildroot/commit/?id=794eac41cc8e116fedf5b6700cc9d0e494fd5c04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The symbol was removed in commit:
'306839586b package/python: drop target package'

Cc: Thijs Vermeir <thijsvermeir@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b1decca34752d7359fe5fa8e4a38f90c3351e1ae)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ranger/ranger.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ranger/ranger.mk b/package/ranger/ranger.mk
index aaca43862c..91b30f216e 100644
--- a/package/ranger/ranger.mk
+++ b/package/ranger/ranger.mk
@@ -19,7 +19,7 @@ define RANGER_DO_NOT_GENERATE_BYTECODE_AT_RUNTIME
 	$(SED) 's%/usr/bin/python -O%/usr/bin/python%g' $(@D)/scripts/ranger
 endef
 
-ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY)$(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
+ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
 RANGER_POST_PATCH_HOOKS += RANGER_DO_NOT_GENERATE_BYTECODE_AT_RUNTIME
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
