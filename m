Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F77A606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Y/oiOG9Q
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F46080DA4;
	Sun, 25 Oct 2026 20:38:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zdIsQV8hk4iT; Sun, 25 Oct 2026 20:38:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 83F1180D7A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792960680;
	b=QZufmtsF/wJq1EMAoRqwk8N9lllRtZHQsDOSQTK30hurYBrBoQ09uK1IpkJ1qdYlp9q8
	 CIyyHUgLvvL66Q1L1gDeGeD5fq9qFaz1otkYOrJIoBKp4/2sP/KGwyzhaSSXpCMW2gokO
	 BwQppUoZUNKuKjD+6aFZ314dS7xZ8+/oe86E/oCnW5yf9RI4YR2qC6/5vS0qcoiyZfUI8
	 TKmNpHS69qNdKQHb+P6fgi3f995Y1aJKTpBri0VqB5h2nZCUHqjLNYt5VUWFbDe9B4Xqe
	 LJ93CV9pDYl+e6at8eyr2lQnfDB/FS/oVe2TUDV7WHSZS7rp+abFZcumIZKpBN2zyNg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792960680;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QL2QAzM4Pjbn5RcsvYCC/ru9sMkRmEbck4YhOIEj2Oo=;
	b=mE8i0UyuaNoIgkuakFutF5qzDfaHvIVCfu2oCHrgEojqnGg/vJ47wOlljzGcF3LSycoL
	 X8JSb4uzI/FqNJvfJShNx3dajsjRukF5MMa9kNt06meP2h3G5G/NBbaz9lFdWovfNUhc+
	 98TWRd+Bqvqw/u8tFc6IM1aH/qF3Hakq8Y++reMfopXd2AEkax3mb8m5Sy1MQpydj3fzm
	 xLCgCpo/75tI1tC9oFHpptuS0tLKFaQMES7iJTeuGly52KubOV2vpBiYjDInq6ivM6v/3
	 pxsoERMzyi5vS9Rbgt4ltepjWPq0XS1/IQ6PsygeG7qiq+M9YI2jnWSynsZgdg7eDHg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792960680;
	bh=QL2QAzM4Pjbn5RcsvYCC/ru9sMkRmEbck4YhOIEj2Oo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y/oiOG9QMSpUTEnt13L5kOMgYzzixLZ0hzp7Ecm2OHgzWuvjPP1R2dp8tB4dECnAv
	 Ib7I39rO1it09cz11meVYJW9zfvZvFuujT3RdI3Q8nl+JPP3XowIsgwwaOOESQk/7V
	 PNTMN1a1mbp3KNHnb87zVtXZL5NfhdeZpEauKq+79fEoXpYIOfuPHcWeuFyyDPxWqK
	 F88tUJ+9tf9u3A0PwTfVU94WHmBUgm7jO5G9/BP1JW2BNnZOhSGhKntRa4ZVSYGeFN
	 1J/90DnPdDxKmKJxuw6f1ZTDWREA5E+HKAj7xvgOST2nAuvwKVJBzhEj9uYX6wp6Q5
	 0gqUd6jhVSN1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83F1180D7A;
	Sun, 25 Oct 2026 20:38:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D1A093D9
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B810E60603
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:37:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1HIOUxhWwMCk for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:37:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 18F9F60601
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792960678;
 b=G2i+QTE8MFIJCmrogTwYLFfGFdRTA7SekeKoW6XtIlaJnIgV3CBTdiOY0cp11FmVIGU2
 ROmwZUzYJtESPQvVtOj+VAH+MvwY9zjpvfYa8E/T6hX403fAdIxZGSeSJ7Dn6L6PfTfWD
 w+dkwW4jYHkdh8nbr8r925MKVwETHh41FsIJt8KBRW55HAdWbnx0N1YoqwAn9iwte01q3
 QaKBPuiaXBOe5wrcA/5bu/bzQCtVv7KwqOD1TJQfYQ3XHK545dvWBwROCRVivv/hbdrHH
 pbFe/Kvyx9gNhkwS6AvlzvnhKFHCxZOLnWtbtxRwB1WYrl5kpp6uhvxB7WIWCSyIxfA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792960678;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=TjkidBKuNKrxuPapgAyDTonFm+gO5cP0JWAyfSueTgY=;
 b=Qxpp8dMbYJPFed9wKu/KaEnY8Q4R/UCXgTMGIloHDfPVLzlNiidq3WxbfpMG+B5gUcZs
 XvZ011wJ7x+yvrG5btV2j3FJzEZext7KYd4r+atAlH76etGBsintz9bpgVQaaDxYnAqdq
 1bWlU4YHf5mRfoxga8S5Wk6tXH75F860wLi0+D/PFPZ7PgNyI0GB89+Gn58HHuPrLkMiQ
 P7YVyaZS8Dc+8XpI96t/T1vl3v5No87soH1Z0X2V9Q6iRJfbZbgSq1loFT+mUy41pOfPi
 M/pu9MSNSR0f7fhJpymf1x20NcwPx7ojxu3zqHvbKND4UbfhoFVeAE6WyFsht0Vh+Hg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18F9F60601
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:37:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 79EE79C841; Sun, 25 Oct 2026 20:36:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 21:37:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f3b234b21ae5096c7243d0e36590a48dfbddc55d
X-Git-Newrev: 6a677b5ec72b59613642563fc9ab50ff4fe41772
X-Patchwork-Hint: ignore
Message-Id: <20261025203632.79EE79C841@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: fix headers version selected by 6.6
 LTS kernel
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6a677b5ec72b59613642563fc9ab50ff4fe41772
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 5e8705263cf4592d8c02fac71803053e17d4f83b selects the
wrong kernel headers for kernel 6.6 causing a build error:

Incorrect selection of kernel headers: expected 6.12.x, got 6.6.x

Fixes:
https://autobuild.buildroot.net/results/857/8570296451fed025c248530da8186ad5c7b237a3/

Fixes: 5e8705263cf4592d8c02fac71803053e17d4f83b

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 6a1eed3146..a722031fd5 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -55,7 +55,7 @@ config BR2_LINUX_KERNEL_LATEST_6_12
 
 config BR2_LINUX_KERNEL_LATEST_6_6
 	bool "Long term 6.6"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12 if BR2_KERNEL_HEADERS_AS_KERNEL
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6 if BR2_KERNEL_HEADERS_AS_KERNEL
 	select BR2_LINUX_KERNEL_LATEST_SERIES
 
 config BR2_LINUX_KERNEL_LATEST_6_1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
