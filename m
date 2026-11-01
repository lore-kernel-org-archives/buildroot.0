Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70702606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 22:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EdPJt/M+
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CBB360623;
	Sun,  1 Nov 2026 22:33:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8d4pla1_JCLb; Sun,  1 Nov 2026 22:33:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5250360616
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793572386;
	b=Sk87ruOVYFdZ4augCbsTNS705xggOUq+MTLWy+K/Z9RCd1qTdV8ozakSV9opfpj/L0Tr
	 MJnFSBwD+PhDYl1w4dIh0QL4pE25mn36D5rLYvmZaQEurN38bdnb9SkMuJSRkggrzLMpc
	 iaET7Cat8TfGT68SM4IN6ZWZg1W6ZTiOJa2Eb/F9634CWKiOlGrH2FI9Fq+tSc2KXn/wG
	 cP4cczFbj7d9vIJhSgCVpe2VgSG4SR/ZUiDGJHiE1p9B79+a8Pqr8UBPSOQuHgvEm3nir
	 A4mt576+n0TS6p6unxXD5OetgoaHUZtbvh0VOpHXdndzPkyIkwmnWbHMmaECt6wYhfw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793572386;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=4vxSYqhJ01EYJtzGen85Ks+jfkqKT3PiW1WbFAaarNs=;
	b=Kg2RdoWvDctI51I7aYAHBi040YvOIcdQe2cJIs/FP7YEhiw6OhZn/RNMgoQ8mN/ErHmK
	 7EO4S5UeBqnXcGfl631APQX6NOQ3U7eQDuSr+onv6WaH420us/KRCCn156VZfPS0EHxCq
	 Rdrwb3VLDWuHgwcakptxsY1WE+LtqYNKcppAknPCYfsi+VLZU/ag77Vep1fwWJUZSx8vw
	 ZeUwNJ5cLPOXIb/5VX4uoRtYGm+5xf3MzkfFI8ITX2idw2UjTKOHbIubZ/N3IDBNKK9Qx
	 SvFheZjqPRrFSOp7MuGYAFuJJz8wo14MM1c64Aa6oYxehkgbWqPZZ5yA5Nn80M+KEYw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793572386;
	bh=4vxSYqhJ01EYJtzGen85Ks+jfkqKT3PiW1WbFAaarNs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EdPJt/M+Qy/YMKmeOpbV4dJHU3RTZuH1cuv5xfqe/MUGgwprcMNI/lIF+HzvK1vnk
	 OiofOJv0XCh7rmQTwEPeVe/F1AP7yB//1GFa3B7NDzNntafoRkagsNoMAtVZZd35j/
	 A1wMnCs4tTGblRh19BQGfbRe6rsXJq0beqnHFN4x+ssuofr8dbkz2qpRhNudY/fLe6
	 0Lo7sO1zPbJDzLGKZKLIJc0tpjjCCg3YJoU48rYc7OjFT682ac6NOs0m749nGoDGmH
	 KYSqRfj97+Ne9MpyYyXPEaguTPQzoIkvDymK6EZfBlNMccI7HFydCROqEVu2dMmuxb
	 4QQadx6G4v5Jw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5250360616;
	Sun,  1 Nov 2026 22:33:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E1A4A435
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C741860616
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:33:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MaWhHGVW7x6h for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 22:33:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2FB9560612
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793572383;
 b=KSl3dCElqxOwQSGlp02lrev8VNepW43Q6wvg/2Xm2oIAR2nM9fbXKMNW23sH6G/FvpV0
 MJVxf+DRRJGQRdmAi2znr+L2iHi4LjP6rtzL2IYM1jhcp8uiXeGAub2ow392JCECbSTrH
 rRhEwQ/9Wd1NBeQIC4nNsj95t5cR3O6luA7/XBKF4qCJFi8ncK2w1/G4t+UPf9RKxu+2Q
 I9wRqt/Ca5S+wJLjxwLylstCo5x9vGF840REsltM2X/CVmPZIGiafS/tVfU6RySlGGZC/
 dKQuIf6VuDbf/61v287ragtFQHtjqAMVZbiy+uT2qdQRmc5kXvh9ND+PoKLTFj5P3Mg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793572383;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=SC6zcVBASw/R6Fsq2CWSx7qDo3xmPKkj+nLhtDHCNPQ=;
 b=a16ZmLoigBSHf2gL0LTCDuljwRr6H2iaG6aX/FxfHaaQRpK1wM0DNGL3FqZhHwefvNt8
 BaTpVyQqoWsccWxcK2/XUQMbcgVHso6SlMqMS8lNk7c2ThgsGFCQ0rlulJAc1Fv34U3I2
 pF5QaxoN25ToZKWjBuyR2nlqcW+t9aRBpoR6JYeP4t642lGr/AJCM/7U2Gr1SblKJjUwK
 QKyJr20EKDta+sOuBHhd8Dkd6W8QJOmD/C7fIXkOsITUPMT8pGdbdsZcF6x9FjAYwWrPS
 2WD183EQTSc8VAbL1hr9W9YqDv5t7iCtC1SajL6jq7DAoiySBEADiwYC/l/IzI5n8Pw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=VmTVscS+; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2FB9560612
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:33:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 487B5C49F79
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:34:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5726860750;
 Sun,  1 Nov 2026 22:32:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7AFCB1032855F; Sun,  1 Nov 2026 23:32:58 +0100 (CET)
Date: Sun, 1 Nov 2026 23:32:57 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <aue91nxT0wYa99RD@windsurf>
References: <20261030102647.927989-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261030102647.927989-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/open62541: bump to version 1.5.10
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
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 11:26:47AM +0100, Yegor Yefremov via buildroot wrote:
> Release notes:
> https://github.com/open62541/open62541/releases/tag/v1.4.0
> https://github.com/open62541/open62541/releases/tag/v1.5.0
> https://github.com/open62541/open62541/releases/tag/v1.5.10
> 
> The UA_ENABLE_PUBSUB_DELTAFRAMES, UA_ENABLE_PUBSUB_INFORMATIONMODEL_METHODS
> and UA_ENABLE_PUBSUB_ETH_UADP CMake options were removed in 1.4.0: the
> information model methods are now always built with the PubSub
> information model, and Ethernet support is part of the POSIX event loop
> on Linux. Drop the corresponding Buildroot options and add legacy
> entries for them.

Actually in this case, Config.in.legacy entries are not needed, since
the features in question are now always compiled in. So anyone who had
those options enabled will continue to have those features in.

Applied to master with this change. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
