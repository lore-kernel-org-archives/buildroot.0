Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDF7C5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 10:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BB21830B8;
	Fri,  1 Mar 2024 10:54:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sPMe-nEKwDT3; Fri,  1 Mar 2024 10:54:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 525FD830C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 525FD830C1;
	Fri,  1 Mar 2024 10:54:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8116F1BF377
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 10:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D8964062A
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 10:54:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hQH8vp7ABjB7 for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 10:53:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 10FE0405FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10FE0405FC
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10FE0405FC
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 10:53:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F7E8240008;
 Fri,  1 Mar 2024 10:53:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rg0WY-006ink-1k;
 Fri, 01 Mar 2024 11:53:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240106224233.3637602-1-fontaine.fabrice@gmail.com>
 <20240207172418.45613b76@windsurf>
Date: Fri, 01 Mar 2024 11:53:54 +0100
In-Reply-To: <20240207172418.45613b76@windsurf> (Thomas Petazzoni via
 buildroot's message of "Wed, 7 Feb 2024 17:24:18 +0100")
Message-ID: <87wmqm8bp9.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/bayer2rgb-neon: fix aarch64
 build with BR2_OPTIMIZE_0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Eloi Bail <eloi.bail@savoirfairelinux.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Sat,  6 Jan 2024 23:42:33 +0100
 > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

 >> Fix the following build failure with aarch64 and BR2_OPTIMIZE_0 raised
 >> since commit 0512910e4901edcb78bb1daa4eb3be9bdc4dc8a9:
 >> 
 >> src/convert-neon-body-bayer8.inc.h: In function 'bayer2rgb_convert_neon':
 >> src/convert-neon.c:233:17: error: third argument to '__builtin_prefetch' must be a constant
 >> 233 |                 __builtin_prefetch(((void const *)(_addr)) + 64, 0, (_lvl)); \
 >> |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 >> src/convert-neon-body-bayer8.inc.h:8:9: note: in expansion of macro 'do_prefetch'
 >> 8 |         do_prefetch(&in[+1*stride - 1], (rows_per_loop) < 3 ? 3 : 0);
 >> |         ^~~~~~~~~~~
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/307c1c448becd99dfba3a17b3ef816db0bb5cad6
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> package/bayer2rgb-neon/bayer2rgb-neon.mk | 4 ++++
 >> 1 file changed, 4 insertions(+)

 > Applied to master, thanks.

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
