Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6771FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 16:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DDC94197A;
	Tue, 21 Jun 2022 16:50:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DDC94197A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qMxBpUfL4dNd; Tue, 21 Jun 2022 16:50:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 668B6415C3;
	Tue, 21 Jun 2022 16:50:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 668B6415C3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E5C771BF322
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 16:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB60660D87
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 16:50:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB60660D87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KrKsCW5_0Bpj for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 16:50:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E516F60BCE
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E516F60BCE
 for <buildroot@uclibc.org>; Tue, 21 Jun 2022 16:50:04 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1o3h4j-0006hr-PI
 for buildroot@uclibc.org; Tue, 21 Jun 2022 18:50:01 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 21 Jun 2022 18:45:18 +0200
Message-ID: <pan$7316b$941419a7$449ba472$801c4201@ID-313208.user.individual.net>
References: <20220620210856.771825-1-fontaine.fabrice__3982.8961993166$1655759559$gmane$org@gmail.com>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Mon, 20 Jun 2022 23:08:55 +0200 schrieb Fabrice Fontaine:

> Fix the following xephyr build failure with kdrive raised since commit
> eedbd6f97d51a0049ec512de26541465403ab06f:
> 
> checking for XEPHYR... no configure: error: Package requirements (xau
> xdmcp xcb xcb-shape xcb-render xcb-renderutil xcb-aux xcb-image
> xcb-icccm xcb-shm >= 1.9.3 xcb-keysyms xcb-randr xcb-xkb xcb-xv) were
> not met:
> 
> Package 'xcb-renderutil', required by 'virtual:world', not found Package
> 'xcb-aux', required by 'virtual:world', not found Package 'xcb-image',
> required by 'virtual:world', not found Package 'xcb-icccm', required by
> 'virtual:world', not found Package 'xcb-keysyms', required by
> 'virtual:world', not found
> 
> Fixes:
>  -
>  http://autobuild.buildroot.org/results/
baba218c879b67bfbadc9c25d34313abc76397bc
>  -
>  http://autobuild.buildroot.org/results/
9471b77db9aefa2fd0e5be61ea84709183511623
> 
> Signed-off-by: Fabrice Fontaine
> <fontaine.fabrice@gmail.com>

Reviewed-by: Bernd Kuhls <bernd.kuhls@t-online.de>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
