Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D942CC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A76BD4199A;
	Wed,  5 Feb 2025 11:50:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yTw-oJ_A7smd; Wed,  5 Feb 2025 11:50:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A26BA419DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A26BA419DC;
	Wed,  5 Feb 2025 11:50:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9205CCD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7445E40928
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uKEIzc_29bQD for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:50:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 15C9F4022B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15C9F4022B
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15C9F4022B
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:50:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C8DB343284;
 Wed,  5 Feb 2025 11:49:59 +0000 (UTC)
Date: Wed, 5 Feb 2025 12:49:59 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>
Message-ID: <20250205124959.414df5fe@windsurf>
In-Reply-To: <20250205112619.27018-1-peter@korsgaard.com>
References: <20250205112619.27018-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhkeelhfeifeehffdthfehhfdvteeuvdetveduvdekhfffvddtgeeigfekleekteenucffohhmrghinhepsghuihhlughrohhothdrnhgvthdpsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhr
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738756200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A0anWHUGp/4K12sx6jstN9dzJml1S2+IeBfrGhmJovI=;
 b=hSysWdM/AOWNsVoi6rWam84cC9blpylvRevg5pPmcOPDZRnvNfi2rWVufC1LGxW5FJj0oI
 fBqY3RSNehAOCf2lrDQf1MyTHnzRueE/grsEYU14R9PPIxAW7cG5YTdGs81lRCXp/ayzW8
 jqpyrPfk7OCxtLpW7GDJ8c7G//sQfPMJWqpgSJrW36CmrCgL+0+SjxkGAVrFZq5kKSpeQb
 NnChSkintqRQb31bdErfJwmsoBL7OaGxna56JyG6higxjcZY/Re6Ggpnvb9CkGB8Qw/PBF
 nuywisenfmZGpn91rDZV8khC6uPQqoivNRprewIwCTWk0/lXqOX6eHikcHT7jw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hSysWdM/
Subject: Re: [Buildroot] [PATCH] package/swipl: fix build without C++
 compiler
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

On Wed,  5 Feb 2025 12:26:18 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes http://autobuild.buildroot.net/results/b24a96b999676990995a466686fe1eacf6cddfef
> 
> Some of the optional packages in swipl are written in C++, so CMake thinks a
> C++ compiler is needed even though we build with -DSWIPL_PACKAGES=OFF.  Add
> -DCMAKE_CXX_COMPILER=true to satisfy this check even in setups without C++:
> 
> -- Check for working CXX compiler: /usr/bin/true
> -- Check for working CXX compiler: /usr/bin/true - works
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/swipl/swipl.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Thanks, but you need to specify since when this problem started
occurring, so that whoever is going to evaluate this patch for backport
to our LTS branch will know what to do :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
