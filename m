Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D20C25B5C
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 10:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BA216083D;
	Mon,  6 May 2024 10:51:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dU3l2opNJW6V; Mon,  6 May 2024 10:51:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 054F060850
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 054F060850;
	Mon,  6 May 2024 10:51:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 365F21BF33E
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 10:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22C9460850
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 10:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N3OT5vJHmZy7 for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 10:51:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D755F60840
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D755F60840
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D755F60840
 for <buildroot@buildroot.org>; Mon,  6 May 2024 10:51:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 04EE740007;
 Mon,  6 May 2024 10:51:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s3vwF-001DT4-1Z;
 Mon, 06 May 2024 12:51:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@smile.fr>
References: <20240410214454.86748-1-romain.naour@smile.fr>
 <20240410214454.86748-3-romain.naour@smile.fr>
Date: Mon, 06 May 2024 12:51:19 +0200
In-Reply-To: <20240410214454.86748-3-romain.naour@smile.fr> (Romain Naour's
 message of "Wed, 10 Apr 2024 23:44:54 +0200")
Message-ID: <8734qv2oyg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 3/3] board/ti/am6{2,
 4}x: add missing uboot.hash file
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

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > Arnout noticed during the review that uboot.hash was missing from
 > BR2_GLOBAL_PATCH_DIR.

 > "The hash for 2024.01 is currently in boot/uboot/uboot.hash, but as soon as we
 > update the U-Boot version, it will no longer be. So to be future safe, we should
 > add a local override of the uboot hash file as well (which is simply identical
 > to uboot.hash)."

 > This is required since BR2_DOWNLOAD_FORCE_CHECK_HASHES is now enabled.

 > [1] http://lists.busybox.net/pipermail/buildroot/2024-April/689283.html

 > Reported-by: Arnout Vandecappelle <arnout@mind.be>
 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
