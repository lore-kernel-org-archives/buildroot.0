Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3196DC02185
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 11:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D836584C4A;
	Sat, 18 Jan 2025 11:50:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xjkm-m1pzhk3; Sat, 18 Jan 2025 11:50:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE95A84C54
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE95A84C54;
	Sat, 18 Jan 2025 11:50:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F195E69
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 11:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D273060789
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 11:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ICF84coK9uRl for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 11:50:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C05D160759
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C05D160759
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C05D160759
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 11:50:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BF8F260002;
 Sat, 18 Jan 2025 11:50:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tZ7LK-001HFk-00;
 Sat, 18 Jan 2025 12:50:22 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20250110193514.C21CC83FA4@busybox.osuosl.org>
Date: Sat, 18 Jan 2025 12:50:21 +0100
In-Reply-To: <20250110193514.C21CC83FA4@busybox.osuosl.org> (Julien Olivain's
 message of "Fri, 10 Jan 2025 20:33:35 +0100")
Message-ID: <87cygks5mq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] package/pipewire: bump version to 1.2.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > commit:
 > https://git.buildroot.net/buildroot/commit/?id=b94d0d354df0baec54af5ec52556d542849d6315
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Includes various bugfixes. For details, see NEWS:
 > https://gitlab.freedesktop.org/pipewire/pipewire/-/blob/cc7439187f61dd73b81ca69f5dbccbb52ce970b2/NEWS

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed to 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
