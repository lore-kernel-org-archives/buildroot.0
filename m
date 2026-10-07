Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0035FCA5FF1
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 08:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A3264072B;
	Wed,  7 Oct 2026 08:09:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v-9XBXZMV1xM; Wed,  7 Oct 2026 08:09:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 20BB9406AB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791360560;
	b=OJ7+0cDblXR030gX704a6yP7mtNxd4Vd+uy+cGMGrY1dyDSobG25IXnEHBOoZeMYvLjE
	 0tUxTuVacpo+04QRBKIsyvs5G6XbwoIto5b6B+rBExUv1tzMb8oG4Vm7saf8UA0UK0D6E
	 RXfIdVOmKQPOXSNFbh/cYZ59hKO2BiweOCzHkqrOAuFCK3Lpwq/QTaqk+x3XWgAN44ExP
	 hs6yStYscE/+OGRRjpW6DSsc/+6bmiw5xcvIYsMNilTEy2/7RIaxApR8DQl712q3Yk+XL
	 O73nrnSS4aZkF3tXkwa3ju5+s+QNjYmVW3xci/fOzgLwm5BDrq2/GITQ1A+LbagFh0w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791360560;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=WNT96+yg5n2oMcrOFPhbuKXgAkVvIy1L1wnZA8QnBMA=;
	b=elzZxKOAl3a6FxBbnZrje2V6E9btcWLwkKdXRwI5rejspQrQKcnw+1e8IUTuaJb5Ezb8
	 fmzAxvOXxQpm04nAOiqzD6Pq6WKHJ0uomY5qAQLUiFaK8lrA7FsiiyDE0r1DKjlU7p4g4
	 YBFT9RbVqMyB6sDsKoCqj84OgSSRTqxwFQiALKYZiG72cWDaStajUQbQ9+xvhnILwkLBO
	 BQyEguurQsbrhPfv0bdpwpYd5xxG7uQzmhXPkqatBdvz5Ac1UGjnJC1C6WVLfltoSXt5q
	 +VJij5JW9pur0Cwt5NFB/ZIViCt5jdTMduxHapyqwf4+YzG0hyfIxnz3cpntqpDbfVw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791360560;
	bh=WNT96+yg5n2oMcrOFPhbuKXgAkVvIy1L1wnZA8QnBMA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=scubpY9AipH5arwPimfvgOqGXdekA74Qvo4g5PqQWtvo6IEJehV+chlP/muPo45GQ
	 KZpqxvvasj0KnKE/W5nWOQHRrZMOBTUfscdNqW0jYmVDUR4LsO2FrK16TxNc0Cpqu4
	 hpRwbjly31PKgMmzSAJIKBzfymWUusi0Pe0DmSei7ngDHAy7UfJSjHjMpgKIV3MqE5
	 PzGd5ZeKluO3tlJLXs5mrRqcpZyeIh9DjMm2rpISjeZucV/TCwtVvZxcQS3wcz6h3O
	 NAhV/UJ6PwNL3TPnUNPTWw6cHLCM8emvUxsUrui2hV10epfT04nD2mPtPokzZttFew
	 hZr3qw8xRlalQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20BB9406AB;
	Wed,  7 Oct 2026 08:09:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B87F132F
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 08:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 121FC80DB5
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 08:03:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b2hjcddvCZtH for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 08:03:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BF63480A90
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791360188;
 b=d+c/Hi44iNik/dV7ihVLLspxPR+OtwuSxbfZ7zAQKx1OaKlywe7RoCJtP94Kg/UDg8Bz
 5rHJar+6WIB4aWiGY4DOYizyZwqM6am61T8rdlUpkIfFc8KynHsOGcufFMYOHqCpx/mGd
 tuL5t4w5ObqvoRQ8xBshI41db+y/reYCVJ9de3eoswtZxwM82gkUCjtXzjyVuDnx4Boj0
 0+NZWqQtEpWn2rqvNf9GAbadHz+BEjmJ17GIeJTqamiWIJwBV6531LEgjKUz1o8Tk9l6N
 92nJvEIahBHWMe04gV0Q8wb8qBdlVxZb4APWiJHq1xm5eMzlcgIKq+N2mA2F364AdEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791360188;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=ZUHYZNMR/C6DQ/OOxXmlcYaiiHaaV/Q/GWRu5fHQpOc=;
 b=KUpUnma0nEDTGnyLr24kLwufCzsymyrez1+FeOd24TFSajMbLMWqBiPZmxgGvMS3OPlm
 FZcMfVmi3NyT3HRNDqoFShmhtBliDzO9A2v2CVoFFFEmcDY7Rg7ZsbR7X9LnTfcIzIlIO
 8DO683GN2odrkz1jvbitGBxZrkrZgDca07ryUEfWTuXPS4ay9ln5jjCG2jEtRYJOVQKqR
 CLXSqMFWMyRKjqafPqj+VESWXZgYE1VkIqYM+K33GqHkd8tyT4kSWqmgobtFTw7lfOWgN
 sgMiwdi+8NIw0e/SmiQprzZyvce9ayBZeSJahamZXo3mMmdTh54x08mEfVwOT1tdLzA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=PUCegeqW; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF63480A90
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 08:03:07 +0000 (UTC)
Received: from smtpout-01.galae.net (unknown [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 1FBD81A116F
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 07:54:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D1B216074B;
 Wed,  7 Oct 2026 07:53:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 93FD010333956; 
 Wed,  7 Oct 2026 09:53:45 +0200 (CEST)
Date: Wed, 7 Oct 2026 09:53:44 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <asX6R74TC4XMSXDo@windsurf>
References: <20261006195933.2225477-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006195933.2225477-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/rust: use cargo environment
 during installation
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Oct 06, 2026 at 01:59:33PM -0600, James Hilliard wrote:
> Pass HOST_PKG_CARGO_ENV to x.py dist, as is already done for x.py build.
> This ensures Cargo uses Buildroot's configured CARGO_HOME instead of
> falling back to the user's default cache, and keeps the host RUSTFLAGS
> consistent between the build and installation steps.
> 
> Fixes:
>  - https://autobuild.buildroot.net/results/02b/02b2fc6ba7329852d7bf6ae4935c120c4de47b3e
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Thanks for the patch. Since when does this problem exist? Of course it
exists since x.py support was introduced, but did it become visible
because of a new package, or package update?

As it's a fix, we need to have sufficient information in the commit
message about which commit introduced the issue, so that our LTS
branch maintainers can understand whether it needs to be backported or
not.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
