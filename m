Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7C3C636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 16:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87C0261135;
	Wed,  8 Feb 2023 16:44:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87C0261135
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eZ_vt3Cc3GyZ; Wed,  8 Feb 2023 16:44:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD24860AFF;
	Wed,  8 Feb 2023 16:44:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD24860AFF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 04F8E1BF286
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 16:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF9B640948
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 16:44:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF9B640948
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zh9yuSq-d37Z for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 16:44:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B215640868
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B215640868
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 16:44:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EF43020004;
 Wed,  8 Feb 2023 16:44:19 +0000 (UTC)
Date: Wed, 8 Feb 2023 17:44:19 +0100
To: Frank Vanbever <frank.vanbever@mind.be>
Message-ID: <20230208174419.3374a888@windsurf>
In-Reply-To: <20230208155752.73981-1-frank.vanbever@mind.be>
References: <20230208155752.73981-1-frank.vanbever@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675874660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xWKN0lARvbRiNZPZS+5duCVteYd4uWXYaNCfVPE4qAo=;
 b=kWxM0ANa3X/XakCiyVG/A9gzymxm4tyhaSBn5Rm/vzHHB5EYer40BAMJZToFr/9TAHYLJu
 QdeQqxMZNXZlkozdUlGgYnFdqV5f8j+x0XPrW67nPCdKy8WpdDYKUEQyGjPNbJqrnJrkFC
 ZGK0D1SK5vJ2MPkJ4Kq6h57eKoj/xjkvRbrGR3YJ8QGhlH+gA+3OAe6dgf0P8u87yRTo3J
 Mm6A5Zl9+BGtOdfMXLci/PElq4N8oO/HTWnfCsQHBnVLAXZvxnQRIjXHmSEKy9CcRG0/xf
 X+wDXs0U1Fg5lgON71SGM+vXk3mECoGC+yHDXW82j7r6ZUdzw+yiKObt3mXXKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kWxM0ANa
Subject: Re: [Buildroot] [PATCH 1/2] package/nginx-modsecurity: bump to
 version 1.0.3
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

On Wed,  8 Feb 2023 16:57:51 +0100
Frank Vanbever <frank.vanbever@mind.be> wrote:

> Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>
> ---
>  package/nginx-modsecurity/nginx-modsecurity.hash | 4 ++--
>  package/nginx-modsecurity/nginx-modsecurity.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Series of two patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
