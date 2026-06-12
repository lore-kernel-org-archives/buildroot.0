Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3AF1CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 10:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A10A860EF7;
	Fri, 12 Jun 2026 10:54:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FJJ3n_-8gLtm; Fri, 12 Jun 2026 10:54:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2BE060EB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781261671;
	bh=Yr0spuBu5S06YJq8h/yZDHeAZxtW65MRK6E53BVxj6U=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WmDbwM6SzyN+odnYREjj3NcmGXdNUo+fQN22IRwFwq8fGd3AjnuHOv24FwK8eExAc
	 EpilGOxk/GEY2Qs/nux/iH6CtDPG+45G55E0JZrGr8mlVu4Y1mhJGsTd6Zo0VEQQd9
	 Pq3d4JMAWSbmAa9/BeCyG1bJygUaniToNeMtgxF59iECdrPZH7/M9eiIQSfCRxSkX5
	 vhsr7nkuZ8zCLxYmKZk1NrcMw8xBmyaQ9ONwpafqRrNV76zbWDMdmHd+vImFbEGNB4
	 KUEmg3w8KSZuxRh8s0bAOmtQm47QKwv9BO5iF5P1NXS+DUgF+LAek0UhrO2EL49ytG
	 gtLggojXIGB1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2BE060EB2;
	Fri, 12 Jun 2026 10:54:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A3BC8F4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 10:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A82F80B40
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 10:54:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z4TxgO4WJL4T for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 10:54:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DDE3880AC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDE3880AC2
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDE3880AC2
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 10:54:28 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 8B0372C846AF;
 Fri, 12 Jun 2026 12:54:25 +0200 (CEST)
Message-ID: <4392c04e-203a-447a-9160-370717fe6099@bubu1.eu>
Date: Fri, 12 Jun 2026 12:54:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandre Ondet <frcomdev@gmail.com>, buildroot@buildroot.org
Cc: james.hilliard1@gmail.com, thomas.petazzoni@bootlin.com
References: <be29a7bb-f97e-49a2-96ca-8a4983c155af@bubu1.eu>
 <20260611191552.414-1-frcomdev@gmail.com>
Content-Language: en-US
In-Reply-To: <20260611191552.414-1-frcomdev@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1781261665; bh=awlRC1uKx/uBfAh1ZTqSF3rU0sMx5IKchqZzr4nD9+c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=RY42s/3wH36/kwcjivwW7zSYwcX+fGwtSkNgpfJiz8vo1G6FTQ5mFMoTIW8XPGVyp
 xiuU+/ErOVoh7iV/1X4KgaCrPdFtV/ekDF051Q1NG99nGserSB3ECK5qCxOAQtawAO
 wc1FRF4CbwwJqbT5a/z9RNjim7ripkLzclKdE85aoHQM7ZFb7nw65fL7YsSk4vbJld
 0jkjyKRW8DQ/+Z9S3l7nW1FEbDvmJWO1sfrfIqDnwcRpmZJd8AF+O3W9/1R4xwrNZk
 55uIlGA9IwiDB8lcaQpTrb7VMQerqyLdoka9nDcPCoLG+iq6susjoIg4KR5PAwpTap
 qtffcTHeUle8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=RY42s/3w
Subject: Re: [Buildroot] [PATCH 06/13] package/python-nmcli: new package
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Alexandre,

On 6/11/26 21:15, Alexandre Ondet wrote:
> Hi Marcus,
> 
> Thanks for the review. Updated patch attached:

Thanks for this iteration, but please send a proper v2, not an 
incremental patch.
See: https://nightly.buildroot.org/manual.html#submitting-patches

> 
> - BR2_PACKAGE_NETWORK_MANAGER dependency and BR2_PACKAGE_NETWORK_MANAGER_CLI select
> - trailing newlines in all package files
> - runtime test exercising nmcli.general.status() with systemd + NetworkManager

Can you also add yourself to the DEVELOPERS file for the new package and 
test files you are adding? See 
https://nightly.buildroot.org/manual.html#DEVELOPERS

> 
> Best regards,
> Alexandre

Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
