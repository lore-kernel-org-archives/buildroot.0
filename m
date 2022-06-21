Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD51C43334
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 16:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2CDD60F81;
	Tue, 21 Jun 2022 16:44:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2CDD60F81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TKUVvb6FV9CQ; Tue, 21 Jun 2022 16:44:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3C7A60D87;
	Tue, 21 Jun 2022 16:44:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3C7A60D87
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7A6B21BF322
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 16:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 553AA4197A
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 16:44:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 553AA4197A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id efwAzX-_VtLO for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 16:44:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F274041970
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F274041970
 for <buildroot@uclibc.org>; Tue, 21 Jun 2022 16:44:48 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1o3gzd-0009lQ-AC
 for buildroot@uclibc.org; Tue, 21 Jun 2022 18:44:45 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 21 Jun 2022 18:44:21 +0200
Message-ID: <pan$e9858$cfef4f27$37918292$eba61d0e@ID-313208.user.individual.net>
References: <20220620210856.771825-1-fontaine.fabrice@gmail.com>
 <CAPi7W81oR4RwqWmFLq2M_EG-11N+B1sCOxhu_NT8xcTQnJ-ZCw__39402.966496867$1655760346$gmane$org@mail.gmail.com>
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

Am Mon, 20 Jun 2022 23:22:26 +0200 schrieb Fabrice Fontaine:

> Bernd already sent the same patch:
> https://patchwork.ozlabs.org/project/buildroot/patch/
20220620184925.538342-1-bernd.kuhls@t-online.de/
> 
> I can set this one as superseded however I would advise to only add
> those dependencies if BR2_PACKAGE_XSERVER_XORG_SERVER_XEPHYR and
> BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE are set.

Hi Fabrice,

you are right, the new dependencies should depend on 
BR2_PACKAGE_XSERVER_XORG_SERVER_XEPHYR. I missed this additional 
dependency, therefore I marked my patch as superseded.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
