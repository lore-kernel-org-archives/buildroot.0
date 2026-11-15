Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CF4606A31A
	for <buildroot@archiver.kernel.org>; Sun, 15 Nov 2026 16:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JsHp9620
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEE2F606C6;
	Sun, 15 Nov 2026 16:13:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z0HO--kRUtlD; Sun, 15 Nov 2026 16:13:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C828E60748
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794759204;
	b=lzuk/ICFcD8sxjcwadlhHKeM/8FTpvTdwpuSNRRMAL5Ykmrn090NWdJCeWy8C9cggMdp
	 9JF51n8XuZoP6snZchypDtSSt9GD7JJYsCQjZuD6lgGWGu2i6F44DBGjAZhy4HBz8+z4V
	 KGYBiLsV0bIndFAl1kagiU7NFTGXSwtgVj+e9O07Ru6LkkI+AXRd5usdFP3i0cdz7gsLQ
	 qp3YTcKCDddtWB9VMRQppEoqzRgX8ciBl2KmwQv1YYkcdNxaPOXG6YI8UiCJGlYW6BvRf
	 5rRwcezI2SAJBBea1pzwZ0l00oVFxkluNaVp84n8g1VR/GGvMstV+XXO1PNA0rjS9hQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794759204;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=HAMFmE/QOyKQZrm8iklrYy9aIGcJ2V6dA0OtBHoSrcY=;
	b=k2Ok/3CrGtDdk6rxYHvF7xEVe299YnvX4L42nC9WJSzqKtTpXqoj2XzGPLQaPva5g5sc
	 yIbXr0l6Q9PpASmiMChaj+NVEmXdLTFFdz55kP8IVD/wrqUuQTu2IUW0zwB6xwIOJQ1Ll
	 tnHPjfC1Ecwb9MvpPo2R4KYuBB+ItGQMvVXfiWDplG5e/SxH6ZBLR/sWwJ9rhukG/GC0k
	 mYDO2blOXNngy8V1DP2eYwvXfIXF2FNQHmNtQ/y+REs5dL9Uhq/djGZ04+HNxB7Nq0XjT
	 V+RWy8ZXoRVFxCG6G9DPEmh5LIUKMzd8ZZY2Ozhpvlc9BoLHSuaBFDvhaML9IejXuMA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794759204;
	bh=HAMFmE/QOyKQZrm8iklrYy9aIGcJ2V6dA0OtBHoSrcY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JsHp9620eJL5KVAWB+3+F0Kp9MtCj2S9NhQHNvl3UfrxdfiGHmB388CWvnAFIW5Ou
	 nDCeGIN1GKc3eAFjbDj2a/CqbNoeVF2h/UYEmHIjojmodPJhKtyBSpxUBZX0GbRPCo
	 yyYxT/rg6zeS31voZVDm9H4IPYgLwAfrfgZCgp2CPRJgEIGAu21vRug+pe4aZSddfs
	 C1jz44a5zy+k5XlTZcWIUcNx5hC3uZg9pe5eUvbKzCHFroHjiyR2hdFLNzB7JNCOP9
	 Z6B/6VQF7iqFCpV3yh9kDDcPaaMq3SS6xepBGlIyJnxSw0c/aJehRM1rQz+bEJchCE
	 49go6VlX0OcBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C828E60748;
	Sun, 15 Nov 2026 16:13:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 76D9F28C
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 16:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53D5940642
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 16:13:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4KJCWpxNj55O for <buildroot@buildroot.org>;
 Sun, 15 Nov 2026 16:13:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AC57B40687
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC57B40687
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 16:13:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id D360319F5C2;
 Sun, 15 Nov 2026 17:13:15 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Sun, 15 Nov 2026 17:13:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 15 Nov 2026 17:13:15 +0100
To: Pieterjan Camerlynck <pieterjanca@gmail.com>
Cc: buildroot@buildroot.org, Pieterjan Camerlynck
 <p.camerlynck@televic.com>, Ricardo Martincoski
 <ricardo.martincoski@datacom.com.br>
In-Reply-To: <20261113121243.1249931-1-pieterjanca@gmail.com>
References: <20261113121243.1249931-1-pieterjanca@gmail.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <d8b086a2b642e16953eceeb9ef807bab@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/thermald: bump to version 2.5.13
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 13/11/2026 13:12, Pieterjan Camerlynck wrote:
> From: Pieterjan Camerlynck <p.camerlynck@televic.com>
> 
> - xz is not needed since version 2.5.7
> - dbus-glib is not needed since version 2.5.8, so add libglib2, which
>   is now used directly
> 
> Add a backported upstream patch to fix the build on 32-bit with a
> 64-bit time_t (e.g. i686 musl), where -Werror turns a printf format
> warning introduced after 2.5.6 into an error.
> 
> https://github.com/intel/thermal_daemon/blob/v2.5.13/README.txt
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Pieterjan Camerlynck <p.camerlynck@televic.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
