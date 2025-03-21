Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A01C36007
	for <buildroot@archiver.kernel.org>; Fri, 21 Mar 2025 21:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1F26606CB;
	Fri, 21 Mar 2025 21:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cXEIsrKUg3Lp; Fri, 21 Mar 2025 21:19:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 193286077C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 193286077C;
	Fri, 21 Mar 2025 21:19:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 954541A0
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 21:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 927E283ED1
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 21:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v6qTubOu0Vq5 for <buildroot@buildroot.org>;
 Fri, 21 Mar 2025 21:19:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 04B4E813E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04B4E813E9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04B4E813E9
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 21:19:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 231BC5FFB1;
 Fri, 21 Mar 2025 22:19:48 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 21 Mar 2025 22:19:48 +0100
MIME-Version: 1.0
Date: Fri, 21 Mar 2025 22:19:48 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250321182045.2782233-1-bernd@kuhls.net>
References: <20250321182045.2782233-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <88e94581857951b9f5ce06e3131546f5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742591991;
 bh=ctMg87RxK28Z4yGGTKgqIcQ11MQUQnhap+3byO3HXZM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MpX/q8g7Efwyof3t/zqOO2/TSU7qkINE+fqQTRKHcHQmx8tQH6LRWOEkqnmJsdVCr
 Po3swT9Tdcd+GAcoHFuVIDClrpuew4qthZhK7qoNPicpkDuqaov4cL1eT26gdaWbmC
 vJ+XcRnNxURpc6MGeoSDFOdeaLRD7tRwW7ZdZEJ7wqN6e4LTml6ONP6IKslcxY9QsS
 xtvy5w8AbaCcuzhvoem+oirIshERt8QRgZu485t+7venZ6Apjvao1YPJ2iqHuozZBN
 uvsykiW4E2F6Iz5tJpzaizMfRlPqhLRJk8ioZWpl4FMEyDPsPGtfwVjeWFDc9+ufRw
 skTh+avXrlO3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=MpX/q8g7
Subject: Re: [Buildroot] [PATCH v3 1/1] package/python-emailproxy: new
 package
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

On 21/03/2025 19:20, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
