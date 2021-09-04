Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96300C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 21:50:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61EAB6056C
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 21:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 61EAB6056C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35F7E40473;
	Sat,  4 Sep 2021 21:50:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tZqvGyoezDm2; Sat,  4 Sep 2021 21:50:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86A2540422;
	Sat,  4 Sep 2021 21:50:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 641C41BF95F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 21:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5347280D7C
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 21:49:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qTrhiBYsoxxE for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 21:49:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67E3280D52
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 21:49:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D38678850D; Sat,  4 Sep 2021 21:48:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Sep 2021 23:47:23 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 12545dd5bdf4695abf7407789d988c6bbcc51722
X-Git-Newrev: e1fedf442e6a11e77f6a7d2ad1a7e13a25358351
X-Patchwork-Hint: ignore
Message-Id: <20210904214818.D38678850D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x]
 package/python-secretstorage: depend comment on BR2_PACKAGE_PYTHON3
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e1fedf442e6a11e77f6a7d2ad1a7e13a25358351
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The user shouldn't see the comment on the python2 menu.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit bf0b9048f216586614aa63ff9d1fd509f0155da3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-secretstorage/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-secretstorage/Config.in b/package/python-secretstorage/Config.in
index 78a0a2ae15..8ae8c2d598 100644
--- a/package/python-secretstorage/Config.in
+++ b/package/python-secretstorage/Config.in
@@ -9,4 +9,5 @@ config BR2_PACKAGE_PYTHON_SECRETSTORAGE
 	  https://github.com/mitya57/secretstorage
 
 comment "python-secretstorage needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
