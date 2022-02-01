Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC086C4332F
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 22:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF2F780C22;
	Tue,  1 Feb 2022 22:08:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bJULRzTHYmOj; Tue,  1 Feb 2022 22:08:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC04D80BFF;
	Tue,  1 Feb 2022 22:08:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 408301BF3BE
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BB0940250
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:08:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4VjPWSytgwH1 for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 22:08:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51E6D40168
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 22:08:27 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id m14so34447921wrg.12
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 14:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nk0WhlWQIhILgUV45PBJVCD+RUXUN3g5er74ljev9Ek=;
 b=RZp4AwihK+zhVARZrnkUpizC9X1+wGXS2ub3RlpMm2tgZiSrwXMTtcMXebR0hiJatt
 B2pb11Kl6DAPWgDTU+LaigVTt5Q8/i5mg1UnMB9U326EGIT9+P1IErXWJyCkHRnbATSY
 474ht9zBnMSJJT/tce3QKFtNHkCYd+ADo1DtBzb9/E/+/12SLTQXllb465FS+6lby0AT
 SoMniMzllsntaQdGvRVFkmotnvfq53iKi9QZs5otZJ2NLuDRSf79OuW6/ud/v8q8mx6+
 /iakCVQ2pdphwhcWQe8ObA7p0CAgMV9v0GrCUP/P1+wyqLs+L7tGifAP4BrjKgCY96xN
 OeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nk0WhlWQIhILgUV45PBJVCD+RUXUN3g5er74ljev9Ek=;
 b=oOnAtpJFWLYAs9Ru2tMYQPa3siWc1Mt407uCAMxAkZT3044zZ09Wra1boO3WkmyfBp
 IeqInGPwCBc2XsgYQGTqWpmvN5jC/CPcCYd9aF+CIQtAN18DQQHeF9ETCOk3MJBfFWP1
 KlNmdTqUYtMmHyxWvf1KLUitGX3w0Z/mbRHCRZs1yZY0LWyiKUAAbXaS1TjvrQxvDq7s
 R4EGPhMFSgScvgtsUW75Il4/TwdlILeN93HgS4C11r8hpdG0uvaNU+JoMzlpN+4QkTiU
 bDiObQxg6/6pfd3kFJSVPrjmOD5L1oUReaQ7FGWlhbwqUz9Z1Jp7fDNZHUh9i78s51na
 i6fQ==
X-Gm-Message-State: AOAM530veiAgzKdd0krNyfW6iZLD8R9vI3M3regN30bk3sNIrbGUjrJu
 B+cccv6GRrtiJ8fFNIPBmJG+7i+ZeUQ=
X-Google-Smtp-Source: ABdhPJxvepT3T2SoLcuuReYRIttupXQCWzEN2HNiTmDIalmgOffNq6TI/HEX6rw8Dn+P6E+pAYYJtg==
X-Received: by 2002:adf:f50e:: with SMTP id q14mr23153523wro.647.1643753305405; 
 Tue, 01 Feb 2022 14:08:25 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id 14sm19227057wrz.100.2022.02.01.14.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 14:08:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  1 Feb 2022 23:06:26 +0100
Message-Id: <20220201220626.350423-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libgpg-error: add or1k support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

or1k is supported since version 1.18 and
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commit;h=c143fa81462584ad39ea780908266bce3fb9a49e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libgpg-error/Config.in | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/package/libgpg-error/Config.in b/package/libgpg-error/Config.in
index 44e9d67aaf..03157dd9fe 100644
--- a/package/libgpg-error/Config.in
+++ b/package/libgpg-error/Config.in
@@ -2,14 +2,19 @@ config BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	bool
 	# see src/syscfg/
 	default y if \
-		BR2_aarch64	|| BR2_aarch64_eb	|| BR2_arm	|| \
-		BR2_armeb	|| BR2_i386		|| BR2_mips	|| \
-		BR2_mipsel	|| BR2_mips64		|| BR2_mips64el	|| \
-		BR2_m68k	|| BR2_nios2		|| BR2_powerpc	|| \
-		BR2_powerpc64 	|| BR2_powerpc64le 	|| BR2_RISCV_64	|| \
-		BR2_RISCV_32	|| BR2_s390x		|| BR2_sh4	|| \
-		BR2_sh4eb	|| BR2_sh4a		|| BR2_sh4aeb	|| \
-		BR2_sparc	|| BR2_sparc64		|| BR2_x86_64
+		BR2_aarch64	|| BR2_aarch64_eb	|| \
+		BR2_arm		|| BR2_armeb		|| \
+		BR2_i386	|| BR2_mips		|| \
+		BR2_mipsel	|| BR2_mips64		|| \
+		BR2_mips64el	|| BR2_m68k		|| \
+		BR2_nios2	|| BR2_or1k		|| \
+		BR2_powerpc	|| BR2_powerpc64 	|| \
+		BR2_powerpc64le	|| BR2_RISCV_64		|| \
+		BR2_RISCV_32	|| BR2_s390x		|| \
+		BR2_sh4		|| BR2_sh4eb		|| \
+		BR2_sh4a	|| BR2_sh4aeb		|| \
+		BR2_sparc	|| BR2_sparc64		|| \
+		BR2_x86_64
 
 config BR2_PACKAGE_LIBGPG_ERROR
 	bool "libgpg-error"
@@ -36,6 +41,8 @@ config BR2_PACKAGE_LIBGPG_ERROR_SYSCFG
 		if BR2_m68k
 	default "nios2-unknown-linux-gnu" \
 		if BR2_nios2
+	default "or1k-unknown-linux-gnu" \
+		if BR2_or1k
 	default "powerpc-unknown-linux-gnu" \
 		if BR2_powerpc
 	default "powerpc64-unknown-linux-gnu" \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
