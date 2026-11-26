Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D61606A31C
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 22:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ZocsvLeC
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7084C811FD;
	Thu, 26 Nov 2026 22:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id orgnrUj--O8j; Thu, 26 Nov 2026 22:17:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A723E811EF
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795731436;
	b=EQUq0XOyh34PQmEW0LzRKuabnPaoFeKxDuYGtOtXY2eOerhBc8kJqaY2g2fVK5z3++bY
	 k4RLZl7JNZlzU2YYrEsTrnlfFV3mImZvJQb8A9ieD2fsIlXAdIGPcOkEuFB8qnTY+GcH9
	 EzeJKx7lFFesEsE338qSqVw+GlmlQSgDMVVS6NRA3HmY9XkB/K6moQUjFNA7epg1oxDr5
	 vkuo4LSKCsAFrT5d9DFYzWozHyNMteW7vBgc7J0kc4d6lkzHSY5khkzi54jVVF0x+9jhz
	 VMv9Rmk3kxuF2mK+/lloZlFGxtLQImpOiw+LtuwkMsXuV2hFusLvR59BoAa4zpLBTng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795731436;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=b7eO7hp3P7D6Zq8dPMbZ5BhYZ9BisIThEpaqkKsB5vs=;
	b=BAmR108+c7OLHVXwRE6RAqfO/6bFPvLkHtndkh38b4Hp2p5YZYRYadIJdSl4ga2xkE8Y
	 7cYL8x1O0DDGHzbvKvJYHOUN/LLMeQltOfchWQrmOpxOPmI2t7EUY7M0RuqKiHcDNr1Kr
	 lRvfzgbSHKQb5JHZAhbhppxRs+0lgHQhaiRHt+BFlXwnEW4p4w28nA1mWYOjkXHwMRSgQ
	 2iqdBL7Vm6M+KGxbqOt1Dxpy/wrlbeB/Ai6iMoIaY4y3/D3w/zEJMqXfWED7D8BQTqBUw
	 415XpLJaav+LHelZfHc6PWjF+cNconRqI3C4rhnZCZlWyb+9lgpxQ1YwM3ZOUcbTyAw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795731436;
	bh=b7eO7hp3P7D6Zq8dPMbZ5BhYZ9BisIThEpaqkKsB5vs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZocsvLeCLdPRZQnE963qYkBIq7twGInMLm6cGACeU0/AOJ8H7mKbZ9BrpKleZD5TW
	 Uo6aGOvG47se9oJNydWlV9WxHp44CuTgB2+GT/jmAzidm4301psmgEI2BOqdfXzCpt
	 /FijeW6BlQVPRTh5wad38zUOqkhf/Uro/jdKMiIrMkbDaDBWunfwXpteDZi5KIijpg
	 XXX95GCKCamq74qovfjY53du9piusMRTn9Hv8u+0pUI2SWqsjKOkRNuMxJoyTzkg1B
	 NSZTCw64Rj2FDvt7iF5Jg+uDHCwkar8dT/BtczeTKQG7bvQ3S1imzOO4JXKmn2Py9k
	 rUEWwxd1phgfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A723E811EF;
	Thu, 26 Nov 2026 22:17:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E3991AB
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 146E860AA1
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:17:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5e4vTP6BB_MM for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 22:17:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2A8E260A8C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A8E260A8C
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:17:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4BEB21A1826
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:17:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2183560558;
 Thu, 26 Nov 2026 22:17:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9422511E69117; Thu, 26 Nov 2026 23:17:07 +0100 (CET)
Date: Thu, 26 Nov 2026 23:17:07 +0100
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <awiv3PHwne1qSJcW@windsurf>
References: <20261126071402.151487-1-chakrabortyshubham66@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261126071402.151487-1-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/pv: bump to version 1.12.7
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
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 12:44:01PM +0530, Shubham Chakraborty wrote:
> For change log, see:
> https://codeberg.org/ivarch/pv/src/tag/v1.12.7/docs/NEWS.md
> 
> Tested using:
>  utils/test-pkg -p pv
>  (Result: 6 builds, 1 skipped, 0 build failed)
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Applied to next, thanks!

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
