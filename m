Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20B8606A31E
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 21:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ch07TEuf
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D982606BA;
	Mon, 23 Nov 2026 21:48:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6HtxziqDnmos; Mon, 23 Nov 2026 21:48:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B64D66079A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795470516;
	b=gdBS2rvfhtL3G9wKO01Iq/HedMBzrRk7Kw8m0SDb88tLRBtbrWcO3iEdqzdA33NCb/gX
	 +oRMim7TZlQ8waHZMThQQ6Bi+nEQlJ+JFOifLS05xXjOWtsBYI1Nn6lYod+bkZwxgsT5U
	 j+nI7m8VOQUehgzqtaRLiQtxoPUxppotJAzdu8bHCIaghNM46+vZZQgdkodtxzoSonD8l
	 NuS6VMjXmFxqx3d/FUm6rx/l4bxvQJ1lqNgBCdsjjqo0iZo8ehDu+FEij5BOrCfYbFN9a
	 wc76QS7OewY4Iai3o5oFzzhGfHei8ysa0QLLsuM7g1hQmLlgRGrPmzCNoxqiZJD5XNg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795470516;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=WILuBVfrhj9V96qFnsKPG64UZuR3OWV/tlt1oOowxHY=;
	b=sQ9J4tOsrhbA0T/VQgEpGg/lG8fQ7NxCzuqslZVrsUeuvxHVDj1CkRIp7WH9JVw7KfCn
	 meEyd0XwfO+QUQIYJTgX0yy1Of+Yt5oikyTIAH2OfDcyvEd5WUQVRetaQhK6okp0qI1tg
	 GxdekBJ/6XYDHussGKJ4c/HCqcIhTS3U3v/p4+U2I2cQX3F4BQDz05A2CV6v4cb5zSr9F
	 quWMFkbwbSnqg7XTLLvzes3kTfm61/d7D5iYnV25ZR3aibXibLACCpSXdaDHkdbwTKypg
	 Z+t66hNH2jtCTf/RCOpDXJ4/9Rm1HgCe3sHOyHZceCFqydt/lBCpRKEjoFHrtE5Cxig==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795470516;
	bh=WILuBVfrhj9V96qFnsKPG64UZuR3OWV/tlt1oOowxHY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ch07TEufS0xCRgXb5fR4+bsrWURV2DHOQjGisWzW2r/wRUmEZxtYqfnaWg5Xn3erU
	 ex1K6jIORdVURrq3Wg87ob4jChQ78ni8Ib2ZfJ3YLS4aK4lchcZRjGKkb4VfqcE0w2
	 qvcWSIPMzW54g6Y2iD2A5TmjFkerSLfn/Eh0Be40w8Ae0Bopbfz1WjPGvlyar64nMI
	 XY197cBkTfje1mhJh6ITME93i/Qq57T5hhXH8RwOzZjDp2Dmw8gzce3pbEew+9OEIy
	 VLYiYj2td56fsI4ph0d7po2DbvK93HXQlHTyctvc8cAQSOHcN3PL1b8lEOPOgFKp3M
	 ZxPQmqa+NWJbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B64D66079A;
	Mon, 23 Nov 2026 21:48:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D6AD7260
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEAB580D6E
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K-GWTCIBFFPh for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 21:48:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 081BA80C0D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 081BA80C0D
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:48:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E53DB1A17AC;
 Mon, 23 Nov 2026 21:48:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A3A9F60480;
 Mon, 23 Nov 2026 21:48:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8E92B11E6AAAA; Mon, 23 Nov 2026 22:48:15 +0100 (CET)
Date: Mon, 23 Nov 2026 22:48:14 +0100
To: Mattias =?utf-8?B?V2Fsc3Ryw7Zt?= <lazzer@gmail.com>
Cc: buildroot@buildroot.org, Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <awS0jznf9p5DxzpT@windsurf>
References: <20261120130015.344000-1-lazzer@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261120130015.344000-1-lazzer@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 0/2] package/hostapd: add WNM and MBO
 options
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 02:00:13PM +0100, Mattias Walstr=F6m wrote:

> Mattias Walstr=F6m (2):
>   package/hostapd: add IEEE 802.11v (WNM) support option
>   package/hostapd: add MBO (Wi-Fi Agile Multiband) support option

Thanks, both patches applied to our next branch!

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
