Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B72C64EC7
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 09:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E94F40C47;
	Sat, 25 Feb 2023 09:42:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E94F40C47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OYN3gb3cE441; Sat, 25 Feb 2023 09:42:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A57440C90;
	Sat, 25 Feb 2023 09:42:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A57440C90
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB9671BF5DF
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A97FF40B93
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:41:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A97FF40B93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j-K86YL8F1h4 for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 09:41:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B21D40A97
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B21D40A97
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 09:41:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 74C671BF204;
 Sat, 25 Feb 2023 09:41:30 +0000 (UTC)
Date: Sat, 25 Feb 2023 10:41:29 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230225104129.71eef68c@windsurf>
In-Reply-To: <20230224092535.306646-1-fontaine.fabrice@gmail.com>
References: <20230224092535.306646-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677318090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ffvCAMzsGmAKx3B2qXlvj5BL2ku7P/1TIeniZX6HRsA=;
 b=gCVzV/u6l+siv49Lq0DwEDdNaRofhzE0ZGGe0hBWHyu9M1ZEushlbwtJ5XWgFjUGJQBpUg
 WXvGoUJmhwDIUM2/QzUAnf+qPtN5aNBxJZ35kRqoeFsQzo7alPY0UzaMW1D3nEcft46BCD
 uPv5k0ddSxVPgtpDCeKOjKlU5YUL92HVp2iyEGgXzWbbZhuDbLu7hG8iRRFPHm5V2ENba0
 XuhdN6Z2uQZeiKVOZUxehXklD4lMJqsDpS8+JqeMkQOtwH6LqifV8TSsLtJJZx6P85nPDZ
 UNk04IN/oqpfddmqaM0bU84uj23vyXd9vk26WGj79qjNmDP3dNXu4ccULpXC5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gCVzV/u6
Subject: Re: [Buildroot] [PATCH v2, 1/1] package/xtables-addons: replace
 XTABLES_ADDONS_DISABLE_GEOIP_HELPERS
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

On Fri, 24 Feb 2023 10:25:35 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Replace XTABLES_ADDONS_DISABLE_GEOIP_HELPERS by
> XTABLES_ADDONS_REMOVE_GEOIP_HELPERS to avoid the following build failure
> raised since bump to version 3.22 in commit
> 53f2999edfa5e67923d4d8a102c15fa3200e089c:
> 
> make[3]: *** No rule to make target '/xt_geoip_query', needed by 'all-am'.  Stop.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f2d596b510f027b94a6b1fad10c363922c50cbec
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Add XTABLES_ADDONS_REMOVE_GEOIP_HELPERS

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
