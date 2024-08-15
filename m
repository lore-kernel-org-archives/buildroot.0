Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A97C3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 12:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 968E9401A2;
	Thu, 15 Aug 2024 12:37:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E0RJhMBkytK2; Thu, 15 Aug 2024 12:36:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A4FD401B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A4FD401B4;
	Thu, 15 Aug 2024 12:36:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B17711BF3E1
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 12:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA16F80E94
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 12:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vxyv7q6QUOvW for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 12:36:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 94A1080E3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94A1080E3E
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94A1080E3E
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 12:36:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D1B0C40003;
 Thu, 15 Aug 2024 12:36:53 +0000 (UTC)
Date: Thu, 15 Aug 2024 14:36:52 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240815143652.7265bd45@windsurf>
In-Reply-To: <CA+R_deriCwom9cj5cYO3R4P9NXXJrHdCvYCTqzkH1UAAOCwdOA@mail.gmail.com>
References: <20240815062841.1051418-1-roykollensvendsen@gmail.com>
 <20240815094738.266ac1f9@windsurf>
 <CA+R_deriCwom9cj5cYO3R4P9NXXJrHdCvYCTqzkH1UAAOCwdOA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723725414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZxgMoegCPiSiabZSY/7QgZGDkDpy4rBAH3Fgvrh0QKA=;
 b=ODDGAjr8xp8X4AcSrAwr/DeX3b5UZh80BP6+HE/qmy8N1/bCQSc6cl3/lmUj3amC3KD0T3
 dKApttTDUE7HV8ORFTAYujrcLfwKXYJEDmXbhwmI59tGF6Z+i8tARh3yC3ZQIBYdgQz6TG
 usVx4Ds0WvU/Ptc1Es91YAcsfFr1eW91vDjXbWYwL1jtLmOGgVU1cWtqzNya376A8zhtyk
 50gDFxSqJT4KgDjyutgjFzCvcznnoPv4yFgxkeyndNKVj5Ho/nT9c1YWsaWdOwKk3jBJOp
 ijSnbTGLkzoGYTxVRHaaNowPeJi3YrBx/zuAvO++07Abntj5hU9gXrTviBO56g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ODDGAjr8
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6base: fix CVE-2024-39936
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Roy,

On Thu, 15 Aug 2024 13:19:08 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> CVE-2024-36048-qtnetworkauth-6.7.diff:
>   - Does not apply since we have not yet added a package for the
> qtnetworkauth module.
> 
> CVE-2024-33861-qtbase-6.7.diff:
>   - It is already in 6.7.2:
>     $ git branch --contains 7c4e1357e49baebdd2d20710fccb5604cbb36c0d
>       6.7.1
>       6.7.2
> 
>   - As Jesse pointed out earlier the bugzilla report dos not mention 6.4.x:
>     https://bugzilla.suse.com/show_bug.cgi?id=1223917
> 
>     The patch applies without warnings/errors to 6.4.3 though.

ACK, thanks, makes sense!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
