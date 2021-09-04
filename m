Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7199C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 21:49:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 879F960E97
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 21:49:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 879F960E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5892580DB7;
	Sat,  4 Sep 2021 21:49:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AEoUiDT95y0h; Sat,  4 Sep 2021 21:49:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B064B80D7C;
	Sat,  4 Sep 2021 21:49:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 629CB1BF95A
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 21:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 522DF40421
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 21:49:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D_tLNur8mFxN for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 21:49:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60AB3403FA
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 21:49:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C91798850F; Sat,  4 Sep 2021 21:48:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Sep 2021 23:40:22 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 6cdae45fd3a6abc9791344febe9f3abc572cee9f
X-Git-Newrev: 12545dd5bdf4695abf7407789d988c6bbcc51722
X-Patchwork-Hint: ignore
Message-Id: <20210904214818.C91798850F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-keyring:
 depend comment on BR2_PACKAGE_PYTHON3
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

commit: https://git.buildroot.net/buildroot/commit/?id=12545dd5bdf4695abf7407789d988c6bbcc51722
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The user shouldn't view the comment on the python2 menu.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6a932714d31440203b707394e1927f05c49f40e1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-keyring/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-keyring/Config.in b/package/python-keyring/Config.in
index 18fad84007..f7bb1ae820 100644
--- a/package/python-keyring/Config.in
+++ b/package/python-keyring/Config.in
@@ -11,4 +11,5 @@ config BR2_PACKAGE_PYTHON_KEYRING
 	  https://pypi.python.org/pypi/keyring
 
 comment "python-keyring needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
