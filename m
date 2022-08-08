Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D21C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 20:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F24A9402B1;
	Mon,  8 Aug 2022 20:50:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F24A9402B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CZ6sX2hFzLjt; Mon,  8 Aug 2022 20:50:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0AC61401DF;
	Mon,  8 Aug 2022 20:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AC61401DF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA3561BF283
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C22F94015F
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:49:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C22F94015F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x7_JHQbAZ4T7 for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 20:49:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46591400A8
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46591400A8
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 20:49:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4DA161BF208;
 Mon,  8 Aug 2022 20:49:05 +0000 (UTC)
Date: Mon, 8 Aug 2022 22:49:04 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220808224904.12a4699f@windsurf>
In-Reply-To: <20220808081141.582053-1-fontaine.fabrice@gmail.com>
References: <20220808081141.582053-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659991745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ni2nyOPGlQKpydhAqM5C/KSJWNSD0CB46mmeJvGAVRE=;
 b=Wf1PKYMLOs5IwuoIGR+rTQeePFA9SllAFBBMVzrYJEVgNiAD6YZdQ9+aMgtZz6vTxkHgaA
 r08HjIGBFNg+QWAXXcYWagn8TydPlq0SyrvSjD+j0J9sFn2vOC2H29QiK/4FmfdOg9sKu8
 11+JjmoDRBwNv+m97CVvtvc/p5zuN0Mi3hnKjUCH407baTjfO3+UjHIbLtiVG7CktDeZs/
 fMNTf4CKax2RdeaVKsx5AMPUA31quXIV5d8M6J535FEjMS8ibFfauCegGCK9gfRDHnIn7c
 fl9oyeA+I8cAn6qgq/I7CEmOKfvtbgooX/kY+bEO4V9m3TiBl+1+Gtw9cX0ATQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Wf1PKYML
Subject: Re: [Buildroot] [PATCH 1/1] package/wolfssl: security bump to
 version 5.4.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  8 Aug 2022 10:11:41 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following vulnerabilities:
>  - [High] Potential for DTLS DoS attack. In wolfSSL versions before
>    5.4.0 the return-routability check is wrongly skipped in a specific
>    edge case. The check on the return-routability is there for stopping
>    attacks that either consume excessive resources on the server, or try
>    to use the server as an amplifier sending an excessive amount of
>    messages to a victim IP. If using DTLS 1.0/1.2 on the server side
>    users should update to avoid the potential DoS attack. CVE-2022-34293
>  - [Medium] Ciphertext side channel attack on ECC and DH operations.
>    Users on systems where rogue agents can monitor memory use should
>    update the version of wolfSSL and change private ECC keys.
> 
> https://github.com/wolfSSL/wolfssl/releases/tag/v5.4.0-stable
> https://www.wolfssl.com/docs/security-vulnerabilities/
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/wolfssl/wolfssl.hash | 2 +-
>  package/wolfssl/wolfssl.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
