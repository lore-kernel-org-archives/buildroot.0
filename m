Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FE2CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 22:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ECE185487;
	Sat, 30 May 2026 22:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TwCpEg_sThBZ; Sat, 30 May 2026 22:05:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E73784A12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780178756;
	bh=TiH1yNJ5qm5QDWhNLrHiMEpVKby+QahI+ZALhDPuIGU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qQGz3/wEqU4z8UbVOW6imgCGlp9wgesgn3neb3eIVNSu6PF9AUkgWtNgJE2eAQp/M
	 jkGKcTZvt/2FKrSKMo5hQg+fEa/VfhQCmZ0v7bpcvIzdcPIruudhb0/j8dj1i8kfwA
	 mJkD7asOUyYg1Ldea6ll/VGDMGQZgL1Z9bri7faXgw4G18f+QQxYVCGY5sA1ttr61I
	 ZhaCy9PPAH/flWQ+e+6rcljRgVwWUWyZboSJ13t1cDSG/J+impXamiBQvz/Q1mWpYX
	 qMIciwF91zHKGf4AMxpoMNkbVrGQdP7BF8fZolT3c8hkGmfDDeYG8vOd5qSNfLsYtV
	 3GRyAaVpnXK4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E73784A12;
	Sat, 30 May 2026 22:05:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B76E0D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8FD942FAC
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:05:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id abyfib18-uVH for <buildroot@buildroot.org>;
 Sat, 30 May 2026 22:05:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D2BF542FA4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2BF542FA4
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D2BF542FA4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:05:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 7FF3B1A3755
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:05:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 42E0B6073B;
 Sat, 30 May 2026 22:05:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6972010888CC7; 
 Sun, 31 May 2026 00:05:51 +0200 (CEST)
Date: Sun, 31 May 2026 00:05:50 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <ahte4jnN6VBRtafn@windsurf>
References: <20260502173806.2666814-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260502173806.2666814-1-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780178751; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=XJ+l0YyJSTHHBDVLUuM+yZrsBB00+nUZRlqp0LSCkVA=;
 b=m9gLt0UJ6WpCMyQbDzGqvIRbMtft/P6xv72377unz6k54EYoK9ZjfZflwpBVH9KmUHLDfW
 Xc5HSyVYNin7jCxlBy4OsT60LQgqqEeQqIHFAlrRq/3ZEIB0fEepzdQYvpwmUCrCNgal59
 iB37H7VBRK0Wzmfyi0gke0jzBu4sm7Hlc6aniHQBbIjJBiM8rOtosU3zWAiIuvNgjs8bbz
 kULXbvjCKPPVaqY25M2IecHkMx9b8RN+PYmsKnPxBbby2aL16D96eTHdgJ1S4/byUr3Lii
 133X7mu2ea/3pUf6Sz2IXc4Ixx7QCJB+TM1kIaZpQJ6F+exBFT841bTpmbGLTA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=m9gLt0UJ
Subject: Re: [Buildroot] [PATCH] package/ncurses: bump to version
 6.6-20260425
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

On Sat, May 02, 2026 at 11:08:05PM +0530, Shubham Chakraborty wrote:
> - Fix poll() handling for closed input with proper errno
> - Security fixes: limit-checks in _nc_write_object, _nc_trim_sgr0,
>   read_SGR, and _nc_mouse_parse
> - Terminal updates: konsole-direct, mintty, linux-alt1049
> - Various bug fixes and improvements

Where did you get this text from? It is nowhere to be found in
https://invisible-island.net/ncurses/NEWS.html.

Also, you're updating from 20251231 to 20260425, there have been
multiple releases, so surely the changelog is longer than that.

If you're using AI to generate those patches and their commit logs,
stop immediately. We don't have the time to review AI slop.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
