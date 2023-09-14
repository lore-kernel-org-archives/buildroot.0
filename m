Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7875BEEAA60
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 18:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B991641F6D;
	Thu, 14 Sep 2023 18:22:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B991641F6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lxXH492aHNL5; Thu, 14 Sep 2023 18:22:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAFAA41F68;
	Thu, 14 Sep 2023 18:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAFAA41F68
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C8E21BF316
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 18:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31C7341F68
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 18:22:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31C7341F68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id klUVjSgBCTxo for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 18:22:33 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A22B341E6D
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 18:22:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A22B341E6D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 154831C0005;
 Thu, 14 Sep 2023 18:22:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qgqyy-008bWG-0T; Thu, 14 Sep 2023 20:22:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Stewart <christian@aperture.us>
References: <20230906201358.2714756-1-christian@aperture.us>
Date: Thu, 14 Sep 2023 20:22:27 +0200
In-Reply-To: <20230906201358.2714756-1-christian@aperture.us> (Christian
 Stewart's message of "Wed, 6 Sep 2023 13:13:58 -0700")
Message-ID: <87fs3gwr6k.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/go: security bump to version
 1.20.8
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Anisse Astier <anisse@astier.eu>, "Yann E .
 MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Christian" == Christian Stewart <christian@aperture.us> writes:

 > go1.20.8 (released 2023-09-06) includes two security fixes to the html/template
 > package, as well as bug fixes to the compiler, the go command, the runtime, and
 > the crypto/tls, go/types, net/http, and path/filepath packages.

 > CVE-2023-39318: html/template: improper handling of HTML-like comments within script contexts
 > CVE-2023-39319: html/template: improper handling of special tags within script contexts
 > CVE-2023-39321: crypto/tls: panic when processing post-handshake message on QUIC connections

 > https://go.dev/doc/devel/release#go1.20.0

 > Signed-off-by: Christian Stewart <christian@aperture.us>

Committed to 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
