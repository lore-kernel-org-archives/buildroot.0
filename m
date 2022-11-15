Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708F6C4332F
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 13:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF5A440355;
	Tue, 15 Nov 2022 13:14:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF5A440355
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TzGzSx8zfs64; Tue, 15 Nov 2022 13:14:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0F35402AA;
	Tue, 15 Nov 2022 13:14:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0F35402AA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2376A1BF94B
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F352940597
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:14:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F352940597
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CmAMohxcSNrH for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 13:14:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C987F4010C
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C987F4010C
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 13:14:36 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6024D60018;
 Tue, 15 Nov 2022 13:14:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ouvlo-008eel-BH; Tue, 15 Nov 2022 14:14:32 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20221113184933.47232-1-neal.frager@amd.com>
 <20221113215834.00ae7f71@windsurf>
Date: Tue, 15 Nov 2022 14:14:32 +0100
In-Reply-To: <20221113215834.00ae7f71@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sun, 13 Nov 2022 21:58:34 +0100")
Message-ID: <87tu30fjgn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/1]
 board/zynqmp/kria/kv260/uboot.fragment: remove unnecessary
 CONFIG_MULTI_DTB_FIT option
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Sun, 13 Nov 2022 11:49:33 -0700
 > Neal Frager via buildroot <buildroot@buildroot.org> wrote:

 >> This patch removes the CONFIG_MULTI_DTB_FIT u-boot option for the
 >> zynqmp_kria_kv260_defconfig as it is not necessary.  The post build
 >> kv260.sh creates the proper u-boot.itb without needing this option.
 >> 
 >> Signed-off-by: Neal Frager <neal.frager@amd.com>
 >> ---
 >> board/zynqmp/kria/kv260/uboot.fragment | 1 -
 >> 1 file changed, 1 deletion(-)

 > I've applied to master, after adding the following to the commit log:

 > """
 >     Fixes:
    
 >       https://gitlab.com/buildroot.org/buildroot/-/jobs/3310463281
 > """

 > For future patches, it would be nice if you could include such
 > references if your patch is aimed at fixing a Gitlab CI failure, or an
 > autobuilder failure. Thanks a lot!

Committed to 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
