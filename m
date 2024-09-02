Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CCDCD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 12:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3816D607FA;
	Mon,  2 Sep 2024 12:02:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uoruze1yUVGO; Mon,  2 Sep 2024 12:02:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BF9960805
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BF9960805;
	Mon,  2 Sep 2024 12:02:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D4DC61BF46D
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 12:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEDBB40304
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 12:02:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p1b5DuGVezMj for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 12:02:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C5CCF402FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5CCF402FD
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5CCF402FD
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 12:02:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 58AC41C0016;
 Mon,  2 Sep 2024 12:02:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sl5li-002d1e-2p;
 Mon, 02 Sep 2024 14:02:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240801191234.9526-1-kilian.zinnecker@mail.de>
 <20240801232358.102e4544@windsurf>
Date: Mon, 02 Sep 2024 14:02:50 +0200
In-Reply-To: <20240801232358.102e4544@windsurf> (Thomas Petazzoni via
 buildroot's message of "Thu, 1 Aug 2024 23:23:58 +0200")
Message-ID: <875xreqn4l.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] board/udoo/neo/readme.txt improve
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
Cc: festevam@gmail.com, Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Thu,  1 Aug 2024 21:12:34 +0200
 > Kilian Zinnecker via buildroot <buildroot@buildroot.org> wrote:

 >> This patch adds more inforamtion to the Udoo Neo's readme, e.g.,
 >> Uart pins and baudrate.
 >> 
 >> Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
 >> ---
 >> board/udoo/neo/readme.txt | 54 ++++++++++++++++++++++++++++++++++++++-
 >> 1 file changed, 53 insertions(+), 1 deletion(-)

 > Applied to master with some small improvements to the commit title and
 > log. Thanks a lot!

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
