Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D03C606A326
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 12:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RYWfl3Yt
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FBCF40896;
	Tue, 10 Nov 2026 12:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WRaooJW07IBS; Tue, 10 Nov 2026 12:18:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 84BF840867
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794313102;
	b=cXeSYbpsTVg4m45gOFBNwcPkSn/FPa0Kayktt+YqH7sxedvIAA8p2KKCEyfhKxPkQJTa
	 LNIEIwawq+3Ze+WUUTQAPWkSvmuwsCabzcKjFC6nUlC93kn5xihkYyGTjekQGQVvd2lSB
	 iqWzVv2zOS+43R0UUEWWI1gI3d7lUgXkSnhgZ+qiZhImFkVucpYed7xx3RzXg9zqdJH7i
	 SwqGySDvKipEfrywZmoFQilKNH2GOmUQiSMsaVeHOcvTe12hF25+UffvB1tHeS+2lkMj0
	 BzJ8Ykg9sfce/O1N6O2xgXwl+HrAve+QWivRQPPpebNrohjCJsq29rm5Qaz8um1t8WA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794313102;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=uCstbB8ZhVyAC2qfJuP5LHUEqmFbED5vbL6+2e4Adak=;
	b=HPQfQ0Qw5Z0rWrxoseikM0d/DQWP/uKDy3PdlsQAdxpUmj2J25CMpE0XFaDN59GPQTL4
	 9lW5x0NS//A+b2s+YuIvMEho0sfoAA7a1KUd3tZB9HCiVqqLiBbZmrkb5UjyJtHmMvNH0
	 Sw4Ewsd2IxemJBpkDxZRJhLQZt9U9AgClxAr/UxXAdEfXtRo6C/XzHLEW904agWoYOA+r
	 wrlBF0o4Plt4mlAqcZvxKxgh2F7UHzMM2cS2kIAb7bVC04K3DYVOtjG/G2EzeWh3dtQh+
	 FVE8MdHApMfoPL9lVqHLF+/o8qQQCD7/Ss+vreFxLGPbrRoMxtbkji51wLiggNwR0cA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794313102;
	bh=uCstbB8ZhVyAC2qfJuP5LHUEqmFbED5vbL6+2e4Adak=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RYWfl3YtQYoI0vVL8uOnmxa/fZU75STUgWZpYRsdCSWeDQIgzCPKLNwqObDrMBdwZ
	 K9f6He25I8EzXlfiBiogLk/F3Ov6RRAqjLvOtoTASYhL8hXEsScbGg6YobLlKb21gf
	 XDKQFZMfYlDbpNUngWq8JP+vyC6vmzsJPOb8hG00iRNJCHLFV8fkxkupv66GwKIKPZ
	 PpE3LQRYtVqqPkL8D5/qmHqod6G24WJHgRrfu3Zlbn/EOvhJTZE1KI60fwgKrlcZQG
	 onEkgIjM2c0a11NEUds1Oy28P3sCmQVXv2M1Lo5o4PvBxWk8v5EXSZcPJ/PAncPhVM
	 a6FAI2Ni3xjRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84BF840867;
	Tue, 10 Nov 2026 12:18:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B5FF8388
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 12:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9280560861
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 12:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NBl8wlH_4q-e for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 12:18:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B02946085C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B02946085C
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 12:18:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id B658FB005C3;
 Tue, 10 Nov 2026 13:18:14 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Tue, 10 Nov 2026 13:18:14 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Tue, 10 Nov 2026 13:18:14 +0100
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
In-Reply-To: <20261109205104.2140273-1-dinguyen@kernel.org>
References: <20261109205104.2140273-1-dinguyen@kernel.org>
User-Agent: Webmail Free/1.6.20
Message-ID: <04bc0fa2c5c6650db6a2971e809711de@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCHv2 1/2] configs/socfpga_agilex5_altera: new
 defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Dinh,

On 09/11/2026 21:51, Dinh Nguyen wrote:
> Build Linux, U-Boot, and TF-A for the Agilex 5 SoC Development Kit
> from the QPDS 26.1.1 GSRD sources.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>

Thanks for the update. I squashed this series, made minor changes
and applied to master. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/7c1fdc76b84a59f88a0b2b90c823bf7695f16b13

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
