Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C89AC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:44:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A11B61040
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A11B61040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23E6F8104D;
	Tue,  3 Aug 2021 21:44:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gy9BoBhwbNXX; Tue,  3 Aug 2021 21:44:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EB0483AFF;
	Tue,  3 Aug 2021 21:44:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A31AC1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A49AC4039B
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hyBJA0DrrrqU for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0ED70404D4
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 59530843F5; Tue,  3 Aug 2021 21:09:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Jun 2021 14:12:16 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d6676ca56f93b3892f05ab78735b14a46ad139c2
X-Git-Newrev: 35aded3c8bd0bd9af148b68d6ee230beb62da32e
X-Patchwork-Hint: ignore
Message-Id: <20210803210949.59530843F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rhash: requires RMD160
 support in openssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=35aded3c8bd0bd9af148b68d6ee230beb62da32e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Enable RMD160 in openssl to fix build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/e3733ad25de55616b2eafff0b489aea2bee65e06

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rhash/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rhash/Config.in b/package/rhash/Config.in
index 2ddcb00feb..35ccb3833e 100644
--- a/package/rhash/Config.in
+++ b/package/rhash/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RHASH
 	bool "rhash"
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  LibRHash is a professional, portable, thread-safe C library
 	  for computing a wide variety of hash sums, such as CRC32,
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
