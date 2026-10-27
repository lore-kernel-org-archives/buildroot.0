Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7563606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gWA5KkAK
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C53BF80FA7;
	Tue, 27 Oct 2026 16:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sh7eDEDLqqNs; Tue, 27 Oct 2026 16:06:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org ED3E180F91
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793117196;
	b=GkHmjQsSBDE0SvQxb64n1v5f2PtjVvXIEIhjHAubHf3d071IDNlmdfbjJkhuv7SEsBfQ
	 QrgxJWH11USdNhOhUctSFrm6huxz0AIW+IPrruBPBu87VnQxwuYhz/3KjSwk62h2vIAQb
	 FocLkrkeTEJzwXrksOoB18BaNFW3v3CFBlAIbOESYdTnkTLTdT+bY+ELdOYayMub+Svi9
	 71gJKgLXqcT3ygv3fswU+WYFRd2CGZ1bK/3I3roUWBEb+9FJ2laAn4MQehwMHVj5NUm5a
	 bAPtL7cGzhVH/GABNUEJU+EvnIPxOFI6AuJOBkEKrAaewDV2geqO+Pljh9vtU5XW8kw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793117196;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=CXIKMEIkU03eTiDty9C5E110r6L3ifWNXx5O2RG/Zq4=;
	b=gyYvz+1QWMXxTvmlaoBu7mbWfcgeYTQiOkKaI2Qhbm9pLgpPbbM8aC2wRlUtLq7aFhzy
	 7+Vh9EsvnMipNUmJgNW9og8LwCLkxLvBARQ5YgEmvo6Mx7/YwESoLwqXmT4qr26c4Va6O
	 Vr1Y8tsqkReoNV3KlvF+5gGRLZO1JnH6klgwurXz/TPrewnAQxTJpoC5XqxUrE19HtHNc
	 8PryaGtutvCnPVe2IDdb9PYmwLLWqZ81rupPBpubyaFfePUl9OV+TC6YDOb2TRg4hGm9b
	 jGL4JEmoPKouQz/FwDehPOavy1D8cFToM8RWRFPGYyjih21/WhkmdqX/bsvCRJArXJA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793117196;
	bh=CXIKMEIkU03eTiDty9C5E110r6L3ifWNXx5O2RG/Zq4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gWA5KkAKgQELuCshlgHJR9s3kWiJ5yjnJEcOwms5pfv2y8YknvWt+I8i23glIcnBq
	 GX5YKCo8/zV1oOPP+DUjz2c82oEFZ6htterTwMlxNQNebADX3NtR50ZhY2fqcnngna
	 yRDO9VTK3+pqR7BGmXXymgCL+B+YHI/piRQE4Ub3u+Qvjq/PvluSES1TCHYyfvFV82
	 hViKiu/OBBd0yyC/LbK+e7GcIXo89Z+KQsVxEA5JWuuZYO9wo5K+OgZ4gkd6GFP5Ei
	 S2OoH6+Tvynaepc+DceWYaNrH+cESZx9s9w0fHPWtrRGZLBD/rz51gs2bfSUjvj3l7
	 8r2Uu6gOLp+Bw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED3E180F91;
	Tue, 27 Oct 2026 16:06:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D13172
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5352A407E5
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:06:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jFHoRzR1bRfN for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:06:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 66D16404D0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793117193;
 b=GfcLNLEcZvVE6R+wGi64OwiN+xLNtsMHvRfhtXmLD0dlUCKLTDcMv5A021fknvGUeyIT
 ASj0oBV9QMCwhSrK8DkQrZV9qVK6b6oawUCs2J0yA+VtSJW6valDBNGP8hFdseH05sXxt
 YF8FWJInIaIblPO41CXaSUyZbLVpXa4CVlETeP/9NWoA/Wz17u+NRYzpi2/VXyL4y+bvb
 Fk1dK3qDhC86ahUsbke2e7yXDv2h1btla9GAAFdwnUqoOa+Jv+b/MGdjcN6jXdOO+2p5N
 Jl8i70YFR3eQTQgTW+PAEQwxQRdoB5wjDBe2R1jMMVXkyziBlG1ahTDsevyiUME4jwQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793117193;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=BLxHC/rsLh+1EvALKiDceG+4eSnAFKKMT5UzdEQKSHQ=;
 b=iSwU6lc0x42WSfy4OcknFPZ0awNWhbUcfTeW9TuMKn5Z+8Fs+4Qvs74lGYqAt7ECL5cl
 oMujT79D3tYHWMMFWlyxtkQV/Q1dh7MhvQZzh5cWjfDMN9Q5xJ0xEyVCfpNrHqRJ6FlaV
 LnleFFZluurHNlS2dNslsw4EVItK7/vHqbNUK8AAYf05xE58vfabO1HWubqIzqcMNycbJ
 qtTOpiJndBYSFmnQh4rhcSTiM2hNM662hw0HGX5Ysq3lEzThHPCaYvBeALrgyFbnWUEkl
 BUp9KFUg+sn/YGxSOMwGpJG7Frtkcj1YuqyEl08qaBmdzSf78aVGtbuHiKNyvr62UIg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=LQ7+xaOo; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66D16404D0
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:06:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 268221A1350
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:06:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E9A55603BD;
 Tue, 27 Oct 2026 16:06:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1941F10328D57; Tue, 27 Oct 2026 17:06:29 +0100 (CET)
Date: Tue, 27 Oct 2026 17:06:29 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Message-ID: <auDMAXSB5TPQW76L@windsurf>
References: <20261027145351.1527631-1-giulio.benetti@benettiengineering.com>
 <20261027145351.1527631-3-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261027145351.1527631-3-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/rtl8812au-aircrack-ng: fix build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 03:53:51PM +0100, Giulio Benetti wrote:
> Starting with gcc 14, several C diagnostics which were previously warnings are
> errors by default. In particular, -Wincompatible-pointer-types was
> changed to a permanent error by GCC commit:
> r14-6037-g9715c545d33b3a32ddc1ae817ba9356ade1fb9df
> ("c: Turn -Wincompatible-pointer-types into a permerror").
> So let's workaround this by passing -Wno-error to USER_EXTRA_CFLAGS.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

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
