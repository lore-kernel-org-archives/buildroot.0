Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49B8CCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CB056121B;
	Wed, 22 Oct 2025 16:52:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aTTrxX_HT3CB; Wed, 22 Oct 2025 16:52:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9897761225
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9897761225;
	Wed, 22 Oct 2025 16:52:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DD44F70A
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAC5340888
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wbalihzmtUAC for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:52:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CCFF0400FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCFF0400FC
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CCFF0400FC
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:52:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 548BEB97918D; Wed, 22 Oct 2025 18:52:50 +0200 (CEST)
Message-ID: <4fb9e644-aa49-4289-b047-04af6f8a9fc4@rnout.be>
Date: Wed, 22 Oct 2025 18:52:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>
References: <20251014111159.73073-1-titouan.christophe@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251014111159.73073-1-titouan.christophe@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1761151970; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=w0Vp2EaihOltCbXTlwieuLfl63pwGMd7phHAMMej+sg=;
 b=n950pV4tUTih0zluTSrPVZCIUjuStsUcERYTicu8ydF7ay4rjL8OgffVQwUlxm2nzu1eEr
 zadyVZ21DOqF494J/Ht8ma0P+OOKIo5tHvXip/AxY8pmy4QA4UidVU0u7Nm9S0SoykprCY
 iO/qj3R6G3V2nNRPKTH1g4615d/3TUHPMAY4Xo6/3whUgviTn9m87rxEK1jgm5ZGNA+sM9
 H95O2pdC4abyTi6lxZulfBfOsPngT2k0RtvTtQBxAZzVQoKP467CHh4BRRWQ7xOC5TIByB
 ig8YjLzURd4YPtic/fBGlK7HC7NXP9qzdwsGn8L9TLsnH7R9f7ab8F3sJz5Nlg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=n950pV4t
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/redis: security bump
 to v7.2.11
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/10/2025 13:11, Titouan Christophe via buildroot wrote:
> See the release notes:
> https://github.com/redis/redis/blob/7.2.11/00-RELEASENOTES
> 
> This fixes the following vulnerabilities (in the Lua scripting engine):
> - CVE-2025-46817:
>      Redis is an open source, in-memory database that persists on disk.
>      Versions 8.2.1 and below allow an authenticated user to use a
>      specially crafted Lua script to cause an integer overflow and
>      potentially lead to remote code execution The problem exists in all
>      versions of Redis with Lua scripting. This issue is fixed in version
>      8.2.2.
>      https://www.cve.org/CVERecord?id=CVE-2025-46817
> 
> - CVE-2025-46818:
>      Redis is an open source, in-memory database that persists on disk.
>      Versions 8.2.1 and below allow an authenticated user to use a
>      specially crafted Lua script to manipulate different LUA objects and
>      potentially run their own code in the context of another user. The
>      problem exists in all versions of Redis with LUA scripting. This issue
>      is fixed in version 8.2.2. A workaround to mitigate the problem
>      without patching the redis-server executable is to prevent users from
>      executing LUA scripts. This can be done using ACL to block a script by
>      restricting both the EVAL and FUNCTION command families.
>      https://www.cve.org/CVERecord?id=CVE-2025-46818
> 
> - CVE-2025-46819:
>      Redis is an open source, in-memory database that persists on disk.
>      Versions 8.2.1 and below allow an authenticated user to use a
>      specially crafted LUA script to read out-of-bound data or crash the
>      server and subsequent denial of service. The problem exists in all
>      versions of Redis with Lua scripting. This issue is fixed in version
>      8.2.2. To workaround this issue without patching the redis-server
>      executable is to prevent users from executing Lua scripts. This can be
>      done using ACL to block a script by restricting both the EVAL and
>      FUNCTION command families.
>      https://www.cve.org/CVERecord?id=CVE-2025-46819
> 
> - CVE-2025-49844:
>      Redis is an open source, in-memory database that persists on disk.
>      Versions 8.2.1 and below allow an authenticated user to use a
>      specially crafted Lua script to manipulate the garbage collector,
>      trigger a use-after-free and potentially lead to remote code
>      execution. The problem exists in all versions of Redis with Lua
>      scripting. This issue is fixed in version 8.2.2. To workaround this
>      issue without patching the redis-server executable is to prevent users
>      from executing Lua scripts. This can be done using ACL to restrict
>      EVAL and EVALSHA commands.
>      https://www.cve.org/CVERecord?id=CVE-2025-49844
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/redis/redis.hash | 2 +-
>   package/redis/redis.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/redis/redis.hash b/package/redis/redis.hash
> index 630f6b6d76..aa3253335e 100644
> --- a/package/redis/redis.hash
> +++ b/package/redis/redis.hash
> @@ -1,5 +1,5 @@
>   # From https://github.com/redis/redis-hashes/blob/master/README
> -sha256  e576ad54bc53770649c556933ecd555b975e3dac422e46356102436a437b43c7  redis-7.2.10.tar.gz
> +sha256  2f9886eca68d30114ad6a01da65631f8007d802fd3e6c9fac711251e6390323d  redis-7.2.11.tar.gz
>   
>   # Locally calculated
>   sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
> diff --git a/package/redis/redis.mk b/package/redis/redis.mk
> index a2d4fbe138..cd9736663b 100644
> --- a/package/redis/redis.mk
> +++ b/package/redis/redis.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -REDIS_VERSION = 7.2.10
> +REDIS_VERSION = 7.2.11
>   REDIS_SITE = http://download.redis.io/releases
>   REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
>   REDIS_LICENSE_FILES = COPYING

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
