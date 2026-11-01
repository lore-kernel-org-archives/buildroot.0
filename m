Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33521606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 13:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fgUyDX57
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13087405D8;
	Sun,  1 Nov 2026 13:53:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t0NTACCzioZP; Sun,  1 Nov 2026 13:53:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1A6A14061B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793541199;
	b=lMq+bhSkjTPDcpzckt8iSibCmbinOb4gw9oqG6Mp+Yg85eDvDlCSnl6atqqKq3Qc9V6R
	 fiDFoXzba8VSaebt/xxj0L8g4aBz7z9+HO21reuIfsbZeNhHU/o/PllB6f9YHuml1qyES
	 B9prN2/x3HoApMn41UVqRrYiP6oXbviRDCL2PV/pW3PtBkTOpVHaG5g0mVkUwmDX7yckT
	 g61vLC+2AWfFHZDdAMq9hMyxacf1hcgy/Xvcvh+6413F/gyyo2SPEmfv2hqCkTYm+Y/Ut
	 VolnWaiTzgXaviVbJWm5M86HjIguHEC/LkGGJ/mWGcjhgzDbWaxuAZdWMEiKw0orYFw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793541199;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=UgbmsW7gCf9kqJcsnBuKwQOi9gGA2gBffPkVrikGm84=;
	b=QKFx7ZmV09mX2F9s2hwa0+bffR3agV/XmL7F9i8dZo/+BFhBabNIYLxOQnKGz0La0FFR
	 tTNLJ/n7QUR2SvRE11Uq9q2RnsBQ+kIFp4YqYkrcPtaR5MIaPEpyYgSyN3ozU9QQN2FSC
	 YG9Z0Hgnc0fcXSJAjOaAAtnZZXzYvNHlZzjrMaqUrrCYWltp8cM/jwrPHrtrby0HF8Drj
	 S6qkOtxbJVtse6CcvkNjTWbOm5AsD//tcZzYQryEYqGuACmE1KHuVVkZcUUxQl0mJbwlo
	 jLOCF39GPzFukUOnx1ZmZycew26QUi3VI0ekZTUOGsMIacSFST9smQ/IuoRBiA84YvQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793541199;
	bh=UgbmsW7gCf9kqJcsnBuKwQOi9gGA2gBffPkVrikGm84=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fgUyDX579olB4Fi9RDGT7VeoHtOnbZ/wwNhVtslgCLKQh2DcRJq3ZzWPzooPJZ1hM
	 0Nsvvep2Yvjv0RxTweNM/3HGbhl5MsbU9gPbXaErZqpJ86oW0FnKaml/i0RNjxqA/l
	 ZU3pjUJ4SsWGmrwFCdXQYa2iA4Gys5rVXja8eBTu8qIIsRYhJmasl+Ned8Pvo4dzXH
	 8Ua7lrZScuLs9pM5e2HwdItcXJ9cjCqWOcDeCeui1X95gg11vlDJ0bbFUpv5wNQSbj
	 NugNnUeu+XVP/52+90SL4fOO2SBJBRwuWCwj2IzIYqnJzMR4fdDgAxKByXcg70413s
	 Erl6B83kWLt2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A6A14061B;
	Sun,  1 Nov 2026 13:53:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C96B84B7
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 13:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF8C960619
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 13:53:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B9JcqQJZ78yP for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 13:53:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 91CBD605CE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793541196;
 b=OQVpYu7N3i7Ku9AV5MtUFAfwOpXxCpny64cW5j+QTO0sw6cAGNL4OwdCVmTW5+rSNMnl
 mGGQd+UxRwhqIQsmeCWkjFlaBBNogfk7KIDlOH0Su00akmeX+U5SMH4T/b98s+/sAqVBb
 BYDpUTFI11/P+nopBHT64LBJKoBfTLBNLjycpaXJfRYZH2lblG7V4nTXDDuHmQzHxQR+7
 3QjkOKR/qVKDJttvCeCHqRhifYc1w+EoGNpur+QFhv5MoaVkDqxc+a0kRwlYjnjy7+DRe
 o1RyXcWyY1kNIJBGysIFJSWP3PfnKzG9PdrEzHyjDvxX+L+XFProYRsfojZ5n7wbCmQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793541196;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=IXhwSsHwI5FUN8rN0UlqRRy1NSnkEHkKHNUfY8ajl5I=;
 b=GirIsVqMdy+wZKI7nqtEjW0UEW0yjZDfyyA4T7Lqfj3epNqV1NBJ++Lr638dYayuvYps
 R8dp6hBwXAaUQpJW7fD3oHvUPHvS9o0m+EOOspQajHngZyU2jDWUYBRKtyRHyUETFjeob
 WsO9/Fcr/goF0KDz5vLDz4Psm9UZObhC4H1nmtxrebA53WJcdut5UvhdnxArkUs75o88d
 kqKffJld/iytUXyczs4eloI43l6WFzOps0FHuYT4yWfWN7V3vilExwxMARtKunzSPTsAJ
 ZWs23qo8uXJ8ZdOJ4m7Xi8imoccNSGDQ2fZQwJzd5CI2WbBGQlltgQreFsAu7OoxoyA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YQ6I4MpK; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 91CBD605CE
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 13:53:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 10C9E19F59C;
 Sun,  1 Nov 2026 14:53:08 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 14:53:08 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 14:53:08 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>, Stefan Agner <stefan@agner.ch>
In-Reply-To: <20261027054034.4556-2-bernd@kuhls.net>
References: <20261027054034.4556-1-bernd@kuhls.net>
 <20261027054034.4556-2-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.20
Message-ID: <6bb5966952d6c7132f5c1f1570b5f912@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v2 1/6] package/docker-engine: Fix go module
 version information
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

On 27/10/2026 06:40, Bernd Kuhls wrote:
> From: Stefan Agner <stefan@agner.ch>
> 
> When using Docker engine built by Buildroot, the BuildKit version
> information appears as "v0.0.0+unknown" instead of the actual version
> (e.g., "v0.22.0").
> 
> This occurs because Buildroot's build process doesn't preserve Go 
> module
> version information that Docker reads at runtime via 
> debug.ReadBuildInfo()
> (see builder/builder-next/worker/worker.go).
> 
> Docker's own build system (hack/make/.binary) uses "-mod=vendor
> -modfile=vendor.mod" flags, which are crucial for preserving module
> dependency information. Adding these flags makes the previous vendoring
> workaround obsolete for modern Docker versions.
> 
> Note: Use "docker buildx ls" to verify the BuildKit version. This 
> requires
> a Docker client with the buildx plugin installed.
> 
> Patch downloaded from
> https://github.com/home-assistant/buildroot/commit/eb49dd0b3e7cbf00ec3849349251b9798a7d7f43
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> [Bernd: rebased]
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
