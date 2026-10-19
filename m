Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA62D606A319
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 21:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fI4vpnhO
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF91960792;
	Mon, 19 Oct 2026 21:53:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jj0qoZYrB5OE; Mon, 19 Oct 2026 21:53:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D85D0607B0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792446796;
	b=qao4foIVwlyqYpzEu8gtZrnGh2Lv2gUDezdtcFYACYAGeqjtn7yl7gJoNA3ydIvxuHHD
	 H3Z3n+9O4YLLw0g/CT7prOpjrY9GX3Q382wt6YIAauoyU6R2yOmUMSHFB15s8bJ8Ue8YD
	 BYhT237DdNkJjHvFHn8e7LughO4/IpKDTI7LXIh2XeqULIVwmgT3JKqe4vyIUzIOaT757
	 S/J7epcRXRevmjZBVGXexvjtnIGIOS/7pOE8lYI7ATpqVVF//2HIjrXK+WXsx4Pu4/UZM
	 0T/lfGYbl+nAj+Qd3II2BNIEZumlKbppDyZpZJY/S5p3jVgH2kBsoEBwhq/vL6LRLXQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792446796;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=DEaIEGSqjoAdGUVtdPSF2znCGmjcxwGssILb5LZM3hY=;
	b=CKXnbrVGcFzdk37qU00qh2DMbB5LNoN1Chc0HjazsufHR0MHxqYDo4OPYk+NfhUf1PSp
	 NW4psZPCoq11yT406fsKUJoPVNTWZwcvi6fic2rYHAD5LWQVsT+n5E0EBFuxRn0ox61fn
	 efL5/b3QRjSXEK1odF/axiKzeLPJqqGA/+SL6Gm9wdVb+18kOCypeRgU+gK/v7gozjm8z
	 KHNi4EsOeOdnmeet63J2sodv30dS3Sy93WEz7KSv00FJjk5H44i/bklPoSPkXuG/zC17S
	 hsBrXTYzaZZaISK7zCjasa1ykLSqzhbgAb3zS+JHEUo1whlLbW2aUjHlj5tT9r3pPRA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792446795;
	bh=DEaIEGSqjoAdGUVtdPSF2znCGmjcxwGssILb5LZM3hY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fI4vpnhOqt8/mzkN6ZwpT1/qM9B+fRDD7FtxnonLce1BiBuAvU45P+SnQy1BWcFkv
	 5kBbhqHUwbIJCTMVeDxsRbAnI6XLf1QUxOa375o7F7LW7KDHNE5zTAF8oipUK2YRv4
	 kGxv828wKDcm3FJIdY3i1E1kstInusDOgrJlHYH6QyVJyiGA5oBN5Q6MKmWRIRaTSl
	 iRZTKXq0XdfC9zlXT0Nx2i6grgEMcaE4IlrrN7KudHOhaivMf3wy1RHoW4mnaUS3Mw
	 dwxzc4hc0unRAgjGuzPOEEMoO174gKRZ2dCVIkFEacmr58hQXhVi1sWek0WPYZthVQ
	 9LQQGvPzzC79Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D85D0607B0;
	Mon, 19 Oct 2026 21:53:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CEFA23F
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 841B2402B4
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:53:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EeDM53YrN-12 for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 21:53:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org ABAA5402B7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792446793;
 b=rq7M8hTHRPAqsxM4Qndu83gt8u6cCgZkVsM+ZHUnA5rz5ghiV4ZPEWSxGqo1BtBtaYSM
 874dw0Qmz7cW71ZYuT1kZkRlH6i8ZkZo7w73hKfHyovFW4WVpQ3lmkaANpJUrYbTyKkCF
 lwZDUS2Q/qke22dDzaSnxRLKvYCPCkh8KGW8GaMBXa0RihSVi7/GN+XLv1/RDBqXXYonE
 kFXT4SPR8myebSFQDCv8P/ubUDHSx32lJudWQ48FQe7sP5DdzBZyNuSJG/kyt+3Qxa9AB
 ggOXn6AuL/MNND33bEPh7gd9qXzfM2AjRW5bHLK8YIopRqSdllWXBc/vy8BPR24V5lg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792446793;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=ZXX+ArEpqcwiUr4Bm6lKWcbhbLRx8O9IYAwZUx/Z36o=;
 b=fzE41d+VEWTee3ZAuqj4YnlhDMcMJZN8yZKCdU2mxTsbpMyh1gIfAvTAM0HFLsq6sDjC
 a+hTmU50MtFZFy8QFehxgK0K9zrT1L2afXfvXa4StaqUMG2we4PoSN4VlIYKu/K+FHsfJ
 jUtaeEKjsyr4CMi4iS70YOkfBV5NAV/K6swg8u+MBd31WftTZFkI5+JsnxhxUAPoOj4gP
 OCCcnAM+L18tkYLvpPaXSK6juL4Xij+9K22s046n+VzTeNEvbDtzBmigeAr120C7D+DVF
 3KWV46oTy9zHjAzPW380qP2/9XmekZIGLnINjEJMs7Tua9XAl3884O7e5mqbWroIhOw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="kwzWWJ/8"; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABAA5402B7
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:53:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9C600C5CD5D
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:54:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 62E6060582;
 Mon, 19 Oct 2026 21:53:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8389D10328C22; 
 Mon, 19 Oct 2026 23:53:06 +0200 (CEST)
Date: Mon, 19 Oct 2026 23:53:06 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <ataRPkeX7c-_7cAK@windsurf>
References: <20261019212832.97456-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261019212832.97456-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/libheif: security bump version
 to 1.23.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 11:28:32PM +0200, Bernd Kuhls wrote:
> https://github.com/strukturag/libheif/releases/tag/v1.23.6
> 
> Fixes the following CVEs:
> 
> (CVE numbers will be added when assigned.)
> 
> CVE-2026-XXXXX (GHSA-h4h8-qgvc-m7r2)
> CVE-2026-XXXXX (GHSA-fcmw-5764-7rq8)
> CVE-2026-XXXXX (GHSA-6fqc-p7r8-2g36)
> CVE-2026-XXXXX (GHSA-q7mw-2fmm-5q94)
> CVE-2026-XXXXX (GHSA-vv35-6hxg-95x8)
> CVE-2026-XXXXX (GHSA-8p2c-9wv4-rx4p)
> CVE-2026-XXXXX (GHSA-86ch-j429-fpr2)
> CVE-2026-XXXXX (GHSA-3gwx-cjv4-jr74)
> GHSA-hqpw-h8p6-22q9
> GHSA-hvwh-xpj6-ph5x
> GHSA-v5rj-g4wv-j5w3
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
