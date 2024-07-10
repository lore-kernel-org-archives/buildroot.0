Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFFEC3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 09:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 680B660842;
	Wed, 10 Jul 2024 09:42:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zW2R3oat1dyU; Wed, 10 Jul 2024 09:42:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C10260887
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C10260887;
	Wed, 10 Jul 2024 09:42:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E0151BF573
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 09:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4B6541385
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 09:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OYsArHn0Eu2G for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 09:42:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5B89041383
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B89041383
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B89041383
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 09:42:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 36E3B60007;
 Wed, 10 Jul 2024 09:42:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sRTqb-007Qnw-2m;
 Wed, 10 Jul 2024 11:42:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240429092326.3247116-1-p-bhagat@ti.com>
 <20240709225840.3f852ad5@windsurf>
 <efe068e2-2721-4986-a514-c848b8fb4442@mind.be>
 <20240710111557.6bd8439e@windsurf>
Date: Wed, 10 Jul 2024 11:42:49 +0200
In-Reply-To: <20240710111557.6bd8439e@windsurf> (Thomas Petazzoni's message of
 "Wed, 10 Jul 2024 11:15:57 +0200")
Message-ID: <87ikxdk2g6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [RFC,
 1/1] configs/am62x-sk: Add fragment for TI tree integration
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
Cc: Bryan Brattlof <bb@ti.com>, Xuanhao Shi <X15000177@gmail.com>,
 Gyan Gupta <g-gupta@ti.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Chirag Shilwant <c-shilwant@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
 Syed Mohammed Khasim <khasim@ti.com>,
 Paresh Bhagat via buildroot <buildroot@buildroot.org>,
 Andreas Dannenberg <dannenberg@ti.com>,
 Sai Sree Kartheek Adivi <s-adivi@ti.com>, Romain Naour <romain.naour@smile.fr>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 >> Just one thing about the naming: I think it should be 
 >> imx6ullevk_upstream_defconfig and imx6ullevk_vendor_defconfig to make
 >> the distinction clearer. I haven't looked at this TI series to
 >> evaluate its naming scheme, but you get the idea I guess.

 > I fully agree with this. The current naming is less than obvious, and
 > what you propose would make a lot of sense. With that naming, I believe
 > I would be ready to accept 2 defconfigs for TI platforms for example,
 > one using upstream, one using vendor stuff.

Sounds good to me, but lets drop the suffix if there is only one
defconfig / for the main one to limit renames (E.G. backwards
compatibility) for our existing defconfigs.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
