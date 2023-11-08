Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C04BC4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 20:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BE1960AFF;
	Wed,  8 Nov 2023 20:34:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BE1960AFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H4sz8nP6gGdb; Wed,  8 Nov 2023 20:34:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 833E960AFB;
	Wed,  8 Nov 2023 20:34:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 833E960AFB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D05C1BF282
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 20:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 128D04027F
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 20:34:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 128D04027F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E3IZ-u9QkqsA for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 20:34:09 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 101DF4026E
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 20:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 101DF4026E
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC0E560005;
 Wed,  8 Nov 2023 20:34:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r0pFU-001EF2-2i;
 Wed, 08 Nov 2023 21:34:04 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20231103111618.548198-1-buildroot@heine.tech>
 <20231104144320.471020b7@windsurf>
Date: Wed, 08 Nov 2023 21:34:04 +0100
In-Reply-To: <20231104144320.471020b7@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sat, 4 Nov 2023 14:43:20 +0100")
Message-ID: <874jhwq91f.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/websocketpp: fix build with C++20
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
 Ryan Barnett <ryan.barnett@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Hello Michael,
 > On Fri,  3 Nov 2023 12:16:12 +0100
 > Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

 >> websocketpp had some ill-formed usage of template parameters which was
 >> finally removed in C++20. Hence build fails when building with C++20 support
 >> enabled.
 >> 
 >> The patch is already in the develop branch but no new release was done.
 >> 
 >> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
 >> ---
 >> .../websocketpp/0001-fix_cpp20_build.patch    | 108 ++++++++++++++++++
 >> 1 file changed, 108 insertions(+)
 >> create mode 100644 package/websocketpp/0001-fix_cpp20_build.patch

 > Thanks a lot, I have extended the commit log with the very useful
 > details you provided as a reply to my question, and applied to master.
 > Thanks!

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
