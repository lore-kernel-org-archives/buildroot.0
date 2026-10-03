Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3035ECA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 14:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED83E60F3E;
	Sat,  3 Oct 2026 14:08:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XB4treHn_znJ; Sat,  3 Oct 2026 14:08:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1CC8460F40
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791036514;
	b=d1+5Qaa+QXzhJP+6qg/DooNQqAWibNh6sxToXBFYQzitjGKgFc1n0Ne0tToK2f33bQwD
	 IkLf/YZOSqWUbhDNLJwf1Tqg4FIV1sZ7U0M/Ona64LLcecHC/mcLojdQvKa27J6Xtxe6R
	 aBAMhdUk79Xe3BoWa51fBYuQc0IEuBRXHkgXfG48pcgdtgQOCBRVXY/t43g0uTNCCjztg
	 EJZxjMR9KW21jvbuUnfJHRuER2yBpQzXnIwS5QB+UnRG+oN4l/qT0mz4bWcOpfddlX3y3
	 iIQg7IaX7f+R62mMwlpLsysuXs8Z6mxn4VASVNtGsuIUpAZmAEAZ7hjGsftGfVzi0hQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791036514;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=/YgirESbmraKaLJ9f118fP65IlZjQDk8N0m8ZsRhIas=;
	b=sNvQcyw45UzzFxfvlkwrkIixphynvAscUyg1UeR2m8Iyx7KkrH1rEy7g18AOShPdDYw+
	 5t0i7nu56Lj6JY8tuWSonTp1UmMX/eanaTWeqeGtxzgDMIFWkJQcIxCl6+Mce9hZ5g9n3
	 /X1LVQkSNSxC0fnumChD+fefnZ4kt8tWefYCgQxYHpbPdtBDSLN5LzxyjN9C/R6B2PkMi
	 9zvxvIVnTl8nUXpcgLdEVEm1maQNDTtHjFAaUsN4wUIA+ZbU+rD9/1exEW2AbG0qUA5lH
	 ownbUdSs7MwmWi+L6z54zVyGgjncWvPAEovDn8FeIcVhX2TJpSwrahYScYEepU8+RDg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791036514;
	bh=/YgirESbmraKaLJ9f118fP65IlZjQDk8N0m8ZsRhIas=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=savGaIk068v1gA5kFWJgi8aPH/4vA+3qB3y+pCpzQy8PnKYdKhMCr5/cWfWreo8Rz
	 Xlh7ko11ujRZdrtYCOxFbaUuO4v6YmsNHIpbrmKQlLj7IMxvdBSoAPRogA8VdMKy4r
	 6w47YUHdMppVqwYUCvA83BIrOI46L2N+IFvgmgo0MeFWf9+6F/GpZxeFZzK1qhKwKF
	 hKSHaOWg4OlDeSID6GH1QVCM9DjB/r2boppWFq+4TJvVJrRbT0E7xPTwqrif0fG3Hw
	 0THG/I+Myp2rLixSewne3ioskjFacTPaDPkks3M2/MhlEfFzKTiGZ+myNkyemThSgI
	 w2TybuvqyNaOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CC8460F40;
	Sat,  3 Oct 2026 14:08:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 287AA282
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E4D460F3E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nID7-HDrJXEW for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 14:08:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9803460F30
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791036506;
 b=juXlE3u+U2Nl34Fs1Rg+QfOlZxeEHksF1lvP/Eb82+3Dm/1/e+x+nuRTPSVW6gjTZ+hM
 4Pr5y+xIKN4FfHizxOpmREYDQ2w9ovhZnSu2c+q8AyVlFoc0ReNkfiwq4Zckrks18djSc
 zfzORuG3vxUujfdajDlhkYyZKISakxe2pUs9mmWvJagCDTmDiLoTAzTlQDymdQf2+VVTC
 IuoVsWZxYQNYKvc4RLcWN4x450HB7dWZ6RW84rWINUe0NmslQ7nIvyj5A67Z6bn0RKKdt
 wagzxhOSd45+KeTJ9gSsGfaeOYf5S1fZY6Qf+KusDbxClx+AisGAY7XBZtQGAlHZCNw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791036506;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=vakobjOkpqQgPOwPW0HWFWC+HUy4tSIeU+qIhNkDn4Q=;
 b=DzOZV+vpbY2zAAhdYFh7saGlhUzJjDXUi8LSWy023Kcxl4shu13NxhTsh9/RufA3FSkA
 3eCnbB04hGaUag1eK5by0PmfCM4HM5GHd89e5g8VP635lxVINhJtJMdAgGGb6XHQSdsXW
 eXg8PAbT80AD2GJ0UaWFuAP595vmR0A7olrqCg//4tTk+6k9OlHc3xabytrfq86CSy9he
 /VZhiRCABiw6ZlXv83HfaWxosgNUzt+KOXBrO+YmWPMWuuW4qUPsxpF4Ou7EPemjsbnXN
 KOb7lnwjK4OePKBTMU1H/4dpEDC7qmGczbRnzFMUyTcULSYTLPU/aIsRs3AeWMsXVNA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=r0R53wyE; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9803460F30
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:08:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 1AFA81A10CF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:08:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CE767604FF;
 Sat,  3 Oct 2026 14:08:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7E39F1032827F; 
 Sat,  3 Oct 2026 16:08:21 +0200 (CEST)
Date: Sat, 3 Oct 2026 16:08:20 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
Message-ID: <asEMUB4BqG88jhzz@windsurf>
References: <20261003071237.1471628-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003071237.1471628-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/{glibc,
 localedef}: security bump version to 2.44-57-g34106fee6
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

On Sat, Oct 03, 2026 at 09:12:37AM +0200, Bernd Kuhls wrote:
> Fixes CVE-2026-97399:
> https://gitlab.com/gnutools/glibc/-/commit/34106fee698c83eb0af71d4d0381e66b399be746
> 
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
