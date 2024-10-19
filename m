Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613F7D3C923
	for <buildroot@archiver.kernel.org>; Sat, 19 Oct 2024 18:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20C2380CEA;
	Sat, 19 Oct 2024 18:43:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MqT5dQnQA1yP; Sat, 19 Oct 2024 18:43:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24C0080CED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24C0080CED;
	Sat, 19 Oct 2024 18:43:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B2E1127D7
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 18:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0BF260690
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 18:43:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cufcAjmXRQ7D for <buildroot@buildroot.org>;
 Sat, 19 Oct 2024 18:42:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 967F16063A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 967F16063A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 967F16063A
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 18:42:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B4FB240005;
 Sat, 19 Oct 2024 18:42:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1t2EPg-00Axau-09;
 Sat, 19 Oct 2024 20:42:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20241002194306.B5A1184649@busybox.osuosl.org>
Date: Sat, 19 Oct 2024 20:42:56 +0200
In-Reply-To: <20241002194306.B5A1184649@busybox.osuosl.org> (Arnout
 Vandecappelle via buildroot's message of "Wed, 2 Oct 2024 20:28:30
 +0200")
Message-ID: <87bjzgc4sv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] docs/manual: do not instruct doctoring
 the saved defconfig
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

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > commit:
 > https://git.buildroot.net/buildroot/commit/?id=17bdd10cb350e9c45926c2a5a05f278d104ee4c9
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Doctoring a defconfig is tedious, and it is not easy to update a
 > defconfig, as it requires manual copy-pasting, adding comments and so
 > on...

 > Instead, just require defconfigs to be generated with 'savedefconfig'.
 > Any details can/must be provided in the commit log.

 > Reported-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Signed-off-by: Arnout Vandecappelle <arnout@mind.be>

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
