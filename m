Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8E1C3ABBE
	for <buildroot@archiver.kernel.org>; Thu,  8 May 2025 21:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1939881345;
	Thu,  8 May 2025 21:39:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lx9sKnCSqmzr; Thu,  8 May 2025 21:39:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D40B812A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D40B812A8;
	Thu,  8 May 2025 21:39:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E7B991A9
 for <buildroot@buildroot.org>; Thu,  8 May 2025 21:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD688812A8
 for <buildroot@buildroot.org>; Thu,  8 May 2025 21:38:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JiN9T3s0XKWO for <buildroot@buildroot.org>;
 Thu,  8 May 2025 21:38:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1DB8E812C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DB8E812C3
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DB8E812C3
 for <buildroot@buildroot.org>; Thu,  8 May 2025 21:38:57 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id D71FE3537E86; Thu,  8 May 2025 23:38:53 +0200 (CEST)
Date: Thu, 8 May 2025 23:38:53 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aB0kbel-yczyUUjH@waldemar-brodkorb.de>
References: <20250507231902.14cbc9aa@windsurf>
 <87ldr71q08.fsf@dell.be.48ers.dk>
 <CADvTj4pbysjPEsS1bAvkHSPTdW9ePHFpfybqg5Zb2Xkv8NnLgw@mail.gmail.com>
 <2b0ae9e9-b4f0-49ca-aef8-1d769780b231@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2b0ae9e9-b4f0-49ca-aef8-1d769780b231@gmail.com>
X-Operating-System: Linux 6.1.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1746740334; bh=gHM1ZG2cGSu6ONKnAKK3pnlc0AAuofmzE/M683+N5p8=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=G8qqtbYkpooaupIyz8CX2pavyDnpw9jezkpsYI+/OIsU+TFkuaTPH/k2FKGdnBs7v
 LtL06ba0LNiCchywwVKei2g6EkG4Bv6HI3BIYsmGwgJZesCjYF1QhFX7vnQgbdAqLt
 /OfpcAODaqlH6jL+u9jFcHAZP0gWGmujdfaEEcFw4DBgKLzv8qEK1ez3CUBps1rRrS
 CSNCOwoWvVQXSz2BM+1g1uVSEGQ+cUCixcpoO4XwSzl5BjVN3LuocIojhWoKRtdWca
 3YpOwtjT9v9VZDQoAy/ljF6XIgcwRSBEuyZdxnicIm8oTzfBwqWTJWZ/wiB/aSF5Ys
 sZzlmFEEPjhug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=G8qqtbYk
Subject: Re: [Buildroot] Grub security situation
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

Hi,

I am involved in some new project, which is using Buildroot and
Grub. So I vote for keep grub with pointing to git master as
Thomas suggested.

best regards
 Waldemar

Lance Fredrickson wrote,

> +1 track debian for what it's worth
> 
> Lance
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
