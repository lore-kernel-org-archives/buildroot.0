Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1A2C88E53
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 21:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09DF680E58;
	Sat, 12 Sep 2026 21:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q8gfMMqFMHbc; Sat, 12 Sep 2026 21:01:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1EC2180E4E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789246890;
	b=rq2kJ9Si8BEnt2+bGuZwS3464a3k/mrkRX+VcQ5M5X9FUF6+CyjlD6+CLciGN2rBqeSR
	 RRVHMGi3X6bYUrYxsT32+xTUv8hqDo7TyONLMSfaWwuImnD0gEbBuBUWS4rXeJSz4zL3p
	 ECEY3CEjcDsinE0fuHtTnBQuSUD57dXD/L3tPYvFABqXdHotAfXUKNdT8apBHnbWSZvmd
	 Gm1PW0PU9d6NGBVm4smJhrVmPdExbMWQw23i34itJ/c4G/vEfu7fbmNcXS2O8rNyzwROz
	 wv9IA0Xszg0VoW8cEOV6EDoE0e+VSKDNs6FB+WUDAyCRQp1yZ8B3dlXjE6IDOD02nwQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789246890;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=XtAvVYl79ouj2cekaoCR4Az9/diGkLV9ctMPMdd8vys=;
	b=QKnGvxJekgSgTQS+lHjdg0a7fPUokB6zs3hl1APK6SjPrIXbCwsvu87GmqnjUHj3dl+w
	 zumEm12SNGIzX6c+M380/dRt0qOMGvWhfgQL8992O/pH8vQqvpFREj5GdyE61L9xhURHc
	 +O2IQknQtiG2MiasKOGytUK+8G2VH38PDNxY/7+M0GGxip2w7xFrpjBu6i9Tm4BLd/5oL
	 Kqg9FPWUxLiTBIz/92uTtZzD4zIWT0ELk3GcT8TnysiVkGVs2kseKYkhfwwfn+ROJBpaH
	 +fH3QjKE/9DnPjTIjSwFs9V5MY5zJfN+YGuu6m2NhxPtHU7iOcKqlNHT1WnYpTcMdGA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789246890;
	bh=XtAvVYl79ouj2cekaoCR4Az9/diGkLV9ctMPMdd8vys=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=YWE6QRYB5ieFLTQR6ChREp92ohBKEWM2Hn5JimrNgL+LDIwF+lD2pE+9LQ+S9YMHI
	 VG7TThmZwAee4FNBSTE36uddQmzo961uq11VEOh3xAB+F8uvtwoIASamLTxv2o5/Rx
	 wTtBjppRXvWC9vA+OoKzgrAjVVBPvEutEOCcSMeWxNvTPNbXAMg07DyZo+LJpkBQ3I
	 ebPr8rPKbXw92aMNQFnU0LxuxEbRZl6bAKDAPWxavqQwGm/kynflJRRx2vNq+QrrH8
	 ZfUUC0RPf4SDbUI2t/TZbxl6oQKJFBzCEbfBASc0WxMPS71F0HU5fgXFoEFWZrK0AW
	 GqEnCsl9onrAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EC2180E4E;
	Sat, 12 Sep 2026 21:01:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E9042E3
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 306D780E4E
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:01:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aQIOQmLXE3Jp for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 21:01:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 70AA180E0D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789246885;
 b=C/knpEfI6sWiw1BTAg2RXkQMy/lRV5EB2c3Q5wb3yeuw/iR0lKeuQpXZWChCqLVRBJTa
 LsFh87fmvrSVzqzug4STbmtz0s4gX3vkGvgn7FphYm6sEUp8OxihAizcaipnly+OV0kAS
 ykDVXRW0plQBo5g+fG2SezFCVQuJx0yuq3vptHbj0QviDkqT64sBqa8O7riDqs0wRR/RY
 3LEed3MIneT927BlIqONRHlr5szvGOi3skL0ZM1Whq0eLZB5FocqeucxJ1Fj3h+CXNbkk
 9yfzSfuRmFjqy2ouFD3yZSOFMfnTts/XrmuEXRaEjGc7ss4nXJ+RNMrTZTOBIQbkkEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789246885;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=VHsHmwBolSx8ITmFE/s+S4jtKicmpJQWMQF7j8vcx+Y=;
 b=tNi/1vdKEcexIclseiH1oKOD72phO23UNh6QI+zwkRtWT/mDEzkikoRpHM/2bwqwvBQK
 3Z4UhlNaRNuWv6XqS5wQ9akMFHZNdHdDZjFVNrjD/zyBYy5VRxryY6WAK9ikP3NZb2pkA
 ccgdxY5MmJ7c+1qU02WmyFMtCCIic4f81gipcebSIAIApJD8Eie0yPGhEcLd72fNZwOWj
 QdChpksVt3+vAvKukt0iPkzkT+FsapWqJgcGDoq/LLendwiUuOXTBPYdyNhQ31GkgIe6a
 rwtvhYnOJMVWHMCGUKkrpAYKWGgbZ2j0k809c/P6Ef8HeuuMXcqYDXlpnTKS6kSIKYA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ZpgxxDez; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70AA180E0D
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:01:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 28D21C63448;
 Sat, 12 Sep 2026 21:02:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C590A60580;
 Sat, 12 Sep 2026 21:01:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C268911C7AFA9; 
 Sat, 12 Sep 2026 23:01:18 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Sat, 12 Sep 2026 23:01:16 +0200
Message-ID: <20260912210117.1550341-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/bcc: propagate missing dependency from
 clang
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since bcc was introduced in commit
146498d13c487e8f43d6725e343eae4474147695, it lacked a dependency
propagation from clang for BR2_TOOLCHAIN_HAS_GCC_BUG_64735, this
commit fixes this mistake.

Fixes: 146498d13c487e8f43d6725e343eae4474147695 ("package/bcc: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bcc/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/bcc/Config.in b/package/bcc/Config.in
index bf46f07d93..9f3907b9be 100644
--- a/package/bcc/Config.in
+++ b/package/bcc/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_BCC
 	depends on BR2_USE_WCHAR # clang, python3
 	depends on BR2_TOOLCHAIN_HAS_THREADS # clang, python3
 	depends on !BR2_STATIC_LIBS # clang, python3
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # clang, llvm
 	select BR2_PACKAGE_CLANG
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_FLEX # needs FlexLexer.h
@@ -48,3 +49,8 @@ comment "bcc needs a glibc toolchain, C++, wchar, threads, dynamic libs, gcc >=
 		|| !BR2_USE_WCHAR \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
 		|| BR2_STATIC_LIBS
+
+comment "bcc needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
