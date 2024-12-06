Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E11CE77173
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 22:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38A0281F48;
	Fri,  6 Dec 2024 22:25:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PNqoiEKaz74g; Fri,  6 Dec 2024 22:25:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6005281F4F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6005281F4F;
	Fri,  6 Dec 2024 22:25:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D43A2ECA
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE9B6409F6
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:25:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CIrmco19rpoe for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 22:25:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D0B54409AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0B54409AD
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0B54409AD
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:25:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D67E61BF205;
 Fri,  6 Dec 2024 22:25:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tJgl0-008lUw-0n;
 Fri, 06 Dec 2024 23:25:06 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Anssi Hannula via buildroot <buildroot@buildroot.org>
Cc: Anssi Hannula <anssi.hannula@bitwise.fi>,  Petr Vorel
 <petr.vorel@gmail.com>,  Giulio Benetti
 <giulio.benetti@benettiengineering.com>
References: <20241106100210.1547916-1-anssi.hannula@bitwise.fi>
Date: Fri, 06 Dec 2024 23:25:06 +0100
In-Reply-To: <20241106100210.1547916-1-anssi.hannula@bitwise.fi> (Anssi
 Hannula via buildroot's message of "Wed, 6 Nov 2024 12:02:10 +0200")
Message-ID: <87msh85u0t.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/nfs-utils: fix unit
 dependencies without systemd on build host
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

>>>>> "Anssi" == Anssi Hannula via buildroot <buildroot@buildroot.org> writes:

 > nfs-utils configure script uses "systemd-escape" to determine the
 > rpc_pipefs mount point unit name in the non-default case.

 > If the host build system has no systemd this will silently result in an
 > empty name, causing rpc_pipefs.target to incorrectly depend on ".mount".

 > Fix that by depending on host-systemd for build.

 > Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
