Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74BA606A31B
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 10:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iFLkMu9X
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9941440640;
	Mon, 26 Oct 2026 10:59:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lcesftCPTqbw; Mon, 26 Oct 2026 10:59:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6C72D405BD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793012371;
	b=bZiOrEEcC1wx5sFNPm2uKhdLDTU9Qu+kXtX0J87qzO8o+kPfVdLGtcs4JpxQWg5gbnSx
	 AbFYsl8mRH+sOGgq+nJ470Sln3YI9fzvlMOWxTV8ZoKimLI450KijboTW6AGBUWhItX4q
	 bHmtnHJpnUNmEEYUuNGQAOs2MCk2jJyCG7WYN/4QdVI2ZGItRJwvNDrzvRmPqO9S5uoUU
	 fSWJuKTLTsbBCkhXn7nbWPFdKpkSXXZBet6cIt4tIwwUbvbh6X65VxPb2WJYCcy74nibp
	 9dsrvv+9QY+LzzbLUJLkm+4MDbVHsYkUWqFfk4mf2sbVPqIaIBh+URlBif0UYd0Dzvg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793012371;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=KmBOcSUI650MRkxkq/VsQIFnJ3pg+MXWwsRDjoAA3Vk=;
	b=fWVPe9TFuZBSMd2WA0IyP5cBm1dSDQoukZugjOM/BQogJ43UHTlr8PT/dkYy/X22xpKu
	 fjKUoF+Tora9BGTjIv9qpo2zouJIL6jgMWNoHYYw8HZyW7ZpEQI6/xeGsK5QhBRQCfmlm
	 8TWoCfryjdWR0mpYPDxBhxNl/1xDKbu8B1HUBxf5JQb7UdNwUCOnSoIGhOQ4rvoYMRbMe
	 I486GCxDS3XH6rx2KvYtXTIf7vln02EkSSzMIpqQVg76EHYOFXMj/rXdW+S7ITUAhp/bg
	 5+PltM7ZwIj6IBXG0LMIZ2HzCijdHGsvGcZDX1R++vRJP8p/szoURRvNPU2eaUikTpg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793012371;
	bh=KmBOcSUI650MRkxkq/VsQIFnJ3pg+MXWwsRDjoAA3Vk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iFLkMu9XvJnGUXTn0kdNwnpBpWYNBAp8rgw3bUdDHoyO6FNU4l0dJXanUS9f2A0yD
	 Kzzh/OEySjwqaIRoINEyjczLuyH6auWoHFHydE2C30i5iYk8WmVukceK/LF8swsXGA
	 xL/Pd6Prib9Vsu1x1IlkLIAmx5lEPzWTqGd1GE2wdzOvth41Sx/G1ebM5SWRiv2D//
	 RrFnuCCHj7KkI7aCKrOJ4nZeemhwvf+Pwt7TWWq3u2WEslg7JCGEUixoqFgLNadgmA
	 g8928Pm9ESCYaAhtKg9y9r9y098bS4jQejLdbLiasv+wpyLgJ/Ajz17JIivRlelGJO
	 6QkLd0IKQiswg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C72D405BD;
	Mon, 26 Oct 2026 10:59:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A580F43
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 10:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9728F60619
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 10:59:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xJyNvc6WbQM8 for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 10:59:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 299C660607
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793012368;
 b=DMkYZFQ7f3VI9UztSNxg+jWPxKyTjDwruySAzYxwUWLvHG2qIaeI95QYlm9VkTY/BLpz
 bGWEVK4PY+XQKEntMrNb00Hvk7/xKbnVliiMqe7CO4l8KY5pEzU2H04sEq6EmQHSNsF62
 KzNxJr+rgM53gzpDXBg0EwRFZtZwkuUsvEIooTd/mWr73cV/uGlzeA3dCkMMPd7BN+qBR
 FEaWsxGy9f0Spoz3AcGf5JBiw3oRw976fwYso6YO2/wRMM4FlJ5P2VBptpx4jmEoaGWS3
 tE/4/DzQYa7XTP4xbuvYdp81kOI6ccU5yrC3XQP7m08uE3ny7w8+at+wDLAPfcacE2Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793012368;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=4mp0hdEWDNb7gIpDPG1PEdeEMU3sPhIxMMxQgEiUhL0=;
 b=R+gyin6bfWsXl4qn8gMNkcgCX+6Q73ncZwRzk9KzvCSX2DWh5rV7vtt/9GphXe+UgZno
 jgcrAK9H4uoP6rnyaZud4nGcnb1WLH3Y2+UOVyNBrR/RW9TxUzDE/NDldQgaAMJNrcob8
 SmLvsLxDhpcvwNjeXBASBDQsiYOff1XPfkmJFesJiGGJ7GdClqS9d+pOz/9Knb/H5cEJ1
 nWBZJuwF4q1O5HpySh5tdODJNJwGGuw8RxvXiqVlP2bs8qHbSvITjWPX28UrJ1QlJCyCH
 pNV6rOoTMk39bU4Ps7T+4UyKbx0FH2LLArhpiCEEx0538RuMhrZVSEOR2UQWbxR3p2Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ckLES1mb; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 299C660607
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 10:59:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E531B4E4131B;
 Mon, 26 Oct 2026 10:59:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BA1FD60740;
 Mon, 26 Oct 2026 10:59:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 190B110329035; Mon, 26 Oct 2026 11:59:21 +0100 (CET)
Date: Mon, 26 Oct 2026 11:59:21 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>, 
 Bernd Kuhls <bernd@kuhls.net>
Message-ID: <at8yg8Kr3FPGv-t3@windsurf>
References: <20261025212732.4111719-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261025212732.4111719-1-fiona.klute@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-charset-normalizer: skip
 dependency check
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 25, 2026 at 10:27:32PM +0100, Fiona Klute via buildroot wrote:
> Upstream has set an upper bound for the setuptools version [1],
> banning >=84.1, which had not even been released yet at the time
> (setuptools 84.1.0 was released 2026-10-19). Because of this the build
> fails since Buildroot commit 2027954db7f5f42ed976ea2f4655e0cd224c7ee7
> ("package/python-setuptools: bump to version 84.2.1"). Nonetheless the
> package actually builds fine with python-setuptools 84.2.1, so disable
> the dependency check.
> 
> [1] https://github.com/jawah/charset_normalizer/commit/a05917f87b5f71d6022d8abe2b0af239f65c1111
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

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
