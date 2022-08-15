Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1560C25B0E
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 12:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D60340AD9;
	Mon, 15 Aug 2022 12:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D60340AD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sE8-BXwQrgiN; Mon, 15 Aug 2022 12:37:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D21B640AEE;
	Mon, 15 Aug 2022 12:37:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D21B640AEE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C79F41BF3B9
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 12:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2AD560BA8
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 12:37:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2AD560BA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hGaL9hDaNu5M for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 12:37:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 731E160590
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 731E160590
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 12:37:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4AFE820007;
 Mon, 15 Aug 2022 12:37:04 +0000 (UTC)
Date: Mon, 15 Aug 2022 14:37:03 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220815143703.4aebe34f@windsurf>
In-Reply-To: <20220809184427.2469515-1-fontaine.fabrice@gmail.com>
References: <20220809184427.2469515-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660567024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a8MdaiZlCbpFsruRLD9JFbVY4ipcINPGMJXmZnehWKQ=;
 b=hGnbRxyNhGAFkCrcusbUTdKB+UTwFWzjUQVcAAt3qDwDfAu6Lf69u5PCyCBKjUOs6gHl9r
 fINzLk73fPSJ5dn76TkZtU1Qu48QCK0guF5pWl0QP6FF0ECuZj7ZrdLk1W1j88D9Mdpl3r
 6Ami+kHCflPzFR7ut/NuAidS6p1K6q+Bul6Pscw/g4N7Br92slTx2N0lccS9CWlCdafSBu
 z0SHwBvcaYd6WfjFHxGcpwOagH1MjFu0F3ZFOuABb9WXWuSA93DPz8F5rlBJQ/kDSF7Noj
 DLkArZU4TChnPKsFrj9qe0vMh5aTCUreLtRsZDAFl7NdJHgj1ldOLo5IayPjUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hGnbRxyN
Subject: Re: [Buildroot] [PATCH 1/1] package/snort: fix sparc build with
 BR2_OPTIMIZE_FAST
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Aug 2022 20:44:27 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following sparc build failure with BR2_OPTIMIZE_FAST raised
> since bump to version 2.9.19 in commit
> 65ed981ce0135379b7faeb69519f4e3e666c0717:
> 
> cc1: error: argument to '-O' should be a non-negative integer, 'g', 's' or 'fast'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e1a330e1a899fcdf4900e9156d62c90813321e30
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/snort/0008-Fix-NO-OPTIMIZE.patch | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 package/snort/0008-Fix-NO-OPTIMIZE.patch

To be honest, I find it pretty crappy that the snort build system
forcefully disables optimizations on SPARC. But oh well, I don't care
much about SPARC, so: applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
