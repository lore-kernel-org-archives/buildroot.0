Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E526CDB47E
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 09:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39F0460D9D;
	Wed, 18 Oct 2023 09:41:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39F0460D9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SD8c9jguU_fm; Wed, 18 Oct 2023 09:41:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A42B60BA5;
	Wed, 18 Oct 2023 09:41:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A42B60BA5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B3BB91BF5F6
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 09:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C26F82075
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 09:41:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C26F82075
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yLTzYhyljYqH for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 09:41:26 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A907882039
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 09:41:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A907882039
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8954220007;
 Wed, 18 Oct 2023 09:41:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qt33I-00BZnx-C9; Wed, 18 Oct 2023 11:41:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
References: <20231018091002.2162735-1-neal.frager@amd.com>
 <20231018091002.2162735-2-neal.frager@amd.com>
Date: Wed, 18 Oct 2023 11:41:20 +0200
In-Reply-To: <20231018091002.2162735-2-neal.frager@amd.com> (Neal Frager's
 message of "Wed, 18 Oct 2023 10:10:01 +0100")
Message-ID: <87h6motghr.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 2/3] configs/zynq_zed_defconfig: bump to
 xilinx-v2023.2
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
Cc: michal.simek@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > This patch bumps the zynq_zed_defconfig to xilinx-v2023.2 which includes
 > the following updates:

 > - Linux v6.1.30

Out of interest, how come this was "only" based on 6.1.30, when there
were already rebases of 2023.1 based on 6.1.40 and 6.1.50?

commit ae6daa717cb4cd4d8234e6f91b99af68ef438252 (tag: xlnx_rebase_v6.1_LTS_2023.1_merge_6.1.40)
Merge: 9299ac26ca51 75389113731b
Author: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Date:   Wed Aug 2 13:28:10 2023 +0530

    Merge tag 'v6.1.40' into xlnx_rebase_v6.1_LTS_2023.1_update

commit 496752408d031f93159fcf1aba2831c807a389a3 (tag: xlnx_rebase_v6.1_LTS_2023.1_merge_6.1.50, xlnx/xlnx_rebase_v6.1_LTS_2023.1_update)
Merge: 0f7f048016e0 a2943d2d9a00
Author: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Date:   Wed Sep 20 17:50:18 2023 +0530

    Merge tag 'v6.1.50' into xlnx_rebase_v6.1_LTS_2023.1_update

> - U-Boot v2023.01 with additional bug fixes

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
