Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43133606CA3E
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 22:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=V3YJUtoL
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D0B781062;
	Wed,  4 Nov 2026 22:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZZEQJOUVXjpl; Wed,  4 Nov 2026 22:20:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A6B7B8119D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793830854;
	b=DxLz9a0y70CMeQpAicocogROSz/TTJEVimnt93TqTaFca+KUKuFqdQN258nwBaYDDHmY
	 +fVMX9P3EyhtdiGjLNCB9eZL0qxM+QbNuEh2xismovxU+acPxr7mGIq8pLrYW1kXWjNu2
	 yICqx02lrxEBzdNxSibWdZg4W812TH3TL1vbV/GEoiLroA7NRiXxF8DgS0+vpBzgeYWi0
	 RBPeHt46xOU85sr1hWTghutdTZnSGjRR+pGtuhajR3AT5eQrvbQvIgWnJ5IEWXjyjIRqL
	 asmsKXrYo/4dNxIY4LbCn0AjN4Tv/e8nWy0xgut0DeqscuRvStb1npzLBSDC/CpjGow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793830854;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=R3qdcn7kZzoDEZNKgMa1dN/dK31vZz3UyiNJeUw+00k=;
	b=qUn81ULBa37LanYyaJtRcJSxO1xZax2eguMBw1HcKIfheyQV8ETsHGWOjZvS+Pg2jyhY
	 lU1U53DlPmd458yh0YPPai6lUjbPq6Gg30rqI/f+eP2BgQWWzHO0Lemgsi5nL/LdgMT2z
	 7y5GEqj0JOGxgDbP+tKV7pbw5F6VFD1IW9Xu1/b2wKc0XlVApA7L3MfqedfR9HeLpEUX+
	 HTKkgH0olJLjagGNQjfXtJfBaGLUKmRTVLvO9W1znbC3wDO10GuOrSA8Ylsm9ukBJTpPg
	 +5rDn7T8qMWwvsQahEpNRkVmo0s14DmyBlRtZ6IZWaZWZpT4cnxIXh5pfx8MlpaYjJg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793830854;
	bh=R3qdcn7kZzoDEZNKgMa1dN/dK31vZz3UyiNJeUw+00k=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=V3YJUtoLw7PKCrN2ED1NvCVm5mxNRoFip0iMfkRI75GdBp4fGDT2Z5GE4TXR7+D6i
	 W/X+/g8s2S0pO3GC8UGFAin/uidTUoROC2UaEFKrDyqdto+C7+6WovN3+nHp83IOs4
	 qKshB5EB15RhCqvVGYJUJ1g2EykXBLhOztSZ7qFyY+Dv94xlUdmBMhjUhzSpdrKmsC
	 bjkIqhzEdhY3AbL7vdnzDDEejV6AbE8SQE0LCTZjQcnXoH9egeckTL12FQnd76rJQc
	 WrDXgHhOPmX7qm4zufdZjYpBgSPcyw59rRxXrhoFOJgjR9Vp9lYZ/9QKJXb27rkWEn
	 8C5C5p6r4OUvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6B7B8119D;
	Wed,  4 Nov 2026 22:20:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1537B362
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07030607D5
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:20:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P9vrMc3RX9Ew for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 22:20:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AE9266078E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE9266078E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:20:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id A431C1A03C4
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:20:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 74A215FD65;
 Wed,  4 Nov 2026 22:20:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ADD1610329280; Wed,  4 Nov 2026 23:20:40 +0100 (CET)
Date: Wed, 4 Nov 2026 23:20:39 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <auuvrXSgL6WKNgLT@windsurf>
References: <20261102181345.3238554-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261102181345.3238554-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/python-cachetools: bump to version
 7.2.8
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 11:13:32AM -0700, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

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
