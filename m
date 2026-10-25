Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25DB606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lEyG+mna
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2A6C6060C;
	Sun, 25 Oct 2026 20:39:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aVS0a2y52_ik; Sun, 25 Oct 2026 20:39:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D977960603
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792960792;
	b=RC3daV/l+QGKQJWgHADl0uZ7VsWOZQVkaLEHP/FKVRzySCWPL3fzeZLPqqq5MlNQLFE0
	 cjvihsQsNGsHMw5GmybngLsU6WnqEiU7s/gmXzUG/zSiNbanlOSNqmtuJKsFMjkeRKTtf
	 /3r7fTbOiXMvo1QUJLQqkOyiPA+pwZezD7sD7BJg0rnyD+dIN6oa7zBfnoJT38kHjWtTp
	 ZQtFvIyYhDOn+arl0rflP4ffE5mh6fgKTuLuUkYFIVhQTmW3Flx3+18RiNzB9J7scPZH7
	 MlvtdAgh0owJTu2EBA2EgcbqCoW3ungpe3rY5IliEeorOJeBJloV8/dh5BL3DPWNtGA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792960792;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+BNQAfPbfmNEIoJeJ46DLoGg6OdoqMc60XYYmr8tTpI=;
	b=M1Xux451hd5Imrtyy8g4vgSsolFfPRgLrlFVATb6olV0qYaVyCwLI3C26H7mWm+Jvv0S
	 tath55meRE8X+06kaIDbTFkBkTCaFJIbDFC9LWkA6YhUpR+iYVZgKf8EWt2WePWPgks6w
	 c8mjH+Srvf2R8tbbo5Hn7XgFDdHjWJULLb6DoPWhNpafFa5Ya1Gr7L94+oY1TmX2sk5Lp
	 wbjCs+oGZqAOuBg88hqoZzNOyy9SQu4PdGClkdNAw1ChjNWKXIqze3bo+bO+ox7wqqYf5
	 u+6LURm6sx8BGsYDLe/emkpGYLgAEoqFsdBYF+JSGh1iCA7uRCr+EP5TEA2Yzi6EsCQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792960791;
	bh=+BNQAfPbfmNEIoJeJ46DLoGg6OdoqMc60XYYmr8tTpI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lEyG+mna5Hhn5zX6MpnTo9fADyuPT7C+LWnuI5GXn0L68AGb7Hy8up4X72AsFrgbC
	 85EejFtuskIelHbi9v6EXuDJsJBl8GmyDdmw62EH71O9BmvFyOikmdgsmIvnwAMO2i
	 eqtAfsn+S1DGVVCgDFvA7pfjtHjSszrYxf4QRYMPNCjfUrPqGE68B7vd1in2jjbBQF
	 h6knWdoXB+jZU0MIOJc2CJiF8/B8EmFDBBm6bvMT14NzDvdhzHR1vljmrU4ZoeQ/74
	 Cm4mIdvm9JEnMv47Po0FIOlhOzvra/rzEqsvSNeh+F4Tl6bUf42qCAdFzdB2n9OPhz
	 N7nA0/+LGn4nA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D977960603;
	Sun, 25 Oct 2026 20:39:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C7A6356
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F275E60607
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:39:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VzCNw-Mvh26o for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:39:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0BAC160603
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792960790;
 b=bmq5H1nvLhZjOWZTT7YapY5t2UBEGSL6q+allnPQlQbck2kw9ciP0FBTuC91i9R0AhwH
 ZCzEQYEy111eXBk3mojiya75iC17uVjc+AFUkt9UzmFGye70nsmmKss8ZjtYs5YUntS+u
 Nw5WbwqJ2bWh+ec/SgNFXHzEqifmC0wl9+fwwG0dTa4eX96B/hdAqjLhAgBp3u5iJLC+S
 BMC69DZxhaQLaF+Mf44iVFI3GKEe6RORGre5SQVkvVkqkac1bHkqF2ZM81aQe0+PyiaTY
 uzTeuLhyP6gvnlA9TOtOKGxe5WadILQxxheyQ46oqp2YEk3QSWueMCDeANEsEqvdWxw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792960790;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Tbi8XLb168doc+TLxP+Vi1+RmeSy2XRo0SZ+j9U215I=;
 b=glDthVUc4Q2P+f54iKf5JhXxaxMm0wYODM3vxRlkHsftGKBDI39ryw9xFOMDH/mgVQHS
 Y8jZx3+9Wl78awGM769CGsohLv+VH15fIO6HiMOCYIzpNQsW96qyN6x/v/2xXN/NRc98E
 Fxkjftd3cAcwnkrn9uRpxW0hjcNUHBNBZmkE6FflKFrlie/NfkTV8TTbDELenRPAcWX+2
 GZu1M96/NGrfN7KAMnpb0iqJUwfEEU0VQl4LCegHAkoeQsaiP7PewMOF/rAbr818le5tY
 /RNJQjliF6pYN1pVN/VyhSvTPwfu2Lu/8iY4Wqs1b4A53kZvlObj/gBToOTjN788DhQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=AJQLTH91; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0BAC160603
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:39:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 5AFE2C51478
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:40:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 90CEC60740;
 Sun, 25 Oct 2026 20:39:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C344B10329035; Sun, 25 Oct 2026 21:39:46 +0100 (CET)
Date: Sun, 25 Oct 2026 21:39:46 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <at5pDditikYoaJEU@windsurf>
References: <20261025194952.3534770-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261025194952.3534770-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/tpm2-tools: Fix build with
 OpenSSL 4.1
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
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 25, 2026 at 08:49:52PM +0100, Bernd Kuhls wrote:
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
