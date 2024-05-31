Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EC6C25B7E
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 12:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 608264004A;
	Fri, 31 May 2024 12:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ToClQWRruWv; Fri, 31 May 2024 12:19:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14EC5423C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14EC5423C6;
	Fri, 31 May 2024 12:19:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 00C571D51EC
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 12:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1FC6606BD
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 12:19:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aih6J8qqdYfi for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 12:19:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1B44C60612
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B44C60612
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B44C60612
 for <buildroot@buildroot.org>; Fri, 31 May 2024 12:19:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 407EA240008;
 Fri, 31 May 2024 12:19:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sD1Dn-00Ckq1-2l;
 Fri, 31 May 2024 14:18:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
References: <20240531094752.3760287-1-neal.frager@amd.com>
 <20240531094752.3760287-5-neal.frager@amd.com>
Date: Fri, 31 May 2024 14:18:59 +0200
In-Reply-To: <20240531094752.3760287-5-neal.frager@amd.com> (Neal Frager's
 message of "Fri, 31 May 2024 10:47:50 +0100")
Message-ID: <87v82unpho.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 5/7] configs/zynq_zed_defconfig: bump to
 xilinx-v2024.1
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
Cc: martin.chabot@gmail.com, brandon.maier@collins.com, ju.o@free.fr,
 juju@cotds.org, michal.simek@amd.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org, luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > This patch bumps the zynq_zed_defconfig to xilinx-v2024.1 which includes
 > the following updates:

 > - Linux v6.6.10
 > - U-Boot v2024.01

 > Signed-off-by: Neal Frager <neal.frager@amd.com>
 > ---
 V1-> V2:
 > - update linux dts name to include new xilinx directory

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
