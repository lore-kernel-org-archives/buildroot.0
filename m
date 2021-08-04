Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ACD2C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:16:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F198F60F41
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F198F60F41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8512402AE;
	Wed,  4 Aug 2021 20:16:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bjBEWc-1N72h; Wed,  4 Aug 2021 20:16:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC3EC40298;
	Wed,  4 Aug 2021 20:16:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D4AF21BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4BAF60A73
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:16:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mTHzx_8QyTrc for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 20:16:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A82FD606C9
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 20:16:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id C361DE0006;
 Wed,  4 Aug 2021 20:16:06 +0000 (UTC)
Date: Wed, 4 Aug 2021 22:16:05 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Lang Daniel <d.lang@abatec.at>
Message-ID: <20210804221605.0a877f5c@windsurf>
In-Reply-To: <0362514c96010df2fa774a7433f1cc031ffa5494.camel@abatec.at>
References: <0362514c96010df2fa774a7433f1cc031ffa5494.camel@abatec.at>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/paho-mqtt-cpp: bump version to
 1.2.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "tuzakli.refik@gmail.com" <tuzakli.refik@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Tue, 3 Aug 2021 06:29:06 +0000
Lang Daniel <d.lang@abatec.at> wrote:

> "This release brings in some missing MQTT v5 features, support for
> websocket headers and proxies, ALPN protocol lists, adds the builder
> pattern for options, and fixes a number of bugs in both the C++ library
> and the underlying C lib."
> 
> https://github.com/eclipse/paho.mqtt.cpp/releases/tag/v1.2.0
> 
> This also makes the patch obsolete, since these changes have been merged upstream.
> 
> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> ---
>  DEVELOPERS                                    |  3 ++
>  ...FindMahoMqttC.cmake-fix-static-build.patch | 35 -------------------
>  package/paho-mqtt-cpp/paho-mqtt-cpp.hash      |  2 +-
>  package/paho-mqtt-cpp/paho-mqtt-cpp.mk        |  2 +-
>  4 files changed, 5 insertions(+), 37 deletions(-)
>  delete mode 100644 package/paho-mqtt-cpp/0001-cmake-FindMahoMqttC.cmake-fix-static-build.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
