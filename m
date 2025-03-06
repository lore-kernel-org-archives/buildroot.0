Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56430C282D1
	for <buildroot@archiver.kernel.org>; Thu,  6 Mar 2025 20:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 139ED60775;
	Thu,  6 Mar 2025 20:53:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 82a4EhPW62tQ; Thu,  6 Mar 2025 20:53:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36FED60BD0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36FED60BD0;
	Thu,  6 Mar 2025 20:53:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BE2971F
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 20:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BBFD41386
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 20:53:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vacqddlrmilS for <buildroot@buildroot.org>;
 Thu,  6 Mar 2025 20:53:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8DC6641382
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DC6641382
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8DC6641382
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 20:53:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 13F2B13F879;
 Thu,  6 Mar 2025 21:53:37 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 06 Mar 2025 21:53:37 +0100
MIME-Version: 1.0
Date: Thu, 06 Mar 2025 21:53:37 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>, Thomas
 Devoogdt <thomas.devoogdt@barco.com>
In-Reply-To: <20250306203150.1538664-1-thomas.devoogdt@barco.com>
References: <20250304205633.397011-2-thomas.devoogdt@barco.com>
 <20250306203150.1538664-1-thomas.devoogdt@barco.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <d82543b36735ea205dc0c8b76695f0f2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741294421;
 bh=W9rbRavSlWR4wmgChpu8tudSG+J26RRrYmHFDnYFDwI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=k3XR7uiTXVf2oaMCQR3WNB1QCyihRyfHt+wnWVfjix5NjVoMukUjUBmVK88bjZoNn
 2arfys4nq9jjMYMKHOfnkniF+/k4fSwp1znNpIHILj2/plT2XjqAb1K10rixcKizSB
 WG6ZgrUoBauCa3JTr7BRTs/kmhK3tcSWuznftqpg/9Jn0kfKEm4/hf5/x/KIGIWWLy
 75ZDgmxfEwEWwOJx8gZnglwOJ/fNpWZ/TmVasPbnYVDnABAdjWoy09dYJ+dnzM7Fob
 srPjsp9+gVfpNJZ35ngt9Sd6NMVqiJV2IQuNr4sXHYHgscDlc740jNETOU2aEUgqmK
 t7JaiK30zyQtQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=k3XR7uiT
Subject: Re: [Buildroot] [PATCH v2] utils/generate-cyclonedx: use indent 2
 by default
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

On 06/03/2025 21:31, Thomas Devoogdt wrote:
> By default, use an indent of 2, which is the same as what 'jq' uses.
> This omits the need for 'jq' in the example usage. Also, add a new
> line to the output while at it.
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
