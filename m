Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB87606A31B
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 10:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dci98+of;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=FZ0q8LhH
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6919960822;
	Tue, 20 Oct 2026 10:29:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zbkpv6vd7GQI; Tue, 20 Oct 2026 10:29:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8CBC36086A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792492167;
	b=iOXx+uWIznEic+cW3W0cExFCywX/1mgKV5JV0pi5hLaZ9rkHItcfKh6usV8LlG/3mb7Q
	 hE5ag0/S1UJv5SMBeSyQ8+hOAGRtWrHrt8CVaKrHiH73nI/dqOgGfDRyW7ZHtwQLkZQ3h
	 7XFlqzb7BiJE+xu6qsmtMm3U+J2YbGOOkToawMhfNPfWUcUnTA/ZhOdbFOeG6PfyrsvvQ
	 j6jgcsG/Y98Ru62YIVvpE37aYh4d7deZraipUMtv0SIS45ufTBqh75Y6B7tIYYqmPXWfQ
	 Pd/cUklTPM5LiekcamlPu22wKY04LbIfd8ytG/j2mvIl8R/s5Q5p99mweveM+VAPH+A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792492167;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-MIME-Autoconverted:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=WwNM71+Qbd/zrH0DAnFx8VdF6FSFnmL05tvPs9xwoHw=;
	b=Bw5dTqd6yXBgJdkw6z3OFRld9gYfT5+lJ5/Wua4EBvwE3iecfEsFY2a46kLVBSq52Jdm
	 LDSsWDGDL4igcX2RQ6GonRsbxjkRGdlhgCuFUfttBWHhNmiZEV33LpXig2qyutvZDmeu9
	 hpQLmz//+bYSAPWgPa0hXjdwOUAoIgl2Vkdyc2wWTyTdAHCnxZdm/89IN85Fs+yM74Bns
	 /hL7aLPIdMAXPQ5S/MUFw17Du9Er8bmc5QNWWyRGXM7ikWi53yaLOTKxZajG15zwCZjIW
	 OGY01mOz9gPR+HbSxMsF6mDb69mwGK2+2HoOhujV9niuwaK7oQejHpNckeWeAop28YA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792492167;
	bh=WwNM71+Qbd/zrH0DAnFx8VdF6FSFnmL05tvPs9xwoHw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dci98+ofXTyu+A9uCWM9aeKW4/svp4kKGv+A+W1LqxrlyHSDDhNeP2t/VQ0ALc+v5
	 w0lXg+QWqnX5R3nZO4j4E5WfioklcebqKpfAfXZQElcxEkRMwMw1pasQ8WjybYICKp
	 L6eIWFCuIJEW/nY5dTqqufdjgFXpOr4Ip71BcErLmqovDfq7R9wnFdRAUeFGB/gokN
	 SNlgyKbu9Jku5PVrufTnkV7Bo9pgTp2XWwulf0bCVqONbesHDU3Dge3WNfQ7beysA6
	 RoAyacnFd9C1P5UBL1VQnqtTtm8ZDFN9LZ9f+SFIDMBOz7LBzQxqLt6QdtoHFIYZsf
	 CpmaDeaOs2CDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CBC36086A;
	Tue, 20 Oct 2026 10:29:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D84A51E9
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C961A40583
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:29:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8xjJAjyUQVbD for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 10:29:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2D09640567
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792492157;
 b=LE2x0o8WwoxPJXk4jHG7KfDp38R/4kA8ni5T4CzJmuqtVj7humK/AEwLbMuZECMpYZln
 676bOvZgbbHq080j0p/mL8M2qoH7X0YLrZLEHbIhaMzcCkMfD5FoweC/8Lr79I7utIOkK
 jbZkJOlf0j1bZqS0lifiMeWx1wzSM+WcG9K8H+lkc9njuDbp5PqDY6QNWDJdKI+xuPQej
 CkDTQP8eglxo1x/rFVHoG+JD02lDEc5hBcgacPjrmWXMFNy0MddbezG6VGAeKqwKYYeTJ
 RFLGUDeP5OBwZpi07rkbNSRHq5JJnYNe7Ht2sQ9S2sIsNy7w6rAI+ml/4l0PcmSyDaQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792492157;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:
 X-MIME-Autoconverted:Content-Type;
 bh=suqs9JE5n5RjoGtU8NT6YegHAx/khK++s856kRSTgXw=;
 b=LDZvfBjLi3l3VmYoO13CxKkXhbC7bAlGpcDft4SxqlQS5u7UlHXUCfENV0AwWdPO3mMo
 A8Z6lSf9x8EN5jj8sbPkMy08UNMYo5dfIRJEOWuBeAgAEbc6Zr4eIldq3AKKswwTUYQYM
 j+8wcFimtZzLd2A0VjY47pJVMHJACnYtwhqJ6iBxuZS6iuyKpleWmpZqw9cbJmyCZaTGO
 2JQoQqHCD0IU0AGcRthqJCOouA833GTV49PAhZ1NkLP/c6HvJk3O+yQgcuDe2YfKmKWwU
 H2jr3OfuynhvA2RPZPDxHRnyK6DWK2PLhutqXwHk23UaPqEElMh6i5Gn9QoOD0WCT7A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=FZ0q8LhH; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=FZ0q8LhH
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D09640567
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:29:16 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=FZ0q8LhH47LF5o6b91/JN//g3szyTjNRscZseteo+mW74h0St4q+x3AECf8jxn0J9PVvRe/OPcBItDpLRoDyH0ULxkqbyuRrJgw+j/wXT5+GLF+GRK9OpCXD53s/Dlz4z1ELNav43+qgdiMi6Kr0dBIqk8tjHfVVS6F4PEw4bbJfzRqhxwfk/t4acNHzgo81IJi1eW9qIy/H31PRGKRQLPfkxQB3FFy9Do3gM8nGjdTPyRb9WkS4mfYDAqVGpDNEw3CZbzUnfct+k738Oanc9ED4vsDziOU0zPJKlKOeeW6U3hHDp/l0SFLLmJ0oijNjup1BQitE5RhfgRVjfDypHA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=06AWyKR2r7099kTKNuzWOrA/9wkfw+HPwnqIhWGbwv4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -438094285; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Oct 2026 10:29:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1xJ75k-0000000833h-2VVl;
 Tue, 20 Oct 2026 12:29:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 12:29:01 +0200
Message-ID: <20261020102906.1918308-7-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020102906.1918308-1-peter@korsgaard.com>
References: <20261020102906.1918308-1-peter@korsgaard.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH 7/7] configs/imx93-evk_defconfig: include
 EdgeLock firmware in boot image
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The defconfig had the EdgeLock firmware enabled, but it was not passed to
U-boot so not included in the flash.bin boot file.  Fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/imx93-evk_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/imx93-evk_defconfig b/configs/imx93-evk_defconfig
index 8c85c0e7cc..cf03bbe3c7 100644
--- a/configs/imx93-evk_defconfig
+++ b/configs/imx93-evk_defconfig
@@ -43,6 +43,7 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
+BR2_TARGET_UBOOT_NEEDS_IMX_ELE_FIRMWARE=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
 BR2_TARGET_UBOOT_SPL=y
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
