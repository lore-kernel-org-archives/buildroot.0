Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41473C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 14:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDFBA414FE;
	Mon,  5 Feb 2024 14:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDFBA414FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bNh7oChIc-g9; Mon,  5 Feb 2024 14:38:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D92AC40AA4;
	Mon,  5 Feb 2024 14:38:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D92AC40AA4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 209701BF2F0
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E592082605
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E592082605
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K7t_oMlNkq3o for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 14:38:09 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81CD88267C
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 14:38:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81CD88267C
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4F3940009;
 Mon,  5 Feb 2024 14:38:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rX06n-00CJPc-1X;
 Mon, 05 Feb 2024 15:38:05 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
References: <20240105101105.6a181dcd@windsurf>
 <20240107105539.1214363-1-thomas@devoogdt.com>
Date: Mon, 05 Feb 2024 15:38:05 +0100
In-Reply-To: <20240107105539.1214363-1-thomas@devoogdt.com> (Thomas Devoogdt's
 message of "Sun, 7 Jan 2024 11:55:37 +0100")
Message-ID: <874jent1rm.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v6 1/3] package/cairo: bump to 1.17.4
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

 > News:
 >  - https://www.cairographics.org/news/cairo-1.17.2/
 >  - https://www.cairographics.org/news/cairo-1.17.4/

 > !! This is a bump to a snapshot release: 1.17.4.

 > But it is the first version that supports meson,
 > and the only version that supports both meson and autotools.

 > This is just an intermediate bump in order to
 > switch over to meson in a later commit.

 > Patches:
 >  - drop 0001-fix-nofork-build.patch, upstream: [1]
 >  - drop
 > 0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_apply_variation.patch,
 > upstream: [2]
 >  - add 0003-cairo-ft-private.h-fix-missing-FT_Color-error.patch, upstream: [3]

 > [1]:
 > https://gitlab.freedesktop.org/cairo/cairo/-/commit/cb2357f481396820ec954dc4b69eafc01a8d162a
 > [2]:
 > https://gitlab.freedesktop.org/cairo/cairo/-/commit/90e85c2493fdfa3551f202ff10282463f1e36645
 > [3]: https://gitlab.freedesktop.org/cairo/cairo/-/issues/792

 > Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
 > ---
 > v5: split in 3 commits: https://lore.kernel.org/buildroot/20240105101105.6a181dcd@windsurf/
 > ---
 >  ...r_tolerance_normalized-fix-infinite.patch} |  0
 >  package/cairo/0001-fix-nofork-build.patch     | 29 ----------------
 >  ...-Fix-mask-usage-in-image-compositor.patch} |  0
 >  ...vailable-in-cairo_ft_apply_variation.patch | 33 -------------------
 >  ...private.h-fix-missing-FT_Color-error.patch | 32 ++++++++++++++++++
 >  package/cairo/cairo.hash                      |  6 ++--
 >  package/cairo/cairo.mk                        | 10 +++---

You forgot to update the .checkpackageignore file. Committed with that
fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
