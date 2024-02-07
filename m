Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A097BC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 14:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56AAF83B42;
	Wed,  7 Feb 2024 14:55:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DkkMPduhanHl; Wed,  7 Feb 2024 14:55:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 618E583AFA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 618E583AFA;
	Wed,  7 Feb 2024 14:55:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3ECFE1BF276
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 14:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CD91613F3
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 14:55:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kQnnknbKDoHV for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 14:55:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 36D87613F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36D87613F2
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36D87613F2
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 14:55:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1550324000D;
 Wed,  7 Feb 2024 14:55:15 +0000 (UTC)
Date: Wed, 7 Feb 2024 15:55:15 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240207155515.6cd7da0f@windsurf>
In-Reply-To: <681d58c130501398b80678a980d2fe511d35015f.1706448055.git.yann.morin.1998@free.fr>
References: <cover.1706448055.git.yann.morin.1998@free.fr>
 <681d58c130501398b80678a980d2fe511d35015f.1706448055.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707317716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5mJ1TmsPU8LYexrG962m5woJS1wK9rkmOhBu8jvRcL0=;
 b=AOKeQxjL2SJzOz7GwNQeyk/rOUBLBPKGQuLhy0xlP3qDd98SwK4O0kJqHBS4mqi2pA2OKF
 2/5j9tt+yyObFmfikL5Z4GcLNCsgJ7cj62BL386q9mnQy8PNQ6NrWdqRnT+4HbIfOideTR
 h0jNtPDbbqqdYaEzS6GwjPx745zeqHEw8oWo2tE/8z87MzJLu/pMz5ueYWGX0SazKzU66t
 NgdEYnZSbV8mCmlcsK1574a2xCQfpGYMF93yz2Yiv/bOCjiqFl8nT1GMbgUgNkcL8kHfI2
 QXQgjUd/9QHVgntr1WcH5/ENhMeXDKrxM4ev8Bc353j3V4cCOmXoHXkLmEzdvA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AOKeQxjL
Subject: Re: [Buildroot] [PATCH 09/10] package/opencv-contrib: propagate
 opencv4 dependencies
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
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 28 Jan 2024 14:20:58 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Commit a7736afacaef (package/opencv4-contrib: properly note dependencies
> between modules) forgot to propagate the dependencies of selected
> symbols, causing unmet dependencies warnings (unfortunately, not
> errors), such as:
> 
>     $ KCONFIG_SEED=0x9F66F854 make randconfig
>     WARNING: unmet direct dependencies detected for BR2_PACKAGE_OPENCV4_LIB_DNN
>       Depends on [n]: BR2_PACKAGE_OPENCV4 [=y] && !BR2_TOOLCHAIN_USES_UCLIBC [=y] && BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS [=y]
>       Selected by [y]:
>       - BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_OBJDETECT [=y] && BR2_PACKAGE_OPENCV4_CONTRIB [=y]
> 
> Propagate the dependencies and add associated comments.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>
> ---
>  package/opencv4-contrib/Config.in | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

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
