Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394C9CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 18:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB7D3404F2;
	Sun, 11 Oct 2026 18:57:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hEAn43CXT9ks; Sun, 11 Oct 2026 18:57:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C352B4056F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791745046;
	b=TrzaZKDdWiIqZH5xtrHGrN4sv2Lfo+T8D4r8/SDxJSEl/lKjeXSdUKM87uxv9UtgpYF0
	 6s39onF2x8u6KUHlxUes4m9a/tZk2H+opkvf6uh444dzlsOd5pY6HoTO/UU6/sIZ77SXl
	 e3mpR9GPKwk2BxnM0Wm/JcFhr6EMaZV9w7MxzZJda4dN2/jv0p60VGixwdEXnSQJP7H89
	 s8puS6+w8T4Zo4ER7MS+r2eXwn5ByQ/tByeAUO230M8pYbfI3Mpuzr6u6TRzLh2LOODF4
	 5cuzS+zaqSqfiI51vaGtuxuMBwaj8YBrXEJMz4G3jYHC7dGI5lz2kSPkoR3qF2jzawQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791745046;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1cz6A66JAzn00roTIdswYlEpj568AqP/mmY2D9YB0Do=;
	b=VD1589srZMyZ3ghP09ojrcXG0NkUgNtTsPUxHkyC/RP+NMBSb83InBKgpLs1l/TIZlhB
	 FexazdrHKfpnc26neQdEI9fyAebTBP3snAaR9YOqXXzxNc6B2eP49ph+C3mmacA/MNmXv
	 FH14FdZrdtAitxQLOiBVcp1bx2euzaYvzEtvc1n6K+gkj29udUsBDzgqcy72/kZ/0siDa
	 25Yk++C9zlOkOcs9tK/NElV0SFiWAJ77X4j8QfzkPNoN+un7W5dCqQfbAOddnHVpnYkf/
	 8U5GL+Y/PRV2IAKk/b0E061RprteQSxmKx1C78UhsEAmMFVfXKMyoY7XdTGbK2kFQEA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791745046;
	bh=1cz6A66JAzn00roTIdswYlEpj568AqP/mmY2D9YB0Do=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BgDSdip5gpm/gi13VQ4Rnh43TrC3bEA5UsnBBAHmWo8Kwa77S5PNvexJFEUAOt5hM
	 0EyHFfeeJLQweLSEHzi/2ndUkErGyUbJfTlanArpGJiKp6y+nnR6lLEq/GZEQQOhCL
	 fBrJ+fBpJKbS7Sb5hbZhuDzwwR5wdUOCPcwtmycLP7cTxbEHoQo3mzWNoMV0bFMBbP
	 t4EMaG0vKHvXyXYntqMYRC054Inqwb29Z5Vcbd6qBvbW94CuUZjtUIUgT6nioFH+kU
	 A3/Oeeon3rjEHE+ZIPGuBlDnBc8Ua8JGBp6rn8o7osdVxU+qotZxe0wfkS1aXHRBgx
	 lXFwXWyDzSltg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C352B4056F;
	Sun, 11 Oct 2026 18:57:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 097DF75
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 18:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2E02605E7
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 18:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1zBXru-iAEzf for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 18:57:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CA84F605E4
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791745045;
 b=UXbSxp0YzgikjvRFQgw+8zGXJYLV/FvQS66DMviBJu7Lg13UvQ9j6C9V+NrHW5BO6/TE
 1K/jrcIGo5Gt95g7ialpqo3FzsiRwIIkZpAgE4uB9Fe8O0GB/pn1vwL8PI+qJR43QLhVe
 EjYfz7NYkxYpeseO0uAho6OXAIJJEOY2czp9AgISDjyMNFQ0T4ya8mS/dh7V0GQfIf5Fi
 oli7CKBMGfojOeI9544pGnfauwZ8pHZ7pRgPdL5h3XMey0HYzUXpPt47zOKQuESyOxGA9
 pSapz5mbJgFhje0CPob1nn25Rqq/GI32rtDEaApTdmoVMUN43m+SEnBtgddOaB7ngxA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791745045;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Znf/wilCsfq9cjbMVamhFfynA8kU6o2FN3oi+sTgS+I=;
 b=IME8nNGH+tsv4Al4xa8GT+sk3Xs9i5RuwCkdYexxoDZ9Eao+mp1Vze8dyA2RVG1ERSeA
 wwTxvAuyz0bA8fvoWxyQti+xBDgNDF3l4Av54eWLE1ZTcCGADbrbJrg7tfTSjzSnhmGeM
 N+YubsJAt54bGBdvqVA8AP0DEMJWZN7eG+lud2i0U9wx4Aiap8ad3nNPD3UGt3ySlEEpj
 EtAqc5P/T4p/Q/M83KKDgfLFTqde7r605w7lL9xmE9p5DEPz3aioftNh0qeLY1pP6+DcW
 DZ/EQ2CPUdJZ84XRVSAeokD5TSIJS29CXETYOCOQH6jBFCZoChFYJBMiEaJ3MAMeTkw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=nimblex.net;
 dkim=pass header.d=nimblex.net header.i=@nimblex.net header.a=rsa-sha256
 header.s=google header.b=QLE4p9fJ; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::b"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:31::b;
 helo=mail-wm2-x0b.google.com; envelope-from=bogdan@nimblex.org;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=nimblex.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=nimblex.net header.i=@nimblex.net header.a=rsa-sha256
 header.s=google header.b=QLE4p9fJ
