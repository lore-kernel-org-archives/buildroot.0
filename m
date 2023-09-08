Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4489EE57EF
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 10:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AE3361046;
	Fri,  8 Sep 2023 10:20:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AE3361046
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id urlWpG0fEBwA; Fri,  8 Sep 2023 10:20:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A693460A8A;
	Fri,  8 Sep 2023 10:20:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A693460A8A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 38D7A1BF31E
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 10:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F55C60A8A
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 10:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F55C60A8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mZ0qPQiNJ73j for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 10:20:29 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A1005607B0
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 10:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1005607B0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C0A41C0003;
 Fri,  8 Sep 2023 10:20:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qeYbB-008Wwp-49; Fri, 08 Sep 2023 12:20:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Stewart <christian@aperture.us>
References: <20230906200951.2712954-1-christian@aperture.us>
Date: Fri, 08 Sep 2023 12:20:25 +0200
In-Reply-To: <20230906200951.2712954-1-christian@aperture.us> (Christian
 Stewart's message of "Wed, 6 Sep 2023 13:09:51 -0700")
Message-ID: <87edj9ezkm.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH-NEXT v1 1/1] package/go: security bump to
 version 1.21.1
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

 > go1.21.1 (released 2023-09-06) includes four security fixes to the cmd/go,
 > crypto/tls, and html/template packages, as well as bug fixes to the compiler,
 > the go command, the linker, the runtime, and the context, crypto/tls,
 > encoding/gob, encoding/xml, go/types, net/http, os, and path/filepath packages.

 > Security fixes:

 > CVE-2023-39320: cmd/go: go.mod toolchain directive allows arbitrary execution
 > CVE-2023-39318: html/template: improper handling of HTML-like comments within script contexts
 > CVE-2023-39319: html/template: improper handling of special tags within script contexts
 > CVE-2023-39321: crypto/tls: panic when processing post-handshake message on QUIC connections

 > https://go.dev/doc/devel/release#go1.21.0

 > Signed-off-by: Christian Stewart <christian@aperture.us>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
