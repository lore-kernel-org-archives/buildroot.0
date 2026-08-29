Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FC5C61DBE
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 18:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DAE26061B;
	Sat, 29 Aug 2026 18:45:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GK6B8eqV6rhm; Sat, 29 Aug 2026 18:45:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788029126;
	bh=Icbk1c9bgkBkgM0mD6Dx22sEX6veQlxtl2Hgp7l2x9M=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=evGqpCyaLa/YyctDLXPBqy04Qa1IkzKuX79u269y9gc4Ei6GaXiqLbERZNuknX4Y4
	 OnURo+qk/LVPaDghjNZbA6GMq/VUQ9TLr26wpVbjHlVLIyLF7cLBphmLoHmEG24nC5
	 n6Cu+EBDwg50Vh1hy4ak5dCCrILmiMgFbRvOP4+dgAjrRr4XiQ1AvxK9oLypW7KEGH
	 1tFipASgoak8MlQJDC/jRJ9mRp/OtOYNCGJMoz52TjBPr3rJK/eOErwh/J/be5zFVC
	 6qcaazKLA3xzyw0nuhBo0Wi96uiAsCXZ6ZhlBZXa1G03ctxHSm6xKIKneqidJCBL3o
	 BsfB762ILww/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B08496060C;
	Sat, 29 Aug 2026 18:45:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F057023E
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 18:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE495400A5
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 18:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OEQoE23_2ngL for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 18:45:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB2194008C
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 18:45:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 456504E41425
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 18:45:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EB6CE6053C;
 Sat, 29 Aug 2026 18:45:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 957A811C787FD; 
 Sat, 29 Aug 2026 20:45:14 +0200 (CEST)
Date: Sat, 29 Aug 2026 20:45:13 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <apMogNfb_5pg-OmH@windsurf>
References: <20260827095520.1049186-1-thomas.petazzoni@bootlin.com>
 <20260827095520.1049186-3-thomas.petazzoni@bootlin.com>
 <8733vxypoh.fsf@dell.be.48ers.dk>
 <ea3adbc598ea273edba25e595fad4969@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ea3adbc598ea273edba25e595fad4969@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 3/3] support/testing: add bpftrace test
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
Cc: romain.naour@smile.fr,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Aug 29, 2026 at 06:52:08PM +0200, Julien Olivain wrote:

> I initially had the same question. Then, I assumed this new runtime test
> has been simply copied from the existing test_bcc:
> https://gitlab.com/buildroot.org/buildroot/-/blob/master/support/testing/tests/package/test_bcc.py
> which was written with kernel 6.6.32, which was the latest LTS at that time.

Absolutely correct. And of course, I see no problem in migrating all
these tests to 6.18.

> Once the next 2026.08 release will be complete, I think we will do a cleanup
> in runtime tests, to add a Aarch64 builtin kernel at the latest LTS. So all
> those runtime tests will be updated.

I vaguely remember that one intern from Romain Naour was working on
this, I even vaguely remember seeing patches implementing this, no?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
