Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C175C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 08:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1434403C9;
	Mon, 18 Dec 2023 08:25:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1434403C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZFhUORwKICP0; Mon, 18 Dec 2023 08:25:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F22DA405B2;
	Mon, 18 Dec 2023 08:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F22DA405B2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 16D271BF86B
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E33EC4071E
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E33EC4071E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GcDh5QC0p6hz for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 08:25:07 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC26240570
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 08:25:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC26240570
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4BE5A4000A;
 Mon, 18 Dec 2023 08:25:03 +0000 (UTC)
Date: Mon, 18 Dec 2023 09:25:02 +0100
To: Maxim Kochetkov <fido_max@inbox.ru>
Message-ID: <20231218092502.6420104b@windsurf>
In-Reply-To: <20231205055220.84306-1-fido_max@inbox.ru>
References: <20231205055220.84306-1-fido_max@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1702887903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fr3Vxr5PUI297bbXxjNXhBOLpOz4X+36BQXPINFr5fg=;
 b=E8/d+ljfwEVaMdwqHRELUbXjVoKekkcYfcpfC1YlP4FPi7tomA/uyVgXfrlY12ero23fVr
 Jwutwp6hURIYmlKZQ8tuIt0ebVZMKPqoMqsZr3Q89W43c9edDzKb3wGPcRGGa89Oh6w2XB
 Fb2YQomUpi4GxdXIvhogfGe9VTOStpe7Uz70iW2fP2H2FvS46vIZdy5glQN92ocGdLHkZj
 J5kT4+5XXnz+X7vOg6V24R1ZpFEZCOE8uqoqAv+pU/fuOpxFI2fqwb3ncObhKn9r8NCIcx
 niWZ52xK6bX0kaVCbSOwBCXi/QWxU6DJmWgQ6p+Vdcu5pVifbdhi6WYsd0WkLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=E8/d+ljf
Subject: Re: [Buildroot] [PATCH 1/1] package/timescaledb: bump version to
 2.13.0
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

On Tue,  5 Dec 2023 08:52:20 +0300
Maxim Kochetkov <fido_max@inbox.ru> wrote:

> Release notes: https://github.com/timescale/timescaledb/blob/2.13.0/CHANGELOG.md
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/timescaledb/timescaledb.hash | 2 +-
>  package/timescaledb/timescaledb.mk   | 2 +-
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
