Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363F8E6781D
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 15:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAF7860087;
	Mon, 11 Nov 2024 15:45:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j4DiSuw9w14y; Mon, 11 Nov 2024 15:45:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01E9E606BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01E9E606BB;
	Mon, 11 Nov 2024 15:45:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 970846C
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 15:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84E5B80ABD
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 15:45:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id roknb49OoYvh for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 15:45:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 09E1E80A79
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09E1E80A79
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09E1E80A79
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 15:45:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E5FB820002;
 Mon, 11 Nov 2024 15:45:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tAWbJ-00B3J7-0v;
 Mon, 11 Nov 2024 16:45:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>, Torben Voltmer <mail@t-voltmer.net>
References: <20240919161908.125007-1-thomas.perale@mind.be>
Date: Mon, 11 Nov 2024 16:45:13 +0100
In-Reply-To: <20240919161908.125007-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Thu, 19 Sep 2024 18:19:08 +0200")
Message-ID: <87ttcdai5y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/espflash: bump v3.1.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

 > Fix the following error:
 > error[E0282]: type annotations needed for `Box<_>`

 > The issue came from the `time` library depedency of espflash
 > (see https://github.com/time-rs/time/issues/693).
 > The `time` library has been bumped in the following commit
 > https://github.com/esp-rs/espflash/commit/233490736646ca7bc29463a98df98d7ccf53439d

 > Fixes:
 >   - https://autobuild.buildroot.org/results/321/321598baef543b84ce82c09a88e51ad745a15dfd/

It seems unlikely to be because of the time library as such, as espflash
3.1.0 builds fine on 2024.08.x (and we have no autobuilder failures
there). Most likely it is caused by the rustc bump from 1.79.0 to 1.80.1
instead.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
