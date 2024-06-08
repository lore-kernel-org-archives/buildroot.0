Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71903C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 13:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4128582261;
	Sat,  8 Jun 2024 13:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id abR59HNxLWiC; Sat,  8 Jun 2024 13:03:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 584A98433B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 584A98433B;
	Sat,  8 Jun 2024 13:03:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7F7AD1BF47E
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 13:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C54540207
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 13:03:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PyUeYQeZYyoo for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 13:03:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F121940119
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F121940119
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F121940119
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 13:03:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F65A1BF204;
 Sat,  8 Jun 2024 13:03:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sFvjF-001jCF-2Z;
 Sat, 08 Jun 2024 15:03:29 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240514173919.318237-1-fontaine.fabrice@gmail.com>
Date: Sat, 08 Jun 2024 15:03:29 +0200
In-Reply-To: <20240514173919.318237-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 14 May 2024 19:39:19 +0200")
Message-ID: <87a5jv60ym.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/gnuplot: fix readline dependency
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
Cc: Michael Fischer <mf@go-sys.de>,
 Anthony Viallard <viallard@syscom-instruments.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > --without-readline is interpreted as --with-readline=builtin since bump
 > to version 5.4.0 in commit 263da09323e83bb3d6552b70b739523b66459df8 and
 > https://github.com/gnuplot/gnuplot/commit/b492ea63bd604081ffb9dee3843e295b0b29df85
 > so add a mandatory dependency to readline or libedit to gnuplot

 > As a side-effect, this will avoid the following build failure with
 > builtin readline raised since bump to version 6.0.0 in commit
 > 5f11ce4aeaba99917778c384b236d267e78a7b29:

 > /home/autobuild/autobuild/instance-14/output-1/host/lib/gcc/arm-buildroot-linux-gnueabi/13.2.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
 > history.o: in function `read_history':
 > history.c:(.text+0xa8): undefined reference to `gp_read_history'

 > Fixes: 5f11ce4aeaba99917778c384b236d267e78a7b29
 >  - http://autobuild.buildroot.org/results/5e45dd8f9071694110c8481f222b9b07b6a97ef3

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
