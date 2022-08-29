Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4D1ECAAD4
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 09:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0D0240490;
	Mon, 29 Aug 2022 09:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0D0240490
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2UpcUTqGeTgi; Mon, 29 Aug 2022 09:33:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F371B404C7;
	Mon, 29 Aug 2022 09:33:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F371B404C7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E425E1BF3EF
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 09:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC01640476
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 09:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC01640476
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5WZMT5cjgY-G for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 09:33:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F7CC403E2
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F7CC403E2
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 09:33:09 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B42112000B;
 Mon, 29 Aug 2022 09:33:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oSb8i-00HCLN-Sq; Mon, 29 Aug 2022 11:33:04 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220514092152.1625466-1-fontaine.fabrice@gmail.com>
 <20220726233730.2d2babdb@windsurf>
Date: Mon, 29 Aug 2022 11:33:04 +0200
In-Reply-To: <20220726233730.2d2babdb@windsurf> (Thomas Petazzoni via
 buildroot's message of "Tue, 26 Jul 2022 23:37:30 +0200")
Message-ID: <87y1v74cof.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/v4l2loopback: add
 V4L2LOOPBACK_LINUX_CONFIG_FIXUPS
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
Cc: Alexandre Esse <alexandre.esse.dev@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Sat, 14 May 2022 11:21:52 +0200
 > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

 >> Fix the following build failure:
 >> 
 >> ERROR: modpost: "video_ioctl2"
 >> [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko]
 >> undefined!
 >> ERROR: modpost: "__video_register_device"
 >> [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko]
 >> undefined!
 >> ERROR: modpost: "v4l2_ctrl_new_custom"
 >> [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko]
 >> undefined!
 >> ERROR: modpost: "v4l2_ctrl_handler_init_class"
 >> [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko]
 >> undefined!
 >> ERROR: modpost: "video_device_alloc"
 >> [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko]
 >> undefined!
 >> ERROR: modpost: "v4l2_device_register"
 >> [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko]
 >> undefined!
 >> ERROR: modpost: "video_device_release"
 >> [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko]
 >> undefined!
 >> ERROR: modpost: "v4l2_ctrl_handler_free"
 >> [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko]
 >> undefined!
 >> ERROR: modpost: "v4l2_device_unregister"
 >> [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko]
 >> undefined!
 >> ERROR: modpost: "video_unregister_device"
 >> [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko]
 >> undefined!
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/640f8f61c7f433ffe5e9a6759eecc9a03f735569
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> package/v4l2loopback/v4l2loopback.mk | 5 +++++
 >> 1 file changed, 5 insertions(+)

 > Applied with the fixes suggested by Yann. Thanks!

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
