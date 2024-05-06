Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10919C25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 21:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9C1460A56;
	Mon,  6 May 2024 21:01:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mh8Z2Uc_tGey; Mon,  6 May 2024 21:01:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D806160A5B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D806160A5B;
	Mon,  6 May 2024 21:01:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 39EB71BF59D
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 21:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25AF9406CF
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 21:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AutxRV1GGRKF for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 21:01:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CADB940663
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CADB940663
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CADB940663
 for <buildroot@buildroot.org>; Mon,  6 May 2024 21:01:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9115240008;
 Mon,  6 May 2024 21:01:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s45Sm-003jx2-1C;
 Mon, 06 May 2024 23:01:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20240411043420.5B0FE86020@busybox.osuosl.org>
Date: Mon, 06 May 2024 23:01:32 +0200
In-Reply-To: <20240411043420.5B0FE86020@busybox.osuosl.org> (Yann E. MORIN's
 message of "Thu, 11 Apr 2024 06:34:03 +0200")
Message-ID: <87msp2y7rn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] support/testing: remove TestATFVexpress
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=107bcd536dae1bc26e4f34ed510484d3abcc6b5f
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > TestATFVexpress is using vexpress_aemv8a_juno as as u-boot defconfig
 > but the Buildroot defconfig of this board was removed in 2022.11 [1]

 > Since both TestATFVexpress and TestATFAllwinner are now using mainline
 > ATF, we don't really need several ATF test anymore. Initially [2],
 > several runtime test were added to test ATF/U-Boot combinations when
 > ATF was provided by a vendor: vexpress (mainline), Allwinner and
 > Marvell.

 > Keep TestATFAllwinner as ATF mainline test.

 > [1] 347c1087388d7782e6865f112f195e6780d473a7
 > [2] 8cf3ce04e9c4a4c4685b80edd9e8e873fe44d8e8

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
