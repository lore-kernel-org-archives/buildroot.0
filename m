Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CC9606A31B
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=emuGRVYM
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2D0C80FA9;
	Tue, 27 Oct 2026 16:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wyonnRB8ulXB; Tue, 27 Oct 2026 16:07:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DEBD380FA1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793117277;
	b=rhgaINDENIq2Z6ArQsSFyQjsi3bYz7eKYncu3N3hpP0m3VsALukdDu4BCd9CpUvof7/a
	 JLQ+4lUlFgdCjd6hA57O2sWyymO/rjUvldu8gzOWDBrx6PxD7YYjHb/OX+XfL5tcKdbyv
	 Gyh7WEJz1K5XSnWnlv/9Zt+9WPkU0a0Ogca4DnotiJkhsGB4il2eEEovAWiWAmN9kuHdZ
	 wBDRPzlkQ4FxfSVtESQqsLoMA7XeOKqUZC3ziOJh812J3EsN3a3fBC6hcPJMNmVs8aIxz
	 cWEqYH1YtCVeDqY+sMMRIJPZjuo1f9VV9cOFppelWgPGZJYIfYphk3SpLkcC9c9p6jQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793117277;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yy6k4QSJTTcfJCUrelBJFlrHPRSuSklKBYkID4CnH6Y=;
	b=lRbVrVVLgKMq5ScTCMXFPICxXhpQrLIt9AyxtRTgr6buQNy8jfpvQL1YIIkNeIg4ouGA
	 2k6kMwrE5koLETorDDH2KuvBpO7WWa8u8BMx5GifrRbbpIvmdrOlWCpo7Ru4rfeEn6fqL
	 +NRoHsIXYBVYhLWDfAr0Wo05U6rLk4C4d1zyOPaSIQPZY76/N7L9qndD2iFzWXANV8zUf
	 IzeWlX9u840eVxfgX3EOC/xIOc7+wUXI5OhUscCy5wQgM3K+GCDWnn9+ri8EcsbKNWpL9
	 FTAhOp1EHAfofzGs96Ar8y/7JobgjYlxhvOg/JBYw3xSYQSIBCHRvYmL9hGCIWXqyGQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793117277;
	bh=yy6k4QSJTTcfJCUrelBJFlrHPRSuSklKBYkID4CnH6Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=emuGRVYMQ8e/8Vrk608uhg52t4qo4l/x1LSQqRIFvBXoPNXnMgVS/5HNzLy8/ZUC6
	 7PHTzBpgpqSECCnV05zaap2Vt2L/VZDhVWmnYy0hzFfgQQVNksmuaOrygKBHy0TIWc
	 +7TF58DE6KziuWz4Slp6IDtJq7TJun+gAzDeL9tO8/Yi2nlC0+FDHKVMuoeyxTkQqP
	 T5CYSvkaSayryJZckzP75g2hXB9cEo2i8DkZMeazI4Q8xiiE4qJTqsFqgE3rcxSXmk
	 thEtwHV2cFAH7q60/GOnaR9RzXpgYlXcNPYNfwo1c8f7rmhqto5uMc3BCbcnVtn9+E
	 HAwyyEHmDWbsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEBD380FA1;
	Tue, 27 Oct 2026 16:07:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1560272
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0713D80FA1
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:07:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KBSHBVJvILZC for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:07:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 53FB180F91
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793117274;
 b=rLkkV8L50wl2cdkP1Y/FpEe0Ve8bgBawH0+rkHJD7Ii4Hw4N0R6cLdOn3Yllx+2bGUrv
 ZKOvbuLM4aLeAqm65ikgDWu4xxzz5jhPDxidDSe8h0i5swUS6VmhANI8F6LTZ1KakE74O
 qF+fHw7RznbsoLGfKSSyY/WBZHhMjv4Z0Qe2Q3wtam/cVWF48bzuDv6hFdyUurwn0/NcR
 S9vfhCgHeHaIqZ5UhgUC0f/gIfKozwYhWQARoHQ4ix9qTckTqNYUAnm7gCRWqWO2G3fab
 UekmiAu+u96H14X73SVeWVAukktzYFhtvUbbLW3RcRgL3Gcbsn/a277jUwuc4TRNS2w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793117274;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=yDD0joDAfzKs71M5sS+FPXU4E6MRVEIKO0H9youRYhI=;
 b=XUldYOGn4zXjZwya42LAmc2qtIKsAWRsuJT1kM7d61T32jrxKm/lLdoTZHMxHYDBZ7KK
 Luu2fNv0fFduwIxcwAXjIrcn++JDv/r3bxy4B90TqpuVk3syz0sYAXuA2jt9opyK0byq5
 xFS/QdXB4lSxlHyXW7aKHc27BVm9z0fdxs84elNDRmWjB7Ie0QVEF5Ab6S6+RMJaWkt2G
 IKnoIfDgLdyT2g50fmX3+wuBkcv9Zxc4f5UWV2qk0JptQb4rNxl2qd/xValCeLTDw0xOw
 uF+eoeazi2IJVnio7NuxD+MRIeDQbGyPNcBL5uT2Pca3PPt03eO0Y/u+NsDLm6QQ9dg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53FB180F91
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:07:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B583F9D0B7; Tue, 27 Oct 2026 16:06:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 17:06:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40a535a386aa3caef0e4f7da4c1f11619b912b5b
X-Git-Newrev: 750d353e3bb295b051ad50dfbd62a7cdff4a6857
X-Patchwork-Hint: ignore
Message-Id: <20261027160627.B583F9D0B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8812au-aircrack-ng: fix build
 failure using gcc >= 14
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/750d353e3bb295b051ad50dfbd62a7cdff4a6857
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Starting with gcc 14, several C diagnostics which were previously warnings are
errors by default. In particular, -Wincompatible-pointer-types was
changed to a permanent error by GCC commit:
r14-6037-g9715c545d33b3a32ddc1ae817ba9356ade1fb9df
("c: Turn -Wincompatible-pointer-types into a permerror").
So let's workaround this by passing -Wno-error to USER_EXTRA_CFLAGS.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
index 7981a382b1..f8c62608ef 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -13,9 +13,7 @@ RTL8812AU_AIRCRACK_NG_EXTRA_CFLAGS = \
 	-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
 	-DCONFIG_IOCTL_CFG80211 \
 	-DRTW_USE_CFG80211_STA_EVENT \
-	-Wno-error=address \
-	-Wno-error=array-bounds \
-	-Wno-error=cast-function-type
+	-Wno-error
 
 RTL8812AU_AIRCRACK_NG_MODULE_MAKE_OPTS = \
 	CONFIG_PLATFORM_I386_PC=n \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
