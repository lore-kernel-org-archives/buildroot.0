Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239B1606A333
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 01:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=P01sLq1D
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAAFB80D2B;
	Mon, 23 Nov 2026 01:14:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pSdfe-yL7sgK; Mon, 23 Nov 2026 01:13:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9942080D2D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795396439;
	b=PkDk3vntD49jfgWpMAaTlCf/BEBwkOBiNhE5gT6ywUIU5GpU57PNo06JWvv6s6p2tRvc
	 KOCcCM8WrkYswCGHrJmKwytbc5FytdAF0m17bF6C5zcj4CMnd4N16WXwTy7k2QZtXOdn+
	 tTh/PgfhokLvJPMT88d5LoGLcwlmIlrt90ItuN+ZITAud1zU0vQHBtb02H7vqFjPtsZtM
	 YmxK9tnJOriOYPLC76jM/balxXuAp/tyYZdb5NzwysJ/4T2b9y1++wJ6mEoLL5RrFuEmd
	 nwQFQLFq0OYs/VOj3kA3+luvTOsl736iHOfDci3mRMZp3BWj1W8yLU7ye+0dLigypyw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795396439;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=dwcySfritIHpK8cGxAk4DljlcI64b6dG1LjYeU/sb0I=;
	b=RdcD+wU2fLJXkN+VuzVLWaGr4fxttYKu5IY0mPQrOuqJ91dOIaAwVuSDieFbr8aYmr1n
	 WLQeonlWmyEbbXxwkaNEGyleSEB9bTlShS5say/qiMiyRSHVUYIGSweSC9p9kJxJb1bw+
	 cFO4K8AWsetd6U3YWfnboi7LffXl52JiwDtzyAnCNKjocCbrlykOnyt7U7KPnjvNxWKtH
	 V1A9067nca3WAYzbhG+VFABE++WmscNh7Bz7AEWNRBIO9tNwaqFV6GM9EweaxMjckCJuM
	 ARSARn7a4ciuL6fpbliJi4gaGv3Jao5G8bGJJLmjjDQg3sK+D9Y0EXzok1aqqIjFPsg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795396439;
	bh=dwcySfritIHpK8cGxAk4DljlcI64b6dG1LjYeU/sb0I=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=P01sLq1DHhVrQqUkphZqzN1x4P3Jymo71/Zavrgto1ZwWc88QKx8axwj0KFL97ZTV
	 b2PtHkrto0ULzvJd1Xq46Rv4+SktibYP7oQ1l6g3bbWCQGqGtXuOuWs1fOqtq7shkR
	 Rh9VBra4h+K+MtfnlWL3tybZh2QdKOntQzRjdMZLpuBx5AzQ3Z/hY5hDa4nuSwcvPB
	 1yzzpPJHvz6GMiBT/Ekc741Jr/MoOyONhREr2X3PMRQvkpqOKyevVsdbWPwwF7JQRr
	 ArwKqB6ae+9BN44xqya0ErpSecCu0kgD7DgWO3nOfw4PcQS+MNhHIy9PiS2KS1dp2M
	 fNGA0moEITlKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9942080D2D;
	Mon, 23 Nov 2026 01:13:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BC9F371
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 01:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 490B3405F6
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 01:13:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0o2DyF_mC4kJ for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 01:13:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AA72D405F4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA72D405F4
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 01:13:54 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 5960B2C8553B;
 Mon, 23 Nov 2026 02:13:52 +0100 (CET)
Message-ID: <e48184fa-a688-422c-93d5-8d44a776da14@bubu1.eu>
Date: Mon, 23 Nov 2026 02:13:46 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>, Romain Naour
 <romain.naour@gmail.com>, Daniel Lang <dalang@gmx.at>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
References: <20231208231413.656734-1-fontaine.fabrice@gmail.com>
 <20261121180855.3595157-1-angelo.compagnucci@gmail.com>
Content-Language: en-US
In-Reply-To: <20261121180855.3595157-1-angelo.compagnucci@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project/clang: link with
 -latomic if needed
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Angelo,

On 11/21/26 19:08, Angelo Compagnucci wrote:
> Hi Fabrice,
> 
> On 09/12/23 00:14, Fabrice Fontaine wrote:
>> FileManager.cpp:(.text._ZN4llvm17TrackingStatisticppEv[_ZN4llvm17TrackingStatisticppEv]+0x20): undefined reference to `__atomic_fetch_add_8
> 
> I think this patch can be dropped: the problem is fixed upstream.
> 
> LLVM commit 20132d8eaa68 ("Link libclangBasic against libatomic when
> necessary.") links libclangBasic, where FileManager.cpp is, with
> libatomic when the target needs it. It is in LLVM 16.0.0 and later.
> 
> Buildroot has it since commit e29dae109a21 ("package/llvm-project: bump
> to version 20.1.5"), and the autobuilder shows no clang failure after
> it.
> 
> Not Applicable: https://patchwork.buildroot.org/project/buildroot/patch/20231208231413.656734-1-fontaine.fabrice@gmail.com/
I've marked it as not applicable, thanks!
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
