Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E85CD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D96382123;
	Tue,  9 Jun 2026 13:04:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KRQ5BGASyVNc; Tue,  9 Jun 2026 13:04:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33FD8815D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010263;
	bh=Ofr9bnrK6RMUz9FbiZYBNblDj6uf2X4kqV4dFaM0M5k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KjFR6lD3cPlF+BHiA2RasGwZ/DJUEDrp+4vNdmZhelm2F0Zl+waaAqtZekb1/JmSF
	 C2BvCVVrwFeQOZqUNhBcDUllubxNFgEGi0RguhM74YrRroO0V3YjX2mlQrtd8h1Nq8
	 1na/0O0KuQIFuEfgjyuSUPxs9MAb+R6LLUaddHjqvdC+qJutn1Xd49AC3TpAKt+VCQ
	 6h7aCytR5ZUamLhOFWGVLte4z9E6fhg72N2pjrhJTPb1STl0ZTKu9fe1GKkuVnHGGT
	 RKLzEitmoxAHdA6I8xJKfr+9jjW/jKv5jT/Oz8rA9vSQnIr0fHJfVPP3uQzqT505uz
	 9Gt5fVxTATPXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33FD8815D5;
	Tue,  9 Jun 2026 13:04:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A840190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C83B4631A
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SZZbGKLSCu0n for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C44D54595C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C44D54595C
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0BB5987E68; Tue,  9 Jun 2026 13:01:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 15:48:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 27ebca4af2cce6a24fdd9b9f1f8ce280f4c381c0
X-Git-Newrev: b3329ed3e027f7a57f5b96a2a842643bebbee693
X-Patchwork-Hint: ignore
Message-Id: <20260609130123.0BB5987E68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/Config.in: add
 BR2_TOOLCHAIN_GCC_AT_LEAST_16 blind option
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b3329ed3e027f7a57f5b96a2a842643bebbee693
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

In order to add gcc 16 support in follow-up commits, introduce
BR2_TOOLCHAIN_GCC_AT_LEAST_16 symbol.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 toolchain/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 910cd103dc..5aa6cf8f6d 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -848,10 +848,15 @@ config BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	bool
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 
+config BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	bool
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_GCC_AT_LEAST
 	string
+	default "16"	if BR2_TOOLCHAIN_GCC_AT_LEAST_16
 	default "15"	if BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	default "14"	if BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	default "13"	if BR2_TOOLCHAIN_GCC_AT_LEAST_13
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
