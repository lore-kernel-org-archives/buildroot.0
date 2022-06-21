Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E6CC433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 14:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33F84404E5;
	Tue, 21 Jun 2022 14:41:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33F84404E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vlFt_tirVped; Tue, 21 Jun 2022 14:41:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AAE940204;
	Tue, 21 Jun 2022 14:41:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AAE940204
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D5B01BF5A5
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 14:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4CD340204
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 14:41:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4CD340204
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PKaLJVwDg3nF for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 14:41:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4646F4019B
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4646F4019B
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 14:41:45 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3888EFF80F;
 Tue, 21 Jun 2022 14:41:43 +0000 (UTC)
Date: Tue, 21 Jun 2022 16:41:42 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220621164142.4567715d@booty>
In-Reply-To: <20220619162933.627103-1-fontaine.fabrice@gmail.com>
References: <20220619162933.627103-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1655822503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=08IxMDf5uls6dFFjMM+bvic+3LEHXPYXz0R/NfAzjaQ=;
 b=JQldL+jzv0f+wGdnP6X37LxtiBwaKCCZhX4SwrpYOEsPCEv9e9mZiMfa5V2jYySRRqupmf
 4DS0mfdhDw+n7/mjX1VUY8CzXs8xtyhvUJhZXTCcyEip4UjBdptD0xb/gSgcVF8cbnI5rp
 9QXNh46AXWjkNd6I0aIqOB4e3Q06vBaH64eJ7taIDLxBdBF94bV8yZEUhqNMR0jFTBm+W6
 FfWmEp/ew/62ZBzO+BLAuRtmDOSORmf8ah8lyS5oxrJsvdMMJAEHrvu5e74dG04uTfcZ22
 dLGXXZtPZJPaMm9Nks447KWOXpxDHhqga1jfhjNhZarMQp8pwEoWcALNvfLgFA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JQldL+jz
Subject: Re: [Buildroot] [PATCH 1/1] package/libpjsip: fix CVE-2022-31031
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 19 Jun 2022 18:29:33 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> PJSIP is a free and open source multimedia communication library written
> in C language implementing standard based protocols such as SIP, SDP,
> RTP, STUN, TURN, and ICE. In versions prior to and including 2.12.1 a
> stack buffer overflow vulnerability affects PJSIP users that use STUN in
> their applications, either by: setting a STUN server in their
> account/media config in PJSUA/PJSUA2 level, or directly using
> `pjlib-util/stun_simple` API.
> 
> https://github.com/pjsip/pjproject/security/advisories/GHSA-26j7-ww69-c4qj
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
