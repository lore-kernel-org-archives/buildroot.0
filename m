Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F64C54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 07:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 707E1812F8;
	Mon, 25 Mar 2024 07:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id STHzoCWtF4lO; Mon, 25 Mar 2024 07:57:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91D6881D7C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91D6881D7C;
	Mon, 25 Mar 2024 07:57:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8C9BA1BF3A3
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 07:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7966F40686
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 07:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jiPAiHn4FUKn for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 07:57:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3941740683
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3941740683
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3941740683
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 07:57:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21A7040006;
 Mon, 25 Mar 2024 07:57:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rofD3-008RXV-1g;
 Mon, 25 Mar 2024 08:57:33 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Lukasz Tekieli <tekieli.lukasz@gmail.com>
References: <20240208211517.9234-1-tekieli.lukasz@gmail.com>
 <20240208211517.9234-2-tekieli.lukasz@gmail.com>
 <878r28itqq.fsf@48ers.dk>
Date: Mon, 25 Mar 2024 08:57:33 +0100
In-Reply-To: <878r28itqq.fsf@48ers.dk> (Peter Korsgaard's message of "Sat, 23
 Mar 2024 21:22:05 +0100")
Message-ID: <87o7b2g2vm.fsf@48ers.dk>
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Lukasz" == Lukasz Tekieli <tekieli.lukasz@gmail.com> writes:
 >> Set correct directory for the BR2_ROOTFS_POST_SCRIPT_ARGS.
 >> Signed-off-by: Lukasz Tekieli <tekieli.lukasz@gmail.com>
 >> ---
 >> Changes for v2:
 >> - fix extracted to a separate commit

 > Committed, thanks.

Committed to 2024.02.x, 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
