Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A52C35FFC
	for <buildroot@archiver.kernel.org>; Sat, 22 Mar 2025 15:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD4D181F45;
	Sat, 22 Mar 2025 15:36:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B0i4Rb72e81z; Sat, 22 Mar 2025 15:36:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F007B81F63
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F007B81F63;
	Sat, 22 Mar 2025 15:36:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B836B1A0
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 15:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA1C46085F
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 15:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8vskJ_RA2dz4 for <buildroot@buildroot.org>;
 Sat, 22 Mar 2025 15:36:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1D4FF60862
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D4FF60862
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D4FF60862
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 15:36:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 7FB22B00573;
 Sat, 22 Mar 2025 16:36:21 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Mar 2025 16:36:21 +0100
MIME-Version: 1.0
Date: Sat, 22 Mar 2025 16:36:21 +0100
From: Julien Olivain <ju.o@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Marcus Hoffmann
 <bubu@bubu1.eu>
In-Reply-To: <20250225134626.1483376-1-buildroot@bubu1.eu>
References: <20250225134626.1483376-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.10
Message-ID: <b56bd142a4e7a4b8f7e673ef1c74c713@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742657785;
 bh=GpRo7MNY1NNz85uAF/CgOfN2wH9LoXJ5kqaaMjaoNog=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lvUHmVweEpCA+eWW65ARqppljE+MPky7SvL6oKcuh5/vOOUUE5OIc83NqXeL17vrr
 VPRtnhyaQXg6dK/6v4TnurULJHwMS9hufn7AfhT6tr+sYbCm3NhMj8VcBnpweZ5ycl
 OhfuG/v0tqtBQDpUZv4FPOADS8QH+5rA8tSjD6DJdLmTG52w0+cbPodQy+BdhsllOs
 wk+lCyZF7r8MqbqWnCcE1g7/7sP/iZIFxxkLI1k9SIAP0CGsST+hHJlBWEhhaJ//Ww
 Oev00HnU1dG40wslxaygS0LnYr3/w1Kk+9wYVMExNVEHfwVeuYUI6rGHQ93CthGPp8
 voCG9zWpVAzbQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=lvUHmVwe
Subject: Re: [Buildroot] [PATCH] package/python-tzlocal: new package
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

On 25/02/2025 14:46, Marcus Hoffmann via buildroot wrote:
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
