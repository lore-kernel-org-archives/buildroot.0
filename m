Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3EFC46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 13:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B07AC409E6;
	Tue, 26 Dec 2023 13:15:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B07AC409E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xJ71gklLZQAm; Tue, 26 Dec 2023 13:15:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D95B4095E;
	Tue, 26 Dec 2023 13:15:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D95B4095E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 961A61BF489
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 13:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CEEE606CB
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 13:13:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CEEE606CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0jZO5Gdreu9A for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 13:13:55 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 70EFE60669
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 13:13:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70EFE60669
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B92760003;
 Tue, 26 Dec 2023 13:13:53 +0000 (UTC)
Date: Tue, 26 Dec 2023 14:13:52 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231226141352.32954aaa@windsurf>
In-Reply-To: <20231226112417.10657-1-fontaine.fabrice@gmail.com>
References: <20231226112417.10657-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703596433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M53H42sotPYZU2SdmYnIJGsXX87YxjAbWm1oGgAbm5o=;
 b=Or+86wC1dgOTu0WaCKIxUvR9mpzOjGKN7entxQEi5DAQfoCbNQ349/w6+r/Bf+FWPuYywA
 Zo8v/KYKwPT8zdwqb68RbWgQ3IqD/cea8A8YjD0ee7W104LpkBRYrQ7FRVoLZmdVf8Pq1/
 m9O1YK33H+2pcrNTbpmI1RNMwgO2RBRGNbKtx1IMpniFsW+lai7mgGHZMFhvITMxqsXSRR
 /X6zljjRY+UI3W5M5hs2SCzJzVNdKLgwVwhjCD5JG3AKdSwWfycqIAKzO60KIMeOddIvdW
 a45MZAT4jS53Cwe0u6icyk+kFyzl3emn2BlcUgqL2QnLaSuAG+5ZafHPyLgOAg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Or+86wC1
Subject: Re: [Buildroot] [PATCH 1/1] package/python-fastapi: add CPE
 variables
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 26 Dec 2023 12:24:17 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:fastapi_project:fastapi is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/detail/E6E33EA5-0404-4037-9B3E-FE718E1593E5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python-fastapi/python-fastapi.mk | 2 ++
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
