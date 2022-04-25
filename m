Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8935C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 19:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94FC660F97;
	Mon, 25 Apr 2022 19:09:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PUAsWO1F5XfM; Mon, 25 Apr 2022 19:09:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20FA460D61;
	Mon, 25 Apr 2022 19:09:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 608461BF2CD
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E4B740A95
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:08:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PINW6FCWJCzs for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 19:08:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D515840574
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 19:08:25 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id CE7D0CA2E6
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 19:08:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2BD4A240003;
 Mon, 25 Apr 2022 19:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650913676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l/gWB25pCq+QrQVIoeGXvZr6HPFBMwrWej37T9XU7YQ=;
 b=Ld/pwqYdG+KX8krooz3iaOGqq2a8z9dv2JJJz/BDF3vGANcgDZKru1iiYesAclXVKvl2lP
 bufLHNed4r+iueEEJeV3E2Q5N4EwKjr0WQurRG3909jltkBWCsZTfjgFmn1OswVyY1k+AD
 CDFSeDraTfEZn2ZabIptjhjYGENFy5ffvlsHjRCBsDsen1bvAIXru7jOSC+KbRxAp1PZy7
 e1JWUzb3MVwcdD1LfIVKr+63Gkjg85THob3KQtF1tFplZRmGDgUsvLCDFxetgflpv5h4Vl
 lBIRSw1ssgEoWRDhYaCmmqoPQvVkmzAKGfUCaHnNtBVUcMs4W342Qb9F4wGpDQ==
Date: Mon, 25 Apr 2022 21:07:54 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220425210754.7714d850@windsurf>
In-Reply-To: <20220423205934.446813-1-fontaine.fabrice@gmail.com>
References: <20220423205934.446813-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/pcre2: fix legal info
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

On Sat, 23 Apr 2022 22:59:34 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 10648db92bc5c4bfd49b58ce4f1c213defdfc7de forgot to update hash of
> LICENCE file (update in year:
> https://github.com/PCRE2Project/pcre2/commit/3103b8f20a3b9944b177e812fde29fbfb8b90558):
> 
>  >>> pcre2 10.40 Collecting legal info  
>  ERROR: LICENCE has wrong sha256 hash:
>  ERROR: expected: 15bc778a1f7e1f857d57abab4181749a06ad1d1f9420d5c9e3c23ef8c991b025
>  ERROR: got     : 87d884eceb7fc54611470ce9f74280d28612b0c877adfc767e9676892a638987
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/275c5478d63d3d4016d440870e96f04230df69d6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/pcre2/pcre2.hash | 2 +-
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
