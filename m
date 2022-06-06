Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B28C43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 10:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01C9C61051;
	Mon,  6 Jun 2022 10:45:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dwscCqlPXGCr; Mon,  6 Jun 2022 10:45:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21ED360F38;
	Mon,  6 Jun 2022 10:45:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 614FD1BF39A
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50EE841753
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:45:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xYfmhQGaW3sk for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 10:45:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F857416D5
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 10:44:59 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 92AB61C0005;
 Mon,  6 Jun 2022 10:44:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nyAEC-00CmS2-Ko; Mon, 06 Jun 2022 12:44:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20220529202017.822191-1-romain.naour@gmail.com>
Date: Mon, 06 Jun 2022 12:44:56 +0200
In-Reply-To: <20220529202017.822191-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sun, 29 May 2022 22:20:17 +0200")
Message-ID: <87czfmxe8n.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] support/testing: test_oci: update to
 _OCI_CMD option
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
Cc: "Yann E . MORIN" <yann.morin@orange.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Matthew Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS option has been
 > replaced by BR2_TARGET_ROOTFS_OCI_CMD in commit [1].

 > Since BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS contains
 > only one item, we can safely replace by
 > BR2_TARGET_ROOTFS_OCI_CMD in the defconfig fragment
 > used by the test_oci test case.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/2491321058

 > [1] 08d65d81d88418b0cd7edd3bd2227faa58d022f0

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Yann E. MORIN <yann.morin@orange.com>
 > Cc: Sergio Prado <sergio.prado@e-labworks.com>
 > Cc: Matthew Weber <matthew.weber@collins.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
