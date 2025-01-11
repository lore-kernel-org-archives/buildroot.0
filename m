Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D06AE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 17:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F38EB40B67;
	Sat, 11 Jan 2025 17:32:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 29BPxHppSQ3L; Sat, 11 Jan 2025 17:32:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF47740DB3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF47740DB3;
	Sat, 11 Jan 2025 17:32:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A6D4950
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BB5560AD2
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:32:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MKdFdjjsqCdM for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 17:32:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B859760AAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B859760AAE
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B859760AAE
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:32:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 0DBE313F86A;
 Sat, 11 Jan 2025 18:32:27 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:49656])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 18:32:27 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 18:32:27 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111151601.2833604-1-james.hilliard1@gmail.com>
References: <20250111151601.2833604-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <efaadbdd14829dca06e31aa1c25a63c6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736616749;
 bh=xcl34y+PShWk58zdsOHwlnVV1rbV1ptrYM9CRJW6c48=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YKMKt30kUuggaC4OLzm0A0pqx6wPGPUwOZN20jHvNh1DcqdPxHlFBd/yxzE8vi0LI
 kwhSg/UuGXFzNzlMuu+7apq4p+AUkLPzasK++3WFpGDn2OjFAijtixQkYFGv4FIvyu
 GFd1sqbKl/D1o9T9belX2CAPsDyu1Ys5GpKJ/+5d+/wr2PiPIc2rEJLNIjkjkCfhWg
 lOAG8aNbfaztfjmtjf3swm0QQyWrI5YyPxjUzfmMwmh9HuDlBQ5FZVmTEzIA3kz7ds
 ebpvUurEdtruSV13vhmPXvJXbujOJ2xuqNYiZMvW0gU2se5UKTQ8SFgXJUMz7sHVGV
 cFtbsL63gbFRw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YKMKt30k
Subject: Re: [Buildroot] [PATCH 1/1] package/python-propcache: bump to
 version 0.2.1
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

On 11/01/2025 16:16, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
