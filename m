Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928A1CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 17:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E4C740B6E;
	Sat,  3 Oct 2026 17:51:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nyAHA74Z3b2n; Sat,  3 Oct 2026 17:51:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 89CB940AF9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791049863;
	b=W/tIgeZzHxVunhgeVWGEH1qBWEU8QBONgn61ACqRGipu6HaQbwtwiX7FzvD3takpGrnl
	 AtNDbsKLAk4FuVLZwOH+kaSDGFMVpBzEDe+YuhzLNjsmlqJ2nOi/hsYUXEUTjT7xgecNj
	 Gum2Y4HATzZgRC1zTaPLsBiydv4ImqOMcKDMnmVgbPVGZ6lNReG8J+fS0XLcLd5HFPXxt
	 LSoZubwWmmmC5AFfcpVQUAvsHScwm8ae8nvXw138ww8Zr9pe06pp8LPLw6lLuP1X13UpD
	 vc7zTWAxI/uIKKk1Ngh/NfsHV7sz7PArRLFSvrD6Cmcwl3OiTl08LidMSFf4dgzjYJw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791049863;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=NOWCNzQKtb/qtuwy5lt1r+yt+yYqG0wE/En7NJQQzMU=;
	b=qU0gbe+rtFubiwd/9x7ZQ8AYw4WALKhLeoSCQ5b13hRQIsTtjvvC3Yn3y/eDBqykobNq
	 WqTTcgannGnBwesxK818JcL1PQff+vxAcI8PW4k7SYcM6frIogKYtcDORV1+ot1Xg5iy2
	 gfs9bWL14hL/JTQTr8oE7gD3/jfenTXneWCGBv45/jezSXjlYeqIouU7CV5a8mP78lf3u
	 VR5w6fBXDUIk+6SyQCxDucACRC5UgpFkEfRO5EW/lV6YBq2vCapNmwab2DdUZNRbpm3zR
	 pUIP06lO+vVk9T41Op3+6QYNoYk20kGv9WWtYcGrG2DvqotdyTskgxtA0TgktVYod3w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791049863;
	bh=NOWCNzQKtb/qtuwy5lt1r+yt+yYqG0wE/En7NJQQzMU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=tHXHP+eJd/a5ip09kQmTKXShYOLLHpLTwi9iKfTHec5l5ET4H58FjfQpT80e56xoy
	 XgMuyy6AnOQ/bKNOufWUopJhFiEQqCsjLAYLvbbznVtxd6FvAvIe/xh3o8PgRRod24
	 pF1BLz4pELz77OvIAlnIllg4dsnjclHHhFh3VVKT6kLQByVdFnmU96C6Kfb5xvBGVB
	 1QwHOwW73Zqvc8EukqymZbMA64Uu85sboxX/YOherDeyoWVFEQYu1p5lsSBvF4GJbu
	 u6p/eigL8LCvNHN56yF6WhgyXsAJunEC+LrDmtR1mCYqnaCyzvq1V+GaL0iJbCoo4T
	 h1HmPz2Mk8Y+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89CB940AF9;
	Sat,  3 Oct 2026 17:51:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D518C2E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2A3D814B1
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:51:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jEkfgaapp4hU for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 17:51:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 77D1B81377
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791049861;
 b=JUb+z9DXVVDt1UPG3b7hHepb5P2rhQPOO95F5q1LCbxLt/ZsMQVzTirfPrnfjBJflmOo
 8htkID19kKE4r+6YW/zr+ECRSJRJwFXsoo/g23Rdxbj0kre3RBf9dO90+Uw3fDdB6d7vp
 Dc+H1vrwdmaMNgW2b/FS7ZPD6KgB+TpWDlCopriqb623Wi2xgDxpvgDwrUr+opaq3oGde
 sR3/Jka0CtYN9aYKGR8EjLa5YPjS69j1WsoKuroptlo+P9GOFR+co0bNkpuQ7SxLBir0G
 ewNPTgTWBZuOwbNSq/pnSMUIk0+zhXZnB9igOdHyGwekYsSHwnJnvqkeflBGX2+yv9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791049861;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=V6++6rL7R/ECdlGIMyjkfIYQIr5lksPBdGhbFdhAe8o=;
 b=FpDISoWcmI3jj4mniOg7eRV/e7qRSiyWtD4m9qpLG4vHYWyWY46NkwHbO3TW6wQfqdQm
 k+SJYBJZXSEMBGBDbSFSampwfaM72NJxDHKd5s3BVpIlHllGZRbErhKSKJpstQseTIbQe
 u508shILjt+ko4pyNZ4KKGSqNWtej9A9bz3ag70KXIoWTdplE54qExzAPCcY+vbDOGUXY
 FSJITVA/PAzjv/UDClK6lkdq0Hk5ldti3YQAeZBtGjzgeLmsBss78QhvfY29nMDoE4u9W
 QsMvaWMHjxCsM00Dck6UQ9t4PK4caR5cOm7ukPtth7Rg69DgfKywhsxfUyStL622w8Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=JHPm5aPY; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77D1B81377
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:51:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B8D061A1108;
 Sat,  3 Oct 2026 17:50:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8616D604FF;
 Sat,  3 Oct 2026 17:50:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A57FA10328170; 
 Sat,  3 Oct 2026 19:50:56 +0200 (CEST)
Date: Sat, 3 Oct 2026 19:50:55 +0200
To: =?utf-8?B?QmrDuHJu?= Damstedt Rasmussen <contact@bearware.dk>
Cc: buildroot@buildroot.org, Tudor Holton <buildroot@tudorholton.com>
Message-ID: <asFAfC_1z5daFTsk@windsurf>
References: <20261003173657.1235590-1-contact@bearware.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003173657.1235590-1-contact@bearware.dk>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/setserial: CPE ID for setserial
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Oct 03, 2026 at 07:36:56PM +0200, Bj=F8rn Damstedt Rasmussen wrote:
> This is a valid CPE ID:
> https://nvd.nist.gov/products/cpe/search/results?keyword=3Dcpe:2.3:a:sets=
erial_project:setserial:2.17:*
> =

> Signed-off-by: Bj=F8rn Damstedt Rasmussen <contact@bearware.dk>

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
