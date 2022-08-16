Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE15C32772
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 09:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0955409AD;
	Tue, 16 Aug 2022 09:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0955409AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kE3ZW7lYHR_u; Tue, 16 Aug 2022 09:37:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A7E5408D1;
	Tue, 16 Aug 2022 09:37:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A7E5408D1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA5BC1BF2A2
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 09:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94ADA60D78
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 09:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94ADA60D78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hKVRaGBZ7rxt for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 09:37:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C79E60A6C
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C79E60A6C
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 09:37:33 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7754A1C0005;
 Tue, 16 Aug 2022 09:37:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oNt0r-001IGw-K3; Tue, 16 Aug 2022 11:37:29 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220620210856.771825-1-fontaine.fabrice@gmail.com>
Date: Tue, 16 Aug 2022 11:37:29 +0200
In-Reply-To: <20220620210856.771825-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 20 Jun 2022 23:08:55 +0200")
Message-ID: <878rnoedgm.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/x11r7/xserver_xorg-server: fix
 xephyr build with kdrive
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following xephyr build failure with kdrive raised since commit
 > eedbd6f97d51a0049ec512de26541465403ab06f:

 > checking for XEPHYR... no
 > configure: error: Package requirements (xau xdmcp xcb xcb-shape
 > xcb-render xcb-renderutil xcb-aux xcb-image xcb-icccm xcb-shm >= 1.9.3
 > xcb-keysyms xcb-randr xcb-xkb xcb-xv) were not met:

 > Package 'xcb-renderutil', required by 'virtual:world', not found
 > Package 'xcb-aux', required by 'virtual:world', not found
 > Package 'xcb-image', required by 'virtual:world', not found
 > Package 'xcb-icccm', required by 'virtual:world', not found
 > Package 'xcb-keysyms', required by 'virtual:world', not found

 > Fixes:
 >  - http://autobuild.buildroot.org/results/baba218c879b67bfbadc9c25d34313abc76397bc
 >  - http://autobuild.buildroot.org/results/9471b77db9aefa2fd0e5be61ea84709183511623

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
