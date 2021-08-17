Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B5FC4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 19:56:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE1F060F22
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 19:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE1F060F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B22E180CD9;
	Tue, 17 Aug 2021 19:56:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A6l279HvCNiJ; Tue, 17 Aug 2021 19:56:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30A2C80D53;
	Tue, 17 Aug 2021 19:56:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0FF161BF86D
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 19:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF2EB4024C
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 19:56:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3tS2imRbS1dp for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 19:56:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41DE640215
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 19:56:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B6C6E8D3C3; Tue, 17 Aug 2021 19:55:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 21:55:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4cf2d745974c0fa5fc9ba6cb091a7d0c5981bd62
X-Git-Newrev: 6a932714d31440203b707394e1927f05c49f40e1
X-Patchwork-Hint: ignore
Message-Id: <20210817195528.B6C6E8D3C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-keyring: depend comment on
 BR2_PACKAGE_PYTHON3
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=6a932714d31440203b707394e1927f05c49f40e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The user shouldn't view the comment on the python2 menu.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
