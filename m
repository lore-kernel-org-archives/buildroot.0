Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDBEC2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 06:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A10266078F;
	Tue,  9 Jul 2024 06:32:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U2z_zW-RQe2l; Tue,  9 Jul 2024 06:32:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7250607DB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7250607DB;
	Tue,  9 Jul 2024 06:32:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F1ED81BF3EB
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 06:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC21F40224
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 06:32:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DhKv--vdRKjd for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 06:32:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 82C4640191
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82C4640191
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 82C4640191
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 06:32:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9FAA8FF802;
 Tue,  9 Jul 2024 06:32:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sR4P4-005HLd-27;
 Tue, 09 Jul 2024 08:32:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
References: <20240623165639.1723393-1-bernd@kuhls.net>
Date: Tue, 09 Jul 2024 08:32:42 +0200
In-Reply-To: <20240623165639.1723393-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 23 Jun 2024 18:56:39 +0200")
Message-ID: <87o777krcl.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.20.2
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Removed patch which is included in this release.
 > Renumbered remaining patches.

 > Release notes:
 > - https://www.samba.org/samba/history/samba-4.20.0rc1.html
 > - https://www.samba.org/samba/history/samba-4.20.0rc2.html
 > - https://www.samba.org/samba/history/samba-4.20.0rc3.html
 > - https://www.samba.org/samba/history/samba-4.20.0rc4.html
 > - https://www.samba.org/samba/history/samba-4.20.0.html
 > - https://www.samba.org/samba/history/samba-4.20.1.html
 > - https://www.samba.org/samba/history/samba-4.20.2.html

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
