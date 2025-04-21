Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9206EC369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 21:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A25940537;
	Mon, 21 Apr 2025 21:27:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3D6Zj8phE5eS; Mon, 21 Apr 2025 21:27:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AB09404F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AB09404F4;
	Mon, 21 Apr 2025 21:27:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DA711A0
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FBE4404E8
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:27:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M6S-Qr9IVASK for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 21:27:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5AE7240537
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AE7240537
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5AE7240537
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:27:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 534C743A65;
 Mon, 21 Apr 2025 21:27:00 +0000 (UTC)
Date: Mon, 21 Apr 2025 23:26:59 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org
Message-ID: <20250421232659.43f4ef55@windsurf>
In-Reply-To: <20250325101116.791637-2-thomas@devoogdt.com>
References: <20250205163750.6072f1bc@windsurf>
 <20250325101116.791637-1-thomas@devoogdt.com>
 <20250325101116.791637-2-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeduleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffefffdvfeduleekteekudegkefhtdehkefhheeltdevkeffheegteegheevgfdtnecuffhomhgrihhnpehgnhhomhgvrdhorhhgpdhmvghsohhnrdgsuhhilhgupdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehthhhomhgrshesuggvvhhoohhgughtrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlu
 ghrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745270820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SlJsQE0xleeqDHQj7po0Txwb+NTqILbvczDhf/TsUOY=;
 b=RuLCRgVI2uSPswXdSbe+XozY0bSCOkxl8EKHSXLIHx4HK03aqVOZDM5cMcuN82fjXZCmBD
 zmFI8TisCNvtT3+jggyTjCCy0pC/+ZZ49XvatklQobGC0RpX8II+upXP1hz6cG850e6zgV
 HfeLuM8CMYyVq7HHmJqtDsrhe3i1PeDW0lI6SZjat6R0ByNQowdZS+OCsZ4H9N4Ic92kCH
 NCc7Xado3JkdKm2s+DuENctpI7i5/DG3brGmHfmHUYYri5xx2RG3OXq9TUgp15sMgSwnXg
 w5IfG+Rvbzb48zahPAVhfFzuVgigePX6QZPgTtrEvsZJpplqttXnpozM9AcAAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RuLCRgVI
Subject: Re: [Buildroot] [PATCH v2] package/libgtk4: bump to 4.18.2
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

Hello Thomas,

On Tue, 25 Mar 2025 11:11:15 +0100
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> https://gitlab.gnome.org/GNOME/gtk/-/blob/4.18.2/NEWS
> 
> Note that libgtk4 never selected BR2_PACKAGE_CAIRO_{PNG,ZLIB} as it is
> not needed thanks to [1]. However, we need to select BR2_PACKAGE_LIBPNG [2].
> In libgtk3, this was indirectly done as libgtk3 selects BR2_PACKAGE_CAIRO_PNG.
> 
> Also, add patches for:
>  - toolchains without fenv.h. [3]
>  - when cairo has been compiled without surfaces. [4]
> 
> [1] https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/7717
> [2] https://gitlab.gnome.org/GNOME/gtk/-/blob/4.18.2/meson.build?ref_type=tags#L450
> [3] https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/7925
> [4] https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/7926
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Thanks for the new iteration!

> diff --git a/package/libgtk4/0002-gtk-gtkcssnumbervalue.c-fix-compilation-if-fenv.h-is.patch b/package/libgtk4/0002-gtk-gtkcssnumbervalue.c-fix-compilation-if-fenv.h-is.patch
> new file mode 100644
> index 0000000000..02d6a25526
> --- /dev/null
> +++ b/package/libgtk4/0002-gtk-gtkcssnumbervalue.c-fix-compilation-if-fenv.h-is.patch
> @@ -0,0 +1,106 @@
> +From e76e2c0c8afad80c6918890e443418e4f78c97c3 Mon Sep 17 00:00:00 2001
> +From: Thomas Devoogdt <thomas@devoogdt.com>
> +Date: Fri, 15 Nov 2024 08:22:40 +0100
> +Subject: [PATCH] gtk/gtkcssnumbervalue.c: fix compilation if fenv.h is missing
> +
> +../gtk/gtkcssnumbervalue.c:29:10: fatal error: fenv.h: No such file or directory
> +   29 | #include <fenv.h>
> +      |
> +
> +Upstream: https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/7925
> +Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

The feedback from upstream on this was pretty negative, and having to
maintain this forever doesn't seem like a great idea. There's already
quite a few packages that need fenv.h, and we for now address that with
ad-hoc architecture exclusions. Maybe it's time to bite the bullet, and
have some proper BR2_TOOLCHAIN_HAS_FENV_FE_DOWNWARD, etc so that we can
clean up all those dependencies?

You can "git grep fenv" in Buildroot to see the packages that have
fenv-related issues.

And yes, that means libgtk4 would not be available for certain
architecture/libc combinations, and I think that's fine.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
