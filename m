Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53946E71060
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 12:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08FBB83C2B;
	Thu, 21 Sep 2023 12:25:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08FBB83C2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0VWeX4swJQJQ; Thu, 21 Sep 2023 12:25:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6050582355;
	Thu, 21 Sep 2023 12:25:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6050582355
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3F3411BF3AD
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 12:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9F78409BD
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 12:25:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9F78409BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z72Adu8WyPGu for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 12:25:28 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B9A584002B
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 12:25:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9A584002B
Received: by mail.gandi.net (Postfix) with ESMTPSA id E979D1BF210;
 Thu, 21 Sep 2023 12:25:24 +0000 (UTC)
Date: Thu, 21 Sep 2023 14:25:24 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230921142524.1fec24d4@windsurf>
In-Reply-To: <20230920211242.43437-1-fontaine.fabrice@gmail.com>
References: <20230920211242.43437-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695299125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LSILDhs33ap/Fbfc5c1eZyLRzJna4+AzN1qd6V55Va0=;
 b=Ec/aEYhL8XoGhjcKXhXmx/wLJzaaYgEUTW+e/cyxTWn2ueAYGVwUblXGR6QNjfBqjaXB7i
 cer3aaQLRohXM99SnVhKSudsdux9H8lZgSPhIl5+q4zn26E0L/T5GFz41Jvf18ora3foLs
 abVFenaR35X9I1QxXY0dcXtsxkRt0iANdlQ9q4hcxkGehR8u3Uury6GjRTRoj2vWdXDKVQ
 X47Y7AivsBTpRU75RgTk7wVqEIgsy7wM2DJXe3RHqHpBVbo3zMm5C42K+nYVRK/ttmp3Wg
 HBJuP7bp7a1WoM3oqZD2IczEu5PQFNTrS22FjNqv15FviIUoSSB7UTuw7se7Xg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ec/aEYhL
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/openvpn: dco needs headers >= 4.16
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 20 Sep 2023 23:12:42 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> NLMSGERR_ATTR_MAX has been added in kernel 4.16 with
> https://github.com/torvalds/linux/commit/dc2b9f19e3bdaa87a7c3d123b8bba8a42d96d942
> resulting in the following build failure since bump to version 2.6.4 in
> commit a46ac2346558d05afe405dda3730169df4b677d2 and
> https://github.com/OpenVPN/openvpn/commit/e34437c26b764851555e4acbe2ccca6bec235c7e:
> 
> dco_linux.c: In function 'ovpn_nl_cb_error':
> dco_linux.c:303:27: error: 'NLMSGERR_ATTR_MAX' undeclared (first use in this function); did you mean '__CTRL_ATTR_MAX'?
>      struct nlattr *tb_msg[NLMSGERR_ATTR_MAX + 1];
>                            ^~~~~~~~~~~~~~~~~
>                            __CTRL_ATTR_MAX
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/69b9737913ac0b5cd2c117d526602874da3ee487
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Only disable dco with headers < 4.16

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
