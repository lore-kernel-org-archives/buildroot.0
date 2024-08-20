Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546FCC531DC
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 17:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F24E9401DF;
	Tue, 20 Aug 2024 17:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YqEKOnDhn4YV; Tue, 20 Aug 2024 17:13:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C00D440383
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C00D440383;
	Tue, 20 Aug 2024 17:13:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0577F1BF37C
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 17:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3E98608F9
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 17:13:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0cBYYIKSnYj9 for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 17:13:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5C99360648
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C99360648
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C99360648
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 17:13:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 353DEFF804;
 Tue, 20 Aug 2024 17:12:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sgSPi-00HCTE-1g;
 Tue, 20 Aug 2024 19:12:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Brandon Maier via buildroot <buildroot@buildroot.org>
References: <20240709-support-b4-v1-1-ef971fe9a893@collins.com>
Date: Tue, 20 Aug 2024 19:12:58 +0200
In-Reply-To: <20240709-support-b4-v1-1-ef971fe9a893@collins.com> (Brandon
 Maier via buildroot's message of "Tue, 09 Jul 2024 14:16:53 +0000")
Message-ID: <87wmkbf78l.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] .b4-config: configure `b4` for Buildroot
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
Cc: Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Brandon" == Brandon Maier via buildroot <buildroot@buildroot.org> writes:

 > `b4` is a commandline tool to make patch-based development easier[1]. It
 > is primarily used for Linux kernel development, but can be configured to
 > support any project that has a public-inbox endpoint. Buildroot has a
 > public-inbox mirror at "https://lore.kernel.org/buildroot/".

 > We configure some basic settings that tell `b4` where to send patches
 > and how to use get-developers.

 > [1] https://b4.docs.kernel.org/en/latest/

 > Signed-off-by: Brandon Maier <brandon.maier@collins.com>

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
