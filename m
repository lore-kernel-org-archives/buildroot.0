Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F9EF459E5
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 22:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 074DE4123E;
	Fri, 10 Apr 2026 22:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HnVvOljWVfXA; Fri, 10 Apr 2026 22:06:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6302F40AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775858762;
	bh=irjpGG1LgC/K9Yj81S0sff5ytb0Izru+xTFcbtsFwF8=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=S9i440UOGD8gsrPubw3hEcByPb1ZOTSjMp+xEq8TSDki1mBCirZg/HbmHuzosuZuC
	 Ro7AMtYWt40jR92E5NAU7WdH7RljkLQ/ZgowYv3nosJ8wUgRe4K5bfY7ByjhhAiWBS
	 YKaZ3tjezSFMhDcXR419b10xn81gHDmg0t54lQN4TU4x8MWhxzLLOu//dkOkNmFWNY
	 olDYzyAl5zf5pk+a/eePkayH98JQc4HhsZQ4pvgdPDgapMaMgCzBnt0p+m0Oj0OQEt
	 E9zVy2saxg4ecd/zggFuXmxkp081WXvHiSfq/YNu4k8EG+NpxCfh8kpgaZOwNpAVeh
	 7xq4Lb9uK8rqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6302F40AA1;
	Fri, 10 Apr 2026 22:06:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 485BEEC
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 22:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A50240AA1
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 22:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BJXf1pVr5PCR for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 22:06:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 60A5A40A9B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60A5A40A9B
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60A5A40A9B
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 22:05:59 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 90AFB2C88D21;
 Sat, 11 Apr 2026 00:05:57 +0200 (CEST)
Message-ID: <672de72c-5792-4be3-bc5e-e33633524c80@bubu1.eu>
Date: Sat, 11 Apr 2026 00:05:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20260410125648.2980692-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
In-Reply-To: <20260410125648.2980692-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1775858757; bh=sAznjFfO4bPFbr6k8t4yHt9LjVSX3XbqZTX8YOENInk=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=dHEINiyv3Fi1BYd5owER3yjRq1JlKJq9puG3eQQJVob5ABFr5WulfECb5b7RiDxPN
 Dv/nYuUMdaxXWCeks80dWaucSMO4n4aqvwSs/QD1Z/ZCt0PNFsAsFFh1m+KXL+iYw6
 5DPXIpyDNL+5C5q7m35x3hv6NRlep0Lq0Yq0UXH2jFfoJLTlVvZXTuJzJlaadrm07b
 PU6aVpqK1ODvY7FxazxemYi/eMmD6/ZpacC6ZVWPoZ2X0mMwiGomIy6oMKMqJLAn0Q
 /xveaEW7s3no38mZjHdMVXqQUVUv/sJQsrWP6ZqpVgAiVoDLvJPyiZjH33c3g8zrVu
 2T+Z/74qGDhvA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=dHEINiyv
Subject: Re: [Buildroot] [PATCH] package/wireshark: security bump to v4.4.14
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

Hi Giulio,

On 4/10/26 14:56, Giulio Benetti wrote:
> For more information on the version bump, see:
>    - https://www.wireshark.org/docs/relnotes/wireshark-4.4.14.html
> 
> Fixes the following vulnerabilities:
> 
> - CVE-2026-3201:
>      USB HID dissector memory exhaustion in Wireshark 4.4.0 to 4.4.13 and 4.6.0 to
>      4.6.3 allows denial of service
> 
>      https://www.cve.org/CVERecord?id=CVE-2026-3201
> 
> - CVE-2026-3203:
>      RF4CE Profile dissector crash in Wireshark 4.4.0 to 4.4.13 and 4.6.0 to
>      4.6.3 allows denial of service
> 
>      https://www.cve.org/CVERecord?id=CVE-2026-3203
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---

Applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
