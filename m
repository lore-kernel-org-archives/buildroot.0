Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D43CA5FA9
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 21:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9E498085F;
	Mon, 28 Sep 2026 21:22:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I6vjHGlgkXl4; Mon, 28 Sep 2026 21:22:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 292CE80A75
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790630546;
	b=TR2PIeBBz/1jr9aximYKNLBQFuWhEcq6KyqW+VKQefWPaj3UPxuuYivRAZodBYaoRjaP
	 PbZgh4exj+Erqj6lyOqbbTdEYVgMgSbPrUha9yPboRbPzRTRfolnPFNfSUPSXeE3HkQcB
	 hfDDh8EmdiQNs0wlcKNHkT2L3DMEZRcSKrQOy3uPYMsUdeGjkikiDvndNeHG3ZS7VfL56
	 nsQAShGmtcTpXMgNlOsWVgoiROvx9E6vn7R3hS5NTCzpOkrOxsrxv67Tkm0jeVahxXNeS
	 yrBncSDYL6M8kzSBSr6Efk/f+EKo/VP6kmF7Fr8HEnEStxN+UBHromx25aWQDVcZUhg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790630546;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=f8Hd3guslEqQnim807uhM8Z4c8yl3PIZzq0BZcioVVs=;
	b=BwQ2b3vJxWne9OAB26xQ2KBiFWJ+ozPxFltKBbEPrWjnz7kmllB9CAaLjkkIC9TU2IXR
	 fPdm+l1Ltk3/2mVLDR9pfL7PozW2LfChrWqz60lVU/QChG1HHUr1pvg9EV/cD/pzND4jL
	 sF24mlxKV1JyzxAnN60KdlqpXHXIzUHCXRNsfZmMPiyvhJdpYZ0yOqpwJy0Py195Muat8
	 EVg8U2iy8k0ZE/tHADyb6qIWTK8QyBPHzkaizezOnV8Yk8Y2BqspjiuMqfsZkpnN1yW7H
	 d2SKOHWrpFrxOl/paORbe8eMilfbW0qY0Ypi01yKW4Y/nHCR4YlTn/xUz6bSZ+cc1IA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790630546;
	bh=f8Hd3guslEqQnim807uhM8Z4c8yl3PIZzq0BZcioVVs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mELqVwte2nt400Qc45lKrDhQQFE1nQmXE2LyPFelpKZXotZ8+KmF7fqDlq6udt46T
	 +j2bvPWfeLf/KbSfp7HTJ12smwdWU+m/oKxPlAqQDxoRufo6X52//Iel5PAJo3UgOo
	 jhMYjCSsbjL8KOP4LmHHtLL3Pd/Rr3QnmSUFleeNc8uQiO+vNEDiUXNR7qP/5EawaT
	 u17b6EN4If2/9rDmep616+Hg2yhG9d+b696a/hr1QMCTGNl0qBxM4/S5LCpE4gheZP
	 651Z2K3Lwteq9HJ5HKA/3aFfNJVkgK3FNzAQU70QeenTRZCIccO4jAqz/b6SpZUz4T
	 NHT2/PidprPxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 292CE80A75;
	Mon, 28 Sep 2026 21:22:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D645A3D8
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7CDB80A75
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7qyYlUjmDLZ1 for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 21:22:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C43F28085F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790630544;
 b=KdYaKQ0xfmjU+gGIMV8U+ZpX4v4y2YdHckWX5UAkCHRVXa7BqNcvLTA3TZDDQMdSLbW3
 oC64jcHswRQhneT3ts+vs7eLo2Tgo3wNUHXHyIyvlGcVaTKksJBuIJZKK/VNFC3wwb4Ld
 uiyyPCB6lWPeHQBusT7YumciejqjDQr8+F6bDRGdA/hFYMRRYq7kD+6owrAQ80l4Lpzgk
 BZ08iackZgZxc4VVu2110Lfawg8keFPtAJIlYCMZJgZ86lsKj6lSUzetk625/2pJ5CP+m
 ir+0yvtz+4fJM0npcq2wF4Zd4y1JsIiW1gQ5ANZN4hoYH2CmAKmpY0KFZYJBUdmmFSA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790630544;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=5cOyn6dvBl/4tg8j/K+Ul653po8+mT74tb5aQVh+HMo=;
 b=idqYVyFPHcvxH92PQHa+1dpaxhapTtXK5Qp/T7VZebl4tvMKWGSQAQYdj4pxaHr3tFbp
 rRzqUCcndw/WUAC9n+IVTyE5FZiCJ3IGMHt4Rt2XAncLuGRpkRr2vzT/HiMHT5a+xy/vm
 3W0bD4AKXdsOc9JOXMZRXrUr6ZJ14RRbFF+po0tAwTvn9O8NV4PdRv6OEbzzd/rlrtgnt
 bh0CpRKNafUbXNFFYW0fDFZ/uJBsm9KskBjET2S52oO4LHv6EMR835Qkg24Y0ez4ipZw1
 4770OntZ6S/8yi11M5mOkLBpXWDYPxT4vG7wIbFxXbMeCqu3sTc4Cz8prAoVIeQcW7Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=18zERBb9; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C43F28085F
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:22:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 5FCD71A103E;
 Mon, 28 Sep 2026 21:22:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 271F9601BD;
 Mon, 28 Sep 2026 21:22:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 46BAE1032951E; 
 Mon, 28 Sep 2026 23:22:15 +0200 (CEST)
Date: Mon, 28 Sep 2026 23:22:15 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
Message-ID: <arragPd2cNijYNDp@windsurf>
References: <20260928162009.3463944-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260928162009.3463944-1-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/atf: bump to version 0.26
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Sep 28, 2026 at 06:20:09PM +0200, Dario Binacchi wrote:
> Release notes:
> https://github.com/freebsd/atf/releases/tag/atf-0.26
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

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
