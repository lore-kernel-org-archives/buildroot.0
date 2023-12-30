Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BD8C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 18:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE0F36103E;
	Sat, 30 Dec 2023 18:03:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE0F36103E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QJ9gPH2sTxoq; Sat, 30 Dec 2023 18:03:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E4EB60F69;
	Sat, 30 Dec 2023 18:03:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E4EB60F69
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C33A91BF2F8
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F28B81E84
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:01:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F28B81E84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gRUCOwpPENw6 for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 18:01:48 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5FEDB81E82
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 18:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FEDB81E82
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4FE571BF205;
 Sat, 30 Dec 2023 18:01:45 +0000 (UTC)
Date: Sat, 30 Dec 2023 19:01:44 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231230190144.5fdb29d9@windsurf>
In-Reply-To: <20231227225940.1683593-1-fontaine.fabrice@gmail.com>
References: <20231227225940.1683593-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703959305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I2WC6ntKjey9FBGbkYzJKn4pN5MicMh9odSD6mnFrcw=;
 b=oTUbl80e4i2FMrXfN0LyKmlKwP3zhBs1HGVB+y6Ga5ljHzdAytHX9dhbmtHqjIZ6gr5SB2
 btLdSpIUm6nlDXv8WVujpi+mlp0b62oN4u8ggcb3C7ABTQpw1o7XdN3dxOZ5Srm2G5JNet
 rxzC38vhtUKn/u43Y0sl+/nSVK2NS5zyVTLeMPkQSnRr/9V+pUoeI/0MBRjvOzWdr2VQRr
 1o2wPJvLGaeKRhwLEiEHxcYHzrbdzvf1xwZtkJs/S7Rh9Mpy7JzWPcPFNru6o+yPurBOF/
 rtQKh1u/7SRsc7fp4flTVf4P3H6FrDRRdz9WefQBmYrKK6nGBWMcxt37YMWtuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oTUbl80e
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/libostree: switch to libsoup3
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Dec 2023 23:59:39 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libsoup3 is supported since bump to version 2023.3 in commit
> 618eb375a046cc4ff007758510c883788e6ff690 and
> https://github.com/ostreedev/ostree/commit/d0ea2db4300eb7871b59d0b997a7f06869120297
> 
> So switch to libsoup3 and drop libsoup2 as:
>  - libsoup2 is unmaintained (as stated by commit
>    b45c2a048d02a0e30da8534b5c048d048b252452)
>  - libsoup2 will be removed at some point (as stated by commit
>    f93380ab1a36bdd019cfbc651a9df5904096e189)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Update commit message and explain why libsoup2 is dropped

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
