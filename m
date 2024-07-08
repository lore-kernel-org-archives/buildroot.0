Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03AAC3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 21:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86D9040233;
	Mon,  8 Jul 2024 21:03:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sblYVnXbmpkU; Mon,  8 Jul 2024 21:03:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49B5440243
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49B5440243;
	Mon,  8 Jul 2024 21:03:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5AA9F1BF390
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4680A811EC
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:03:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c4qyJFwPJ95y for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 21:03:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 17FCE811E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17FCE811E3
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 17FCE811E3
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 21:03:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45F69240003;
 Mon,  8 Jul 2024 21:03:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sQvWI-004nQ8-11;
 Mon, 08 Jul 2024 23:03:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fiona Klute via buildroot <buildroot@buildroot.org>
References: <20240626145942.3154406-1-fiona.klute@gmx.de>
Date: Mon, 08 Jul 2024 23:03:34 +0200
In-Reply-To: <20240626145942.3154406-1-fiona.klute@gmx.de> (Fiona Klute via
 buildroot's message of "Wed, 26 Jun 2024 16:59:42 +0200")
Message-ID: <87ikxfmw9l.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/rauc: select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Fiona Klute <fiona.klute@gmx.de>, Andrey Yurovsky <yurovsky@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fiona" == Fiona Klute via buildroot <buildroot@buildroot.org> writes:

 > This fixes link time errors, undefined references to various ENGINE_*
 > functions (paths shortened to the output directory):

 > host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: librauc.a.p/src_signature.c.o: in function `get_pkcs11_engine.constprop.0':
 > signature.c:(.text.get_pkcs11_engine.constprop.0+0x14): undefined reference to `ENGINE_load_builtin_engines'
 > host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0x20): undefined reference to `ENGINE_by_id'
 > host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0x54): undefined reference to `ENGINE_ctrl_cmd_string'
 > host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0x60): undefined reference to `ENGINE_init'
 > host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0xe0): undefined reference to `ENGINE_ctrl_cmd_string'
 > host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0x128): undefined reference to `ENGINE_free'
 > host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0x1a4): undefined reference to `ENGINE_finish'
 > host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: librauc.a.p/src_signature.c.o: in function `load_cert':
 > signature.c:(.text.load_cert+0x114): undefined reference to `ENGINE_ctrl_cmd'
 > host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: librauc.a.p/src_signature.c.o: in function `load_key':
 > signature.c:(.text.load_key+0x124): undefined reference to `ENGINE_load_private_key'

 > Before linking there were matching implicit declaration warnings
 > during compile.

 > Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
 > ---
 > I assume this is a consequence of
 > 623d3bbe43e9193aa8e3395367d01af59071b859, previously RAUC built fine
 > without the option enabled.

 >  package/rauc/Config.in | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/rauc/Config.in b/package/rauc/Config.in
 > index 7451b29a55..69a65d165b 100644
 > --- a/package/rauc/Config.in
 > +++ b/package/rauc/Config.in
 > @@ -5,6 +5,7 @@ config BR2_PACKAGE_RAUC
 >  	depends on BR2_USE_WCHAR # glib2
 >  	select BR2_PACKAGE_LIBGLIB2
 >  	select BR2_PACKAGE_OPENSSL
 > +	select BR2_PACKAGE_LIBOPENSSL_ENGINES

Rauc can also work with libressl (which always have the engine API
enabled), so we need to only do this if libopenssl is used.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