Received: from mail-wm2-x0b.google.com (mail-wm2-x0b.google.com
 [IPv6:2a00:1450:4864:31::b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA84F605E4
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 18:57:24 +0000 (UTC)
Received: by mail-wm2-x0b.google.com with SMTP id
 5b1f17b1804b1-4a16dfb8fa6so8075295e9.1
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 11:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nimblex.net; s=google; t=1791745042; x=1792349842; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Znf/wilCsfq9cjbMVamhFfynA8kU6o2FN3oi+sTgS+I=;
 b=QLE4p9fJEOs7qArFtVb/eGYdrGiCTMOZxgun2OYbm969gTY6Y3B1UaLmzAXY5qGTgx
 m3853FwwTDtJYVqGOa1TmaOW6/XhAfmojTGLQxsI4mNFj1eoEXliVg8epK/2HUCTXDWF
 +NIFlufE3cYJg9DY49vUhnuMXrN4S4a/9nP88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791745042; x=1792349842;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=Znf/wilCsfq9cjbMVamhFfynA8kU6o2FN3oi+sTgS+I=;
 b=OeoXHinn5rzyUf9YnB65/pRQTHiqcluBL/P4mgj/fnJUe7S0hWTvxPJ+fp9RkXH6WA
 4T9tXEAK9FKWUwV6iuV/APWXuGcQ9FO8kYDFHBr9NcWCVCk+A1XWUmcSw+OgYEDsrczK
 uj39vSRa5Oc4MGBvpkgTiT/MV8FUoT83Ujcz2yWrulvnJhA54XOuf6O5hpT7dbZtBt4f
 lIMQcNkPc3e7WsPm+X1sbwRMHsoQ7ofbhnBOy7U7s03MmD1bnxzYtbg8abq/9Cbl9pNC
 eIfS6tsf+YzB9jRtlSG33NsLGxgAyO6bUJdzWLQsIPuftXudU5mm7Cxrz8yJm6yD7Myz
 croQ==
X-Gm-Message-State: AFq9FYJdLpEVIGObCQff3sompIojt7pZTiBJtmXLqMaab4oKhxJyTal4
 IWh8TuZDIdLZc1Wg5CNSVw+C2EPB+o8vxEHOaeV04/yRnWxdOQhrEpnbWf5q644yn99XLvSk1L8
 wfhPVdKnnnuf3
X-Gm-Gg: AYBFou2HNHtPTBIAhDjxQIbJ8ATfXYrY+r5HS0zT3Pnc+61VxJzlPLcyALnUZ6Tx0nK
 TeF34e4DmQBqyWD0Wuw2AVeOQqKk/g/VvjFr7S28kHuKpYo7BbIOpQA17OIzcA0OkMWueIp+a6M
 sQB/t+yNO+6Qxra2kOzaHAcIOYFQUnzObLUKkJnbWqv/nt901i3FRix49yrMYhN7FAQZaSa88io
 ZAyuQ4D71SoWY22TMHhTA5+hxhBR50JBlwmQaey9nD3isWGNZqyDdP+zLYLwmAl3A2thE/0vtYl
 eG7MNH/V+mFwM7PPFhyKGd2WG+RhE+a4RlAPn75pmoax2OqazsE3nFiHyUwM/fCeaB6tQd0P/Mt
 tsRPAtlu7mvkb95QtU45cIBmjdrCXVOG97YfI1y1VSKLmSbg/owJdVSLHAPL78G2L3XVNAUIqGH
 e2R8RrXFfN2WhbDsVohEbufZTksilD87KoXbvoOVI38+kdKdaBndmAfeoEsVIcH1a9cXU=
X-Received: by 2002:a05:600c:34cf:b0:4a0:159b:d2a9 with SMTP id
 5b1f17b1804b1-4a18e4d68aamr113696715e9.24.1791745042010; 
 Sun, 11 Oct 2026 11:57:22 -0700 (PDT)
Received: from nimblex ([2a02:2f0c:5601:8b00:fd52:90c6:53a4:beb])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a19471edd5sm255797315e9.11.2026.10.11.11.57.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 11:57:21 -0700 (PDT)
From: Bogdan Radulescu <bogdan@nimblex.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 21:57:35 +0300
Message-ID: <20261011185735.3200892-1-bogdan@nimblex.net>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/nettest: not available for the i586
 Rust targets
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

nettest depends, through rustls, quinn and rcgen, on the ring crate,
which refuses to build for 32-bit x86 targets without SSE and SSE2:

  error[E0080]: evaluation panicked: assertion failed: cfg!(target_feature = "sse") && cfg!(target_feature = "sse2")
    --> .../VENDOR/ring/src/cpu/intel.rs:26:9

Buildroot uses the i586-unknown-linux-{gnu,musl} Rust targets when
BR2_ARCH is "i586" (i586, pentium-mmx, geode, c3, winchip...), and
those targets do not enable SSE/SSE2. The i686 Rust targets enable
SSE2 by default, so ring builds fine there.

Make nettest unavailable when the Rust target architecture is i586.

Fixes: https://autobuild.buildroot.org/results/d04f770538412bee77851142ee007f2ff107e0ec
Signed-off-by: Bogdan Radulescu <bogdan@nimblex.net>
---
 package/nettest/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/nettest/Config.in b/package/nettest/Config.in
index 0ec4dcdc4a..6b9eccfa7c 100644
--- a/package/nettest/Config.in
+++ b/package/nettest/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_NETTEST
 	bool "nettest"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	# ring needs SSE/SSE2, which the i586 Rust targets lack
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH != "i586"
 	select BR2_PACKAGE_HOST_RUSTC
 	help
 	  nettest measures download and upload throughput, latency,
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
