Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D70C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 10:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A98280AEF;
	Sun, 28 Jul 2024 10:05:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O4Kw2lNsgVq1; Sun, 28 Jul 2024 10:05:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45A4680AF0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45A4680AF0;
	Sun, 28 Jul 2024 10:05:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2187E1BF5F5
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 10:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B72180AF0
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 10:05:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vdwAdyvTGm7M for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 10:05:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 329C380AEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 329C380AEF
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 329C380AEF
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 10:05:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0ED0AC0002;
 Sun, 28 Jul 2024 10:05:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sY0mQ-0025zI-11;
 Sun, 28 Jul 2024 12:05:30 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <Zm70YkR_roWwY-ms@arch-zen.localdomain>
 <20240711212450.03598fa8@windsurf>
Date: Sun, 28 Jul 2024 12:05:30 +0200
In-Reply-To: <20240711212450.03598fa8@windsurf> (Thomas Petazzoni via
 buildroot's message of "Thu, 11 Jul 2024 21:24:50 +0200")
Message-ID: <87jzh5x251.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/ubus: remove obsolete systemd
 option
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Jan Havran <havran.jan@email.cz>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Sun, 16 Jun 2024 16:19:14 +0200
 > Jan Havran <havran.jan@email.cz> wrote:

 >> ENABLE_SYSTEMD option has been removed from ubus by commit:
 >> 96ab0b3032f5 ubusd: remove systemd socket activation support
 >> 
 >> Signed-off-by: Jan Havran <havran.jan@email.cz>
 >> ---
 >> package/ubus/ubus.mk | 7 -------
 >> 1 file changed, 7 deletions(-)

 > I've done a bit more research to see from a Buildroot perspective since
 > when this obsolete systemd option has been dropped, and I added the
 > conclusion of this investigation in an improved commit message:

 >     package/ubus: remove obsolete systemd option
    
 >     ENABLE_SYSTEMD option has been removed from ubus by upstream commit:
    
 >       96ab0b3032f5 ubusd: remove systemd socket activation support
    
 >     From a Buildroot perspective, this means that this systemd socket
 >     activation feature no longer exists since Buildroot commit
 >     130be80d34905d3e79ff6b8f8fb31b3c3765eb96 ("ubus: bump version"), as we
 >     bumped ubus from 259450f414d8c9ee41896e8e6d6bc57ec00e2b63 to
 >     34c6e818e431cc53478a0f7c7c1eca07d194d692 in this commit, and the
 >     96ab0b3032f5 ("ubusd: remove systemd socket activation support")
 >     commit is in this range. It was therefore dropped upstream in 2016,
 >     and in Buildroot in 2017.

 > Applied with this improved commit message. Thanks!

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
