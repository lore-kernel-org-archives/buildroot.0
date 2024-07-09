Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C5CC3DA41
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 05:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E3DA60AC0;
	Tue,  9 Jul 2024 05:43:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uBCWT_GtSVN4; Tue,  9 Jul 2024 05:43:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 565F660875
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 565F660875;
	Tue,  9 Jul 2024 05:43:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A19BD1BF97C
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 05:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 985C94023E
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 05:43:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CukrOKopWAji for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 05:43:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 28E784015F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28E784015F
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 28E784015F
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 05:43:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0916AC0004;
 Tue,  9 Jul 2024 05:43:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sR3dN-005EGd-36;
 Tue, 09 Jul 2024 07:43:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
References: <20240627222657.636484-1-bernd@kuhls.net>
Date: Tue, 09 Jul 2024 07:43:25 +0200
In-Reply-To: <20240627222657.636484-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Fri, 28 Jun 2024 00:26:57 +0200")
Message-ID: <8734ojm876.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/apr-util: needs engine support
 when build with libopenssl
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Buildroot commit 623d3bbe43e9193aa8e3395367d01af59071b859 disables
 > engine support when BR2_PACKAGE_LIBOPENSSL_ENGINES is not set.

 > Fixes:
 > http://autobuild.buildroot.net/results/e472618ca9ff4a3cf460f607a8dfa317832ca622/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 >  package/apr-util/Config.in | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/apr-util/Config.in b/package/apr-util/Config.in
 > index c1a967bdec..f7c119db48 100644
 > --- a/package/apr-util/Config.in
 > +++ b/package/apr-util/Config.in
 > @@ -5,6 +5,7 @@ config BR2_PACKAGE_APR_UTIL
 >  	depends on BR2_USE_MMU # apr
 >  	select BR2_PACKAGE_APR
 >  	select BR2_PACKAGE_EXPAT
 > +	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL

It is maybe a bit odd to select this when it doesn't explicitly pull in
openssl, but OK the alternative (to not add openssl support even if
openssl is enabled but engines support isn't) also isn't very clear.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
