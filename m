Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2D13C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:09:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92A8460FD8
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 92A8460FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 661E740788;
	Thu, 26 Aug 2021 22:09:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gc4upwNocNqi; Thu, 26 Aug 2021 22:09:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E97B4078D;
	Thu, 26 Aug 2021 22:09:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1DB071BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0069440780
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v7EqgZ4qK2N7 for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95C2B4077B
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 041628DC50; Thu, 26 Aug 2021 22:01:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 7 Aug 2021 11:49:47 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8e7232bbc578e34ddde4bd371131ec89a291c7ca
X-Git-Newrev: 83eb121ae58d03f7b7e0e846fc2ba3fa57b12efc
X-Patchwork-Hint: ignore
Message-Id: <20210826220127.041628DC50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libesmtp: requires DES
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

commit: https://git.buildroot.net/buildroot/commit/?id=83eb121ae58d03f7b7e0e846fc2ba3fa57b12efc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Enable DES in openssl to fix build failure raised since bump to version
1.1.0 in commit b72401692e1ea73a37fcf4c0b421b654e8a2100f

Fixes:
 - http://autobuild.buildroot.org/results/52bce321552d23c10617c4ba4dc5b290e1d43dd5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libesmtp/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libesmtp/Config.in b/package/libesmtp/Config.in
index 5c6a412134..c631d127e0 100644
--- a/package/libesmtp/Config.in
+++ b/package/libesmtp/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBESMTP
 	bool "libesmtp"
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  Library for sending emails through SMTP.
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
