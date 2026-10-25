Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6CC606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Fge/dwYJ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C99D80974;
	Sun, 25 Oct 2026 20:43:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C8oUQ9Y4xH84; Sun, 25 Oct 2026 20:43:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 88B04808D3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792961025;
	b=bSORRk/NdpuRnQZWXS7eCtr5y/wostYBONC+rz02Lrj2BYQ/Bb74qCBH0FtdRFO3oQXm
	 nzT54OY0kOTo6c8fry8D59+91/mtRyU7HwC/bk/2Wzfypf0JNYzrCTMEP7f8bVuvM9vBe
	 qzB6wMBezpTMrFLtSPV+FOTVW7iNF5mNQURRz+BOSkwuFYGzOmwS0n+smkYjYu+ICsFNe
	 cp9nVDmp23prt0IeVC6a/F6IuwLMDMb79ombcPBj+b4z/sD/5E7F0itNH/QPARHIHS/Y9
	 eJyNWtZxh2iw4p+jbxI5gJJnlIc7Xu9XEo7yIl0A0sfiX4Jc0V48QkGAP8vQcyS0mqA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792961025;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=O0+qwImhj0XWropHVqin2wxPcKfLrItjaHxZMp8n8sQ=;
	b=GNqxiEmpHe8j/N8OylRzX5sopBURh26RXx962r/W2sc8iDfhg6seIaDPg2/ZyWoMYP4m
	 uWZicfk/NJs8M71JikNO2f+yfJvNUvFi/A0I8DG39xeU1XkLakmYzrt7JziOqGuUbHAG7
	 nZRftV/llO8QP91232YDaCxjllF4Uuh9Ni+CT/bKyuOwgoSf3Y9KG6KRvFwirTeHe3WpN
	 wiG9o8S+gt48BfnBpeN05oV0Mgk/cY4uGP6G23mLn+ZdBjz3fs4G6n68ClzXcQZswxCVE
	 N1LtizoFLHapSqB8Ihj6ifeiFa1LArsNpgOdMj4euXA74TaBi/C9r95uQKBt15D03dA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792961025;
	bh=O0+qwImhj0XWropHVqin2wxPcKfLrItjaHxZMp8n8sQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Fge/dwYJRXZSsZBJVL1aFrbtQeKTA6dyr+kqrck+h8ygiPQVakORJBmd4J3GZHcvu
	 bjliVAygJM6fTAGFPx4q7Y9HO8L8EJDNxqUl8niT51o35t0cqed+c8RKEVB9Zv45j8
	 6w2Q0mPodc/clvV5xm8daG1zfsPz0cKSRgRFDTgUYHccepbwgn49hP6QE53GwrSnmS
	 Um1ap9m5vCcY2rC/FQtQ3oudl36VqSoiBYNWpaVZwQzQQkdp+gx/jMHGfFDUvpeuUn
	 DhJP8PCrxNFGd9Y5ajfC8IjFJyMStWzgvdmJuw4zM26wFB2ngP7q/DYEZe+HMUPGn6
	 vDQ2+3lEzmhMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88B04808D3;
	Sun, 25 Oct 2026 20:43:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 818D2356
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EE71605E5
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:43:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AWI0WEAob9yT for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:43:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 704F4605DB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792961023;
 b=R2/vRuvPpY8YZ3qSbjSDn5BYUnWnwCeUhgs5Cm9CrNNuH+2Os5QsCsBT5WTuE4+xGfUp
 +ppPLbXco9OWWHxJCJK5H65gQRkDJDse24dsHrRHMF2+x1oZ/A35Jmcc6tjytK4GAktG3
 aQ1o7pdDak89WiEMPzb6cQyN8C9HtLrtjT3a7EQ4p/QC00XNpiLMCYgjgtMaGY50RUx5p
 eTu+E3oZ60ogk28R1/7giT9U+lgKjv2QeAsCF0nRth0DEq4HkS1cBNPcMb6F29gAXKivO
 hnU9azdjkJvyZIoCcmpJVcXnomBAEMMAcPAoXcz/fynaFKpvJWarwZYw7pZjTD2pcGw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792961023;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Fcwo6wFrVNCs/W/uCUTMdaoDZR4ICTpXyoAvjrWtgfA=;
 b=Wn3XpnTx3JDc4pNTMMx6qO7oF5AFf2rcfxsTt4pYHCrZZfC/ILFQHNc/IK03e3MXf/C3
 Fqq8w/m6VHAFQwrtu53IDL4YcEGXbqGhFvcd+Xj4jvAAvJaRdk62q8nkfZhWvs7b4rvoV
 a/skzbrp6/T9QVScvXdU6nz5dRals9r1SahHRZFkcx29OAreH1UqJXD8Pi6g9xcalJEGb
 lWAaBhXzHbZYbJw/2/V8hj8Wxldb4X21ta8KfF1MUUMHyCmkt/nxgbAu2nNniWNgEe3sr
 aT/xAXlYF4j0/dAAQyJhJNfBtR9WBGsSfz9cXGgO9pSmgKvhrk0LV00/nn2cVuvksKQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ekcw2ux+; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 704F4605DB
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:43:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id A237DC51477
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:44:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D618660740;
 Sun, 25 Oct 2026 20:43:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1F9D110328E76; Sun, 25 Oct 2026 21:43:39 +0100 (CET)
Date: Sun, 25 Oct 2026 21:43:39 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <at5p9aj_jJ7KgV8v@windsurf>
References: <20261024220331.2861322-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261024220331.2861322-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/tvheadend: bump version to git
 commit 51ec612fa2
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

On Sun, Oct 25, 2026 at 12:03:30AM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

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
