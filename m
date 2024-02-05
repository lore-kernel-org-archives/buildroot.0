Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A2FC48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 14:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E455B41859;
	Mon,  5 Feb 2024 14:49:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E455B41859
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ay8Y5s0hjbMJ; Mon,  5 Feb 2024 14:49:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D6D641802;
	Mon,  5 Feb 2024 14:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D6D641802
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A78251BF2F0
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D9C68254A
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:49:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D9C68254A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pYKcPbPAW1is for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 14:49:24 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5928782451
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 14:49:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5928782451
Received: by mail.gandi.net (Postfix) with ESMTPSA id 01620FF80D;
 Mon,  5 Feb 2024 14:49:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rX0Hh-00CKO5-1t;
 Mon, 05 Feb 2024 15:49:21 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
References: <20240105101105.6a181dcd@windsurf>
 <20240107105539.1214363-1-thomas@devoogdt.com>
 <20240107105539.1214363-2-thomas@devoogdt.com>
Date: Mon, 05 Feb 2024 15:49:21 +0100
In-Reply-To: <20240107105539.1214363-2-thomas@devoogdt.com> (Thomas Devoogdt's
 message of "Sun, 7 Jan 2024 11:55:38 +0100")
Message-ID: <87zfwfrmoe.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v6 2/3] package/cairo: move to the meson
 build system
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, yann.morin.1998@free.fr,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org, aperez@igalia.com,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:

 > Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
 > ---
 > v2: added -std=gnu11 (allow inline int declaration in if loop, 99
 > caused some directives problems)
 > v3: enabled host-zlib, needed for librsvg
 > v4: also added gnu11 for host-cairo compiling (fixes my compilation on
 > a gcc 4.9.2 based system)
 > v5: split in 3 commits: https://lore.kernel.org/buildroot/20240105101105.6a181dcd@windsurf/
 > v6: fix host-zlib option (again)
 > ---
 >  package/cairo/Config.in |  34 ++++----
 >  package/cairo/cairo.mk  | 168 ++++++++++++----------------------------
 >  2 files changed, 66 insertions(+), 136 deletions(-)

 > diff --git a/package/cairo/Config.in b/package/cairo/Config.in
 > index 0c87a2904b..caa6c37195 100644
 > --- a/package/cairo/Config.in
 > +++ b/package/cairo/Config.in
 > @@ -4,6 +4,7 @@ config BR2_PACKAGE_CAIRO
 >  	select BR2_PACKAGE_FONTCONFIG
 >  	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 >  	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 > +	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_XORG7

How come the change of build system adds libxrandr? This needs to be
described in the commit message.


>  	help
 >  	  Cairo is a 2D graphics library with support for multiple
 >  	  output devices. Currently supported output targets include
 > @@ -15,34 +16,35 @@ config BR2_PACKAGE_CAIRO
 
 >  if BR2_PACKAGE_CAIRO
 
 > -config BR2_PACKAGE_CAIRO_PS
 > -	bool "postscript support"
 > -	select BR2_PACKAGE_ZLIB
 > -	select BR2_PACKAGE_CAIRO_PDF
 > -
 > -config BR2_PACKAGE_CAIRO_PDF
 > -	bool "pdf support"
 > -	select BR2_PACKAGE_ZLIB

Please don't move options around. They were indeed not alphabetically
sorted, but after your move it is even worse. You are also changing a
number of dependencies without any clear (to me) reason?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
