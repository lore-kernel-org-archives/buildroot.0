Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17E4C54E5D
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 07:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AC2540323;
	Tue, 19 Mar 2024 07:38:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eNxvFfu5M46s; Tue, 19 Mar 2024 07:38:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CF7B40328
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CF7B40328;
	Tue, 19 Mar 2024 07:38:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E03BA1BF310
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 07:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9A4640121
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 07:38:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GnCWWboN_l-I for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 07:38:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 75BED40101
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75BED40101
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75BED40101
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 07:38:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6645D60004;
 Tue, 19 Mar 2024 07:38:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rmU3D-0033vH-29;
 Tue, 19 Mar 2024 08:38:23 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>
References: <20240319070554.1323606-1-javad.rahimipetroudi@mind.be>
 <20240319070554.1323606-3-javad.rahimipetroudi@mind.be>
Date: Tue, 19 Mar 2024 08:38:23 +0100
In-Reply-To: <20240319070554.1323606-3-javad.rahimipetroudi@mind.be> (Javad
 Rahimipetroudi's message of "Tue, 19 Mar 2024 08:05:54 +0100")
Message-ID: <87v85id634.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v3 3/3] configs/avenger96: bump ATF version
 to v2.8
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
Cc: Marleen Vos <marleen.vos@mind.be>,
 Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Javad" == Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com> writes:

 > This patch upgrades the ATF version to v2.8. Please note that
 > due to DTS chages from commit 51e223058fe70b311542178f1865514745fa7874
 > ("feat(stm32mp15-fdts): add Avenger96 board with STM32MP157A DHCOR SoM")
 > The ATF additional build variable also modified to use the new DTS file.

 > Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>

What about
board/arrow/avenger96/patches/arm-trusted-firmware/0001-stm32mp157a-avenger96.dts-enable-hash-device-to-unbr.patch?
Can that be dropped?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
