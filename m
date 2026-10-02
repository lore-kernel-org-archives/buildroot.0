Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9576FCA5FD9
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 07:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43A2840CF2;
	Fri,  2 Oct 2026 07:59:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cyM8cp0uEKar; Fri,  2 Oct 2026 07:59:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8BEA740CD5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790927983;
	b=WTp7RrTyzuVVb2/aXsteaUq6FclSkR+jPWie1GI5V6EqsOo/wEh+QPmm6rC0L4PpBPyN
	 AhAX9gM0nRyah0z+vDsVti87jVsHt5N8/kDONsVlCa6WEg+AhSzz1YN0M6gWiOWwKDc1u
	 Qk0hw0SC45PokxU19gGV/W6lAGsC4+G7upM8JxPAmlPp99j7y2NyZYhAWRMNg+DxFzDTH
	 JlBpWkGsRJ/21uPB+FqpLxeH+PirK53D/S068s/rOUK7nc3djBPwYxVNxqy3fo14TJ/9I
	 YofIR+btLRjrNHGwvA2KufoPz2RtttmGFWGravBNiPT2a2D+padKu5zTNYJQ2TllHLA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790927983;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=ta29gdqCp+zyy/1vUev5BszMq+EBkq5qM9d8RsAB+KM=;
	b=htlSTYen58Z67ApwROwjs8erZT4TE1sNB1xp/GaFzgCNHdVQQzhoDW2ufPeM3BZrEt4J
	 hi0MLKiKlyHHobB7W4j7VNjlDkdJBqQN+/KsY3vchrAOXMjY6ertWkPT+8iT5Dk2AmJ/l
	 vISFcgpmLduaJiQR57RG0ngwj2k6b0OewFJdfakgp9Kd7fPlOKLpikEJu4ZtlHuhB60O3
	 4Fdff8jf1eF6KyAJOPA5mGbBK3qffBbYEGryXkOQw7z2+tR7cSZkWT69BKm6PL3imi5fr
	 7jNnWh4InDLnCoVPwmnlzH1+JRyKX8HCid1Eq8XZCxyf0GHq6MZpbOZ6h1DhNLTtIhQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790927983;
	bh=ta29gdqCp+zyy/1vUev5BszMq+EBkq5qM9d8RsAB+KM=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=IxO7bBdgfpPaoRLwntNia2VqoeZVN93NbvzR0qKJpa2yANHWkfrnwvy34BcOieRbx
	 hsZ5TY/Rd4ENoGh3B+ATS5fR1IQx8xQ0nlrZ94WbsYpVHkeHdzuDz0k47P+XAy/fa1
	 QbmVXInVL6xM56jxjMMA6F8hvh7n+YH+v7ndZXCMM2CJRM7/5WoYR29H2NWGWi5dxZ
	 GfCpkVSnqeEG7XNFDYbhcNGn2GjZkIxakZT6NWBgA+R1ODyh/a0TTYVqb0ZwrrgFw9
	 vS7G5AHL0Zt5DR4y9M1k0Kz3f7yTdQc85SPPdNmZdspq6hQ2sGFQpspszLpguQkfc6
	 HnshiMkWxqzjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BEA740CD5;
	Fri,  2 Oct 2026 07:59:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9874D4DA0
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 07:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E71340CBF
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 07:59:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x4LZDSjuT0DT for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 07:59:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 75F7040C03
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790927980;
 b=SWmo3tC/4VvJYRHsURn24rIC4eH4BhCR/YHJQJAM92bNXqlddnaSJFA1htaL2hPoHz80
 Wt5SZRHkW6Qsv4LuNnMF6GVALkxjR2Sdrk+7Mgqx2Hy44Y0IiC90P7tmBmlxPR24qP/IU
 +C2j2rA/rxbm6l9REtv//HIEGpP1SQZ2WhOSvfbbbgLUKvm+ZUcKcXVDAIWQgeaS3T0p6
 jtNU9eVCApnYRae5VjN6vTJiFzffYQlps/xMy8SX5loSCg9FV6Uz3dgiVoYmAKHUnbcHS
 oyXcnTPAb7ek78x4C3r+DnFtN5kHLWNyinzGe5F47bUyuhuiGfRMyvbpUZvy1S6KznA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790927980;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=ikpKyo9Zbpml7hmLLrfELyP+IwKO1zp8IkVlNV6P5oE=;
 b=FpQ23zuTiw1kBoeipaMTskrNuqHAAaBJZf/PT3bTb/6FcQOhXtJGDU8c6ZtRuSlz/eeN
 woogWIkhihJZk2ND9Uv3e/s95NtfxnF+qF6E60X8vNtJwXzZLOpYZiTlC9SZdypyn5bDa
 zhu5m+Ko5GjhaFbp8aj22vX/DLnbTE5u5zFM14ZntRt/uLs7KUtEYHyGnnLAh+Pt+dzuq
 5/gHBWjCcgIEQBeKixTCrgTqLtP91zsu2pQrm1lsQvg2YLBlMxhPX1Ewz+9D5IeIwTp08
 q0/UTLVB0IC/KC6Xj4i+Yp7k2IEngwSYQSAR3DoZn6sv2xVYj9IYjDVjOaLND4zV11Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=heine.tech; 
 dkim=pass header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=bUFPbjZ4; 
 arc=none smtp.remote-ip=195.201.24.99
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75F7040C03
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 07:59:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AE9041814BC; Fri, 02 Oct 2026 09:59:37 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 09:56:32 +0200
Message-ID: <20261002075640.2350126-4-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002075640.2350126-2-buildroot@heine.tech>
References: <20261002075640.2350126-2-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH v2 3/4] package/sqlitecpp: needs threads
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SQLiteCpp has an unconditional dependency on threads.

fixes:
br-test-pkg/br-arm-full-nothread
https://gitlab.com/heinemml/buildroot/-/jobs/16865965420

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/sqlitecpp/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/sqlitecpp/Config.in b/package/sqlitecpp/Config.in
index 31de9a3904..614c46cb54 100644
--- a/package/sqlitecpp/Config.in
+++ b/package/sqlitecpp/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SQLITECPP
 	bool "sqlitecpp"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA
@@ -10,5 +11,6 @@ config BR2_PACKAGE_SQLITECPP
 
 	  https://github.com/SRombauts/SQLiteCpp
 
-comment "sqlitecpp needs a toolchain w/ C++11, gcc >= 4.9"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+comment "sqlitecpp needs a toolchain w/ C++11, threads, gcc >= 4.9"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
