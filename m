Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6891C02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 20:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6809B8212A;
	Fri, 24 Jan 2025 20:05:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id by6gRl0wLz55; Fri, 24 Jan 2025 20:05:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8548E82142
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8548E82142;
	Fri, 24 Jan 2025 20:05:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 587CF94A
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 467478212A
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:05:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zp4AOsxY0Rlb for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 20:05:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 190988213E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 190988213E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 190988213E
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:05:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 2BA51B00572;
 Fri, 24 Jan 2025 21:05:12 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:36626])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 24 Jan 2025 21:05:12 +0100
MIME-Version: 1.0
Date: Fri, 24 Jan 2025 21:05:12 +0100
From: Julien Olivain <ju.o@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250123144032.1429434-1-fiona.klute@gmx.de>
References: <20250123144032.1429434-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.9
Message-ID: <e194f1d1813c5be0c9d4a4e95076c0f1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737749114;
 bh=vO1hmqyjm5dKcfxaVVukQpb7Q0jdtCoK07bbWqvefyY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fG9iR8XwL4ClBZ6LHhjihjBWlVSVOjGJiZe0jFUyb5Bs1cZyq9Ru0by+4mVxTQr46
 vTq+7/qct2LEz7Q4W7RquMgimBruPYaFwAPi5SXdyECYRl/smHhCc9AB2hTo2zTBm+
 Y+4II3ysdIa+LccWor79Vs5oTtSBHld0NB86kLfDwHeakcA1xZBqXziAODDm/1dxC0
 WFcX7/ZtLHky0D5yuh8zhgTcfQk1C9TQSuz/8C5b8BHqqLF1XZzye7lzPZdGTeMp9S
 K+ilEzD+hfIGRUMNPKHBC344nBAANOaydgWmh7tfX2ClYKBrpzWM+In2Rt5pIPCvBl
 /yEJi/xv3Rovw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fG9iR8Xw
Subject: Re: [Buildroot] [PATCH 1/1] package/panel-mipi-dbi-firmware: new
 package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fiona,

Thanks for the patch!

On 23/01/2025 15:40, Fiona Klute via buildroot wrote:
[...]
> diff --git a/package/panel-mipi-dbi-firmware/panel-mipi-dbi-firmware.mk 
> b/package/panel-mipi-dbi-firmware/panel-mipi-dbi-firmware.mk
> new file mode 100644
> index 0000000000..c3a9fa7afc
> --- /dev/null
> +++ b/package/panel-mipi-dbi-firmware/panel-mipi-dbi-firmware.mk
> @@ -0,0 +1,35 @@
> +################################################################################
> +#
> +# panel-mipi-dbi-firmware
> +#
> +################################################################################
> +
> +PANEL_MIPI_DBI_FIRMWARE_VERSION = 
> 1cbd40135a8c7f25d7b444a7fac77fd3c3ad471e
> +PANEL_MIPI_DBI_FIRMWARE_SITE = 
> https://github.com/notro/panel-mipi-dbi.git
> +PANEL_MIPI_DBI_FIRMWARE_SITE_METHOD = git
> +PANEL_MIPI_DBI_FIRMWARE_LICENSE = CC0-1.0
> +# license info is directly in the only source file
> +PANEL_MIPI_DBI_FIRMWARE_LICENSE_FILES = mipi-dbi-cmd
> +
> +PANEL_MIPI_DBI_FIRMWARE_DEPENDENCIES = host-python3

The script mipi-dbi-cmd does not seem to depend on extra host python
modules. See:
https://github.com/notro/panel-mipi-dbi/blob/main/mipi-dbi-cmd#L15

Do you think we could use BR2_PYTHON3_HOST_DEPENDENCY instead? See:
https://gitlab.com/buildroot.org/buildroot/-/commit/b98062f7301bc72d2a59cca733f36525405d3bb9

This could save the time of the host-python compilation, in some 
situation.

What do you think?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
