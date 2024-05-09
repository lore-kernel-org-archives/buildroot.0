Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44B9C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C0BB4023F;
	Thu,  9 May 2024 16:46:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LTkJk5SRFHZp; Thu,  9 May 2024 16:46:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35572405B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35572405B0;
	Thu,  9 May 2024 16:46:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B43AA1BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A13F44039D
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:46:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FMGj_Vhy4FFh for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:46:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 611484016D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 611484016D
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 611484016D
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:46:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D6FF1C0002;
 Thu,  9 May 2024 16:46:49 +0000 (UTC)
Date: Thu, 9 May 2024 18:46:48 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240509184648.5a3719f4@windsurf>
In-Reply-To: <CAPi7W828vTKG5W6=e9RvFMLC=0gge42GnQTNrr4m4qs2yNGfmQ@mail.gmail.com>
References: <20240407115439.872167-1-fontaine.fabrice@gmail.com>
 <aba84998-3aca-4a42-b1ee-40ccf82fc80e@mind.be>
 <CAPi7W828vTKG5W6=e9RvFMLC=0gge42GnQTNrr4m4qs2yNGfmQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715273209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+lzcwiaefbEOpMeOE+k6miy2hI8OOoElCpwF2RUNmog=;
 b=F54S0AmNyVk8yhocmOGm5+Y8QHoZJXb92+7Nb/RfvT+2z+TNDWpuVQ/tzKMXVvGT1iZSxV
 oYtekGxbttZwoTK+4YrPWx8D54weYirYsua9cctiUUv+Ya3xZVvkwWBAi74YJ3+ZZ9BPQN
 JcSjrjSf9xjBw8ujZZBLWZpIwSkShQvD11SiFf9wOGw/9T1EC9Rjopc+bYF8oubDC09+GF
 pTRYjIklvlVRC+gTDvviJIbvCGmjjLt0JNiecS8G8Z+XZp8TGAwTo1hJd9WXvnq+7S2T/P
 wGP7iIvae+f+vfyG7S05vxnQx3KQm8uTr3QXnZ6XWT+O5aO3x4n2WRnyFy3DOw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F54S0AmN
Subject: Re: [Buildroot] [PATCH 1/1] package/python-remi: fix pep517 build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 buildroot@buildroot.org, Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Would be good to get some input from Python experts here. James? Vincent?

On Sun, 7 Apr 2024 21:58:45 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> >   If the package _does_ build without setuptools_scm, it means that the
> > setup.cfg is wrong. So an upstream patch to fix that would be better..  
> 
> From my understanding, upstream uses setuptools_scm to retrieve version since
> https://github.com/rawpython/remi/pull/404/commits/f27630721d2bbcfbce515dc2e6be3167f6a06a34
> 
> So setuptools_scm is not "strictly" needed.
> 
> I used --skip-dependency-check because it is already done in 6 other
> packages since commit 8937db8dd595e0988751e5dbb568e870b07b39cc

But isn't it super crappy to skip the dependency checks? I mean the #1
issue that Buildroot tries to deal with are dependencies of packages.
So if we ask them to then skip their dependency checks, how will we
make sure that all necessary dependencies are installed?

I understand that setuptools_scm may not be strictly needed, but by
passing --skip-dependency-check, don't we also skip checking other
important/mandatory dependencies?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
