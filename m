Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FC8C6FA8F
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 09:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0BAD40CA1;
	Tue, 29 Aug 2023 09:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0BAD40CA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WS-XvMptqoV0; Tue, 29 Aug 2023 09:08:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDF5140C53;
	Tue, 29 Aug 2023 09:08:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDF5140C53
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C2D2A1BF3D2
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 09:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81D6E40C53
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 09:08:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81D6E40C53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PNRGv6stM5Et for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 09:08:45 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 433C44018A
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 09:08:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 433C44018A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 382DC20003;
 Tue, 29 Aug 2023 09:08:42 +0000 (UTC)
Date: Tue, 29 Aug 2023 11:08:41 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20230829110841.1bcf9128@windsurf>
In-Reply-To: <87edjm5itv.fsf@48ers.dk>
References: <20230627061104.9EB9285B2A@busybox.osuosl.org>
 <20230828235935.4dcd6b5a@windsurf> <87edjm5itv.fsf@48ers.dk>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693300122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p4a0vk48xILi9kaVzSBED3bNSZGg7NLFoLKL9MyDPlk=;
 b=i6miuM3Dx3Xw4dYvkybRM1Nx1EGjNQTiWpldKoKhop/xnBbzuSUbvD8ug1xnjnMqvMJN+T
 CX0wRE5NDPsDwVlvCuEShEB1VGRdSXEU2lngS5egh17uL3UDEPs/vxN3frM67OjQ8wdwTu
 w5PgpwDLp7U33JLFpbl+EAy8iby0PW4JvIu2CuMzA79fsyjIr5hp4oE+DZIT0nlDHu2wRb
 ruwia4uvGuzodoH8JlCxj8AtEr1XshdHRQQSEGmDQ+auo9X4nZDwbLLMI+Jxuk3X5c52Rr
 /w9h/VFku7uTZu/ezaraVk7IM010bupVWyknkV4jeNpLKalognovZmpVJH8MZw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=i6miuM3D
Subject: Re: [Buildroot] [git commit] package/dmidecode: bump to version 3.5
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 29 Aug 2023 10:55:08 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

>  > FYI: this is a security bump, as it fixes
>  > https://nvd.nist.gov/vuln/detail/CVE-2023-30630. "Dmidecode before 3.5
>  > allows -dump-bin to overwrite a local file. This has security relevance
>  > because, for example, execution of Dmidecode via Sudo is plausible."  
> 
> OK. Somewhat unlikely threat model expecting people to run dmidecode
> -dump-bin on untrusted machines in directories with other files, but oh well.

Yeah, but the CVE pops up in my list of CVEs to fix :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
