Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B60C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36973420E5;
	Mon,  6 Nov 2023 21:42:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36973420E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ry9Wk0qtpX67; Mon,  6 Nov 2023 21:42:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F6C7420E0;
	Mon,  6 Nov 2023 21:42:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F6C7420E0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F114D1BF3A6
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC6204173B
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:42:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC6204173B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NdGuX4ryYYpn for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:42:43 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B857420E4
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:42:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B857420E4
Received: by mail.gandi.net (Postfix) with ESMTPSA id EBAF140003;
 Mon,  6 Nov 2023 21:42:41 +0000 (UTC)
Date: Mon, 6 Nov 2023 22:42:41 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231106224241.2e2a5635@windsurf>
In-Reply-To: <20231105171408.103503-1-fontaine.fabrice@gmail.com>
References: <20231105171408.103503-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699306962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tne8WBVpumeaCosfgDG9FyLpJATzu240RpdPeE0qR5M=;
 b=UfIXK2iYaNe94FCVEOKCzRVE9Iwqdy4R23VOwm7RP+bY916G+fFEHxKKVao3z5/LUL9Uts
 8bKlm0LhBQoZoxCRvaq/GGOoQFG74myd7GnJtHEyiSkfquVFRL+SrPn6/nEtPQfNPr6r2y
 2fHFq9Z/6LX+IfhI9LyWUr5pbqK2U6kbKiZKbol5EpxmaoCq8+Ei8VedtqtdZQA2M00pmg
 71ezoDG2a+q2+9i6t9NCERZ1lrdPpeqD/xFmaAcpnFgyBvgTtHjeAkIieJldPeNncxA2nc
 pP/fi0L6p8uC9T7lfkelO5R0QWtB/47MoifUGPzztMeWgn1gk7tRgwnXnXaCdA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UfIXK2iY
Subject: Re: [Buildroot] [PATCH 1/1] package/kvmtool: add
 KVMTOOL_CPE_ID_VENDOR
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

On Sun,  5 Nov 2023 18:14:08 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:kvmtool_project:kvmtool is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/detail/9B4C8068-B4EB-487F-958A-353BD3F494D1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/kvmtool/kvmtool.mk | 1 +
>  1 file changed, 1 insertion(+)

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
