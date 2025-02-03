Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E02C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 22:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9635E60EF6;
	Mon,  3 Feb 2025 22:19:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eTrEwF_z5Vwy; Mon,  3 Feb 2025 22:19:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0349960ED5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0349960ED5;
	Mon,  3 Feb 2025 22:19:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 05837185
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 22:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0064740102
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 22:19:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kbpuK4Yww7k3 for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 22:19:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BE1DA403A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE1DA403A5
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE1DA403A5
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 22:19:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A571A44249;
 Mon,  3 Feb 2025 22:19:18 +0000 (UTC)
Date: Mon, 3 Feb 2025 23:19:17 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <20250203231917.61ae8dad@windsurf>
In-Reply-To: <20250130182250.189182-1-bernd@kuhls.net>
References: <20250130182250.189182-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelgfetjedvuefgteegieejgffftdejhfeghfeikeehjedtteffudeiheelvedtudenucffohhmrghinhepmhgvshhonhgsuhhilhgurdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppeduleegrdejkedrvdduuddrvddvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleegrdejkedrvdduuddrvddvtddphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsvghrnhgusehkuhhhlhhsrdhnvghtpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegvrhhitgdrlhgvrdgsihhhrghnrdguvghvsehfrhgvvgdrfhhr
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738621158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yj3frUlKLQWkv1/FyUuCFciFJBy/2PkhcD6dgW6RCZs=;
 b=boapbVuc3eN+86V+irSrPPNIbTVAm+7UqhW15asC/IP50ddL2EbPVvsF4CZzrK6xnqF7ay
 zSo1MFknQ4EQxhUsRkJobQkyCnbu8UaAVwx1gwoL2wI7jf/TsrMhNZPEQpRn18hQJaP7hx
 uLAhheBg5VQmbKKC/qPyFvQaGok3SISNvaIoo1CoWxN3P18z5UEFhAwDnDaYq6wnIcXQGq
 NbeKizatbvgKNZn2gXCaTWHnw/gKBquX1fjmSPHYm6gfxGWOYIOYZN78HtmQUORaf2XwMW
 i0e+Yg3730t58JtCxgAfFmOaUfuFPlj7pUbc5P/xPJN9oKPRjrGLPlMxyBjk9Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=boapbVuc
Subject: Re: [Buildroot] [PATCH] package/meson: bump version to 1.7.0
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

On Thu, 30 Jan 2025 19:22:50 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Rebased patch 0001.
> 
> Release notes:
> https://mesonbuild.com/Release-notes-for-1-7-0.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...Prefer-ext-static-libs-when-default-library-static.patch | 6 +++---
>  package/meson/meson.hash                                    | 4 ++--
>  package/meson/meson.mk                                      | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)

I applied to master... but of course a Meson version bump is always a
bit risky. Could you keep an eye on the autobuilders in the next few
days, and see if there's some obvious fallout from this?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
