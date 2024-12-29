Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BE6E7718F
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 22:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F5FD40644;
	Sun, 29 Dec 2024 22:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K7BkC6U2Gysp; Sun, 29 Dec 2024 22:35:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3855A40642
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3855A40642;
	Sun, 29 Dec 2024 22:35:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 08DFB72
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 22:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCCE6608CA
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 22:35:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EEpoViUtWZHw for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 22:35:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9BE636084D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BE636084D
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9BE636084D
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 22:35:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C5D1FF803;
 Sun, 29 Dec 2024 22:35:02 +0000 (UTC)
Date: Sun, 29 Dec 2024 23:35:01 +0100
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>, Grzegorz Blach <grzegorz@blach.pl>,
 Marcin Bis <marcin@bis.org.pl>, Fabrice Fontaine
 <fontaine.fabrice@gmail.com>
Message-ID: <20241229233501.44efb251@windsurf>
In-Reply-To: <20241210162243.1541113-1-fiona.klute@gmx.de>
References: <20241210162243.1541113-1-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735511702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XxgR2kKVTs61iG+TqnP0RMlN8rxkyX/a7BC7DpPYQMA=;
 b=P4E6J6RSN8dZQU+c1+njJ4YkCsimytPvF2yHyJtyS18blKxOgOpXfeZbvKjIFIVjLpxxKz
 xXt6J8weSaDU69gm1YXxfJql/jVAQJngkebC5YgbJqbdBGUvzS1eT3VR0vV94eZSFs96/g
 W/oiqg3oQVJw1te1D0P3/a1iQYnFgj66VsdR1SzNKgn77LAlKZ68QaS91Wf5biszZHvxiQ
 ZJyLP99A4ABoBJ4QpIEudAFIJRpktd3k/DUBuiPAaAmCezFxWeMorX6FmXxWVTAeEmOnzC
 nV42oyhll1rNMzV4PaDvTU54VmhKX/AczcIXQM8nzLyS8RoU6yLjky9S6lIgbw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=P4E6J6RS
Subject: Re: [Buildroot] [PATCH v2 1/4] package/bluez5_utils{,
 -headers}: bump version to 5.79
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 10 Dec 2024 17:22:39 +0100
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Upstream changelog:
> https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?h=5.79&id=0845b8f6ef2ac004b1c953cf4fe4ca3458cd8e36
> 
> Patch for musl compatibility taken from upstream "master".
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
>  .../bluez5_utils-headers.mk                   |  2 +-
>  ...0001-gdbus-define-MAX_INPUT-for-musl.patch | 33 +++++++++++++++++++
>  package/bluez5_utils/bluez5_utils.hash        |  2 +-
>  package/bluez5_utils/bluez5_utils.mk          |  2 +-
>  4 files changed, 36 insertions(+), 3 deletions(-)
>  create mode 100644 package/bluez5_utils/0001-gdbus-define-MAX_INPUT-for-musl.patch

Thanks, great patch series, applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
