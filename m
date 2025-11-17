Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B337CEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 13:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E0F1406E6;
	Mon, 17 Nov 2025 13:01:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yeJ1lU753V10; Mon, 17 Nov 2025 13:01:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDB73406E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDB73406E8;
	Mon, 17 Nov 2025 13:01:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 53830D5
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 13:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 396B160D90
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 13:01:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ajnfaQmLC5y6 for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 13:01:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E16A860C34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E16A860C34
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E16A860C34
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 13:01:51 +0000 (UTC)
Received: by nyx.n621.de (Postfix, from userid 1000)
 id F22B1E003AE; Mon, 17 Nov 2025 14:01:47 +0100 (CET)
Date: Mon, 17 Nov 2025 14:01:47 +0100
From: Florian Larysch <fl@n621.de>
To: thomas.petazzoni@bootlin.com
Cc: buildroot@buildroot.org
Message-ID: <20251117130147.n6gecdrdho546h4u@n621.de>
References: <20250527152342.4288-1-fl@n621.de>
 <20250531143928.25446-1-fl@n621.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250531143928.25446-1-fl@n621.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1763384508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ncXGj3XB9z5dcZ3OnpHT0qNhSv0WYYvLOV+yCZlQKMs=;
 b=Pm/hzchdobVE33QV5Sj0+ISY8QA8/P3a0B5KIxqSizWhaxK8f5ce3AkhW3p6E2gA2xImP8
 u0MF/6Fs9THuunlWtmxtOoFGAlQ9OTVDK15y44NN2AabmWF/iSbe5vmRe5Oe9CEXUPKwFY
 w8lcCBDrXdP9ur0ufhpS3jt8RfPH/+Q=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=Pm/hzchd
Subject: Re: [Buildroot] [PATCH v2 0/2] package/network-manager: make crypto
 library optional
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

Hi Thomas,

how do you feel about the v2 of this series? I've been carrying it in
our internal tree for a while now and I'd like to minimize the diffs to
upstream, so an ACK or NACK would help me to know whether I should keep
or drop it.

Thanks!

Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
