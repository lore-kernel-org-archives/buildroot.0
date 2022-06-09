Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1814C433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 769978426D;
	Thu,  9 Jun 2022 20:42:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cirm-bzXo6B6; Thu,  9 Jun 2022 20:42:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E6448425B;
	Thu,  9 Jun 2022 20:42:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B7C131BF2F0
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A69E660672
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:42:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 14W_RB6ArADv for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:42:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ABCE56066D
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:42:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A21021BF204;
 Thu,  9 Jun 2022 20:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654807340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rh/LGBCit2jgoB1k64OGUostiD9qfjLpseMaxast7YI=;
 b=AWjneEUXf+SVN0lpzdPDngACJ8KiI1A1q+1D1Z9qu9POOnmaUQ6wjYX9v1Zk4tkNlCHM2M
 dB4XcG6GQ8tAP4UHu35WVAEf/4TiYTeP08ZayNX47i3opRndp/dGEZq4GBW1P68qROMUZu
 wiZkWgn7z8sRkHYLEmuRRxyWGWa74CC5EoKL0lkW25Ke8DzSp7X21J8/G/KnpN0EVSpgBm
 umXKPGXQ0/KRUaN1zBiRCN8bWs49rhOG1JWdGz0a30KcF7Tg3YzsoST4LIhefJ+smrsAGk
 pTtpMnnJ6XGI348zew+sGCf/EHfMep/gS8ObPiFL/mNYGBVYuZuwcPLZllBH1g==
Date: Thu, 9 Jun 2022 22:42:19 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220609224219.429e634c@windsurf>
In-Reply-To: <20220606134518.791648-1-fontaine.fabrice@gmail.com>
References: <20220606134518.791648-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/luajit: disable on armeb
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

On Mon,  6 Jun 2022 15:45:18 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> armeb has never been supported by luajit since its addition in version
> 2.0.0 by
> https://github.com/LuaJIT/LuaJIT/commit/ed6c895ae56288b6982d1651c4ea638452c9e99b:
> 
> lj_arch.h:473:2: error: #error "No support for big-endian ARM"
>   473 | #error "No support for big-endian ARM"
>       |  ^~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3751096941ae16184b835fd6879b4904f28c6432
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/luajit/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
