Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11B4606A320
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 17:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BYNqvgzt
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAA1C60760;
	Mon, 19 Oct 2026 17:47:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SXh-rFnTSFKI; Mon, 19 Oct 2026 17:47:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2333060727
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792432050;
	b=Sb+ZAcNeTDS2m9sfgAptOLbkC7gWf/Q8RXYa1m/gVYpCiUhnvg7YOpA5F5oWKiDDafBu
	 Gtq8I4Sk77NMrCcdXuHd7Rr/pSI0xLle5B0asC18utPLkFvXxuCOKDyhxqtIfoIybWGzU
	 UjHANJMJ7qurCdwynM540cUhgyv0rdfkSR7Xmk0IwnDfq+ToPUzNNqUE6dWqW+Cv3m8c6
	 ZVNgeZ1EkdIhAoRC5sxqiqYpaGxSgWvzxDc+irKfoE4J4cCLKkP0QFon4Hh6F1jpKaYkI
	 3lhRm5Yo9Q2y+EXmVrUkGgOULeh/BJEv5iMp0I9dI8TdPpwm4baNkdBFfkmvcx4/8XA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792432050;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=WPnNiXeT47/uF5eOeRW3roQEH75J6VPJc63XS3YhECw=;
	b=cHdY4JHE/oVZfSlVyQ213wziRL13PbRhBsjcDBuqVHbKGNA3f3NotsPpnlu7jLDsfWdE
	 uB8cqdFORzcQq7uxvWPVRWpW3gdtagGVoHP9oy/f+7uPAarDEIRdbzj1L8WXR7aDyE74V
	 IF5kAomsTBU6gVloBcErXiwhNAt7dxJoYuUg5ZCXZ9YNGlvQG5fWyaP/oSZS1X1FU6BRb
	 lai9vKzUL3lflhFExLm3uJMSYkya1He/H3KJoEiXA8oxLk1g69uZUay2jZFw8eicqv+Rb
	 jxbbowOdq3bFK+I5MuhMAT5lLLcO1qLwGcIpRuAoc89sawCsmQiYio7QcR9cX6baLhw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792432050;
	bh=WPnNiXeT47/uF5eOeRW3roQEH75J6VPJc63XS3YhECw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BYNqvgztGDbpu6ygjyDn44Xp9IfXezLgOEiaHjgfiLzYSfhoRjjl3ikZlfwKjNd7E
	 YV2jQj13A1lN6ToFlwxDeXFkiVS3alb8w1n0CLC2J+eeqTja519HdBx1bCy2VTP54I
	 HJtpP6p7Ze7GpFkK/M8MUbDHT1icZxtm3FpqD6NsCcKHCD3cYvt+SnGpdKjO3POgRX
	 X1SQqjGDn1cgr7ACdQPTUvgLGj2oFxinBG2+y12hZSAL6RO+LgOpIKLYC+uN4RH89p
	 GVcx4vhZymA03oXxFjJc0Ig3If9ofJgT54ohvfvo92HN2e1Nt72BPLE+z8e8I3y0aZ
	 vzPZdN4AhIrrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2333060727;
	Mon, 19 Oct 2026 17:47:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D7471E9
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F55580BE2
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IqxKUo2E_rec for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 17:47:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6721680AC5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792432048;
 b=MCfLjftufsD90R3/SeBZohQGTvTfdJYGtcgVhUMlfz9MPwEe/hkoHO0yzXtI2gHswkpC
 LjSruyBw2q0AB0cRtaY9k5I9nGIrg7MJQ6l8jGjkF7bMf2a4f0YBnhL+azlQXWv/aWwAA
 pBtedO7fbr06JTrQMirlPCwKjjj6KmgyRj7jTlqOKMl2uiQWy3HfTcGaUwgrxOAs5P2oA
 N8x2GYgW50xAL+CFn1wV1FTMlaq8wi7x9XUqaenJtKv3FUrgvRecDBqhTVZNidDLaqSMh
 S8z2cbdj0S8kSA39fo5/umxZYIpfi04CqtXX/YS6RfJRrukaykob4FMg2PFHnM7mYOg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792432048;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=iqSjIZ+JP/0ENpNihkcF+wXYvzhmd9pjQ76zumDeFUE=;
 b=GZ4BZPvdICX1+eun+V65fhhszbF1FTu7dScGy6X4agS5dVIGQ/wWTRiUHijNGWN38b+l
 GOpc/WkDwiJ8l4j13JFTt1wU+d/FSgacUtypt5xxvkv/Cu1se4vB/GwldXWJic4Waesww
 BIRRjgzmBeohO3X8ntix1NcBSCSqflTKF2pCVLCsxr0WiddVLbZwEvaafVg+akDP3qmDA
 UuBosQ9tNY+RXGJMjeCn63fZVtB7Jt2DKEs+0Ps3ponJFgno4yT/tc+rO9C6BxKNpAKUg
 E+rA/p+FNogP+ULcfm3TSl1QbhOHs4M8Ag0MmRvdZ/+3Iiv8jl0OTgaj5Jo1XAsB7OQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=zLiTtCSt; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6721680AC5
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:47:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 5B39DC5CD5C
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:48:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3324360582;
 Mon, 19 Oct 2026 17:47:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7191910328C5E; 
 Mon, 19 Oct 2026 19:47:24 +0200 (CEST)
Date: Mon, 19 Oct 2026 19:47:23 +0200
To: Joachim Wiberg <troglobit@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <atZXqLmwIZV_VEUO@windsurf>
References: <20260924095634.1298401-1-troglobit@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260924095634.1298401-1-troglobit@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/netsnmp: add option for a
 read-only agent
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

On Thu, Sep 24, 2026 at 11:56:34AM +0200, Joachim Wiberg wrote:
> net-snmp can be built with --enable-read-only, which removes all SET
> support from the agent.  For a device that is only ever polled this is
> a stronger guarantee than withholding write access through VACM, since
> a mistake in the access control configuration can no longer result in a
> writable agent.
> 
> The client applications are unaffected.  Default off, so existing
> configurations build as before.
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

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
