Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 038DDC36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 21:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A32CA60672;
	Mon, 24 Mar 2025 21:27:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d3CQuPFalDek; Mon, 24 Mar 2025 21:27:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1DE56080C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1DE56080C;
	Mon, 24 Mar 2025 21:27:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2612F1B8
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 21:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 176E94057B
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 21:27:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3-2j0024HLhF for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 21:27:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 15DD44056F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15DD44056F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15DD44056F
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 21:27:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E1353B0056A;
 Mon, 24 Mar 2025 22:27:32 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:36076])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 24 Mar 2025 22:27:32 +0100
MIME-Version: 1.0
Date: Mon, 24 Mar 2025 22:27:32 +0100
From: Julien Olivain <ju.o@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20250324104202.182473-1-buildroot@bubu1.eu>
References: <20250324104202.182473-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.10
Message-ID: <ec8a57aba558b35aa2340132c800ce39@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742851656;
 bh=AAWcj66DCx7j/rmEe132L8UKFQtxvur3VTv5mz5P0CQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ttnIgldJ2jWrboodChlGp4nv9PSyFWXdWC/zpUormKN7gINfcAFZuGfusMy3BbFiu
 nhQtFwRgm2IPInaxCOyJlatYhiNtOMwlz5VyHhpEySsBJuTfCn+nTVNLthrKBFf5a3
 gMSsT+EY1gVxrSF4DzK0NSOMjZ2MS5d83+AM0Z5AA6KXTmmkgBxthn8lpiajHmQmuo
 gKUvGXySLGMSWqYQlZJCryMhCO8EwHo2qwuUlyP5R6bRdol1041i6wznMF2dHHkYsY
 wCYsir5cOwL3XeaHmyaKuEC6uh3esrYe7kvv0fGtsofEio3L8d0bAh60BgNA/I80tE
 Cz2yIB6gK8rIg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ttnIgldJ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-tzlocal: bump to 5.3.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Marcus,

On 24/03/2025 11:42, Marcus Hoffmann via buildroot wrote:
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
[...]
> diff --git a/package/python-tzlocal/python-tzlocal.mk 
> b/package/python-tzlocal/python-tzlocal.mk
> index c616974f64..2c1e5ff87a 100644
> --- a/package/python-tzlocal/python-tzlocal.mk
> +++ b/package/python-tzlocal/python-tzlocal.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_TZLOCAL_VERSION = 5.3
> +PYTHON_TZLOCAL_VERSION = 5.3.1

This bump breaks the package runtime test. See:
https://gitlab.com/jolivain/buildroot/-/jobs/9507749210

Could you have a look, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
