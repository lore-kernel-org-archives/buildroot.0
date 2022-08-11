Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F544C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 21:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2551D4183A;
	Thu, 11 Aug 2022 21:02:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2551D4183A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QBksTWw82D3H; Thu, 11 Aug 2022 21:02:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03FFC41748;
	Thu, 11 Aug 2022 21:02:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03FFC41748
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 35C6E1BF2B9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 21:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 040A241830
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 21:02:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 040A241830
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YZRTVSkj5ClC for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 21:02:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CD0B410AE
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8CD0B410AE
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 21:02:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6266720002;
 Thu, 11 Aug 2022 21:02:24 +0000 (UTC)
Date: Thu, 11 Aug 2022 23:02:23 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220811230223.71c40b4f@windsurf>
In-Reply-To: <20220810072801.2832510-1-fontaine.fabrice@gmail.com>
References: <20220810072801.2832510-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660251744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A5G8mdp+EEG5pZP0p2Ete+eVbc++z50JYl6CeNUWeto=;
 b=BqwnGQM+XmynsWCSGIN1bI2xd0SVK/YJmeTuM7v9gtMh9wxfloYFvyCvhYfChUIXh4kqpS
 MAmMMAY1BI9ja+AH+Xlun9w7IebpUT/idjj3oB0r3MFAOq6eftMbbsOdMpYKTp/Q1FXzfS
 s9e9IeT3oRc1tpaiWI0Zb756Q0KaQ40waeCZ7KU+HhiHqRyENIQ/taFalNJnNo2LPRp89e
 j8YLvxm1ypX8Dcoj0Afxl8fnngXa40IkCN+XO3w3bz4KT0XyUkwSlWkrygszGAVFXKh1O5
 YpsFzI+myz1FS56DbLt95BTQdq1uylIAEuc0TImoPVc9ZB1zWb2mi0sukthZbg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BqwnGQM+
Subject: Re: [Buildroot] [PATCH 1/1] package/grpc: fix legal info
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
Cc: Robert Rose <robertroyrose@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 10 Aug 2022 09:28:01 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 0fc2438ff6e3d14cc9e7b546e2909e386db33439 forgot to update hash of
> LICENSE (full text of MPLv2 included with
> https://github.com/grpc/grpc/commit/05fcd826f477ef1a024a2defa5e4b3d78f5e6eb4)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/98b820f85cd32596bde6bbee2cfc7e07ecfa454b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/grpc/grpc.hash | 2 +-
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
