Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D0DC83F26
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 21:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D998B81225;
	Mon, 28 Jul 2025 21:20:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OlZiuXZKmLWF; Mon, 28 Jul 2025 21:20:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FF9B81258
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FF9B81258;
	Mon, 28 Jul 2025 21:20:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CD7F432
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 21:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F271360D6B
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 21:20:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cmpKdQLQ65yy for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 21:20:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 39DD660D68
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39DD660D68
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39DD660D68
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 21:20:45 +0000 (UTC)
Received: by nyx.n621.de (Postfix, from userid 1000)
 id 944E6E006B0; Mon, 28 Jul 2025 23:20:43 +0200 (CEST)
Date: Mon, 28 Jul 2025 23:20:43 +0200
From: Florian Larysch <fl@n621.de>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Message-ID: <20250728212043.uxfacpm3fovokhcq@n621.de>
References: <20250725184609.3794-1-fl@n621.de>
 <20250728225205.2c22044b@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250728225205.2c22044b@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1753737643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/LhKGFVT0J77HgvpEYOeuCzn9Vp0/zzTNxzQFZ8SOqU=;
 b=TIpyElLCrNUhx5aOWzuBXBFY20K9VJqe7tI/vqjYGWVVyb084s0dxPOVAsmjky4OZpul+W
 d6s+7TLecvQWGhVS27EBjP/t7FJ/ZWvTwTn3q4xkrtuBwCG6qIBonKHbbJavPUMjKtuYN0
 YQVHpJGF6P5RWJDWD+Uq43hUCGYH1hY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=TIpyElLC
Subject: Re: [Buildroot] [PATCH 1/1] package/libmbus: switch to git repo
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

thank you for taking a look at the patch!

On Mon, Jul 28, 2025 at 10:52:05PM +0200, Thomas Petazzoni wrote:
> However, shouldn't we also update the link in
> package/libmbus/Config.in?

I'm not sure. The libmbus repo still links to that page and when it was
working earlier this year, it seemed much more "official"/useful
(including examples and rendered documentation) than what e.g. the
README in the repo provides. I don't know how much hope there is for it
to come back, but if it does it would be the better place to point
somebody at.

Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
