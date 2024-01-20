Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4930AC47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 15:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D115A81EA2;
	Sat, 20 Jan 2024 15:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D115A81EA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JbqDX-zbKy5P; Sat, 20 Jan 2024 15:08:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35BB381E68;
	Sat, 20 Jan 2024 15:08:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35BB381E68
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2CC5D1BF3D9
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 15:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF9954049A
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 15:08:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF9954049A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N9nGHz5P7lup for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 15:08:28 +0000 (UTC)
Received: from mail.ott.net (mail.ott.net [77.109.144.132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D4BA400FE
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 15:08:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D4BA400FE
Received: from relay.zh.ott.net (relay.zh.ott.net [IPv6:fd53:c48b:8ee5::17:1])
 by mail.ott.net (Postfix) with ESMTPS id 5D2EA4801019;
 Sat, 20 Jan 2024 16:08:24 +0100 (CET)
Received: by relay.zh.ott.net (OpenSMTPD) with ESMTPS id 40fd2b3a
 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:YES); 
 Sat, 20 Jan 2024 16:08:23 +0100 (CET)
Received: from localhost (mort [local])
 by mort (OpenSMTPD) with ESMTPA id ae807f2e;
 Sat, 20 Jan 2024 15:08:19 +0000 (UTC)
Date: Sat, 20 Jan 2024 16:08:19 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20240120150819.GA125940@mort>
References: <20240118144823.5105c00f@windsurf>
 <20240119021124.92277-1-stefan@ott.net>
 <20240119122630.3f58dad1@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240119122630.3f58dad1@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ott.net; s=onbz5; 
 t=1705763304; bh=u0NyZ4hwGIh7C/LmF6GtKZZnStklzw2vkYvmRHYRrXk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=REoIkqX//XxzbIlN1WFq6JjYFmKs0xYPrucD/KB3rqlmwMosLdU0XSaQd2dGyrv04
 zqIy96986JZs2Zfb3ou2MrZL5MdelB+87OQwo7KGHqNUKlvZYJrhu2kjNZnCY8FQje
 D6HwsxoUr9gIfPnp6UFbgAvxdvCgGnyDG5T5Ly0y0Kj3jNKrh9m3lAP/9nndhXvajq
 38unPlQnlLDdtjsXf2mFGDyNKU057ACmt16vTmQeYcymTYPZnMAURtDw/ar6jHllGd
 TJXspqjZb3+2vSpOXNDxueGV4OztVzpK2rYHphDlqw7khqnWfz8rgHaj3xe3iYyH05
 gbxOBCn8+unYw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=ott.net header.i=@ott.net
 header.a=rsa-sha256 header.s=onbz5 header.b=REoIkqX/
Subject: Re: [Buildroot] [PATCH v2] package/sway: make systemd optional
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
From: Stefan Ott via buildroot <buildroot@buildroot.org>
Reply-To: Stefan Ott <stefan@ott.net>
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Stefan Ott via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi

On Fri, Jan 19, 2024 at 12:26:30PM +0100, Thomas Petazzoni wrote:
>
> Which other values of -Dsd-bus-provider are available? Would
> one be suitable for an "else" clause to this "if" condition?

The other values are "auto", "libelogind" and "basu", with "auto"
being the default.

-- 
Stefan Ott
https://www.ott.net/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
