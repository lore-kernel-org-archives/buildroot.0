Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CA0C433FE
	for <buildroot@archiver.kernel.org>; Fri, 11 Nov 2022 22:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65E4E8195D;
	Fri, 11 Nov 2022 22:51:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65E4E8195D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a6O2vtPh9yVe; Fri, 11 Nov 2022 22:51:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6C3A8191E;
	Fri, 11 Nov 2022 22:51:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6C3A8191E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CF1081BF290
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 22:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA4988191E
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 22:51:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA4988191E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rh4rAPC0M__3 for <buildroot@lists.busybox.net>;
 Fri, 11 Nov 2022 22:51:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7465180D47
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7465180D47
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 22:51:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3A9DC1C0002;
 Fri, 11 Nov 2022 22:51:35 +0000 (UTC)
Date: Fri, 11 Nov 2022 23:51:34 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221111235134.3c819f0f@windsurf>
In-Reply-To: <20221111224218.6160-1-fontaine.fabrice@gmail.com>
References: <20221111224218.6160-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668207095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uiuHlsFZ4QvQPccXiJ0WcFVRbzvhkkHQQ5dbowAcSEw=;
 b=HO7oWPzfZ4rsqH/Uzpm7iaHXPvYnb+ZyrsQRLCepAk88Tud+6BOas3E7q1Go107Z5Suyme
 b/cB69xqCU5box5oGhN6iLXnL9vW/xaNiUmyBFS0hzGVvRRU6XeRcxXz0TsECVQzlRFZSs
 7s+nXbN45LjLOcibSL7v72Jzpxw3gwHDHP/3hOgsL+EJYP82rgYE6rtiHnPZ8jbiY4fj43
 z1Oc/LSr2Uxx8UVjnG5XUurj9PT/85TI4Ng+1ESegIxadAgCRoKqbkmm3iRPBetwUPvYmH
 QE+eY7VB0hKu+WkSe9d+5hB+A9TjILyk991DpLqaVdtEmjPevMsk+lp2ijCAcg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HO7oWPzf
Subject: Re: [Buildroot] [PATCH 1/1] package/lxc: fix systemd build
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
Cc: =?UTF-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 11 Nov 2022 23:42:18 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following systemd build failure raised since bump to version
> 5.0.1 in commit db19998035701d08bf1b5fd366e0b5aa9adb8e57:
> 
> ../src/lxc/cgroups/cgfsng.c: In function 'unpriv_systemd_create_scope':
> ../src/lxc/cgroups/cgfsng.c:1234:104: error: incompatible type for argument 10 of 'sd_bus_call_method_asyncv'
>  r = sd_bus_call_method_asyncv(bus, NULL, DESTINATION, PATH, INTERFACE, "Subscribe", NULL, NULL, NULL, NULL);
>                                                                                                        ^~~~
> 
> Fixes:
>  - https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261449
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...thod_async-to-replace-the-asyncv-one.patch | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 package/lxc/0002-use-sd_bus_call_method_async-to-replace-the-asyncv-one.patch

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
