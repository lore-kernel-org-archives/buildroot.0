Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F6AC5B572
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 10:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5590360634;
	Sun, 16 Aug 2026 10:45:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TAujfBFxOF5E; Sun, 16 Aug 2026 10:45:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AF8C605D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786877142;
	bh=ObWGYV1KEorzYNt4I4O9Tg8+eOqtqDe/VlJl87qkRSo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Hj4FfvHLmGvujTaSJZJ58zAFCfJMy889yh2zDIGiRYQ1Lj+UfTBT9fY1nlj+tUEP9
	 APt15AP6RGoBLCVg+AS6fy350LNAfxYQPdOJIw+kSx5VD6s6BM358sryeIm3vydB7z
	 5W6Ed4DHwYOCFDwjJdSnNL+neOvxvwWCHR0qwsaGi9E7jLo2muw1jQvUoOg2pgOMc6
	 HrClDaE53oapPZzpxs/dge+wRngD8HLKMzGLdDv59lLwITFZVwBiLP7g4npRVN5KPS
	 NLmAyo/iiy2T7YBXPbaZQUmC0kCCVqSl+VgHCYUqeI9cm/9fqn3jx6Z1U9ll1Ysb2S
	 oV0Q0slghwu3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AF8C605D0;
	Sun, 16 Aug 2026 10:45:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E5C0336
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 10:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BA9440637
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 10:45:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XJm3Z7QXAyde for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 10:45:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 74BD540620
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74BD540620
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 74BD540620
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 10:45:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id E84DF2003C3;
 Sun, 16 Aug 2026 12:45:34 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Aug 2026 12:45:34 +0200
MIME-Version: 1.0
Date: Sun, 16 Aug 2026 12:45:34 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <aoC7Qd8pbR8RIl0H@waldemar-brodkorb.de>
References: <aoC7Qd8pbR8RIl0H@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <ae41a10a57272931dbe8fdf8d1728f94@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/uclibc: Fix SSP support for RISCV32
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

On 15/08/2026 21:17, Waldemar Brodkorb wrote:
> Add patch pending upstream to fix SSP for RISCV32.
> 
> Fixes:
>   
> https://autobuild.buildroot.org/results/1b6/1b6f2161b11390b6545bddbc39b444401c718ebb/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
