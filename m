Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C81C87FCA
	for <buildroot@archiver.kernel.org>; Tue, 29 Jul 2025 23:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAAE261286;
	Tue, 29 Jul 2025 23:40:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t0afn5hAB_tw; Tue, 29 Jul 2025 23:40:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1E406127F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1E406127F;
	Tue, 29 Jul 2025 23:40:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BC28513D
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 23:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADB6D41E11
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 23:40:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AqluYeHLAUpN for <buildroot@buildroot.org>;
 Tue, 29 Jul 2025 23:40:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BE6A341E0F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE6A341E0F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE6A341E0F
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 23:40:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 4B6395FF88;
 Wed, 30 Jul 2025 01:40:49 +0200 (CEST)
Received: from [192.214.236.6:54590] via [192.214.236.6] by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 30 Jul 2025 01:40:49 +0200
MIME-Version: 1.0
Date: Wed, 30 Jul 2025 01:40:49 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250729094732.165580-1-titouan.christophe@mind.be>
References: <20250728102956.81525-1-titouan.christophe@mind.be>
 <20250729094732.165580-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <32ac90fd5da31b47a282efd7a9c060e9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753832452;
 bh=DheULwLbg/F3RVx7r3VVtregO/8265JCGOLLU/YqSEk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H0jjXKrNKn1sggJ2lfcjHOYXmoqITK/xbaTfuBYf7OvMqFsw+qOBLsmCrQwelPRcq
 gduqfkE5FpO8/QDSugwIP3oeQeQl/gOeaOcoyu45MNB0gvdu3u53CNfx1c8lcyE3vu
 kKreC3Ht/SDZ32BGRcb9mSiIsqxHZ0gfxOHsUxF0SwUJJBoalaNcNYsP+/G2ZDzVXl
 uKbGB40ujh0uHtpW6Zc2Ga+ylz/Ag6Pie1B70lFuJMlagOv637L9XivDHA1L33FYNZ
 XjBVjtHEqNyUScM4DeCsK1F6sg19QcXZbJIAX3Jt/p25UUUVGNhzJVJ7WJVn0hR6n2
 DENL/loOV+TUg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=H0jjXKrN
Subject: Re: [Buildroot] [PATCH v2] package/rust: add CPE_ID_VENDOR
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

On 29/07/2025 11:47, Titouan Christophe via buildroot wrote:
> This gives a proper cpe-id string to the Rust buildroot package,
> as it can be found in the NVD database:
> https://nvd.nist.gov/products/cpe/search/results?keyword=cpe:2.3:a:rust-lang:rust
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
