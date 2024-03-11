Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379C7C54E58
	for <buildroot@archiver.kernel.org>; Mon, 11 Mar 2024 11:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E77FA6085A;
	Mon, 11 Mar 2024 11:35:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FAOBV5Q5rz_X; Mon, 11 Mar 2024 11:35:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1175B60822
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1175B60822;
	Mon, 11 Mar 2024 11:35:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 717691BF2F2
 for <buildroot@lists.busybox.net>; Mon, 11 Mar 2024 11:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AB0280B51
 for <buildroot@lists.busybox.net>; Mon, 11 Mar 2024 11:35:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OpO5R-Yv46wK for <buildroot@lists.busybox.net>;
 Mon, 11 Mar 2024 11:35:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1552580C97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1552580C97
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1552580C97
 for <buildroot@buildroot.org>; Mon, 11 Mar 2024 11:35:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B9A90C0010;
 Mon, 11 Mar 2024 11:35:16 +0000 (UTC)
Date: Mon, 11 Mar 2024 12:35:12 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240311123512.09c1c77d@windsurf>
In-Reply-To: <CAPi7W803mjZL9-rRu2wdcG=5t=D1wtDJET2S_SHfjCc_uvViVA@mail.gmail.com>
References: <20240307122806.102726-1-fontaine.fabrice@gmail.com>
 <20240307134916.32738b5e@windsurf>
 <CAPi7W803mjZL9-rRu2wdcG=5t=D1wtDJET2S_SHfjCc_uvViVA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1710156918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3g/dunLtEEFu3uZ+io3sjfYN/dulZzifRgBnn/Kb+M4=;
 b=f3BEZPVuR/zc0i10FaF8n+TyTcR4kouxY4tA8vqywnzSTpCsURu9M12yjjQZDn4chJieaa
 QlXUXHMwSM4lRKFQI3L0ysGwPdU0Ea62FaxO22DaBDp480iBm1JyNUOSPzZiklL4v9xolV
 3n87Pwp/OVM5mYHGMJ+uBVT4VTnLIri8SqjgMWdjnx3G6d7xAxNrtJp+qX1+KCwFn/nHDf
 8FbXYKxKcRN0oIx0axxdNKhOVmfyqCmyyDDa1Hqlivi5EGKUuaueOn1HQACjb83a6rfRN9
 2xfWKCuyZA2AdRaxecPG4CyJDgGKc+OGfrQwC8R42rHBqAHO2ZpaF6IPdCjT8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=f3BEZPVu
Subject: Re: [Buildroot] [PATCH 1/1] toolchain/Config.in: enable libatomic
 with BR2_BINFMT_FLAT
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 7 Mar 2024 18:18:24 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > Thanks for the patch. Do we know since when there is support for
> > libatomic for platforms that use the FLAT binary format? Is this
> > specific to ARM/FLAT, or applicable to all configurations that use the
> > FLAT binary format?  
> 
> Nope, I don't know. I didn't find any clue in uclibc-ng github history.

That's because libatomic has nothing to do with the C library.
libatomic is provided by gcc. So if you want to find out why it is now
available for FLAT platforms, you should check the gcc Git history :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
