Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE67606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 22:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=g3PIo496
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 718CE80AAA;
	Mon, 26 Oct 2026 22:02:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gyOnn-YP6qVo; Mon, 26 Oct 2026 22:02:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 90CFF80CF8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793052135;
	b=a1IBRtnjJIOnRLRMDIbWBZ9/kwab4Y2M0OmWieLJKXWNBkBZ0pK/481TqNY9IjY8iBUm
	 Kd3/7hsaA9VQQhlVK6+BtOGlnKo2GWD/H8Zvvj73hU25Ot2pEYW1z52pJM6ncgK9Y7jJH
	 dJSWZCCJKoqakbQY8bn3f2OtCVEgL0yUcr9uQzTHEMjMzM+Efypk0qgy01699mo4/kj9v
	 2UbNMjwsTfreExtpPYr/m4CQZpjdbeR1+wbA4SrIcd7pqUOdsCQ1UN+p9alFWExGbIj3d
	 XgfeC4lLAXnkXts2OZHcdGKDQeNsotkpsZ+8BcO1Gky5YigQcxZa2pI5eE9DEBxVPHQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793052135;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=vxD2dy+OPA92LUGxQb136sp3ZM2sgNp3BsanW9xZMbs=;
	b=O6VPkVA0OnS09+S0B5Z4y563g/kufw9JjKqTupOs+QSFxTiCYIwrgo+Xd79X1AJI+flr
	 zw/7+SjSZ+NotId/C4KeLP7bBEJPADXB1z2nGmpf3fEe5QbJOSfCvAZqVLpdS9d8O1DSk
	 IAGlK7vKGugAiWxUbvOb2MeymIEuWwVzWrr4lWlB78TpjJk2f0hMux9QDQ9nLVKttdLjJ
	 BP7VPgLJ5CAv2Ch4lJRibcPfAvqg6bkwDdLTiuDZLPF4n80P0O5i3K9eHtcSpf7759dxj
	 dwjx7TLRT28zG4tgCmOnU4xOKQEO7w/Ly2dVuUC8J1KJgUVjNm/qT3yazfQZIxcN+uA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793052135;
	bh=vxD2dy+OPA92LUGxQb136sp3ZM2sgNp3BsanW9xZMbs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=g3PIo496u6UeoJhABDWQgBzLVHUpY3co85a8WJv+owVcMe1YjIj4GyMbdYIBMKqIf
	 45VhpZJoEt3KythSmafzbuT9p6Xb5IKllXzvgVfOO1BvPEJZazpdfSmwS/G42CdIHr
	 YFa1LmIiU3Yvh9SExlnhWIzHN3OLMQmAMXVhWEHcjyn4IUcTWGz3dFK06Me4Wmae7L
	 o+PDwBXU2+YfGA4AWpZAkoXWPrA59g/6MQr85/2npUqOYaby5zgpu0ubDvjZstSXwm
	 sgqkK2VdFyn1bVFC0QgKss+plzkT8fF6Wj0oWjnJYVATIZJwRQbZWc61Q/QiSvyDuJ
	 7A4WLRakrvioQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90CFF80CF8;
	Mon, 26 Oct 2026 22:02:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DD0D3421
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 22:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 841BB80D09
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 22:02:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7mGodZ3K8-VV for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 22:02:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3ACD580AAA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793052133;
 b=X229fouPFas2UAphAlVSk6u7nWZiQbMD72x1jDjtem6AejIMTG0oTTn5BwH67KdEHi0H
 jzMAoQr8fJqY0RZ7NCNni/fi/XhPRtNrLr9WYOHbBmj5AndKGNTrmc9KZptY1V5+xNGxH
 bUkhDqEdbdVwu7IuezeZlDPNroYLQS/pXi/5GEoyU6XZTdV6EsdWIldHFATGWMc4/Fmy8
 3PlvGBrK0c1GYyuHFBvqW3y8WuJdTRWbh2FsbQyfJqk9P8oJU2JKrkwU73fthh+Fcurmg
 Iz4Jm1fD4s05NgS0LG3yNBnYDX2rQ0fSDGGc7dX1dwNtZaF2gxi24DDMGQwvyhC/N6Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793052133;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=GNe28E3r3EfqJemppIVLOLOTG1yP+JGvXbMn5ePNMZ4=;
 b=Eu76JMn4uIvEtZxWILmlGVQ/bzToGNssv11rmbTZ532ecgjRWb6D8ou/A4EYO4eRrJkz
 ywkjWN0HIOfz/yAgYDI+kaq5+xrTx1kGeqIaHQBvNDOByMlue9+7KrHX3IsyPjHO08RHp
 2qA+V3Bfs8dQZRtZkXTLEMH0GjrBKJDo9zL9GyqrVUNd6h0DsTofQUXtNxW9QYZg6KCfI
 zLCnPGSnngpPr6PRmbS6K+G/P6ppLhFGvQtYRkv9C2GdrJeKs5ynrjHlE7GvO/78dLsz2
 Xv78ZcrPOKEgqU0+06QCwwYgFQqJj0f5/i1pzmL/jDtbJwJn6FXM6sTqtJNse9qxd0w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=DyfSnnck; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3ACD580AAA
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 22:02:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4089C1A135A;
 Mon, 26 Oct 2026 22:02:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0558B60740;
 Mon, 26 Oct 2026 22:02:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 50D4F10329092; Mon, 26 Oct 2026 23:02:02 +0100 (CET)
Date: Mon, 26 Oct 2026 23:02:02 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Manuel Diener <manuel.diener@oss.othermo.de>, 
 Oli Vogt <oli.vogt.pub01@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Message-ID: <at_N1R7Td8ScK7Sl@windsurf>
References: <20261003224447.744966-4-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003224447.744966-4-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-django: bump to version
 6.1.1
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

On Sat, Oct 03, 2026 at 04:44:28PM -0600, James Hilliard wrote:
> Update license hash due to JavaScript formatting changes:
> https://github.com/django/django/commit/fc0a0ebd4fe573299a5f978e77fa3bca8424f661
> 
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
