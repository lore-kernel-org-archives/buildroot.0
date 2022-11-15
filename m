Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62BFC433FE
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 13:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AB4C40951;
	Tue, 15 Nov 2022 13:26:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AB4C40951
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7wXJEW8Rbr-q; Tue, 15 Nov 2022 13:26:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75D60403EC;
	Tue, 15 Nov 2022 13:26:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75D60403EC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7FBE61BF319
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A251403EC
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:26:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A251403EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nSWVOLL5TN3o for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 13:26:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D3174023F
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D3174023F
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 13:26:25 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 22A8960007;
 Tue, 15 Nov 2022 13:26:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ouvxH-008g9N-8K; Tue, 15 Nov 2022 14:26:23 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221108175129.727174-1-fontaine.fabrice@gmail.com>
Date: Tue, 15 Nov 2022 14:26:23 +0100
In-Reply-To: <20221108175129.727174-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 8 Nov 2022 18:51:29 +0100")
Message-ID: <874jv0fiww.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/perl-net-ssleay: bump to
 version 1.93_01
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Refresh patch
 > - Drop -lz from Makefile with libressl as this is the only solution for
 >   now: https://github.com/radiator-software/p5-net-ssleay/issues/399
 > - License has been clarified to be Artistic-2.0 since version 1.86.11:
 >   https://github.com/radiator-software/p5-net-ssleay/commit/aa4a0206d6d2a5ac2998dd9d6a8c5b88902c04de
 > - This bump will fix the following build failure with libressl:

 >   In file included from /home/autobuild/autobuild/instance-11/output-1/host/armeb-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/perl5/5.34.1/armeb-linux/CORE/perl.h:5748,
 >                    from SSLeay.xs:141:
 >   SSLeay.xs: In function 'XS_Net__SSLeay_SESSION_get_master_key':
 >   SSLeay.xs:5569:37: error: invalid use of incomplete typedef 'SSL_SESSION' {aka 'struct ssl_session_st'}
 >    5569 |      sv_setpvn(ST(0), (const char*)s->master_key, s->master_key_length);
 >         |                                     ^~

 > https://metacpan.org/release/CHRISN/Net-SSLeay-1.93_01/changes

 > Fixes:
 >  - http://autobuild.buildroot.org/results/71337cc496727f2b1173c055d706c5bfc2f5d2bc

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
