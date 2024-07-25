Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A603CC3DA5D
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 05:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28C1C4067B;
	Thu, 25 Jul 2024 05:51:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 386EQKdItQHY; Thu, 25 Jul 2024 05:51:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8FF1406CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8FF1406CD;
	Thu, 25 Jul 2024 05:51:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5AEED1BF484
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 05:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A372401FE
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 05:51:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W8Y_grw3Yn7H for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 05:51:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F045D400E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F045D400E5
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F045D400E5
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 05:51:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 71C12E0002;
 Thu, 25 Jul 2024 05:51:13 +0000 (UTC)
Date: Thu, 25 Jul 2024 07:51:12 +0200
To: Brandon Maier <brandon.maier@collins.com>
Message-ID: <20240725075112.576a95cf@windsurf>
In-Reply-To: <20240724-revert-output-gitignore-v1-1-510a2795884c@collins.com>
References: <20240724-revert-output-gitignore-v1-0-510a2795884c@collins.com>
 <20240724-revert-output-gitignore-v1-1-510a2795884c@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721886674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pnjznPN36ZdbU9TlfR7IaQ54I4gHD4jq67CrTVNqybY=;
 b=kKq4PfCt2uR3xNQS1C2E0AkzrI9DLW0ZE19xoVJ4cPtNhTegWtj6JpHmf5QZpfcIwmKuXB
 1+JUHtgvkFWxW34LPPvK+mBnoxJG3fMghIqzhkkeKN32wHu9fD0PYSTVaaE1WyE11MFju9
 3uehNe6JZENtOLJHhyMxTNpjSE2l0NpgQ8KP90fc/3vHnFNhIDIzKjIPTFHSho8E69Q3Ru
 mCy062AKn/GQyyaqs5rM4j415mkWbJM6QyIcM655bHUNQHT90p3C44gKdQho6aIhvMbLRc
 GoMgpMASfdCtX0yLLu+M4DpguQIvDZ1N35elXlwycHyYe8Q9PAqpeOkkR8h1+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kKq4PfCt
Subject: Re: [Buildroot] [PATCH 1/2] Revert "Create a .gitignore file in the
 CANONICAL_O directory"
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
Cc: Bryan Brattlof <bb@ti.com>, Romain Naour <romain.naour@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, "Yann E.
 MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Brandon,

On Wed, 24 Jul 2024 21:23:20 +0000
Brandon Maier <brandon.maier@collins.com> wrote:

> The packages 'python-jsonschema-specifications', 'pydantic-core', and
> likely other packages based on Python maturin silently stopped
> installing files to the host and target directories after commit
> a14c862c08.
> 
> A similar issue was reported by the Conda project[1]. It seems some
> build tools scan for gitignore files to decide what files to build
> and install.
> 
> I attempted various combinations of gitignore patterns including
> mimicking the Conda project's gitignore[2], but the only thing that has
> worked reliably is the original `/output` ignore in the root Buildroot
> directory.

Thanks for working on this. However, it's really messed up. Why would
these tools be bothered by a .gitignore file? Do you have some more
details?

I think I'm going to apply the revert to fix the immediate build
issues, but I would really really like to fix the real problem, and
allow us to generate this .gitignore file in the output directory.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
