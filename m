Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A3FE77345
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 22:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 499B842F82;
	Fri, 29 Sep 2023 22:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 499B842F82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EfNJxmk3pUVn; Fri, 29 Sep 2023 22:13:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C6DC42F7B;
	Fri, 29 Sep 2023 22:13:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C6DC42F7B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BC47F1BF995
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 22:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9560942F6D
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 22:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9560942F6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bDaGJUeUxhhr for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 22:13:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78ADC42F30
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 22:13:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78ADC42F30
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62ADE837B1; Fri, 29 Sep 2023 22:13:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 00:11:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be87362f101b11cf765fa9c38501abd3b0b09795
X-Git-Newrev: 60b0f7141b00a793a3ddb4e963d83bdd832aca83
X-Patchwork-Hint: ignore
Message-Id: <20230929221310.62ADE837B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-httplib2: add host variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=60b0f7141b00a793a3ddb4e963d83bdd832aca83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is needed for the host-depot-tools package.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-httplib2/python-httplib2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-httplib2/python-httplib2.mk b/package/python-httplib2/python-httplib2.mk
index 1093ecab39..2f4eb98356 100644
--- a/package/python-httplib2/python-httplib2.mk
+++ b/package/python-httplib2/python-httplib2.mk
@@ -14,3 +14,4 @@ PYTHON_HTTPLIB2_CPE_ID_VENDOR = httplib2_project
 PYTHON_HTTPLIB2_CPE_ID_PRODUCT = httplib2
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
