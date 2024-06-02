Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CDCC25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 18:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFC4240BB4;
	Sun,  2 Jun 2024 18:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id km58gaR1BOaD; Sun,  2 Jun 2024 18:44:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF93340BC6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF93340BC6;
	Sun,  2 Jun 2024 18:44:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 10A871BF4DA
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 18:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14EBD40B85
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 18:44:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AOTAbQ25edmC for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 18:44:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6DF8A40BCB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DF8A40BCB
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6DF8A40BCB
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 18:44:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4BBDE240002;
 Sun,  2 Jun 2024 18:44:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sDqBU-0016hI-0y;
 Sun, 02 Jun 2024 20:44:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: yegorslists@googlemail.com
References: <20240602141954.2667787-1-yegorslists@googlemail.com>
Date: Sun, 02 Jun 2024 20:44:00 +0200
In-Reply-To: <20240602141954.2667787-1-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Sun, 2 Jun 2024 16:19:54
 +0200")
Message-ID: <87sexvjibz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] package/ncftp: bump to version 3.2.7
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

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > Change download location as the new version is not available at the
 > old location.

 > Remove already upstreamed patch.

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 > ---
 > Changes v1 -> v2:
 >     - Rework download location change explanation (Peter Korsgaard)
 >     - remove the patch from .checkpackageignore (Peter Korsgaard)
 >     - download xz version (Peter Korsgaard)

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
