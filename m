Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AAC606A31B
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 22:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iWlVK4nU
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84D0B60844;
	Wed,  4 Nov 2026 22:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QoaKljXg7irV; Wed,  4 Nov 2026 22:45:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A1A7E607F7
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793832309;
	b=BHVjTRSv6mDIxKvJNHnf1XIwLMEHQhUfe7Lc/4KjCmisnbGQN3DqIyuDGZxWwazpibBz
	 IgXNFKAJbV1I07DgxnEc1lq41mZA0N8o6Rc7PriCpILDTNQqy9PLZwyC5M94AYmkQTbBi
	 YbzoCKsQTlX1hGFKjbAJCEYeTHGFg8EPDc47WRctyRK5qnADrBPX5s+qO0y27E1L+DYAq
	 AtNGWTZvIiwQ4WvfwGw0fS03jVlHSvqOFKu1yuIhPl8l9uMx3M8emaBTe0/zKt8a+XlZO
	 JrUUmBm5kXgMsvmj1/9eZ0QlL1sgsOVNbxO9mZc6pj/Z1h/o4H3G5IjVQGvCq2zfuJQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793832309;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=RY6lsDd0cze8wK7XhwYSu8+xJljXSaGMmsuJRmBeUe8=;
	b=Pn8mfhcSSbv696TOV0rf8IPHh+2wO6RNiDnIirNtoUIAq8BMz1OePfWhsHzelnKTJNSy
	 9AXIpGW0ruwvKRflYu7xvqQ3xo/nWL79rqxR4had7fzaJDR3KpDL14onCMJkrmPBu0LjV
	 lanOoTof028217iGuplkcKCNqC5shrZUMrnmlq7v8ZADsbtFZPd5yx9nrZsp03iJtr7hL
	 ZSBNMGwYvgOWzJKa4yozAE2prX6rjF35ysmg2V2qrfEKf4nYGTfZYDGDwiw0Cwl1fGhZc
	 hy55wRj+vVZfzc5g8qH8oSmWtIR1bo6vwbyOdZwbS3fpg/91Uroa1lL7e9py2BHpMSQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793832309;
	bh=RY6lsDd0cze8wK7XhwYSu8+xJljXSaGMmsuJRmBeUe8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iWlVK4nUtTPB6zf6FKKzG5osdHjrTAXNzleWJ9TKb8be6kngLBuACagZMqpy8PQo4
	 +Rpc1crhFIDC/Ti0AtnA6tYIvYglbV6/oc4UVPWXF1jleyT8YD9HGKiJRjJBX6u/gJ
	 TcoiE6fn50heLZiNBR1baC5SAkY1RYdu122eIo8ZxsOQ8wwc4tQYlmRYa1ICAvGnTG
	 ZIX+5PGTOVOq60wqMvxR2fkNRFPE9AMElx15A+/aBnxPj/O439D2R2TG8M/wn9f3GX
	 MiB0oNE66rA19sWhMwy9dLic0KeF4zsCRoi0EaDeQQuJeR0yvLd7eFFT/yVXU60zEi
	 xLmbZsBzDIx4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1A7E607F7;
	Wed,  4 Nov 2026 22:45:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CDBED362
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF48440866
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:45:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gfz4hkmuTwAH for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 22:45:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CFCFF40801
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CFCFF40801
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:45:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id F198A1A0440;
 Wed,  4 Nov 2026 22:45:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CA5645FD65;
 Wed,  4 Nov 2026 22:45:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 05E05103291FD; Wed,  4 Nov 2026 23:45:01 +0100 (CET)
Date: Wed, 4 Nov 2026 23:45:01 +0100
To: Manuel Diener <manuel.diener@oss.othermo.de>
Cc: buildroot@buildroot.org
Message-ID: <auu1aEeGQfkJgYzn@windsurf>
References: <20261102092557.439840-1-manuel.diener@oss.othermo.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261102092557.439840-1-manuel.diener@oss.othermo.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/pico{tool,-sdk}: bump to 2.3.1
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 10:25:57AM +0100, Manuel Diener wrote:
> See the release notes here:
> pico-sdk: https://github.com/raspberrypi/pico-sdk/releases/tag/2.3.1
> picotool: https://github.com/raspberrypi/picotool/releases/tag/2.3.1
> 
> Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>

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
