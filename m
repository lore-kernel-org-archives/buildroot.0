Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEE8C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 11:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8479D605AE;
	Sat, 13 Jul 2024 11:04:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ijkFygaAsxMe; Sat, 13 Jul 2024 11:04:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DD3660605
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DD3660605;
	Sat, 13 Jul 2024 11:04:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F1091BF2FA
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 11:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79C5260605
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 11:04:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SwOX9iCWSQIt for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 11:04:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CBF8C605AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBF8C605AE
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CBF8C605AE
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 11:04:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9CB141BF203;
 Sat, 13 Jul 2024 11:04:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sSaY6-00CiUr-1Z;
 Sat, 13 Jul 2024 13:04:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240702121745.3445375-1-yang.li@amlogic.com>
 <20240709233246.4026b6f8@windsurf>
Date: Sat, 13 Jul 2024 13:04:18 +0200
In-Reply-To: <20240709233246.4026b6f8@windsurf> (Thomas Petazzoni via
 buildroot's message of "Tue, 9 Jul 2024 23:32:46 +0200")
Message-ID: <87sewdft8t.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/linux-firmware: change Amlogic
 Bluetooth binary path
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
Cc: bernd@kuhls.net, Yang Li <yang.li@amlogic.com>, yann.morin.1998@free.fr,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Hello Yang,
 > Thanks for your patch, which I have applied, after doing some changes,
 > see below.

 > On Tue, 2 Jul 2024 20:17:37 +0800
 > Yang Li <yang.li@amlogic.com> wrote:

 >> remove bluetooth subdirectory, and use generic pattern aml_*
 >> to install all bluetooth binary.

 > This commit log was not sufficient. It does not explain since when the
 > bluetooth/ directory has been removed. This information is absolutely
 > *critical* as it allows us to figure out whether this fix needs to be
 > backported or not to previous version of Buildroot. Therefore, I have
 > changed the commit log to:

 >     package/linux-firmware: change Amlogic Bluetooth binary path
    
 >     Since upstream commit 7d931f8afa51d83e9eaee3a3f449bc2f86a5edf3, which
 >     first appeared in linux-firmware 20240709, the amlogic bluetooth
 >     firmware files have been moved from amlogic/bluetooth/ to directly
 >     amlogic/.

How does that work? Master has LINUX_FIRMWARE_VERSION = 20240410,
E.G. an earlier version than that?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
