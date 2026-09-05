Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80A5C624D6
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 16:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 635DA40B12;
	Sat,  5 Sep 2026 16:15:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r1V7zDh27IS7; Sat,  5 Sep 2026 16:15:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4A1EE40B14
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788624918;
	b=szJxRJf7h57DCsJXa/reV8cq9sF8m9kjrmzl0Gke+jN0Wwzn6LcY6QmSatAWBqz2tJMT
	 9YKGgJcK30lgTyUYnigMN+fEwhNXf+Np84afQrgENcqXx0dG00bM9l0uud9bwqpHnyOG+
	 gH7dYzbtX34NbxiJSQpDi/6XyyMoTYvfcG2cZBmaRXmotEpFw12WcofHnQu3OgcNRGEZX
	 DmZBpk+ggSoZc+olsWpEBrZracr3sC4zY9l8IpfkolNI+5+Xita6TP7TUpox9V9pp16Wu
	 7RvPiKdcEYzJsObUuhfcf1b88d6Rnoa2SRztyCMEm+6wcoO/oaf90X8toQoy2ih+t6A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788624918;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2bA2cBUNxjFmRQTCh8SZAKeNIsfxVlh6f/I9r4FcArI=;
	b=kDqJs/oBIV1vcnYiLU/uPTw31M11/8wfl+rMueZqL99Xz87gVBb+ZQ+j98PFwqJxw4PE
	 Y2Qx7Z7rZvmuQtgiAcQuOrVNbYQut4iDQSAqePv3c8PVXKzyMO0tku0uVesszQcNt0Rht
	 BczzCZqXkSktLr997zdHTVibS1XloP2dkq7Cf9Xa2gNiMUGOMepi7/Q+Amo1gMMb0yEno
	 QVfrIDLKjJpnPSE8hmFAEDlOU2bD+jHYAH91uoB5xJpPgtAd6ITse7TR40/dY61yqK/FY
	 vbxPzNpCZe+7UxwbbI5s/3Z7Xq3tYzGqcqE1dldd7cYt/eFffJjONtWU1wGOkStEKWw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788624918;
	bh=2bA2cBUNxjFmRQTCh8SZAKeNIsfxVlh6f/I9r4FcArI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=omcltJW1lZmBJq39IzC66Yumhxx6vRn3jR7Of5RZuED+QNeBFKGr3BN14XRNH8lYA
	 TrXqBRvxdMdRQULK6NxKe9ABaie3fwfmpyZW2Klb7JBaL2/Pg7NGy+OH91k7hJc1P3
	 qJO7Z2OADeNA8fPxnBqepJu9uuwdrvt0eZ944RIPSbRwUBFhhx9Z/99ToKle8lS3ax
	 dp5PLJIdrkT9Q5aWJJdvlX59sU8BGE1MXsFXYxtMc6mwT5IR4jqDAbUBIGP1q9AGV4
	 onESTaP5YDIqUZOxk4Ct6cT+5+97ozZ+owy4B5M41UBCLBUP3ZpAsR3Nc25b5Fnto7
	 k724n7FvvBrsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A1EE40B14;
	Sat,  5 Sep 2026 16:15:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 82F19279
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 16:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 750AF40067
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 16:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6uIFFcxT7mdd for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 16:15:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org BF1F34004C
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788624915;
 b=J6M7cBb8EM+5cqYu1b4JHPKIA0NCf97joKKIkwvcoprOLykaXJQ8hoc1n6aMviWAstOJ
 2MNdLhEXdUo3ruOeM4qJkulcnw5l3i3Cra6CbfQofF/lYbxYTDqw6Np7lg6yYKxG6PRBr
 /Z2+1lK/V/HepS6DSoe4zP/ISQcbgVtOuo7EBXrfz+ri+ma3wSxwcgj9wd9m5NjCBuNVy
 Np+hmNfXdx5DxRXrSsWAkAOTPQK3Vf7iFEgYmghFSjo6CQ/6zWq3pgcpdfAr0dftN+yQv
 VWU4XjbCSqK7Gc4EjISb7XV8f4CEuTbZMNKOJOkQd2d/J86tAXqv2WQXpUazGLQs4Sg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788624915;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=qXo4hN+rm305uz1FP5hT/RbKIWwjVMDAie+zfUKfqDg=;
 b=YGMk+1NgzLxXyug/EV359J07Nwfm/KF7DNSLFtRsiRmundku+IAkiPgIUheHLJtu+H5p
 rTNkxIvgTtq/VpGiarcY7PG6+giJz4Lebv/rYd9EQg+Ah8WzDqs3up8BtuTDY1fldYWFL
 hDnyeTIBaGDQ9+n5wS6vnQltL3iF5N+thU7f4Wd3DTVp5ceieoRAU5g/3Mm7oMmSGpiCH
 dO4vTWhIB50GG73xHQ2VgEy3X/TCtqDT1qv//LT9LVOLnRh2vl46y1z2C3hcX2rqRTAV+
 b7h5rWvXuWCWGLKMpgDZy7RQy2cS8fIXd0JR1aHZDPxtcrxc6mQJExUxuDDW7BTazAg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=oaheROCL; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=oaheROCL
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF1F34004C
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 16:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788624883;
 bh=qXo4hN+rm305uz1FP5hT/RbKIWwjVMDAie+zfUKfqDg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=oaheROCLa5vNiJBNycrFY9iOKrjSqKAQbUkKQoyckAC2mmriLef4jIPLVLjeMJrGY
 oIHVNPFO0ua6iklJD7QPJZV6DLGs/40dtX4wrQJLfeFgg5t+udf+6+IfEURnWeBt8M
 imckNNv8tWWyoXYy30h9pS8CdWjpTTBVWmqS5+VmkFl0qkJvA34B8GjlC1M1B/48Gx
 vUL4Dvv1VVNNyd4oF2H01K8IcQTFz+HFGrDmm0U4dsJJilmkCsqllXEL4T3dLNu4ux
 ybAF2NKZ4EH+m1LH1vV5j7ME8aujYXqeNIs2XPTthutga6MIsLMkI9U172dJrEOKf4
 R49S4YMriBYSQ==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4357AA4C3436;
 Sat,  5 Sep 2026 18:14:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37408)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2t2Q-000000005tA-3zvV;
 Sat, 05 Sep 2026 16:14:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Sep 2026 18:14:42 +0200
Message-ID: <20260905161442.548037-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260905161442.548037-1-bernd@kuhls.net>
References: <20260905161442.548037-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH 3/3] linux: bump latest version to 7.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For an overview of changes in 7.2, see:
https://kernelnewbies.org/Linux_7.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 401f2828cb..2cea1b402a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -30,8 +30,8 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (7.1)"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest version (7.2)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2 if BR2_KERNEL_HEADERS_AS_KERNEL
 	# mips always generates an ITB image
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.1.13" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.2.3" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
