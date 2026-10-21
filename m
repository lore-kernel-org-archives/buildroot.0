Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EB6606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 19:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FGb+U+zJ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C4DA4108A;
	Wed, 21 Oct 2026 19:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X1b4mNPZ2I2p; Wed, 21 Oct 2026 19:12:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D50D341003
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792609961;
	b=mTLGkaD/mc7nWVysWNZQl6AvNMeTqyKklIu+uYlIcRpVjCbdZ9xk+/5OZj6eoLpmr7Z/
	 0aSYtlcWzBlImrR8S8cLvpEwaWqT8s6av1RvNJjZm1/sBiVd4ZrlYdRnQnLm0Jr+4pLdX
	 EtMort/i5pQMdFsO/zVcLNAkWSg2G2Gf6gpG7ej+JFNf8Um2jaUzp+7x23dp0KIOEfnwp
	 47Zz3vANzHrhLHQGie/6yJ1ywx68SAKEHwkKACOM5PPZYEJeo+l4DHNrgimymVVZhJG0g
	 C33VoLT4JMtu2JumyIrbAho5nHuor0mTD3eMDyoEemiS5APXfdo2MVNQXuN6sIzah1g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792609961;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=/ZbdBZirfTaN5Y20KcKjyKUAry56r4Gjskfq26E/omk=;
	b=OxUdCgviYfVmaxH3/Imb69cvW80vH1tO1g5lV560NEq3mA90aL2xlI6tEdOGs/yFYG9H
	 bDymM2GODopm5C7YVu+/fTfLsqHCjLoA1oCbOdjnP5IGFYD0q778TLITOUVwOEYbnzh4n
	 udZD7h79E1oPi/NMASM7DYS7dOMjJLKU3yTAu/Bt03H95GyHrYvestJVe1EZKI9W6u/tB
	 quTTKCBEwIdLh6pgwi3k62c58Z1bsAG3iRcMWjvVcuW7huCTLhUV8Z61lEuUMOLF5mJs1
	 qy1MpXInNiVO26ouEqP5+IeJd0hwmxUvHd76wHLkv94QRSAjCf/g7TRqp6rLwlSKdBQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792609960;
	bh=/ZbdBZirfTaN5Y20KcKjyKUAry56r4Gjskfq26E/omk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FGb+U+zJ/T0yLYhrZ7uTB/v70O3DCgpWM6ipemnrqmCx6549ZiaYOD/j78jwaKRPB
	 ncdwGrLPtHDltCdOnKVrvc6ppagsm+wWQY4CKzEiCVacHTPESLMEQaUff+JjKINjeQ
	 WAfTcfPDH86JGG5VxfeQELjpprFviGq1CTSi+NZIu2VD0BqZy/83mLehGn6HnsWZYt
	 091pfT6pPoI/YyfTzcXIm2yq9An/Ym9i42yijuA4+Sf/6oED8/IojYp5bQwNena1ze
	 HOHxbevXQV5wQ1v1Q+cra2Rm/lmC8RbAmuBX6uvCBXPzMC+Y3BNH8VjIdli0VULtSW
	 GnSJataIKBgQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D50D341003;
	Wed, 21 Oct 2026 19:12:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 928D0235
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77D306137D
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:12:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iqbjBmvVyhdy for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 19:12:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D734F615B6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792609958;
 b=E49xzUYyfra0sKne5iGWGLFmNCDD53d7ghk2SEq2BwU04he0zAa/hBwUED4c/NrV4ggi
 /K9vf4zfIwzHPpvRgbsSLemnBjpYTqJSVznaIY1OWWRacQSk08V0QPs6u4vzoI2ILwEzT
 2V3gbAHIRaQvqyzkCy/K/JJd3X8bl18Wu58jNw64CwxzcNR4EZlOlv4hkzJgnO3xc34AX
 OS47glTpgjXMpUUaL7FJ0CHCTpRe1l5FFp1nORk5GNAbnDtwK5i/GDt8eK3GxZUwpnYeu
 j/pkxV1VHGKZ/e033teEe8sPJzoFY8HcwqaGDM6MaUeMbCsoib6GFP0G8pVq8PKqmlg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792609958;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=uCn8hH707NUA5l77dQKanj4qPii0AW2/K048TF0j/ZU=;
 b=hR8c1wPraRaePmyjnjhjil4JEjRoeZ0p8F7jFSPlrfguDH7ZDEH1geKeZM24j1A1zSaW
 2J0AXEr/peAY7SQHb27+famuF1ATXkapJZEH3rkx4m6YafQwAW0vHoYvfI+84RLgZAhXS
 J0QmGQNvhVQ/QkUaatdRnW5WNNwmsxWAgVa4ys9OHNXyQbj2Eoe59nojRMbO+7ZrhhZkI
 CdqtMaap3Or3a7WUxX1/AKgoDtO1aAGGHQty6aIAjyzEvJeO+cWi8UXcjb2d6shtqKArR
 J2nh6PMFH1wxyElCFfe5GU3KthjG1f8ai4KnV8WOuf2IyVYsq/ASl2vl0J7ysYAHhxw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=phCtLWBT; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D734F615B6
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:12:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id C6963C5CD6A;
 Wed, 21 Oct 2026 19:13:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B6098606E3;
 Wed, 21 Oct 2026 19:12:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C17E0103289F5; 
 Wed, 21 Oct 2026 21:12:29 +0200 (CEST)
Date: Wed, 21 Oct 2026 21:12:28 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <atkOmZwz8ORK30JG@windsurf>
References: <20261020223437.1675563-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261020223437.1675563-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v3 1/1] package/python-nats-py: new package
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

On Tue, Oct 20, 2026 at 04:34:37PM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

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
