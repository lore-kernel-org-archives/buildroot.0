Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92F8CD1284
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 14:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 012958308D;
	Thu,  4 Apr 2024 14:25:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KAHhyqdmfZ04; Thu,  4 Apr 2024 14:25:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 780CB82222
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 780CB82222;
	Thu,  4 Apr 2024 14:25:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 23B341BF365
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 14:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DF0240124
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 14:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fo7M9mmXF8-O for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 14:25:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 224CD400F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 224CD400F1
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 224CD400F1
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 14:25:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F13D860006;
 Thu,  4 Apr 2024 14:25:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rsO1X-00DcYe-0r;
 Thu, 04 Apr 2024 16:25:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
References: <Zgv9bm3jnAu0_nZo@antipodes>
Date: Thu, 04 Apr 2024 16:25:03 +0200
In-Reply-To: <Zgv9bm3jnAu0_nZo@antipodes> (Thomas De Schampheleire's message
 of "Tue, 2 Apr 2024 14:43:26 +0200")
Message-ID: <877chdqk74.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] Fwd: [PATCH] DEVELOPERS: remove Thomas De
 Schampheleire
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas De Schampheleire <thomas.de_schampheleire@nokia.com> writes:

 > Hi Peter,
 > I sent this patch to the mailing list, but since I am no longer subscribed, it's
 > probably stuck in the moderation queue.

Odd, I don't see it in mailman.

 > Could I bother you to apply this patch or let my mail pass through the queue?

Sure, committed.

Sorry to see you go, thanks for all your work!


 > Thanks!
 > Thomas

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > Subject: [PATCH] DEVELOPERS: remove Thomas De Schampheleire
 > To: buildroot@buildroot.org
 > Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > Date: Wed, 27 Mar 2024 16:36:02 +0100 (1 week, 22 hours, 47 minutes ago)

 > No longer active in Buildroot. Keeping my name in the list sets the wrong
 > expectation regarding package updates or support.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > ---
 >  DEVELOPERS | 41 -----------------------------------------
 >  1 file changed, 41 deletions(-)

 > diff --git a/DEVELOPERS b/DEVELOPERS
 > index 313fc16b9d..a8865653f9 100644
 > --- a/DEVELOPERS
 > +++ b/DEVELOPERS
 > @@ -2956,47 +2956,6 @@ F:	package/openlayers/
 >  F:	package/vuejs/
 >  F:	package/vuejs-router/
 
 > -N:	Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > -F:	docs/manual/
 > -F:	package/cereal/
 > -F:	package/chartjs/
 > -F:	package/datatables/
 > -F:	package/datatables-buttons/
 > -F:	package/datatables-fixedcolumns/
 > -F:	package/datatables-responsive/
 > -F:	package/jszip/
 > -F:	package/libtelnet/
 > -F:	package/opkg-utils/
 > -F:	package/perl-convert-asn1/
 > -F:	package/perl-crypt-blowfish/
 > -F:	package/perl-crypt-cbc/
 > -F:	package/perl-crypt-openssl-aes/
 > -F:	package/perl-devel-cycle/
 > -F:	package/perl-devel-size/
 > -F:	package/perl-i18n/
 > -F:	package/perl-locale-maketext-lexicon/
 > -F:	package/perl-lwp-protocol-https/
 > -F:	package/perl-math-int64/
 > -F:	package/perl-math-prime-util/
 > -F:	package/perl-mime-base64-urlsafe/
 > -F:	package/perl-mojolicious-plugin-authentication/
 > -F:	package/perl-mojolicious-plugin-authorization/
 > -F:	package/perl-mojolicious-plugin-cspheader/
 > -F:	package/perl-mojolicious-plugin-i18n/
 > -F:	package/perl-mojolicious-plugin-securityheader/
 > -F:	package/perl-mozilla-ca/
 > -F:	package/perl-net-snmp/
 > -F:	package/perl-net-ssh2/
 > -F:	package/perl-net-telnet/
 > -F:	package/perl-path-class/
 > -F:	package/pigz/
 > -F:	package/popperjs/
 > -F:	package/xenomai/
 > -F:	support/scripts/size-stats
 > -F:	support/testing/tests/package/test_perl_lwp_protocol_https.py
 > -F:	utils/size-stats-compare
 > -F:	toolchain/
 > -
 >  N:	Thomas Devoogdt <thomas@devoogdt.com>
 >  F:	package/fluent-bit/
 >  F:	package/libsoup3/
 > -- 

 > 2.43.2


 > ----------


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
