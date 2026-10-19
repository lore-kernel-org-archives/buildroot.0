Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAAB606A31B
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 16:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bxxbcTeE
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C790606B1;
	Mon, 19 Oct 2026 16:59:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q1VGkC6gpSRw; Mon, 19 Oct 2026 16:59:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7036260613
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792429167;
	b=rwQhZiz4SwVYpxKhSgiKC2Hkt0GW8mIiUPacHxKBU+cOvO8238ExDKYwIdepnrY39/5z
	 n5gGJ4UAoBSrAKuo88KnHG3sxxhfpqfsQnktJcjUshaJoFSch96Q+8W0PwMF4bMhcP/IR
	 RLuYYjDyxldb0ZGczMZvacv4H5t3DeQmpAACkxqnnm9oyEeeVG3PDKsVrkgYEowlr2Nlt
	 8RinHGZoWQT+G7Hp6BDxb0DPg0+fotMzDooEQA5lVpx7vi2A/jmmwNM43aE1YT+xDlPnU
	 RH7arfv5ANZ9gLZurOSdc1bxsXr6sUp6Gn4SOeOw8unZhFtadREFC2e2troHtzkjpvw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792429167;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=nVwfEuSvScZj1Vs04Fh5SUUyQRrzBKDn1/lDkVZsI80=;
	b=qFKD0KaI6oZ1KvHX2CMSNLVcWVfEM4Zjb4NRqnQdgfRPU5UdN2/NaPMq9pHZIn7mEyus
	 yo6ZN+w7ppy065FEu4dgPdAiGfjXMAOBIMMZpxxn3ysBrbh4tTPSC06zmSLRTMViRFi1D
	 TVuoubm1P4FLiHLAudmG0l6C+BUyhYPQm0pmgQ6+TmA3aWeEG61QssVBzKnrc8FjRMUAQ
	 pf6lj9P/Larvq9k671UTExzn9jRtihHyVA4zgIQvYRkMd4BDulZq6d+yGHy64mUTqxPFW
	 I/pYbQiFmNE+ApA/pvlnrAZbqUjawjrLAF9QZfpKrEOFH2clMWGq/mkC1+gSpjPywAg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792429167;
	bh=nVwfEuSvScZj1Vs04Fh5SUUyQRrzBKDn1/lDkVZsI80=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bxxbcTeEjvAD422sBfXCUOIFfhw3UzyEwxnjzp+Dh/dFncAe46Ewmz+pVtBWcAqRh
	 s++vfS4hZ0DGJS6WUXBAz5eIr3n7crN9eLNmqB17ndGZ3slM6zoEu5pVino/yzGjl3
	 pfM5SxpEADnXoaL3htij2vfhXVrBd7fK+CYVuSVR9IOfOosv4qGBVgeJOq6FNu1B5H
	 Aill/dRsS5nj5Ld2FKeVY4inULDXrr8uDFDWW4eLXI8+0gDzXUld2B9A7X5Jo4kLyd
	 Kh6Gt+2fDv4y/9V4vgbvqNX1J/CNp/auoC6WbDo3Lv3yE8gr7WqFfRzgtORSNUSnn2
	 0e4gQ4qwi2A0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7036260613;
	Mon, 19 Oct 2026 16:59:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FCAA23A
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 16:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11BA84057E
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 16:59:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kw-M3FvfmO7Y for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 16:59:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8F55E4052A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792429164;
 b=tbZIKnGECZMM/vl7HWKMnSt4CelG0q3kFOGo2/XDKjyp0+3Wb1IqZPfmq3R5hvNtQAMd
 cnpGjniPcKgCA2M20a6+t6JPKgFyppUPyRgrjEOxiGlzZ7priVfof5c2J4BwXMFgadPe+
 7ZdWJ9Cqm1fsHg+AWfSJnfPcjDQqbU+kp2K6yT5ZIquxURyLAfAC6uZ+MTnB1fzwqizTF
 PM7Cbdz6ux3w5RFj23w/Xd9C1oBYFtST5KQcOKphShfRkiIRxBiTRvYmQ1I0hxxUdinUK
 IZpaSFHuftikodq7JvPgCse1hzBqlPfN7vO1uDnEkL2M/xJZXl7kDqrccpFbY9qdAcw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792429164;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=AGQ9ZT48ZqJ/m/YuWaBEkfJVWIxf7b0g5IyUyKJD8Fw=;
 b=YBD2Tc9/uKdEVc8fNvCFj4oJmai4f1wZI5Svbvn3DrI23P1p2DIFOrAHp6zhoDAud9g6
 5Z8tucXSSXLoI/8az6Ii71h51OXC+th3jYIq58a14BtTGBmnqigRCwWhv1ZiRJ5kAUFTp
 Zso2wWrRajYJ2Jmrwa07zCPYK7LLIRiggdXLAQASjSr2vV1+GATTq/8NFZuld3ofQZ2gs
 KrpefqiDFjosNQhwsHsR299DvETa1Qh3o+KZYHuvXghvYpc/V5uu807RxOn6xMrnqdRw7
 iICjLidUoxCtIHsFfD86cUt3Y0BwTq0meu8FV44Cy/y/UYo0AsTrXBKs5mkHu7i1suQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=pWkbbkpf; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F55E4052A
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 16:59:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 0FBC6C5CD5B
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:00:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DBD0F60582
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 16:59:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CE3ED10328CE7; 
 Mon, 19 Oct 2026 18:59:16 +0200 (CEST)
Date: Mon, 19 Oct 2026 18:59:16 +0200
To: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org
Message-ID: <atZMYErVxI-Ba7SN@windsurf>
References: <20261019-bump_openscap-v1-1-28ee6f7afa48@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261019-bump_openscap-v1-1-28ee6f7afa48@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/openscap: bump to version 1.4.5
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 05:21:05PM +0200, Alexis Lothor=E9 via buildroot wr=
ote:
> Changelog available at
> https://github.com/OpenSCAP/openscap/releases/tag/1.4.5
> =

> The two patches present in the package directory are now integrated in
> the new version, so drop them.
> =

> Signed-off-by: Alexis Lothor=E9 <alexis.lothore@bootlin.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
