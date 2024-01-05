Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECA4C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 12:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E7FF43702;
	Fri,  5 Jan 2024 12:55:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E7FF43702
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H9RXh-lR38XO; Fri,  5 Jan 2024 12:55:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25706436E9;
	Fri,  5 Jan 2024 12:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25706436E9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8C2911BF422
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C48543725
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:54:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C48543725
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5X1p18YKtWcw for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 12:54:28 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56BD8436BD
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 12:54:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56BD8436BD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 912A72000A;
 Fri,  5 Jan 2024 12:54:26 +0000 (UTC)
Date: Fri, 5 Jan 2024 13:53:42 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240105135342.19978502@windsurf>
In-Reply-To: <20240102223122.2463453-1-fontaine.fabrice@gmail.com>
References: <20240102223122.2463453-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704459266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AKZ3+fLEkTZN6ajnjL3xax76jC8HLNMUrMyL+R8c+V0=;
 b=Cv0DCXwAbfzccBxkIjrgaAZjhImcr6EYMsXmAhgAfuZCOTsXl2kkLW6FbNQkMlaFyuf5Ib
 hHZZPZuq4NPauOE5sHPA4O6UYkT9gSdfIQ8LP4PK9IwkZuSg9IJg+aZqUv4YrZnC8j0rBv
 x4OWbSY+5fvIUS0QcWcCClMjyeodoZF7SvSGxFeZjRkZ8NWavVZ4+zU3VKS13TivlVF1mn
 fPibY4iL3QdwM4DxwyQMaV6ZhSUI5eFW2PPJQYhH74fOy2CWmN6r6DnfKRQtUtpG1Phnxt
 dMtDuneD0kFLpumrLG0r/P7q3WKpyK458VAuss2HJ3hwNUxAuemqZ7Lm1EqroQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Cv0DCXwA
Subject: Re: [Buildroot] [PATCH 1/1] package/jszip: bump to version 3.10.1
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

On Tue,  2 Jan 2024 23:31:22 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/Stuk/jszip/blob/v3.10.1/CHANGES.md
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/jszip/jszip.hash | 2 +-
>  package/jszip/jszip.mk   | 2 +-
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
