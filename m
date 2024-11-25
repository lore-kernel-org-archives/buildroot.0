Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7411D58D65
	for <buildroot@archiver.kernel.org>; Mon, 25 Nov 2024 16:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89FC284F63;
	Mon, 25 Nov 2024 16:27:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NRyAA2frg2SA; Mon, 25 Nov 2024 16:27:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A791484F5C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A791484F5C;
	Mon, 25 Nov 2024 16:27:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 622E94961
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 16:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 506F884F5B
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 16:27:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rstraIpwMFj5 for <buildroot@buildroot.org>;
 Mon, 25 Nov 2024 16:27:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 430E884F50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 430E884F50
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 430E884F50
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 16:27:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 872266000C;
 Mon, 25 Nov 2024 16:26:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tFbvN-005sdO-2u;
 Mon, 25 Nov 2024 17:26:57 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Devoogdt <thomas@devoogdt.com>,  buildroot@buildroot.org,  Martin
 Kepplinger <martink@posteo.de>,  Thomas Devoogdt
 <thomas.devoogdt@barco.com>
References: <20241022204333.2045190-1-thomas@devoogdt.com>
 <6399601e298573bbf98ee6e18415d530@free.fr>
Date: Mon, 25 Nov 2024 17:26:57 +0100
In-Reply-To: <6399601e298573bbf98ee6e18415d530@free.fr> (Julien Olivain's
 message of "Fri, 08 Nov 2024 22:25:34 +0100")
Message-ID: <878qt7p9da.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v1] package/x11vnc: add and rework compile
 patches
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > On 22/10/2024 22:43, Thomas Devoogdt wrote:
 >> From: Thomas Devoogdt <thomas.devoogdt@barco.com>
 >> Add the "Upstream" field to the patch message for:
 >> - 0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
 >> -
 >> 0002-scan-limit-access-to-shared-memory-segments-to-current-user.patch
 >> Add a compile patch for GCC >= 10 which enables -fno-common by
 >> default.
 >> Fixes:
 >> -
 >> https://autobuild.buildroot.org/results/b22/b2231fe06fe56036a5ddbe61cb8556b046e3a7b7/build-end.log
 >> -
 >> https://autobuild.buildroot.org/results/8af/8afbcc63818d3e1586731e178f16635e773d5600/build-end.log
 >> - ...
 >> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

 > Applied to master, thanks.

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
