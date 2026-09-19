Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3298C982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4714B80FB2;
	Sat, 19 Sep 2026 16:23:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cfmBW1O29L5w; Sat, 19 Sep 2026 16:23:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1072280F97
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789835022;
	b=Oqsx88/ng3Vq4ww9MgTa3HXxorbXYnQ9oxh01pmbG7ofLjLAEaHpO7JbIqCRygK/hBw9
	 HgLUNYk/sRZnBcl/0x6DnSBMGa5WHVaRFRuKHlwR4b2OdMfMu7bTcyl5wcifIolW4wMDd
	 H7+FxXIlk265JBO1IkeeOoWvRKOVarvQyaIe5DmKF4VL4GTjytznltfMQhvsbqIXRWEta
	 YIZkDDX4SGfsCMkCdfSXMeoBl5Cp2/QjIr8Kt8apzyY2iTZuhXTeCkd2Tc9u1NiNtIYXZ
	 1xCGc70EgLudV7Jj7azu5E7rCtDod8Enpote+Go5qdN0jlgqr/Frn42AEhTt7w2aeTg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789835022;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ycjkfvi69DaqoOJkQATp0CwhvUUn/BM04zTJwwnznPo=;
	b=jJM1BnVBt++vebxRknG5Iedgvq4d8VYvu6AsBQcNAX7OYf0ktvRq0H5DlHYvsRkngH4B
	 Nz9hsWPxjAJjG2xTkmSjmJ9tL7pexoTaGWGBCEpS14Y5kOdkN/Gv/Eqsa14wjaM/OKYdH
	 EFvVn8W1q0dtcv6lgh+XqM0ao3K0SO6E2bCj5BDlyb9D14gXYPpZD32erfTAwmUQX1AJF
	 CckhNdk1JuKevEtN97n0eP0Pf5G3+bEHsLahqH1BEa5kdpAN0S/rjdTmVSkNofY6VPKZc
	 NLU4auF8I8Cm2F09NNb91MvSXT+qXFt+dPKsmd6uRkyeTkIXT+AAHNbUs4LMwUPAsmA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789835022;
	bh=ycjkfvi69DaqoOJkQATp0CwhvUUn/BM04zTJwwnznPo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sdZ97vSOAN2j0Aun2eqj0BeoOZM6jyaVm+J46EQsOGBTG7mlalpMhypvcrjSeriuB
	 ZUW63EsliYPb7fHUyML7zJ3pqBN/62BekKklmg3s1/miJhTpkIS/IFK/yoJn285Jzf
	 Y4lOgZtejAIEx8IAuR7gbXyLWz1SbVceymkxmhrH/LUeh5D7aPMr0p19QRD0/vUrF1
	 vBWCPhNfRK9JPaD1cjmrDooFoD3+UCKOc0/GH3Sqlko4UvSv/zQ2M98ipC1PoLVZES
	 +tScVfGqNXCqvAKGtM/CNnRZvNSkAyJo9H642epofwmEBMsaJ757XfZqUfHEJKtlJ6
	 q3+fLbpkay3Qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1072280F97;
	Sat, 19 Sep 2026 16:23:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A7F89333
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E56D606FA
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xfaWdMT6h610 for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:23:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2F281606EE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789835018;
 b=GHE6gaciZKXVg6PMSfC58lXHYK3CiL9Rz3HHWJBRJ78vs19HdRTCtgEBhcvZHmTnkpKu
 2VU1jIZRa0fuArawLq3fo8wQy8ecq9oNMZQ2H4LiMNFffETONgMSrucM28MInGHDeG5qK
 g41RIEpU/pE+nv/sv7j9V98Ghe9w8qjHpFeGw/E+xwSFfXsH/Qaz00oNVyrCkhfJAyVkh
 KWp5Z3B7x1kXxcP0G/jiBk41BpVCKfx5fofBQP3e+zi9hRgUlLhx2/MQcTdFHACoVJKLW
 RlruSQANpA+fgOCJ/xSJHrH79yqCBc98hwic5vCWbYtNzFVY11aK9oFYTWskZZdzbiw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789835018;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=5RBt5fibOafSoR3M2W54XGxEmJlZs4OFnfywEPbpW4Q=;
 b=fTGX/Yg8/FySNrwWiyFTM30XYdq6AHwj4u8KeDhMawRHW6EKdHX77QJtPqRWpkUfGg4x
 rK0y601jqHkZnoqjuS8wJ5s4T77Fd7MMXE8JksiuocSR1kaWszF+/ztxLHFv3LiH2Zdsa
 tbyxqimx2RDGb8W16CtlhL8Y8eBBBMTyR8AGP4D8+DSWbXF6Nr/LyZWg1+rORZ4kWgCd3
 lZw4bek8cCF7+L+tlSPvfhqn9XKBWvw5e3Lkwxd5oIGNFta967JEelYnj2upO6pNa0hmF
 Gy8+5F1nU2tO4EJLsz+/ZMyPKcRzhhkQZlVMvi691md4aIO71BWFGjObT7ltPdAgXiA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=VxMYCYwn; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F281606EE
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:23:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 42D524E408CB
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:23:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 11F83606CA;
 Sat, 19 Sep 2026 16:23:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3D95D10328C08; 
 Sat, 19 Sep 2026 18:23:29 +0200 (CEST)
Date: Sat, 19 Sep 2026 18:23:24 +0200
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <aq62x3ovAUoc_Lmn@windsurf>
References: <20260830181907.106154-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260830181907.106154-1-alexander.sverdlin@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] boot/syslinux: Bump to 6.04-pre2
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

On Sun, Aug 30, 2026 at 08:19:01PM +0200, Alexander Sverdlin wrote:
> And change the source URL to use new upstream GIT repo:
> http://repo.or.cz/syslinux.git
> The revision to build comes from Archlinux syslinux package.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

Thanks for your patch. You received some feedback from Andreas. Could
you take it into account a send a new iteration?

Another request: could you improve your commit log to provide for each
patch a status: why is it removed, or why is it kept but changed, etc.

Thanks a lot!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
