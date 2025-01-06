Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66153E77198
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 22:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B51A4029A;
	Mon,  6 Jan 2025 22:20:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zex2uhbFzSeJ; Mon,  6 Jan 2025 22:20:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01E61404B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01E61404B6;
	Mon,  6 Jan 2025 22:20:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 23D18F1E
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 22:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10D1580E5A
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 22:20:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pQQEuUnT8RWp for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 22:20:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EAE0880E59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAE0880E59
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EAE0880E59
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 22:19:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 66BC420003;
 Mon,  6 Jan 2025 22:19:55 +0000 (UTC)
Date: Mon, 6 Jan 2025 23:19:54 +0100
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <20250106231954.734c2006@windsurf>
In-Reply-To: <CA+R_deqLs+aSCBvoTGj9rJn8D5ARu1=QFKDy19qgTP_YWBdU0g@mail.gmail.com>
References: <20250106210623.1296442-1-thomas.petazzoni@bootlin.com>
 <CA+R_deqLs+aSCBvoTGj9rJn8D5ARu1=QFKDy19qgTP_YWBdU0g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736201995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0K+uBq7qU4L81JdklumtUJVh3enhLAonDPoXhJAj5tE=;
 b=NLdn1BezyQuV/PMPo7ZFmD9von+/z70HuE4HadXWMSW0EwFISg305R9iZ+XtNBuJZOlZtl
 dJMRaKfdJIVvYft/3JraBuDoaG8jFsgd+1M+HkUQIr38/A6U9F16ua5ZQSGwpsWNx9OsDi
 VOMpXBgtmGErqmInVsMsAY3EzEdiFHcGSlb1ImyLy/gVIfJYcEkOudybFrnbSDp7qjoK9e
 Q7rgH5sH5UR3uFT3c6NX7jkHYfPpgSDw70jpZ+FI+DjYuW8LszmqVa8bCeI6vysx+dMLEj
 pGf6VhiDK6VNpa3/nJoiaXag5K8MW3582nZiy1Ix1a79d1fxRi0TOqU+aGYdnQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NLdn1Bez
Subject: Re: [Buildroot] [PATCH] package/qt6/qt6quicktimeline: add missing
 select BR2_PACKAGE_QT6DECLARATIVE
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

Hello Roy,

On Mon, 6 Jan 2025 23:07:46 +0100
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> How can I recreate the warning reported by kconfig?

Like this:

$ cat > .config <<EOF
BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_QT6=y
BR2_PACKAGE_QT6QUICKTIMELINE=y
EOF
$ make olddefconfig
WARNING: unmet direct dependencies detected for BR2_PACKAGE_QT6DECLARATIVE_QUICK
  Depends on [n]: BR2_PACKAGE_QT6 [=y] && BR2_PACKAGE_QT6DECLARATIVE [=n]
  Selected by [y]:
  - BR2_PACKAGE_QT6QUICKTIMELINE [=y] && BR2_PACKAGE_QT6 [=y]
#
# configuration written to /home/thomas/projets/buildroot/.config
#

Basically, just enable qt6 and qt6quicktimeline. You can even do it
from menuconfig, and then when you exit menuconfig, you will see the
kconfig warning.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
