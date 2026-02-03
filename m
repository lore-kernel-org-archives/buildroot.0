Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D41E87842
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 16:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 291FA60870;
	Tue,  3 Feb 2026 16:16:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YvxB31dHqkTC; Tue,  3 Feb 2026 16:16:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3026B6087F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770135393;
	bh=OJ9VRzoReCHzZKzY++80hGqor4JfIscF6PekEfuLjUk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CHDkczodMoYCI8ml1bDqWfOGofJ2B2mjlGV01IBu/CPrwDLLxrW6hRjA0grnWNkW7
	 l49/nlowXran+dJdF1XdVZvw7xImkP44ene81JW3q7umqS4rPsVaAREOyEs5HDESZC
	 Wcs0KG0HzZVyUjoOtv/KaDSzidoPahRzeE8e2bptR08pES+B2kv3Q2FzQbB7QIHHbh
	 2nim9dN9P0xMzA0C79e8aVA8S2MJiVN/voNZKFzn/1QFGMEir2BIoqte4q6DRry5ni
	 jvBJR6DM9Abw89WHHta706R5pDmydm3duj02bPa0ZH6fjTmxlXVUvNoUZ/pJWodMja
	 j2yXVM1M8fYAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3026B6087F;
	Tue,  3 Feb 2026 16:16:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A484F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 16:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B5756087F
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 16:16:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rFEXr5cvufyV for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 16:16:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 64E9160870
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64E9160870
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64E9160870
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 16:16:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 234584E42369;
 Tue,  3 Feb 2026 16:16:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E6E7B60728;
 Tue,  3 Feb 2026 16:16:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E4831119A8888; Tue,  3 Feb 2026 17:16:25 +0100 (CET)
Date: Tue, 3 Feb 2026 17:16:24 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
Message-ID: <aYIe1pqsEBM8J9Qm@windsurf>
References: <20251125145024.602672-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251125145024.602672-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770135386; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=cEGqN55ED8wzzX3pWHlLseVS+58yvc8JhdoEhmJ4pF4=;
 b=KcFxzbRMfA6uTSpSCtnK9M7H8Fk9i6iP4hjOOWlFjnk5oHFLawYKXLIZjjqNLpwhnadxfv
 7wnDIN6vg6gtbE4KOjx4z9GNsSjKyK6C8RSG8/GjuaaEBuJcixZs/AbQywSzNJux6v6kgZ
 f+v9fU/GuMI+PxPawiS8PlfPCmuyQ3SBuZNzhhFzuM6XYG5GNjO3p//q2iPlKf9OWhNYGN
 xLXt5CqJxxle/E6ZYWcGJ21daAiwk/K6NeQ1Z3UBi38ToV6vtvYYP0XLju5hYa8pftlELy
 3rYYGMHeAtMxs82ZVaPJE5NnjldJQFNGLJVuPCqtXRE7Kmx9CiCo9cN6QchdDA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=KcFxzbRM
Subject: Re: [Buildroot] [PATCH] package/swupdate: fix build failure due to
 missing include
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

Hello,

On Tue, Nov 25, 2025 at 03:50:24PM +0100, Giulio Benetti wrote:
> Add local patch upstreamed to fix build failure due to missing unistd.h
> include.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

I'm rather confused, because we have been using swupdate 2025.05 in
Buildroot since commit d5826736d5aa63eb818a5d20338b7b698f66dad7, which
was merged in May 2025, and this version already includes <unistd.h>
in network_ipc-if.c.

So I'm rather confused. Also, I couldn't reproduce the issue, building
swupdate with a musl toolchain.

Could you clarify? Also keep in mind that when fixing issues we need
to indicate since when the issue exists so that our dear LTS
maintainers can understand whether the fix needs to be backported or
not.

I'll mark the patch as "Not Applicable", but feel free to send a new
iteration with more details if you find out that the patch is actually
still needed.

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
