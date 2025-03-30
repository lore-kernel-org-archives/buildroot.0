Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B909CC28B20
	for <buildroot@archiver.kernel.org>; Sun, 30 Mar 2025 09:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B1BB404AD;
	Sun, 30 Mar 2025 09:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Jf8G582pZVH; Sun, 30 Mar 2025 09:17:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DD60408C5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DD60408C5;
	Sun, 30 Mar 2025 09:17:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BCA7121
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 09:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DAE560BAD
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 09:17:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jnj-zXTVqSsw for <buildroot@buildroot.org>;
 Sun, 30 Mar 2025 09:17:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9B2A160BA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B2A160BA0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B2A160BA0
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 09:17:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 9A6EB78050B;
 Sun, 30 Mar 2025 11:17:38 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:44382])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 30 Mar 2025 11:17:38 +0200
MIME-Version: 1.0
Date: Sun, 30 Mar 2025 11:17:38 +0200
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250329221815.573118-2-giulio.benetti@benettiengineering.com>
References: <20250329221815.573118-1-giulio.benetti@benettiengineering.com>
 <20250329221815.573118-2-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <95542e04b048c4d987bc2ce1b6d1146e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743326259;
 bh=v7w9dXRlJmf0AGoZ+p7Ei1BG63B4eNLvq+UTiOcr6Nw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Aoj7939nySZNpnubYJMox3BlX0Kqpn7OgeAfIezDsIndHgGhcMLsJSjlq8cimYQth
 HmOBwNtCr2mcNXCge4LHSm1x2igkO50Mwg5XGC2vIOtl1uNrzsnLeSrdd7pGpjKoma
 UEjGGpwvG+gwjRj16uTUX++19IN5P+lZX0DiUlQpffFcgmJHdg4mXxCNLO/Ju7nycq
 TsF6I4Za9m5zIIAXtqep8O3LofMYf5T/Xhh3JXqrMCQ51beBC0IzReee1hew81Nlo+
 rM0wO9FKv3T8lyDk21lNO1pkX0KIs+17A6Mx0Q+E4nx9njj+BwmKgAxBNgOBb2qkuh
 l6Ivt1+UfHyjA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Aoj7939n
Subject: Re: [Buildroot] [PATCH] package/libnvme: bump to version 1.12
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

On 29/03/2025 23:18, Giulio Benetti wrote:
> For release note, see:
> https://github.com/linux-nvme/libnvme/releases/tag/v1.12
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
