Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDE1C54E58
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 20:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5902260612;
	Sat, 23 Mar 2024 20:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TX_y8RCQKGJt; Sat, 23 Mar 2024 20:22:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 791206063C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 791206063C;
	Sat, 23 Mar 2024 20:22:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C03491BF37E
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 20:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9A6B405DE
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 20:22:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ePXvGysO4f9x for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 20:22:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3E9CB405C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E9CB405C0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E9CB405C0
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 20:22:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6CB701BF203;
 Sat, 23 Mar 2024 20:22:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ro7sT-000KDj-1y;
 Sat, 23 Mar 2024 21:22:05 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Lukasz Tekieli <tekieli.lukasz@gmail.com>
References: <20240208211517.9234-1-tekieli.lukasz@gmail.com>
 <20240208211517.9234-2-tekieli.lukasz@gmail.com>
Date: Sat, 23 Mar 2024 21:22:05 +0100
In-Reply-To: <20240208211517.9234-2-tekieli.lukasz@gmail.com> (Lukasz
 Tekieli's message of "Thu, 8 Feb 2024 22:15:16 +0100")
Message-ID: <878r28itqq.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/2] board/visionfive2: fix genimage.cfg
 path
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
Cc: Francois Dugast <francois.dugast.foss@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Lukasz" == Lukasz Tekieli <tekieli.lukasz@gmail.com> writes:

 > Set correct directory for the BR2_ROOTFS_POST_SCRIPT_ARGS.
 > Signed-off-by: Lukasz Tekieli <tekieli.lukasz@gmail.com>
 > ---
 > Changes for v2:
 > - fix extracted to a separate commit

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
