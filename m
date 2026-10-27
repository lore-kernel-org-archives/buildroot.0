Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BD3606A32C
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 12:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=C/6HmNHa
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6105A6075E;
	Tue, 27 Oct 2026 12:59:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JSquoErjVvL8; Tue, 27 Oct 2026 12:59:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 60771605EF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793105994;
	b=Zp6NnbCCFLzisBOoOWftFWNylC36zncjm0GlhuN2sJqvTl34ddKr5O1TsacvPkJUpBNv
	 xLq6PmZSxjYDefKGvG5g7xlMmoJRUSNA0/+Mz74xGuOvCUHWboo/iq/7FbgwsQcnfz5gF
	 eWF2YzFUz7/h/i+nh57KO1oBVrtd0YOPsB9juEcWcyzxP4F/zlBM6KXzoBwERo5L9Bc5r
	 +HcRSGSQ/BWLyQY3hI1F30HzVHabo/UW5LkovEYZO0RpTB0UD0fha+M22APCXj0Eyu1VN
	 ALARerULsOeGhQs0o9uUzPlA/noMw4oU5r2ikHu/3FI03doN5Yl91RUyLqexuh+sfhQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793105994;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=gQNdFeERot5ZNIwhG53fWGDyS/qLmkdHi0IjlMX/CD8=;
	b=ruxxmKmKBEYL9nZIxraY45oUSydjDeX2oAbx3uZBJegegq7JkVsukHtRGfPElhCir5EZ
	 Jwmj1diuqFFItIfIvJd5Wr+i9T7SGQLAi0IxWRooKyIgCCkG0RzapjqcG76uboCDtWuij
	 jI/t2iGy5xnhn02FjPBOVl1mcvDaqKSDgDYa7yLVl50VQd2LSCkkSvz0bookJ7su1d6rk
	 Z+YH7VFZ636mlGF/+m4dkNu2hRjz+LAPYh78qlZIRTRrjKt2NCxXaQ1vx06oBBY47ah/y
	 qlvdJ5gJupIZJeN/gudRUbhkMlOj8N/OMpJkK8iPCIvohzctQUSwm1XOYa/xDxIwV0g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793105994;
	bh=gQNdFeERot5ZNIwhG53fWGDyS/qLmkdHi0IjlMX/CD8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=C/6HmNHa+GyT6L87VMcwednQOe0emiIMUtJ7TFLX8Tgp4rwOb3IzShQ1SGxJVAG46
	 dqYDrTUkTC2D+s8JAA2E1HJamqTOWCaYlLw/ajmBYQJBRbeCiv4LVHRmO3x3suHKIj
	 GGRyDMthfBwBFkGV5CwwPpEHRClMKup4OJXuvYYXaMMp62ie5M7HQNsqW6XXasaxfw
	 qaq2NV0kW5PI0e1/aZXBBbpE13HK4f27tBQ63Ld+aR1sRMeGyt8rzAw4iucBBOncIF
	 dfDepi6XXnlygHqASTeDzaIVg4fyWNSS9B5KDNpu6w4NphhRUzh1mE+Ex+8oOT5C3r
	 zBAarP2Ko9FjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60771605EF;
	Tue, 27 Oct 2026 12:59:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C717A279
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 12:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACF94605EF
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 12:59:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sqFKNHPbj8S9 for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 12:59:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 474ED605D5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793105991;
 b=nKEUZlIdbc9kOCLOCxYKHqSg6AQCsWmr60jv3iBMFUc5lMcnrXVuaJNqb+0TKlERPP0O
 YaPbDpCQPPkk0qMHRhVYlQHlMGGnuoKy4UOeFTr1s6x33NOhQeAlYOsMoKNo9nsp3Rpe1
 sD0HTNrkYWb9uf5GTnRCKale8atmGvWeyRJCZYKEqVAq8zy+OwvDRSumJShys4Gm1QcnW
 UqMpePzq/xnPukGFCNSvLX+6ogeSWH9EG9NGAzME5jpxkwlrclu0K4bW7nE0r0FWd8SUH
 CMgMlc4NR84VQqJHs7P/8PY2TaeKssWB0MQ2Xqg0ZHHmAvFQynDmyxDDDf5ax8x9Eng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793105991;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=xS+whgazKwaqAUYE+6if8t2WiTDcTvh3nQ/PEeYo7h4=;
 b=a81pghSCwN1Izl973QEN0cNhDIiirrUDIKkdaxYN94MzlGFlIc9xQHoDG7Myn0PUFVOp
 K6v61+2Lqj9eeDRGRarvnkgxCNeFgyar3PY4tHCcP5vlz4YyXobJBIVYg1yUpTH3XUcnO
 d6Xp8kqzHQhqHBYHIZ66jVhAJgJJGde5QRifdhkJQkKvKcpOxc8xxo+aX+fICiaawl+3d
 Pf0AkNPqnbQdfp5kvXZ96YuNQGs1fcT6iGc5pW/2Aey5S9aybwWbMgYt+T4Ge02qnnyHA
 BaGQdc4vtuF9h5lXfgte8OuAPVQ8ZSU62b0NRzGM5vM5idiSbXH0QfiR2doFrzD8b7g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="U/G5E/eh"; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 474ED605D5
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 12:59:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 712824E4133B;
 Tue, 27 Oct 2026 12:59:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 31E02603BD;
 Tue, 27 Oct 2026 12:59:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DCF3810328FB2; Tue, 27 Oct 2026 13:59:41 +0100 (CET)
Date: Tue, 27 Oct 2026 13:59:41 +0100
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <auCgGxiJaYUrMKSA@windsurf>
References: <20261027101235.2876416-1-titouan.christophe@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261027101235.2876416-1-titouan.christophe@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/mender-update-modules: fix
 LICENSE hash
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

On Tue, Oct 27, 2026 at 11:12:35AM +0100, Titouan Christophe via buildroot wrote:
> The SHA256 sum of the LICENSE file was incorrect, leading to a failure
> when running `make mender-update-modules-legal-info`. This seems to be
> the case since the introduction of mender-update-modules in Buildroot:
> the license file hasn't been updated upstream for more than 7y [1], and
> the buildroot package was introduced in May 2025 as Buildroot commit
> a474642fdcd8 ("package/mender-update-modules: new package").

Crazy that this has been incorrect from the start!

> [1] https://github.com/mendersoftware/mender-update-modules/commits/master/LICENSE
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

I've added a Fixes: tag:

Fixes: a474642fdcd8 ("package/mender-update-modules: new package")

and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
