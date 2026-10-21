Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC5D606A31A
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 19:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ACv6v94G
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF0CF42887;
	Wed, 21 Oct 2026 19:00:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ik2fUxsu2PnQ; Wed, 21 Oct 2026 19:00:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 472BC428A0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792609204;
	b=NEgMDweG2c59hJIfhNIRVyOg5FGGdEXR6LEpNkUAe836Nbim7qiLlKAAFIRbhfxcd7WX
	 tfiXeQH+9ex/LXycvCZPGzUWk2PwdjAm+xg2gfpuJ1QtsVWSb6V5WuIkq2oG4h+edeVBq
	 vAQ/h5j6wbKDSGzbrACmFiCQ+5QQKv+spgs0Qv82w0ydX6rVlkCF0HVziQMuoncmWWill
	 zFhyXRB6cnN0rk2mJipE8GJDnsEdAW6iyTdWxkSnWoEILT23j8RUHGPkfQKji35BUbQmJ
	 4lIHLMsN2cLtc86R3dbBxwtPx4OFhrtZJGrVrsaQMUiW89k+3KpXLNHqCq2l0Y4cVqg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792609204;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=EThA5I7YTgXj33dsOsPLv9y/yhHMb7dry/vtzMwapZE=;
	b=C11rwGeMX+5h/6+hdi9FEe3XMz1y0k+YgfLeTkRE11inSW/Ju733CvEDVOdEk5R832EU
	 +KKOinbbOmv9IYJfRi1JB6Fts4U/Bwj7pEvME/vZ6Uv+GvLrmVxRvhDPKRU44ihqIFItj
	 d+XXkRzq5DcLg5eMJLmJvkBrQw3F+GMGlZyQO4WNMCAdIJBJXRCYADtqzYljEL2n8eqQ/
	 F8IjQDkKx7h2lGp64HUHLtC236wRVC9hAzpCcFa4lOo9S3iIOuzjkeNEKkxs6aggSXC5R
	 4SPCozEazIOm7o9O/6qg8YsXCrHkoVvVh8v7TcggjcGXtJxqEApHzBZGQfFTDOCxSDA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792609204;
	bh=EThA5I7YTgXj33dsOsPLv9y/yhHMb7dry/vtzMwapZE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ACv6v94G07/5L/pLQar3B87DNezDT9Ug8UL3+KueOxOfR90kBg41B76ZqqTTP0r7X
	 yR3CyAe1ahJbR1kwiwzaDXHdgGEW74TKiJBRCZu9AsZ3iiZDh/hAuRG7r45eUfTw+v
	 Xu14eIchgTF+60Ycz9DaOkP3Th/WUPzHbKz3rir2SYSMNi2XewB5vuPAmrTVYfevda
	 VcXJT32P5J7G+Yx4r5sdAsJECJH199W09MfeShp1gONq/6Q5Z/Dryr+HuxIU2z9HhU
	 v092dhiSaz5FAaMqPyoLd7ehrGw+JOrqGBsK607iVMMLgoPYaXG+9yDWvE6L1wcRuP
	 SNixcmU6d3+0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 472BC428A0;
	Wed, 21 Oct 2026 19:00:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E0DD3A4
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EC12426AE
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:00:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wfD3wEDizIie for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 19:00:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F14E741C1A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792609194;
 b=n0woAa5iU4Ud/iHhtBpJ698LKu6/+yTN1iVF5wby4OqBKsDyUIhTxmOBU6KmUOfA7fPp
 0tVw/zyYn/m7OrB1lcT5Een/F9KSiUQhhvUTij+FPUrfOAerfU3Ul/wYRAbe4cV/YoPjq
 dwfO0PhMzydgbyho3tFpwDtzy3BnAqJzItoXp892jZH73sbwaH5owY9oQs9UCqLPuIQ/C
 0VHKWEoBsTvqzlwRK4fZv+rxvNCwLLQeeYmpW7NyWePpsNsHWIzmDGgozbr+SW/bFahGD
 Nl4bszsZPscSpjCes/As+W6JGtHJNFHHM6yVMlWB6R00+8Fgw9aurrC7OhoGx+4pZWw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792609194;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=In8ayQ/o6HfEuJxdx6aIbb28GML9sudoSTh/u2YNAcU=;
 b=faRJIvOSRySuvrTL691qV5P+O8GYHoA7nOlsefs1VqAdtnbXwNFapdRq70s4yusByrYK
 14wNspSjaj3ZhHcMUHFu7pB7s3vEmghf29ENcfTydgXAEOadfyZaZPXvJic0vHIb6qBYh
 L0YWgULoBNoM7Oh8y8nLUG4X66DXnc9t7w5UGyPwM+Dyg7tdcpYg3pfkAxgILzA3e3Jly
 L2BmILtZPyGc+BTHZZMf33MLyr+8WNxvZKhefg3rt04pvcH4wH8SMMjYWanxEqauGjxzg
 9xE0y0bywXKOSwN53jqCTS6ASXwpLwSh4wvreb2N46mibljfEgKR4BaAu0bajt6egcQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=TviKCzp9; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F14E741C1A
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:59:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 9D7861A12B2;
 Wed, 21 Oct 2026 18:59:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 690C6606E3;
 Wed, 21 Oct 2026 18:59:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8F418103289F5; 
 Wed, 21 Oct 2026 20:59:46 +0200 (CEST)
Date: Wed, 21 Oct 2026 20:59:45 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <atkLNw8pfPRoTzzl@windsurf>
References: <20261020212239.4182418-1-yegorslists@googlemail.com>
 <20261020221309.4194290-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261020221309.4194290-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/gobject-introspection: fix host
 build when /bin/sh warns
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
	SPF_HELO_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 12:13:09AM +0200, Yegor Yefremov via buildroot wrote:
> host-gobject-introspection is built with LD_LIBRARY_PATH pointing to
> $(HOST_DIR)/lib. When g-ir-scanner calls pkg-config, which in Buildroot
> is a /bin/sh wrapper script, the shell inherits that LD_LIBRARY_PATH.
> On hosts where /bin/sh is bash linked against the system libreadline
> (e.g. Arch Linux), and host-ncurses has already been built, the
> dynamic loader picks up Buildroot's libncursesw, which has no symbol
> versioning, and warns on stderr:

I've applied your patch because it is the most obvious direct
solution, but I find the above explanation rather worrying. It really
isn't great that we end up executing the system-provided bash with a
LD_LIBRARY_PATH pointing to our libraries. It happens to work by
chance because our ncurses is probably not too different from the
system-provided ncurses, but that seems like to be more luck than
correctness.

Shouldn't we investigate a different way that avoids having to pass
LD_LIBRARY_PATH? I honestly don't recall why passing LD_LIBRARY_PATH
is needed.

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
