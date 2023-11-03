Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482B3C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 09:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0207D60E7C;
	Fri,  3 Nov 2023 09:34:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0207D60E7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IGwg2RnlZgBK; Fri,  3 Nov 2023 09:34:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56C3F70821;
	Fri,  3 Nov 2023 09:34:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56C3F70821
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9EDFA1BF27E
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 09:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 777EF60E72
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 09:32:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 777EF60E72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pqX2SHauJCeX for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 09:32:45 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F9E460644
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 09:32:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F9E460644
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0EF86FF811;
 Fri,  3 Nov 2023 09:32:41 +0000 (UTC)
Date: Fri, 3 Nov 2023 10:32:41 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231103103241.1f96f389@windsurf>
In-Reply-To: <20231102213443.201027-1-fontaine.fabrice@gmail.com>
References: <20231102213443.201027-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699003962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HJ+iv/BA7UXoiGU+yDRVIm+BpXhwFNtQBs91xNt2ZwY=;
 b=CXXarYDGDXpodVybKP+qApx0fVOn1hqVOVM6ol8kOLkJ5PDGtnQZFkiGfw1DFQI5SrtCoc
 DSEi6+x1toELhEWEctJJDlwKAQVLO/ArTBHY77JDMjGCN8UXYMOIe+ukJrO/10SutIzqKo
 hJqMqyDLKiWP96gnR9CnYbclaIBIHf2YoGzumnGySKAQa9R6FOL/cq2fGUPp+vVG1SIsF7
 FX1VDzQuIHnuPakb2q/OFSEppYwTzrv1d93tbRQeVfnTzSpWBjmaN7ZG/LS0o/v6EktkHw
 ifTbOpMAXzeFyIgz5Xh6eoCQjp1anb69qe3T7bgfm0qF4CSMIikV4Ys6il3ZhQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CXXarYDG
Subject: Re: [Buildroot] [PATCH 1/1] package/dtc: bump to version 1.7.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  2 Nov 2023 22:34:43 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/dgibson/dtc/releases/tag/v1.7.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/dtc/dtc.hash | 2 +-
>  package/dtc/dtc.mk   | 2 +-
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
