Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34383C7EE23
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 09:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD57960F1E;
	Mon,  5 Jun 2023 09:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD57960F1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id daJDmr8ZyqqA; Mon,  5 Jun 2023 09:39:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3159860D4C;
	Mon,  5 Jun 2023 09:39:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3159860D4C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A94E01BF3D1
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 09:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 908D240195
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 09:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 908D240195
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AbJ1-aUBUpKO for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 09:39:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CD7F40141
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5CD7F40141
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 09:39:04 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 84B1D1BF20B;
 Mon,  5 Jun 2023 09:39:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q66g0-00DTvK-Oe; Mon, 05 Jun 2023 11:39:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20230603210642.264930-1-romain.naour@gmail.com>
Date: Mon, 05 Jun 2023 11:39:00 +0200
In-Reply-To: <20230603210642.264930-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sat, 3 Jun 2023 23:06:42 +0200")
Message-ID: <87bkhu9rkb.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/perl-http-message: add missing
 reverse dependency on perl-clone
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

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Commit [1] added dependency on perl-clone but forgot to propagate
 > the reverse dependency on !BR2_STATIC_LIBS.

 > Fixes:

 > WARNING: unmet direct dependencies detected for BR2_PACKAGE_PERL_CLONE
 >   Depends on [n]: BR2_PACKAGE_PERL [=y] && !BR2_STATIC_LIBS [=y]
 >   Selected by [y]:
 >   - BR2_PACKAGE_PERL_HTTP_MESSAGE [=y] && BR2_PACKAGE_PERL [=y]

 > http://autobuild.buildroot.org/results/5d5/5d503aaa94b56523c684be7946123921747ebf52

 > [1] 742258fec06df18782e4bd75b00ca530120312cb

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed, thanks.


> ---
 > While looking at perl-clone build, I noticed that "-shared" is provided
 > to lddlflags by the Perl package infrastructure:

 >   --config lddlflags="-shared $$(TARGET_LDFLAGS)"

 > It would means that any Perl package in Buildroot requires a dependency
 > on !BR2_STATIC_LIBS.

 > Currently some Perl packages doesn't requires !BR2_STATIC_LIBS since they
 > simply copy some .pm files. But as soon as something is built, it break
 > for static only builds.

Hmm, indeed. Maybe we should just make BR2_PACKAGE_PERL depend on
!BR2_STATIC_LIBS. I doubt there are a lot of use cases for a statically
built perl.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
