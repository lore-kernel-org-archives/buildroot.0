Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511C9C38A2D
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 19:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9C08408E1;
	Wed, 26 Oct 2022 19:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9C08408E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2HtDt-NKLnui; Wed, 26 Oct 2022 19:51:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBB5D40338;
	Wed, 26 Oct 2022 19:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBB5D40338
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD7321BF57C
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 19:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC10D405EC
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 19:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC10D405EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q1ptdWj8ak-N for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 19:51:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7984B40547
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7984B40547
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 19:51:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 981EC1C0004;
 Wed, 26 Oct 2022 19:51:05 +0000 (UTC)
Date: Wed, 26 Oct 2022 21:51:04 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221026215104.238043e7@windsurf>
In-Reply-To: <20221026193658.245255-1-fontaine.fabrice@gmail.com>
References: <20221026193658.245255-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666813865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B/tTOuqeMS2CMomi+TF2FhG3+4y/qqVZPmHkV6+ZVvE=;
 b=fbP30qO5hsfJkvIKQetPL/8TvFYXriJtLtVLozNWVXyn/oxJPLm/3w4NMoCCtuTYSrMxgX
 TpzSot+PhnBk7482P442stYqySKAuFrQphz0iZFX0R5zdtecQeEmQ4GYwG5YMkByLLXTzf
 MldcyyzkRJtXR0utkCwIB/lTYyWP+OKRyYFtUBiMJkNRU+3Bk06O0/WjPh/2UbqW9iyU2L
 rGunxE9dYda0gmKyRkF6TiBFOjJnsAL7LfAL4nkqscn2+TfvNRQG9/LS0n//dMp+9xf57O
 t06XrS1yX7wJyTIXq4jlTCCBdxJLnNOG/fMzsQoYrp+a+e+hF1EyPhskmxLw2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fbP30qO5
Subject: Re: [Buildroot] [PATCH 1/1] package/expat: security bump to version
 2.5.0
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

On Wed, 26 Oct 2022 21:36:58 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Expat 2.5.0 has been released earlier today. Most importantly, this
> release fixes CVE-2022-43680: a heap use-after-free vulnerability after
> overeager destruction of a shared DTD in function
> XML_ExternalEntityParserCreate in out-of-memory situations, with
> expected impact of denial of service or potentially arbitrary code
> execution.
> 
> https://blog.hartwork.org/posts/expat-2-5-0-released
> https://github.com/libexpat/libexpat/blob/R_2_5_0/expat/Changes
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/expat/expat.hash | 8 ++++----
>  package/expat/expat.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
