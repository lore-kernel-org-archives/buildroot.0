Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C801C4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 11:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BF95406D1;
	Sun, 28 Apr 2024 11:01:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GpnpevGH_FE1; Sun, 28 Apr 2024 11:01:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0FBB406F1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0FBB406F1;
	Sun, 28 Apr 2024 11:01:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E75F1BF396
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 11:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7AEB406F1
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 11:01:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5R4I35dfugFU for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 11:01:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 84CC3406D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84CC3406D1
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84CC3406D1
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 11:01:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 992D1FF803;
 Sun, 28 Apr 2024 11:01:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s12Ht-003Hdf-37;
 Sun, 28 Apr 2024 13:01:41 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240326142853.B049C84216@busybox.osuosl.org>
Date: Sun, 28 Apr 2024 13:01:41 +0200
In-Reply-To: <20240326142853.B049C84216@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Tue, 26 Mar 2024 15:28:36 +0100")
Message-ID: <874jblg38q.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] package/googlefontdirectory: fix
 command to generate license file hashes
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=f139aab6fedfe1d9924fc205c0a61c51351e4972
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > In commit ebe5d9edfe8d07eafd7b61c4f77ce509bb98a0ad ("boot, package,
 > support, toolchain: switch to 2 spaces for the hash file"), all hash
 > files were migrated to use 2 spaces as the separator.

 > However, in the googlefontdirectory hash file, a command is present in
 > a comment to indicate how to generate the part of the hash file that
 > provides the list of license file hashes. This command was not updated
 > as part of ebe5d9edfe8d07eafd7b61c4f77ce509bb98a0ad, so it still emits
 > a result in which a single space is used a separator between the hash
 > type (sha256) and the hash value.

 > This commit fixes that by using a 2-space separator.

 > Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
 > [Thomas: extracted from
 > https://patchwork.ozlabs.org/project/buildroot/patch/20240228145013.411919-2-christian@klarinett.li/
 > into a separate patch]
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
