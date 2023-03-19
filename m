Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EECC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 13:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47CEA40A05;
	Sun, 19 Mar 2023 13:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47CEA40A05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bJZty7nZp-fj; Sun, 19 Mar 2023 13:51:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F21F9410E4;
	Sun, 19 Mar 2023 13:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F21F9410E4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0BC621BF577
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 13:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E55FE40E46
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 13:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E55FE40E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 938yVmyFnSew for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 13:51:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56CA1414C3
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56CA1414C3
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 13:51:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 537D1240003;
 Sun, 19 Mar 2023 13:51:12 +0000 (UTC)
Date: Sun, 19 Mar 2023 14:51:11 +0100
To: Lang Daniel via buildroot <buildroot@buildroot.org>
Message-ID: <20230319145111.6bacfd53@windsurf>
In-Reply-To: <VI1P190MB049389FDF2EA1D1EAB8292B99FBC9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <VI1P190MB049389FDF2EA1D1EAB8292B99FBC9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679233873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0gD1isnckj7nDzzb0Crl5fmuDXzkmfDqWWHJ4+eKnnI=;
 b=OIuJd4efwwU69lzj6WxQ76iadbivavT4Iyn/JJoVm/62JSzwVMX/xSwthxHQp3AuFBCCRe
 +t3AxJu1pr9c2TuB4manCAzqpBB2b8RgAV7uOCsqLRrK3zx/qFHZo3a/AtDtpClFEe8/mD
 CIQxxOvnRlAeI8RnF11gHuDAaw5wOvtRCv/uFv17wN9Du26pcM/vAj0QK1j2NmOYSxOsDi
 Eylhd1+yJXEHQwqBj7CsU9HwqCJ8U4ugC+Mh6mYjpKwIJUbKEhxEHsrcrrH/WlnpEgSTn2
 8a2pBkNBCBpS4zn9pr1vmoFATha0zX8t/bynjpGyaM3rS0Ed74/Hp4gkx765nw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OIuJd4ef
Subject: Re: [Buildroot] [PATCH 1/2] package/bluez5_utils: fix media control
 profile
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
Cc: Lang Daniel <d.lang@abatec.at>, "marcin@bis.org.pl" <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 16 Mar 2023 13:53:04 +0000
Lang Daniel via buildroot <buildroot@buildroot.org> wrote:

> With bluez 5.66 (bumped in c6c79d6) the Media Control Profile (MCP), Basic
> Audio Profile (BAP) and Volume Control Profile (VCP) where added.
> All three are enabled by default.
> MCP only works if AVRCP is enabled, as it requires player.c which is
> otherwise not compiled.
> Only enable all three new profiles when the audio plugin is selected.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/d62/d6260a5acf766657f683d85fa1bdc27b7a43551e/
> 
> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> ---
>  package/bluez5_utils/bluez5_utils.mk | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)

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
