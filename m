Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8B4C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 14:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD97240256;
	Thu,  9 May 2024 14:14:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r2EHp4DX1RLk; Thu,  9 May 2024 14:14:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B677B40999
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B677B40999;
	Thu,  9 May 2024 14:14:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7503C1BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62CB740111
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k6y-bkp8f0sy for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 14:14:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0F6ED400F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F6ED400F5
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F6ED400F5
 for <buildroot@buildroot.org>; Thu,  9 May 2024 14:14:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BCA491BF204;
 Thu,  9 May 2024 14:14:27 +0000 (UTC)
Date: Thu, 9 May 2024 16:14:26 +0200
To: Nayab Sayed via buildroot <buildroot@buildroot.org>
Message-ID: <20240509161426.14b7e757@windsurf>
In-Reply-To: <20240509-refresh-busybox-config-v2-1-71a4c8061ac7@microchip.com>
References: <20240509-refresh-busybox-config-v2-1-71a4c8061ac7@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715264067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6c+QzDBOfDq9C4AtcJJey6FaAM9EnLMnaZn6uYabWL4=;
 b=l9O14CLbbKnglcK8tQZ8i8gZf1lkIeGZBR5IC3x3llmGd+fgXbhPuMuv+X7s+d3eUQuom3
 7s8+d5ONF3HgPldgvzZdHHnLJ1eBc+6/UMnhIUA3GqWj5pixsYqy0jn4J/k5FtKmx4b3Iq
 6mNMb4gwpvKV2MyT/0z842YtuUL3yIuElFa9+P2MUd2S1orlw4OyJsYfOmZgEot0jCj+2Z
 DjbBs7VoWI8B63zJcacjj5IaFuKj2Tv5yxlJUzTqZXFsumb+SXnyQTHSI6OJ1EOrw4gjen
 /Ix0WwwxUzL/bbaddUk8yEAYbUl+3v1GMZpBeqXz+Csw+msHQbWd57N8PTGJjA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=l9O14CLb
Subject: Re: [Buildroot] [PATCH v2] package/busybox: refresh busybox.config
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
Cc: Nayab Sayed <nayabbasha.sayed@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 9 May 2024 11:27:01 +0530
Nayab Sayed via buildroot <buildroot@buildroot.org> wrote:

> Refresh busybox.config to current version (1.36.1) default values.
> 
> Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
> ---
> When `make busybox-update-config` is executed, the config
> CONFIG_UDHCPC6_DEFAULT_SCRIPT became empty. But it's updated to reuse the
> value from earlier bump as mentioned in the commit d68b617993bd
> (package/busybox: update to 1.36.0).
> ---
> Changes in v2:
> - remove local custom config
> - Link to v1: https://lore.kernel.org/r/20240426-refresh-busybox-config-v1-1-c70cb5b60243@microchip.com
> ---
>  package/busybox/busybox.config | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

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
