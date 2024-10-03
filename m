Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF97CF857A
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 11:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6EE440102;
	Thu,  3 Oct 2024 11:05:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w3muTXqko7wZ; Thu,  3 Oct 2024 11:05:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81147403E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81147403E4;
	Thu,  3 Oct 2024 11:05:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5BAAE1BF285
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 11:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47FCA4125C
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 11:05:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SWZt73GsNMg5 for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 11:05:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 915834124C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 915834124C
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 915834124C
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 11:05:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 496B9240003;
 Thu,  3 Oct 2024 11:05:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1swJeV-000FeM-2e;
 Thu, 03 Oct 2024 13:05:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20240911171937.10842-1-ju.o@free.fr>
 <87jzf5h12z.fsf@dell.be.48ers.dk>
 <7884535cac565004d351d4d143364104@free.fr>
 <87frpiiy6k.fsf@dell.be.48ers.dk>
Date: Thu, 03 Oct 2024 13:05:47 +0200
In-Reply-To: <87frpiiy6k.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sun, 29 Sep 2024 11:52:51 +0200")
Message-ID: <874j5to390.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] boot/grub2: needs host-python3
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
Cc: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:
 > Hi,

 >>> Given that it apparently doesn't need any special python modules
 >>> could
 >>> we use $(BR2_PYTHON3_HOST_DEPENDENCY) instead to only build python3 if
 >>> not available on the host / older than 3.4?

 >> Yes, I confirm that for now, there is no specific python module
 >> requirement, and Python 3.4 should also be sufficient. So we could
 >> switch to BR2_PYTHON3_HOST_DEPENDENCY to save the time of the host
 >> python build.

 >> The same comment applies to the Linux kernel.

 >> Since those patches were recently merged in [1] and [2], I'll propose
 >> followup patches as an improvement.

 > Great, thanks!

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
