Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC06BC00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 21:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EEC98176F;
	Tue, 26 Jul 2022 21:11:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EEC98176F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uyxYywb4dEAr; Tue, 26 Jul 2022 21:11:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 538B281766;
	Tue, 26 Jul 2022 21:11:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 538B281766
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22CC71BF59F
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F198D81766
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:11:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F198D81766
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LdaIycK0xm8u for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 21:11:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84F34813AC
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84F34813AC
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 21:11:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 661C9200008;
 Tue, 26 Jul 2022 21:11:10 +0000 (UTC)
Date: Tue, 26 Jul 2022 23:11:09 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220726231109.44aeb33e@windsurf>
In-Reply-To: <20220518013424.2558229-1-james.hilliard1@gmail.com>
References: <20220518013424.2558229-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658869871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yE2QzOncFd1R18opqoTYKHMSdRxn6iX+pUuLMAT3YfQ=;
 b=JFNikG6g/JwJiiNzerOiQX8cxtTI9z7/konaQSWeuP6x88nRLOcbZs6rn4vTr2WDquGr1b
 FKR3NVzeKvyf6NLUJYY6ZGGhz8DQrwQ3wi8VgXNrj+NQAJsm7dspw6TLJbCBHD+zwAp39U
 iMO4enPgD0s7xwv4n6jfb7++fK89njHf4SWB0d6+WZtiGpNK1XNUU5PnVBtdGPXchB3lf7
 9EE9UQhInISLAAPRM67CJ2CNBQeyXVwInD21wVdsIorSYmli3DxLSEvgAJWZ401icBdgdj
 p8QsR5ul1kOwEjqtveB0hz/E2ZefRlpeOAYcb9du72/Wdqi8cMdDDbKlWW6DnA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JFNikG6g
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5: bump packages to latest
 kde submodule versions
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Joshua Henderson <joshua.henderson@microchip.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org,
 =?UTF-8?B?R2HDq2w=?= Portay <gael.portay@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 17 May 2022 19:34:24 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Bump qt5 packages to latest submodule versions from:
> https://invent.kde.org/qt/qt/qt5/-/tree/kde/5.15
> 
> Drop a qt5location patch which is now upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/qt5/qt53d/qt53d.hash                  |   2 +-
>  package/qt5/qt53d/qt53d.mk                    |   2 +-
>  package/qt5/qt5base/qt5base.hash              |   2 +-
>  package/qt5/qt5base/qt5base.mk                |   2 +-
>  package/qt5/qt5charts/qt5charts.hash          |   2 +-
>  package/qt5/qt5charts/qt5charts.mk            |   2 +-
>  .../qt5/qt5connectivity/qt5connectivity.hash  |   2 +-
>  .../qt5/qt5connectivity/qt5connectivity.mk    |   2 +-
>  .../qt5/qt5declarative/qt5declarative.hash    |   2 +-
>  package/qt5/qt5declarative/qt5declarative.mk  |   2 +-
>  .../qt5graphicaleffects.hash                  |   2 +-
>  .../qt5graphicaleffects.mk                    |   2 +-
>  .../qt5/qt5imageformats/qt5imageformats.hash  |   2 +-
>  .../qt5/qt5imageformats/qt5imageformats.mk    |   2 +-
>  ...fix-compilation-for-no-opengl-builds.patch | 528 ------------------
>  package/qt5/qt5location/qt5location.hash      |   2 +-
>  package/qt5/qt5location/qt5location.mk        |   2 +-
>  package/qt5/qt5lottie/qt5lottie.hash          |   2 +-
>  package/qt5/qt5lottie/qt5lottie.mk            |   2 +-
>  package/qt5/qt5multimedia/qt5multimedia.hash  |   2 +-
>  package/qt5/qt5multimedia/qt5multimedia.mk    |   2 +-
>  .../qt5quickcontrols/qt5quickcontrols.hash    |   2 +-
>  .../qt5/qt5quickcontrols/qt5quickcontrols.mk  |   2 +-
>  .../qt5quickcontrols2/qt5quickcontrols2.hash  |   2 +-
>  .../qt5quickcontrols2/qt5quickcontrols2.mk    |   2 +-
>  .../qt5quicktimeline/qt5quicktimeline.hash    |   2 +-
>  .../qt5/qt5quicktimeline/qt5quicktimeline.mk  |   2 +-
>  .../qt5remoteobjects/qt5remoteobjects.hash    |   2 +-
>  .../qt5/qt5remoteobjects/qt5remoteobjects.mk  |   2 +-
>  package/qt5/qt5script/qt5script.hash          |   2 +-
>  package/qt5/qt5script/qt5script.mk            |   2 +-
>  package/qt5/qt5scxml/qt5scxml.hash            |   2 +-
>  package/qt5/qt5scxml/qt5scxml.mk              |   2 +-
>  package/qt5/qt5sensors/qt5sensors.hash        |   2 +-
>  package/qt5/qt5sensors/qt5sensors.mk          |   2 +-
>  package/qt5/qt5serialbus/qt5serialbus.hash    |   2 +-
>  package/qt5/qt5serialbus/qt5serialbus.mk      |   2 +-
>  package/qt5/qt5serialport/qt5serialport.hash  |   2 +-
>  package/qt5/qt5serialport/qt5serialport.mk    |   2 +-
>  package/qt5/qt5svg/qt5svg.hash                |   2 +-
>  package/qt5/qt5svg/qt5svg.mk                  |   2 +-
>  package/qt5/qt5tools/qt5tools.hash            |   2 +-
>  package/qt5/qt5tools/qt5tools.mk              |   2 +-
>  .../qt5virtualkeyboard.hash                   |   2 +-
>  .../qt5virtualkeyboard/qt5virtualkeyboard.mk  |   2 +-
>  package/qt5/qt5wayland/qt5wayland.hash        |   2 +-
>  package/qt5/qt5wayland/qt5wayland.mk          |   2 +-
>  package/qt5/qt5webchannel/qt5webchannel.hash  |   2 +-
>  package/qt5/qt5webchannel/qt5webchannel.mk    |   2 +-
>  package/qt5/qt5websockets/qt5websockets.hash  |   2 +-
>  package/qt5/qt5websockets/qt5websockets.mk    |   2 +-
>  package/qt5/qt5webview/qt5webview.hash        |   2 +-
>  package/qt5/qt5webview/qt5webview.mk          |   2 +-
>  package/qt5/qt5x11extras/qt5x11extras.hash    |   2 +-
>  package/qt5/qt5x11extras/qt5x11extras.mk      |   2 +-
>  .../qt5/qt5xmlpatterns/qt5xmlpatterns.hash    |   2 +-
>  package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk  |   2 +-
>  57 files changed, 56 insertions(+), 584 deletions(-)
>  delete mode 100644 package/qt5/qt5location/0002-fix-compilation-for-no-opengl-builds.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
