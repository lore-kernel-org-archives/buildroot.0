Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DBF606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VoveBXrF
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1088D81948;
	Wed, 21 Oct 2026 20:37:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9-3JbGzj_f8C; Wed, 21 Oct 2026 20:37:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3EE5A819B8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792615029;
	b=YiNYzBRUssN2zM1FoIXrvikq1aId2DJL11NHK276pr4XqRb1QlGAG4uU53WXTntot/U0
	 JjF23ClJAlzsXWC+1WrEp6e+9zGbM7AGpIR6vVxeZBR1NoVqDaidP7azkOO5gnSTjUo1v
	 Cpr4yXyw73U2IkdD0MixLJwJbv9aEDq1U/NFD2xofL3TAkerLeKpoD0yNE5ZaDPk80cg/
	 UoToMkSB3JuyPSIwxDpW7pXFUzQNQZX03tB2PdiUyfUcRb5wOlEKXZueoCmoEAD6cJd4d
	 PTQpoo/D/XuptqksC8igg+MNimHiM0pF5Qawc3FFd6LWKCYkJ3lVaUr7/G0KclYc6rw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792615029;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=l9aYWfuqiyoTjLrz/akMBrtqKmU0nPZu19JegPEnAOU=;
	b=MZ095m8bPVn5dXuzr6qzqnto1RBL7yeVdX0Gdc0jL1Y+FP0kFihdNjW5va9/jTWFEkCQ
	 qsWgGIcjKpeZJ1VyQip4IR2LjVmZngt2+YpxDkcePGAu2jdSCAdS3Dm7b6tKH6+y3X9+C
	 K9bLJPLFAtwIDGHWxGBhEhSka9XIe9yhImSYM7Z0WZ3PO7LmyPaaXpfq9F09MIp4n62xj
	 AqXoyT1pTi4RGakh1vDP/8xzbY3szfVGDiWOtrXa4CtKDTUNKx8RnubFJgu3VodiK3oEY
	 Et0Vaw9XUg7LkohghOKX08VI7JGykJ0rNqL7xJy4IOylCZa7tI/cT5f2mfuSNXclWCQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792615029;
	bh=l9aYWfuqiyoTjLrz/akMBrtqKmU0nPZu19JegPEnAOU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VoveBXrFJa1krlzibpEfnsrdKSzZzTKcpJZzjnwf1m6f671MGpGbYYDtcA4Ruwzji
	 6kKqe9SaoIcwrES7HKDu5S/98FzSgc4/0QQNa/LXqMK8Wz1DaspGrQTmBGshZNvOQp
	 lHwFyPpFPXGiea6TDxsnD/qhg8xi3aKHTJfuglDf5imsnt78CcOv2lXexC7tN4+jlK
	 QeC2/kt1Xt02ReGYcApDvbrPZH3SU86+jxZmr00bosj28iPcJt1bjwQT8R7uPS6CrH
	 cr6w1w/N43l8JxIa8BEdU2Zs4DTvG1tN2mNdXEe6Fu9MNXPYThFi0S1+AHR+NjPXPN
	 zNxvs2gnuwBrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EE5A819B8;
	Wed, 21 Oct 2026 20:37:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DEAD3C1
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4425A819B8
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B3leKck4tCUr for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:37:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4430981948
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792615027;
 b=ZaJPsC9n/RGLw6SFK4aTjfyRbMYIeOJIxpCzXLYvMypzSvqJeJyCZjdZScqDD+Gxn6hl
 50/oq5NAY3yqKX/qlWWHjGhTWgp9W61U0DylrCOQj6+OhrHyDuQaVdJXNhJo9IvlEBKIK
 m0KiSzHxkZKVpWVLP85qmXjZFWORzbuQAbTo7H1qIC0gGSIATOJndY0mWu6g0DClvvG1V
 nsCwXwEtViCq8Enb8oYJhnyrAhfpoCV2t3kKCTTOxiZ0RMvdshBj6chXTlqZ4r9U7lZst
 E27ZwMrMMAVW3LnFjBVs37w4haxWcr4gccsIS7wu6Bt/cRmpGK4At/kGo7V5GVlQtlA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792615027;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=T/zH5AnAr1zstehrZ41oxvnbbKHiGW2wUtiZA0mJ294=;
 b=ncK+n8CSCCX98c5nCnrnaJxxb9wV+tjn7qOELLgt/cis4cl7gKXL+w3+QW1ibtoj0J9Y
 Nx8kX0DfXLECMR9AJ1YtMC0kfytN/nA6+bZdSQTg8X0/ouimjeOJK4PinBIH3fLCHIg1d
 Q6K0OcHjS6ksFuf1oZxDs7kEhSc1702ByIdv/ugrpPG9BejtOEDy27h9JRF2UcAFTDTAs
 V61WxFgAtgrBfP80RE9rz5wwQtp5OGmbY/YXy2aCzqSfYLrvsXm/43Kf/5A7zMGO1tfxQ
 3orWYrssW32rY+bpP+M8ysm6p2VJ+AMGwpkQS3JGmg+g9K0kLmYofuwwJlPamCrdi5Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="FzmHg6/X"; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4430981948
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:37:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 8C833C5CD6A
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:38:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7085A606E3;
 Wed, 21 Oct 2026 20:37:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 741FB103289F5; 
 Wed, 21 Oct 2026 22:36:59 +0200 (CEST)
Date: Wed, 21 Oct 2026 22:36:58 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Michael Fischer <mf@go-sys.de>
Message-ID: <atkiWHKWd-QdYB-G@windsurf>
References: <20261021195924.2746366-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261021195924.2746366-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 1/1] package/sdl3: fix X11 dependencies
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
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 09:59:24PM +0200, Bernd Kuhls wrote:
> Add handling for optional X11 dependencies to fix configure errors.

Which configure errors? Does this needs to be backported?

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
