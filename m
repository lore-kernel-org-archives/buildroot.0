Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30665C3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 16:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FD8E8126A;
	Mon, 12 Aug 2024 16:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J6yyrG9eImk1; Mon, 12 Aug 2024 16:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C7678126B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C7678126B;
	Mon, 12 Aug 2024 16:01:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 027AE1BF5E9
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 16:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F148C60627
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 16:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i2HIgktqZxiW for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 16:01:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 94A8860678
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94A8860678
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94A8860678
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 16:01:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 340B81BF203;
 Mon, 12 Aug 2024 16:01:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sdXTk-007Su3-2Z;
 Mon, 12 Aug 2024 18:01:04 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240714111147.E5ABB866C4@busybox.osuosl.org>
Date: Mon, 12 Aug 2024 18:01:04 +0200
In-Reply-To: <20240714111147.E5ABB866C4@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Sun, 14 Jul 2024 13:10:41 +0200")
Message-ID: <87sev9ivcv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] package/android-tools: add patches to
 fix build with GCC 14.x
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=d201f2f5cd0d1e0389430cda78adead37977a6cd
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > This commit adds 3 patches that fix various implicit declarations
 > error that arise with GCC 14.x.

 > Fixes host-android-tools build issues:

 >  http://autobuild.buildroot.net/results/1fd0d0a9547d4ad2a24916eb79230d49a825e694
 >  http://autobuild.buildroot.net/results/9e3bb951d7db1c8a8725b5570c54f6dec0e8b344
 >  http://autobuild.buildroot.net/results/8c9345fcad6e935c13b16c318bbb27282de10ac1
 >  http://autobuild.buildroot.net/results/4e8a2ce69bfb8a86da2711cb32a99ad51b0bdf5f
 >  http://autobuild.buildroot.net/results/ca6310cfcb0a9787eb5cec3c33aab903f4964cab
 >  http://autobuild.buildroot.net/results/a77509d4df8281d666d870faeb008f9196d3bbc3
 >  http://autobuild.buildroot.net/results/74cdcbcbe8bab244b1c368260162e3cef133376f
 >  http://autobuild.buildroot.net/results/225b2722b030b1ea1706db8dd54d62da81d8725b

 > As well as android-tools build issues:

 >  http://autobuild.buildroot.net/results/abfaf53328d0b29c778f75e105cc7043f2ad44fe
 >  http://autobuild.buildroot.net/results/d2467a2ac4a915d850cc8bc2341d9803346604a9
 >  http://autobuild.buildroot.net/results/a4cf59ce479b7db7f0a3269c0462ce1ccc9f600e
 >  http://autobuild.buildroot.net/results/667a49bff45b226dec4349d54f977c8bd6abadd5
 >  http://autobuild.buildroot.net/results/92cf3eea0e0d7531220cd9850993e269a3a4744d

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.05.x, thanks.

 > +Upstream: N/A, we're too far from upstream

:( I know next to nothing about these tools, but is there anything
keeping us from upgrading?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
