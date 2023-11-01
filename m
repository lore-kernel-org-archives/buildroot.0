Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6044EC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 16:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10B16431B4;
	Wed,  1 Nov 2023 16:26:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10B16431B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bz5_DQQObHMK; Wed,  1 Nov 2023 16:26:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A596A431C2;
	Wed,  1 Nov 2023 16:26:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A596A431C2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 735131BF841
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EC64431D4
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:25:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EC64431D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6RESd8CWsswz for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 16:25:13 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84D98431D7
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 16:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84D98431D7
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1B27E0009;
 Wed,  1 Nov 2023 16:25:03 +0000 (UTC)
Date: Wed, 1 Nov 2023 17:25:03 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231101172503.0331771b@windsurf>
In-Reply-To: <20231029215348.25075-1-fontaine.fabrice@gmail.com>
References: <20231029215348.25075-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698855904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OHXN+anwG5dDHGuWDANXYBTOpG3G+mFNx1mg39u1UiE=;
 b=gn3d5XtWOWDNN3Y8lKqE4anJYyA6BfZ9oqV4vmzJYM4YAk/d/DPAamkJFe45OxLiPUEbmR
 z/cg2THKXiTGXl9pUR/d8ojY/S+rxtdPFSaVWxK199Kd7R30Qxa75jEYRRsqZyHDAJg/UM
 dNzCWuQqevzpkh/SJkYtXL3+kYDmQX7ppe6dEvMTzJbG8sOq08WhnJ0zN4uXjoK7KPZsTr
 LqBgWSlTo1+VlEA+8KmJQhZrkvSQXTgkWz4X/tMXojchtRycwLb7URO7EILnYcslSIWR6x
 Dy5Sl7ktX6QiccAOkK1FxksrQzTxvg7GYVXiWSiSm4Sj867A++B2V7hzj0x60w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gn3d5XtW
Subject: Re: [Buildroot] [PATCH 1/1] package/zeromq: bump to version 4.3.5
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 29 Oct 2023 22:53:48 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (already in version)
> - Relicensing from LGPL-3.0+ to MPL-2.0:
>   https://github.com/zeromq/libzmq/commit/da31917f4f443df751871ee359f7562cf6d77bde
> 
> https://github.com/zeromq/libzmq/releases/tag/v4.3.5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-define-missing-rebind-type.patch     | 62 -------------------
>  package/zeromq/zeromq.hash                    |  9 ++-
>  package/zeromq/zeromq.mk                      |  6 +-
>  3 files changed, 7 insertions(+), 70 deletions(-)
>  delete mode 100644 package/zeromq/0001-define-missing-rebind-type.patch

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
