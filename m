Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F16E7717F
	for <buildroot@archiver.kernel.org>; Thu, 12 Dec 2024 19:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3895081370;
	Thu, 12 Dec 2024 19:37:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id badNCS1hLxPj; Thu, 12 Dec 2024 19:37:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C45E81448
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C45E81448;
	Thu, 12 Dec 2024 19:37:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A685C75
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 19:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94B2581370
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 19:37:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MzjXhb-Dn-P0 for <buildroot@buildroot.org>;
 Thu, 12 Dec 2024 19:37:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0C24C80D8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C24C80D8C
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C24C80D8C
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 19:37:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1ABB340005;
 Thu, 12 Dec 2024 19:37:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tLp0N-003isq-0m;
 Thu, 12 Dec 2024 20:37:47 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: Christian Stewart <christian@aperture.us>,  buildroot@buildroot.org,
 James Hilliard <james.hilliard1@gmail.com>,  "Yann E . MORIN"
 <yann.morin.1998@free.fr>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241128012217.21455-1-christian@aperture.us>
 <b11604c62e77db9b7b87d985850be89b@free.fr>
Date: Thu, 12 Dec 2024 20:37:47 +0100
In-Reply-To: <b11604c62e77db9b7b87d985850be89b@free.fr> (Julien Olivain's
 message of "Sun, 01 Dec 2024 12:37:12 +0100")
Message-ID: <87cyhwwv3o.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: bump version to go1.23.3
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

 > On 28/11/2024 02:22, Christian Stewart via buildroot wrote:
 >> go1.23.3 (released 2024-11-06) includes fixes to the linker, the
 >> runtime,
 >> and the net/http, os, and syscall packages.
 >> https://go.dev/doc/devel/release#go1.23.minor
 >> Signed-off-by: Christian Stewart <christian@aperture.us>

 > Applied to next, thanks.

Committed to 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
