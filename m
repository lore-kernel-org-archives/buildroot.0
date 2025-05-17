Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFF2C3ABDA
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 11:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F187560D68;
	Sat, 17 May 2025 11:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N53WdZhGeloA; Sat, 17 May 2025 11:16:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 177A4607B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 177A4607B0;
	Sat, 17 May 2025 11:16:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 35701E4
 for <buildroot@buildroot.org>; Sat, 17 May 2025 11:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25F6940CD0
 for <buildroot@buildroot.org>; Sat, 17 May 2025 11:16:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lZPbaGYNT3cv for <buildroot@buildroot.org>;
 Sat, 17 May 2025 11:16:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ECC764080E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECC764080E
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ECC764080E
 for <buildroot@buildroot.org>; Sat, 17 May 2025 11:16:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8648143147;
 Sat, 17 May 2025 11:15:58 +0000 (UTC)
Date: Sat, 17 May 2025 13:15:57 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Phil Eichinger <phil.eichinger@gmail.com>
Message-ID: <20250517131557.0aaee5c2@windsurf>
In-Reply-To: <20250425192458.2276762-1-ju.o@free.fr>
References: <20250425192458.2276762-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudehgeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveetveetgffhjeevkeegvdekkeehgeetieehtefgueduhfefteekgfekfeehuedtnecuffhomhgrihhnpehfuhhkuhgthhhirdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepp
 hhhihhlrdgvihgthhhinhhgvghrsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747480558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ripzlKWboLo8FLYCM2G/YkEyulbnUbavguobU/jGxmY=;
 b=ITi0dMa8ezvjfBg1BRBy0xzzgigmi5ix6rp9cgMoD6POoO7ufj+z+rcWq4iVa3chniOhLP
 w48T6CFXkSAAqFF2h2e6NeX9L75tj4Wv5EFeyvErkrrAZ6FNKg6CyAG7NdS2Et8AB+jpBi
 JeYyJfPPExC18D4TjQkbZRfYsBuTNXQhAT/0EVBQHpO29vrLOu3CpgIYmtC7FC3L+9jhog
 pcLp5/6brzsyqyJ8ULf1Vh67b02+O3f0B4khgX++pH725r/+BKyWwjI/+MoX5kzWFIniGv
 uKwFKI3FuPg+R6Be/Js6gan5H+pvAW9lZYURzsR0yOoRnLl3iQvbOZN9OBtR7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ITi0dMa8
Subject: Re: [Buildroot] [PATCH 1/2] package/libqrencode: update Config.in
 homepage url
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

On Fri, 25 Apr 2025 21:24:57 +0200
Julien Olivain <ju.o@free.fr> wrote:

> The old home page url [1] redirects to https, and points to the
> japanese version of the site.
> 
> The commit updates this url to the https english version of the
> site [2].
> 
> [1] http://fukuchi.org/works/qrencode/index.html
> [2] https://fukuchi.org/en/works/qrencode/
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/libqrencode/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
