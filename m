Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70917E77188
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 11:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AF7B4064A;
	Sun, 12 Jan 2025 11:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VDwh_0Yt_dae; Sun, 12 Jan 2025 11:35:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20ADE40696
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20ADE40696;
	Sun, 12 Jan 2025 11:35:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C454942
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CFB54064A
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:35:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KGsCv9UHLmr3 for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 11:35:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 74C89406E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74C89406E2
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 74C89406E2
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:35:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A823C780372;
 Sun, 12 Jan 2025 12:35:15 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41924])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jan 2025 12:35:15 +0100
MIME-Version: 1.0
Date: Sun, 12 Jan 2025 12:35:15 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Louis Aussedat <aussedat.louis@gmail.com>
In-Reply-To: <20250111183053.2936427-1-james.hilliard1@gmail.com>
References: <20250111183053.2936427-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <1c02e72d4beb59f26f9b1aba44baf0ab@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736681717;
 bh=HqGqZoWp5Cw00FuxfUsAwDpZ+bxOfjjDZZR9E3C5eFs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=phYJ4CClEoaxPCWNw7Sbd8Qbsi+3xNqgn7q9Ql1zQ2gBY6sluHlMu4qDVF3F2MZLV
 YVHsAcfWbSfcR8Rx0ys65MO6L7rhBePj/WEfWJuDLjt1V8/Yb7KxPbxMMvwbzjKhul
 UbBtPJsR8bwmApCcDazA+qOfViNZ+sVyqCgWthrVvsu+titxrCTeVkm8uE4u44cu6t
 Zla7am0blMMloFJzI2ATbwwpCQJpCxyjyK8goEV1Tf73MXjs2Stm6EFR727FhR0VDX
 ARhU6dI3Jkg2i3T32oALcF3JKfP/ZlUlExqrVPCv1NBtKSQGe/va1eThu+ESs0uvew
 hnMVWCjqM4m1g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=phYJ4CCl
Subject: Re: [Buildroot] [PATCH 1/1] package/python-tqdm: bump to version
 4.67.1
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

On 11/01/2025 19:30, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
