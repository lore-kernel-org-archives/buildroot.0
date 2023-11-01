Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3B3C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 16:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E12F4172D;
	Wed,  1 Nov 2023 16:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E12F4172D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v9RUaqYs1MPi; Wed,  1 Nov 2023 16:52:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 183CE41768;
	Wed,  1 Nov 2023 16:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 183CE41768
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 170231BF2F1
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2CB541768
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2CB541768
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cgf_4ku2sbLr for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 16:52:46 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2EDE64172D
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 16:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EDE64172D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43D9120002;
 Wed,  1 Nov 2023 16:52:43 +0000 (UTC)
Date: Wed, 1 Nov 2023 17:52:42 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231101175242.765694dd@windsurf>
In-Reply-To: <20231022203123.54493-1-fontaine.fabrice@gmail.com>
References: <20231022203123.54493-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698857563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YsZgvF2jJV/61a/FyQiPNKEuX7MhaNElGuZCVX0per0=;
 b=jIX3P82rO3WMxSvBMNdyGOznrhVBpAkGZkxlsXw0rUrdHqZ1TizLFJ2Qf/CIFfDdWVUv7o
 rRfun4+HzZcprBDL0UTC1ZYr0zCZKTGEtSpk7HBG6V1iqy0UAd/BJlCEjsiEhzxRQxjxRS
 Wu9JeM9fGOLpCAJ8pNiaRX3mOQz1C4egoQEQXGzWlVQcs8LN0w/DydOPfzk2mlaBY5wGlZ
 LDigNuMTrRbs3ExQ9tY/d+KAQGHYdOBt2sZh/OKd11TEXFJUYKtbyYl3tKQ6/GjPJV2UYd
 8UnV+1VmYAXRZBLfRDprChLn+6qmnpY17CLTieFgPXeFrL0QcAabGX4qEPkKlw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jIX3P82r
Subject: Re: [Buildroot] [PATCH 1/1] package/lxc: bump to version 5.0.3
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

On Sun, 22 Oct 2023 22:31:23 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://discuss.linuxcontainers.org/t/lxc-5-0-3-lts-has-been-released/17708
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lxc/lxc.hash | 2 +-
>  package/lxc/lxc.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
