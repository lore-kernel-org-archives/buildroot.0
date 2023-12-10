Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A0FCC4167B
	for <buildroot@archiver.kernel.org>; Sun, 10 Dec 2023 12:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE9C96106B;
	Sun, 10 Dec 2023 12:59:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE9C96106B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ejy2wDI6GWAJ; Sun, 10 Dec 2023 12:59:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13D006104D;
	Sun, 10 Dec 2023 12:59:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13D006104D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A0F61BF239
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 12:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED85F4179E
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 12:59:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED85F4179E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y9gLtS74CJuP for <buildroot@lists.busybox.net>;
 Sun, 10 Dec 2023 12:59:39 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDB1E4179C
 for <buildroot@buildroot.org>; Sun, 10 Dec 2023 12:59:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDB1E4179C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 941131C0002;
 Sun, 10 Dec 2023 12:59:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rCJPC-001wWb-1h;
 Sun, 10 Dec 2023 13:59:34 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Stewart <christian@aperture.us>
References: <20231206221202.39468-1-christian@aperture.us>
 <878r66qr89.fsf@48ers.dk>
Date: Sun, 10 Dec 2023 13:59:34 +0100
In-Reply-To: <878r66qr89.fsf@48ers.dk> (Peter Korsgaard's message of "Thu, 07
 Dec 2023 10:47:18 +0100")
Message-ID: <87r0junrgp.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: security bump to v1.21.5
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
Cc: buildroot@buildroot.org, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Christian" == Christian Stewart <christian@aperture.us> writes:
 >> Fixes the following CVEs:
 >> CVE-2023-39326: net/http: limit chunked data overhead
 >> CVE-2023-45285: cmd/go: go get may unexpectedly fallback to insecure git

 >> https://go.dev/doc/devel/release#go1.21.5

 >> Signed-off-by: Christian Stewart <christian@aperture.us>

 > Committed, thanks.

Committed to 2023.11.x, thanks. For 2023.02.x I will instead bump to
1.20.12, which has the same fixes.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
