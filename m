Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9070EC4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41A8643727;
	Wed, 10 Jan 2024 20:50:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41A8643727
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kzCY3IEeKjc9; Wed, 10 Jan 2024 20:50:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 454FC4378A;
	Wed, 10 Jan 2024 20:50:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 454FC4378A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D7D31BF5B3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E706883DB5
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:49:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E706883DB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VNfSGP4fzxWK for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:49:23 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC61B83DB0
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:49:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC61B83DB0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A6F840003;
 Wed, 10 Jan 2024 20:49:20 +0000 (UTC)
Date: Wed, 10 Jan 2024 21:49:20 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240110214920.5e6485da@windsurf>
In-Reply-To: <20240106142258.1880402-1-fontaine.fabrice@gmail.com>
References: <20240106142258.1880402-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704919761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TVqEvGi59fsAh2enlqz8dA4LGruWgH/k9olPAb9NnW0=;
 b=aV2poEHDpOTp4V0GYYArEXXrA4dsMSySFHufiAuFTYUowy9/5hNktY94p/BZ3Wlh9WqDc7
 PFu4kUXouSCxsCZgi+ocyvRtwyYe0ouWoT1a3FCVwz2s5aq5u+a5ff+UHE/vYESDp6ua9q
 Vwe7Wa2xQBYL3gcpIbVt4KKEnfzHOxfbvzr5EKXhdbNzwINEX3bsLGNW9llJkHXHNrBj0p
 Ie+KFv6PdUtHltukQ60VMAFuOtawEpvnDhRf4/rIoKkqDFeZHtU7f2r/7SEYHfkRm9mMbJ
 vbbf7SgW5OYMMBWp7RB8XaWas0zlGl62Y5wAYnLZDlX0obrbkqVHF1ToAHCjGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aV2poEHD
Subject: Re: [Buildroot] [PATCH 1/1] package/libzenoh-pico: bump to version
 0.10.1-rc
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
Cc: Alex Michel <alex.michel@wiedemann-group.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  6 Jan 2024 15:22:58 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/eclipse-zenoh/zenoh-pico/releases/tag/0.10.1-rc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libzenoh-pico/libzenoh-pico.hash | 2 +-
>  package/libzenoh-pico/libzenoh-pico.mk   | 2 +-
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
