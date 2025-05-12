Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C6DC3ABC3
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 22:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2E53813CE;
	Mon, 12 May 2025 22:44:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id puyTAJWSBWGA; Mon, 12 May 2025 22:44:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2230681F3C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2230681F3C;
	Mon, 12 May 2025 22:44:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D3D4D150
 for <buildroot@buildroot.org>; Mon, 12 May 2025 22:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFA3540B39
 for <buildroot@buildroot.org>; Mon, 12 May 2025 22:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xbseaOGvCUDo for <buildroot@buildroot.org>;
 Mon, 12 May 2025 22:44:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C296D405A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C296D405A9
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C296D405A9
 for <buildroot@buildroot.org>; Mon, 12 May 2025 22:44:45 +0000 (UTC)
Received: by nyx.n621.de (Postfix, from userid 1000)
 id D5A53E00346; Tue, 13 May 2025 00:44:42 +0200 (CEST)
Date: Tue, 13 May 2025 00:44:42 +0200
From: Florian Larysch <fl@n621.de>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20250512224442.ddlpkis5za6aiatu@n621.de>
References: <20250512214829.462894-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250512214829.462894-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1747089882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rc7Ywa1TXleg5M+NQss2r9Ev9l9jgdKXKRH5iVfjmKg=;
 b=p2mYNb8I3FHxxo3Pkc9Q2c5fu3YQ++qswRLiS4knqcZKFhajbWP+vpWifSK7az2LfCcWo+
 nNJal/0RdayAchIxcr4OZMOMtscS1r0bqN/F40md7thQ14KvqZEt0TDkktfxzL5CY7Po7l
 PuDQBQTqOdHrt98BMjeHUL+E42mRW8Q=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=p2mYNb8I
Subject: Re: [Buildroot] [PATCH] package/dbus-glib: bump version to 0.114
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

I submitted this in [1] but this is a better approach since I didn't
also track the new license files. So I guess:

Tested-by: Florian Larysch <fl@n621.de>

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20250507194456.11172-1-fl@n621.de/

On Mon, May 12, 2025 at 11:48:29PM +0200, Bernd Kuhls wrote:
> Updated license files and hashes due to upstream commits
> https://cgit.freedesktop.org/dbus/dbus-glib/commit/LICENSES?id=ad08ba0c6ba2d69783d41254e0cf03b2ae1647db
> https://cgit.freedesktop.org/dbus/dbus-glib/commit/COPYING?id=ad08ba0c6ba2d69783d41254e0cf03b2ae1647db
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/dbus-glib/dbus-glib.hash | 6 ++++--
>  package/dbus-glib/dbus-glib.mk   | 7 +++++--
>  2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/package/dbus-glib/dbus-glib.hash b/package/dbus-glib/dbus-glib.hash
> index 072dde3d69..1ce3c6b63d 100644
> --- a/package/dbus-glib/dbus-glib.hash
> +++ b/package/dbus-glib/dbus-glib.hash
> @@ -1,5 +1,7 @@
>  # Locally calculated after checking pgp signature
> -sha256  7d550dccdfcd286e33895501829ed971eeb65c614e73aadb4a08aeef719b143a  dbus-glib-0.112.tar.gz
> +sha256  c09c5c085b2a0e391b8ee7d783a1d63fe444e96717cc1814d61b5e8fc2827a7c  dbus-glib-0.114.tar.gz
>  
>  # Locally calculated
> -sha256  589bc300214a8b9ecd121f51570fe6342617487fd8fc0fb1f4ec26a13d5b96f8  COPYING
> +sha256  095e2affe38031d0ca80db5dbf06881306e5f5125f6ba422297396bdfe02b3d5  COPYING
> +sha256  93bb4f7417aa775bab9026cc3d0af28aeb64451fc5a8ec651876785edd8eaf9b  LICENSES/AFL-2.1.txt
> +sha256  aaf135472f81c5b4a0dca9367e5bb5e9750032b5bebe5442b36e4c0a47430df3  LICENSES/GPL-2.0-or-later.txt
> diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
> index 0d247e1d89..5c13c0b37f 100644
> --- a/package/dbus-glib/dbus-glib.mk
> +++ b/package/dbus-glib/dbus-glib.mk
> @@ -4,11 +4,14 @@
>  #
>  ################################################################################
>  
> -DBUS_GLIB_VERSION = 0.112
> +DBUS_GLIB_VERSION = 0.114
>  DBUS_GLIB_SITE = http://dbus.freedesktop.org/releases/dbus-glib
>  DBUS_GLIB_INSTALL_STAGING = YES
>  DBUS_GLIB_LICENSE = AFL-2.1 or GPL-2.0+
> -DBUS_GLIB_LICENSE_FILES = COPYING
> +DBUS_GLIB_LICENSE_FILES = \
> +	COPYING \
> +	LICENSES/AFL-2.1.txt \
> +	LICENSES/GPL-2.0-or-later.txt
>  DBUS_GLIB_CPE_ID_VENDOR = freedesktop
>  
>  DBUS_GLIB_CONF_ENV = \
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
