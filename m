Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00581C369D9
	for <buildroot@archiver.kernel.org>; Wed, 30 Apr 2025 08:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFC6E4066D;
	Wed, 30 Apr 2025 08:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aMJNBLNYU2oM; Wed, 30 Apr 2025 08:20:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB30D40689
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB30D40689;
	Wed, 30 Apr 2025 08:20:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E4088E4
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 08:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C927E81F11
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 08:20:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tHr62LevrcPb for <buildroot@buildroot.org>;
 Wed, 30 Apr 2025 08:20:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6B6E881EEA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B6E881EEA
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B6E881EEA
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 08:20:05 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id B344CBFACA
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 10:19:59 +0200 (CEST)
Message-ID: <ab994654-61f8-443c-ba70-777fc4379462@grenoble.cnrs.fr>
Date: Wed, 30 Apr 2025 10:19:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <60b8483c-b717-41ce-a406-bceb71c3a089@rnout.be>
Content-Language: en-US, fr
In-Reply-To: <60b8483c-b717-41ce-a406-bceb71c3a089@rnout.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1746001199;
 bh=0AV5HzmpUhM7fBKnavytcO7EYZJlncD327AGhuXln2g=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=BKigqcwCNYM/1kRtWFj4zSib/lPGJLPGBJMZxbGEzK6jWY7WGvSjFjAoFdONFpvHP
 R7KjIKQmdGvEGqMeRWQ/7vjzpLEMFAn0QQHfsNGS3qCPvJ0xBle5wtjSfPT++dgNrS
 FHs9KBvyQqWsHCJojErU5okizi6XORgm+Z6yd+nT10YRiv/mCTOSEBJh9/jIK/3PwO
 g8e8bHhpxh+S4Ajw48IkRuRtZxDVfxbH8NrcMa9EyjZLMviKynWJlaGMKQAgFEWGE1
 hPL2HX66iuzErqVoR+20/eMnZgWemhc1GxSaTVwq/3mt/kz59wB8QEzHonQSxeDBIP
 f/dpj1lHcOBmA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=BKigqcwC
Subject: Re: [Buildroot] Buildroot 2025.02.1 released
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8hCgpPbiAyMDI1LTA0LTIyLCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90ZToKPiBCdWls
ZHJvb3QgMjAyNS4wMi4xIGlzIHJlbGVhc2VkIFsuLi5dCgpUaGVyZSBpcyBzb21ldGhpbmcgd2Vp
cmQuIFRoZSBCdWlsZHJvb3QgZG93bmxvYWQgcGFnZVsxXSBzdGlsbCBsaXN0cwoyMDI1LjIgYXMg
dGhlIOKAnGxhdGVzdCBzdGFibGUgLyBsb25nIHRlcm0gc3VwcG9ydCByZWxlYXNl4oCdLgoKUmVn
YXJkcywKCkVkZ2FyLgoKWzFdIGh0dHBzOi8vYnVpbGRyb290Lm9yZy9kb3dubG9hZC5odG1sCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
