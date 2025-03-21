Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98ADAC36002
	for <buildroot@archiver.kernel.org>; Fri, 21 Mar 2025 21:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5501642677;
	Fri, 21 Mar 2025 21:04:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W83ZFR_3i-Sb; Fri, 21 Mar 2025 21:04:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F9A042683
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F9A042683;
	Fri, 21 Mar 2025 21:04:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 44E5EE2
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 21:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BF3C408AA
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 21:03:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NGUwOUcn0ekq for <buildroot@buildroot.org>;
 Fri, 21 Mar 2025 21:03:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 94E774054B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94E774054B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94E774054B
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 21:03:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4654913F861;
 Fri, 21 Mar 2025 22:03:54 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 21 Mar 2025 22:03:54 +0100
MIME-Version: 1.0
Date: Fri, 21 Mar 2025 22:03:54 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250321173530.71510-1-bernd@kuhls.net>
References: <20250321173530.71510-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <f2b2a9cfdcad17edfb5b7b6c4a85f784@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742591035;
 bh=sJzOK3k4O6tTpiF9xFAH96J3Y1xlBYzzFbW8fnLmaEg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DHD9KrVv+HWJBmbL09Kl6JI/+N8KdSWLPgNIDzNc0mqRArlGWQjncI9bhfKJ4+n+g
 JsZayZEU+g/y7Rv+6Zr5HknRA62Hcebn8ffHEpkzkT0Ao++sjL3p1EkxlXMvn2TZBT
 4I0WlVopHFeaLgZs9b4zfi1U278xcHucI26CYAoWemM5tPb52FF31zBq6dOk40BYqH
 cKp3eT+wPTuvGS0nEXQ+Utue4YSIUhDbenfUMADaedhEopgqGfsCbcZ+771XUSs2GK
 5wlimFsLpueQwQkeJ8BrkIOehZsOY2y0QI0kQ4p0jp9sgZOkS770oK5vxhg3hsWIJk
 AAp1BWwbGnWQg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DHD9KrVv
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-waipu: bump version to
 21.9.2-Omega
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

On 21/03/2025 18:35, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
