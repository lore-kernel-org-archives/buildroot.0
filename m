Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063F6CFD2F6
	for <buildroot@archiver.kernel.org>; Sat, 29 Nov 2025 10:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B29F0810BE;
	Sat, 29 Nov 2025 10:25:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wPYi5SWxMfoB; Sat, 29 Nov 2025 10:25:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D85518108C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D85518108C;
	Sat, 29 Nov 2025 10:25:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CA53D1A9
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 10:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC48380FF9
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 10:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JmCx_UtL_tN1 for <buildroot@buildroot.org>;
 Sat, 29 Nov 2025 10:25:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C9A8380F84
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9A8380F84
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9A8380F84
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 10:25:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 68D0A19F59C;
 Sat, 29 Nov 2025 11:25:03 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 29 Nov 2025 11:25:03 +0100
MIME-Version: 1.0
Date: Sat, 29 Nov 2025 11:25:03 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20251129072819.395958-1-bernd@kuhls.net>
References: <20251129072819.395958-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <e101907a477b27805df213a8d9629303@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764411905;
 bh=evD1qZW5LaH3/rOhGiY55Y4cbB1tS1cCnycJUYxrDxE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lE0pcr9VeU1AC1wT5IsItaOmY+oCZb/Hl9G+cub5oEUony7wQryWrz4sKlFL5hb9d
 LK0pPkO/MpWqaY/70VJlfe5ub5VbOC/iWitnsuxsraesrGsA6xL+F03KrTlYZNX9e0
 Xq+dF15pgN3kETH7XAj2yx8evoTZ7HFbaRv7fJA9XQ/CIaBw5NzBvG3LSRMoF6OYr8
 P96x3s5BVeAeBwR9iilIRgVitKK9iL6HOc+ubbYLj5qcQj59cRMBeVFZOUe2QoGEJI
 5ybDPAqJm9W4aWVZ3517eoY0t1LGeS381kgLYa9lFusQzszrWfMU8AFfrT6XhImm2n
 b/SEqkdq+dNig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lE0pcr9V
Subject: Re: [Buildroot] [PATCH 1/1] package/oprofile: add upstream patch to
 fix build with newer gcc
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 29/11/2025 08:28, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/e12/e12de278cb7bb0ecc0d44dd9c69d3832ede946de/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
