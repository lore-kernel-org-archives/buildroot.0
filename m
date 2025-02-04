Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041F1C02196
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 15:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5C8640015;
	Tue,  4 Feb 2025 15:25:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ti8KRpMbZPQz; Tue,  4 Feb 2025 15:25:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0581410B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0581410B8;
	Tue,  4 Feb 2025 15:25:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 01C61185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DABA180B9F
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:25:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2FWEqe4Aiyld for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 15:25:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E758E80B8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E758E80B8F
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E758E80B8F
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:25:19 +0000 (UTC)
Received: from L25025.local (unknown [109.89.232.55])
 (Authenticated sender: vjardin@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 397B019F5BE;
 Tue,  4 Feb 2025 16:25:14 +0100 (CET)
Date: Tue, 4 Feb 2025 16:25:13 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Julien Olivain <ju.o@free.fr>, romain.naour@gmail.com
Cc: buildroot@buildroot.org
Message-ID: <ijjjmtvfj5ezlub4a7t4w2kalfw5iagme35ncwoups2cbvjili@5sdrajj6l35d>
References: <20250203141425.48418-1-vjardin@free.fr>
 <4126e709763b47f9e182f83f6221bdbd@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4126e709763b47f9e182f83f6221bdbd@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738682716;
 bh=FM3hoO2r+mPJColH7EHuA3woIc4Uc3DHecZmt54GZjk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fsL/ZJAXpaLGp+NRq1Cn70jRg/IDZpg7VxTJJCk/b7mEFaE2v/SJJxoIh0cvE4ibr
 661m9HvMhgARtuJ/tt05UQO8LK9SXr3xqD8b0HeWi8O+xQ7bVxQU/ERSAyDcc2JUpW
 OAPcop95hAli6q8574bedlYoWROOL0XCzfDP4of1u8YC6MdkszUmZe3cjwEea9oX4C
 byRaKdEeMHxiwIF/vVbxDbWJw6ugGMANj76vpdlWEb3AXtwUCgYnjBnPrGTY9UT0jf
 PguwBMCR+zrh0DsgqnflJO6p79w6Q6i8Okm/A/oKrPpgaGDt9tcov9DhS402O04YmS
 6fzhPfdwJ3KbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=fsL/ZJAX
Subject: Re: [Buildroot] [PATCH v1 1/1] package/libbpf: bump to version 1.5.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Feb 04, 2025 at 04:10:11PM +0100, Julien Olivain wrote:
> On 03/02/2025 15:14, Vincent Jardin wrote:
> > Changelog: https://github.com/libbpf/libbpf/releases/tag/v1.5.0
> > 
> > Signed-off-by: Vincent Jardin <vjardin@free.fr>
> 
> Applied to master, thanks.

thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
