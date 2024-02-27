Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFA1C5478C
	for <buildroot@archiver.kernel.org>; Tue, 27 Feb 2024 22:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76DD1402B9;
	Tue, 27 Feb 2024 22:23:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tn3Uy83OXYOz; Tue, 27 Feb 2024 22:23:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3CD8402F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3CD8402F0;
	Tue, 27 Feb 2024 22:23:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A4B261BF842
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 22:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 921D282258
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 22:23:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1FqOr6e604Mc for <buildroot@lists.busybox.net>;
 Tue, 27 Feb 2024 22:23:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 44BBF82257
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44BBF82257
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44BBF82257
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 22:23:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C7B1240005;
 Tue, 27 Feb 2024 22:23:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rf5qo-00GNHR-2J;
 Tue, 27 Feb 2024 23:23:02 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Laurent Badel via buildroot <buildroot@buildroot.org>
References: <20240226091904.14928-1-laurentbadel@eaton.com>
Date: Tue, 27 Feb 2024 23:23:02 +0100
In-Reply-To: <20240226091904.14928-1-laurentbadel@eaton.com> (Laurent Badel
 via buildroot's message of "Mon, 26 Feb 2024 09:19:04 +0000")
Message-ID: <87zfvlr1h5.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/micropython: update PCRE
 dependency to PCRE2
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
Cc: Laurent Badel <laurentbadel@eaton.com>,
 Chris Packham <judge.packham@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Laurent" == Laurent Badel via buildroot <buildroot@buildroot.org> writes:

 > micropython-lib/unix-ffi/re/re.py uses libpcre2-8 since commit d8e163b.
 > Thus, update micropython package to select the PCRE2 package instead of PCRE.

 > Signed-off-by: Laurent Badel <laurentbadel@eaton.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
