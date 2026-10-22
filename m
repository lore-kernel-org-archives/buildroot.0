Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249BA606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 08:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MTZPSaj1
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05254811E3;
	Thu, 22 Oct 2026 08:40:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jUPkBez29hTs; Thu, 22 Oct 2026 08:40:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1711B80C0D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792658438;
	b=EJ+5nWRH0WnEepJp4bbvU8Lq0hG2e81CvXhLu+iv+C3MrLlPJSvnenaXdUpatinBgJB4
	 cydVayAhxn/pxUBAIQTVZN6FcEIYvh1uYfK/LDGLhNUq+wUk9M5DzT2m0d2KdALGMsEaT
	 UV0MxBHVlNBGIYFuXfAI6Ho8UX36qcJxE518Jx1MkItWTLWTMqSag/w4zB3ekXQWWIGcO
	 YNunIumfbrVKK5o5JcqvZBp8Lq6biZfcDht5ldSBE4sy5goCWnTvVIZrqbFm8MjvDEDcm
	 V4/meD0GYMtpfLqj+Mizo0Bai9OD1tasHV9v9wOPLrwMaxcux+k3Hy4oQZs+E5MoqWg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792658438;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=RZ5nWSZ9B/BiRlUHg3V2vc6XbGIrPvjsY5VsG120lew=;
	b=eHNvKskrHaWvWQxqLgMF5dTRpjurSfd+DLdRx6ZQID9LOVe+qQKQtcN6mT2zjAa9rzrg
	 K8RPMwu2kVFqyIW2/21zm8WeSIIP/aqy0rNggJa6UwSvv4AuMT/7w2q9LZ8ZY3ygV5Tpj
	 XNEA6iHV0pwSIiuZTHNNBgmpl6zzEIqHEpwUmFDjoFcb3MGNYFuSExZ/ucYlWGR0exYWQ
	 u6Pn7SWzDTGMwgp37rbXnTStWCSPXgm7oDDnm/Fm4BA+hiGRxzIdiB113OkkMLcpoMBE1
	 2i2WRuCon9vzNyaHEyW/ZZxlgRCtQIHGjveBUfmgCV1LmMU2MSEwPRCkS7yODWsToTA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792658438;
	bh=RZ5nWSZ9B/BiRlUHg3V2vc6XbGIrPvjsY5VsG120lew=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MTZPSaj1UR8ZoVmlRDh6KRVTfhtsG6gQIWYPA3FqWq/FqO2KYPWNyaN49smfyqXv0
	 rHL8QIFLFx0TMX+snF/PkSiXkqkf5Hof/IFwSx2LP4wOL2x3hoozdhF6aJ5FHNwP4Y
	 5Fp2jj5iAp+IM+B64aWtxbAUUmFHh34N2rkNdiumOOfggI04BiJz80NMwNzppfRPcm
	 m9TwlS9PPcLnuU1MrRnLXPNyWG05iwfgFdfIuPezDhijyeuALUzhjqQrmiLHBVRgJy
	 fgO00vYXdJxCzN45LP2wpLw8axgoVbQE4RoEjJi2tWY0dM0u5AKFiE5g3ha8p+lGmb
	 EN7et13tgqCyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1711B80C0D;
	Thu, 22 Oct 2026 08:40:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 28B65371
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EC6D60823
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:40:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PXLJHWP9RQXo for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 08:40:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8EC9160816
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792658435;
 b=Ky6uFiIxxqFUClEEkhlnwog0ovSPoeIDGaqzC6vYv+rt11OmAJGzzYfpvEwTgPnaImxo
 QfxGGWKHz+vSYJ5rZs2i/Y0B3PPL8kM+QnHKK7nwW+K2PuvPfcg3Askg6iDE6wk4DmsVw
 5wQ2hRRtaE3jkof8EMGHgliDqT76SC6SCHq6L4RmRFEV9IQq5PPv4FdecxI1cgNa5wLtu
 5C+ed3ZQeNnSRVobYB8tOQZXxqP/ArFAgP6nW7ab1i1/rDLDilj+jqFS2LvmBdFKXShaq
 jFFsiyvqDhiOls86pDbskBFKZZ8GOkNGTo3nGAfphXMduLR8FUQzxpdlZaU6a/jMdew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792658435;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=9QqBfCRFu1FMoOptE09pYU2BcRZamS8frik4bTOQ2dw=;
 b=qTcRo+c05++uGvvPQMlj6Zpq5x0Qcl29qCRj+3Dlx2+d09D4V92eQ6fw1LMnpQ+sLAzV
 m+6vJMUC7pgseQkGTHHAA1WHfWEI/y+JiWzeGiyfOJzClVHfcbxJlDweaGWju++rRDj2i
 VSeNjoNcj2YRAo43CMVt1tIXuTrNpTl9gWu8r89tt19/hHbiZDwTDSTDBcLISxotMDymk
 cV+HJEN27Yf8G2s6eGU06Armn6qWwkgQnNMHSG5ToydelfuCjIv6hAQWK9bVjlrna2Qs/
 hCqck2CsJXKlWhqthdKvb+Svr9fnSE7txOBJP339bEkQayrV/ufvNN024Nkjea3ClOg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=W9qgvcBo; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8EC9160816
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:40:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 296FE4E412B6
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:40:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EAAA560360;
 Thu, 22 Oct 2026 08:40:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 07F3310328C52; 
 Thu, 22 Oct 2026 10:40:31 +0200 (CEST)
Date: Thu, 22 Oct 2026 10:40:31 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <atnL-VpD6bRzEiqE@windsurf>
References: <20261022051356.5768-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261022051356.5768-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/stellarium: bump version to 26.3
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

On Thu, Oct 22, 2026 at 07:13:56AM +0200, Bernd Kuhls wrote:
> https://stellarium.org/release/2026/09/28/stellarium-26.3.html
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
