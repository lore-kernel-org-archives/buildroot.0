Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F78CAC587
	for <buildroot@archiver.kernel.org>; Sat, 13 Sep 2025 14:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F02FA83D22;
	Sat, 13 Sep 2025 14:46:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rua_hKjoGh3S; Sat, 13 Sep 2025 14:46:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 229F183EF4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 229F183EF4;
	Sat, 13 Sep 2025 14:46:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D245117
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 14:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53B1760603
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 14:46:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PujYJTZo8OBN for <buildroot@buildroot.org>;
 Sat, 13 Sep 2025 14:46:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E9F2615AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E9F2615AD
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E9F2615AD
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 14:46:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 85A935FFAF;
 Sat, 13 Sep 2025 16:46:35 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 13 Sep 2025 16:46:35 +0200
MIME-Version: 1.0
Date: Sat, 13 Sep 2025 16:46:35 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250910111944.2685069-1-thomas@devoogdt.com>
References: <20250910111944.2685069-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <f1a84b48e59d2e9c1a0774cdd83e54e2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757774796;
 bh=ROlhcbPq8DQxvIXF1XhhecNB1+TvjE6wCvJCqd9NqJs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TYeMXkN3dMKZyEja1kRhCMDdUnMT+D2AlwAb7R7ixnXjkYvt13uEAf+X5tog01/z2
 NzBB8XmRzjIiaEc79BcbFCE2bVQUF9GUCzHKz7UZlEQX3M1JDpW6j5fL7AqBC1g4u6
 adNgcnj9TR8mjqHFp2jAY8joX5Mnc0VKETnmGrgAqQ5HqeRT/e8hG9/t+RWfpC/RBt
 sv42qI1UzAjXxTuQAJoPJX5OR4WZEaXVzV4AvppAjYVn8dKzV5nKmYZv+nj89r1Zv9
 A/GhtTkjopUxyauUoDkv3yB/4vHbbqzH03scE2i+GMw+lNncbqnaZHdLzFDuKd5qdR
 fLdkjktAqQQPg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TYeMXkN3
Subject: Re: [Buildroot] [PATCH v1] package/fluent-bit: bump to 4.0.9
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

On 10/09/2025 13:19, Thomas Devoogdt wrote:
> News:
>  - https://fluentbit.io/announcements/v4.0.4/
>  - https://fluentbit.io/announcements/v4.0.5/
>  - https://fluentbit.io/announcements/v4.0.6/
>  - https://fluentbit.io/announcements/v4.0.7/
>  - https://fluentbit.io/announcements/v4.0.8/
>  - https://fluentbit.io/announcements/v4.0.9/
> 
> Fixes:
>  - 
> https://autobuild.buildroot.org/results/770/770e9106a0c92f02e0f699505e69b35ac0e6cd41/build-end.log
> 
>    
> /home/buildroot/instance-0/output-1/build/fluent-bit-4.0.3/plugins/out_cloudwatch_logs/cloudwatch_api.c:1540:66: 
> error: implicit declaration of function 'strcasestr'; did you mean 
> 'strcasecmp'? [-Wimplicit-function-declaration]
> 
>    Fix commit: https://github.com/fluent/fluent-bit/pull/10452
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
