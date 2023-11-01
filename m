Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7297C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 18:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AD4A81E74;
	Wed,  1 Nov 2023 18:15:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AD4A81E74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ud_RO65noyxb; Wed,  1 Nov 2023 18:15:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA9C881E56;
	Wed,  1 Nov 2023 18:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA9C881E56
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5ACBA1BF59F
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 18:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32478704B9
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 18:15:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32478704B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mp6JRxtAsrys for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 18:14:55 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 673C2704BB
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 18:14:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 673C2704BB
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5584BC0006;
 Wed,  1 Nov 2023 18:14:52 +0000 (UTC)
Date: Wed, 1 Nov 2023 19:14:51 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231101191451.61c19ddf@windsurf>
In-Reply-To: <20231101180606.18319-1-fontaine.fabrice@gmail.com>
References: <20231101180606.18319-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698862492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UdcFTgpHd88tkYTMk6vKktYqvG8dWx3arDqBBDpgZxw=;
 b=Wx9WL3novE1qiWUPn7jqsrzN3gi3NRJtbq0Qg0ZKVhcTydnOY8NBjS1BYhjN0fB35Fm0Mi
 fl6yt5pJ+vzFUe2eCEjGAMcjra2bSUODwjIBLIsFjsNC85VvJl01Wpm8ff3xNpJSuTTRss
 DT9JVlQXwq1m6cjGiYmb0OdsKuTPgbv6sak526gD3Qva63tZ3GIp1Ptd/peqEefvNWQO1s
 afBcqBukR9TJliHh2PlfYsC0XcjkZ4p3joLM51bzVCwrrK/yJ841UrxtD6hWGV0ZqrhvJt
 CcJGP/zNBMV11it9beYKGqVq+OK93D+gBcVFUDzm5ch2Oa/nHCCxDCNQ79de5w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Wx9WL3no
Subject: Re: [Buildroot] [PATCH 1/1] package/perl-lwp-protocol-https: add
 CPE variables
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  1 Nov 2023 19:06:06 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:lwp\:\:protocol\:\:https_project:lwp\:\:protocol\:\:https is a
> valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/detail/804408BE-097D-4FE3-B6DB-29324871C6B9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk | 2 ++
>  1 file changed, 2 insertions(+)

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
