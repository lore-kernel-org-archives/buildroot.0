Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB01E74ACF
	for <buildroot@archiver.kernel.org>; Tue,  3 Dec 2024 20:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C018C4002E;
	Tue,  3 Dec 2024 20:24:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s1pKBK9w0096; Tue,  3 Dec 2024 20:24:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACD2140286
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACD2140286;
	Tue,  3 Dec 2024 20:24:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A30F4236E
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 20:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84170841A1
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 20:24:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C0r9nJMz0Mil for <buildroot@buildroot.org>;
 Tue,  3 Dec 2024 20:24:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E18B184132
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E18B184132
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E18B184132
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 20:24:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id A4DF02003C1;
 Tue,  3 Dec 2024 21:24:45 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:54448])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 03 Dec 2024 21:24:45 +0100
MIME-Version: 1.0
Date: Tue, 03 Dec 2024 21:24:45 +0100
From: Julien Olivain <ju.o@free.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20241202201120.3298217-1-yann.morin.1998@free.fr>
References: <20241202201120.3298217-1-yann.morin.1998@free.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <917bda2dc7ce33a1397ae273c0e5a662@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733257486;
 bh=5MaQMOoqLrkyAGISFLHtO6Jl8gMfd/X7p/KJtQibgnk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=swXvVJ3RgG3srTqszKfLAk3Kr4rtMRGRl7dgh1BGb7CPtc8kd+h2sPE7Tschgdd/r
 PeazwASnYSJ0drISsXMLdqJx96X2Xq3H7azeyrJGvHCqLHg1osxY9yCE4Hbt99LNSk
 dpyOhPZdRGFiUNsNwIHmyLMimY8eJQ1f0uDgHLenH987S3tB+K7UHJydzAlRxTyV8O
 qPaREuQ2sG29NtBFtMKrWO/LLVNM7i+vdrXAB2grWUoacWEbtwgyuT+QQ+KDQKCEPg
 /J0k6nswOqDprLgZnoF8SaUMAAu2sEApyWxexB5JsnfXcD6VwK6oUTITvXhSD2o6ZA
 Omixo5a21E+vg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=swXvVJ3R
Subject: Re: [Buildroot] [PATCH] DEVELOPPERS: drop Yann's entries
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

Hi Yann,

On 02/12/2024 21:11, Yann E. MORIN wrote:
> As it happens, I am unable to keep maintaining those entries, and it is
> misleading to others about whether they should Cc me on their changes.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

I applied this patch to master (with some emotion). Thanks for 
everything,
see you around.

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
