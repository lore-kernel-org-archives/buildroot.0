Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE37E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 13:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73C2260719;
	Sat, 11 Jan 2025 13:20:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WZJMYq4rKCyA; Sat, 11 Jan 2025 13:20:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99C1F60741
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99C1F60741;
	Sat, 11 Jan 2025 13:20:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 73FD6950
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 13:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 613624022A
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 13:20:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NP4UOmpR2Mgw for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 13:20:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E2046400F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2046400F2
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E2046400F2
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 13:20:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id BE7CC13F8C0;
 Sat, 11 Jan 2025 14:19:56 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:36432])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 14:19:56 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 14:19:56 +0100
From: Julien Olivain <ju.o@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org, Guillaume William Brs
 <guillaume.bressaix@gmail.com>
In-Reply-To: <20250109011807.28041-1-nemaakhilesh@gmail.com>
References: <20250109011807.28041-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <4c9c28ba8d404ac268334f211221f8b0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736601599;
 bh=kABw9XQXAt9BBfKq9y5rrh9BA+UtrHSw+aun+ZFvq9U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=P2XWd6YEarPmApxlZ77xIKOzyJfV9m0wZ16cezapI4izHjO9/sNO9GcVlLdLH3HAS
 vtZstrlwQwMnMMYo5/CllPABWNM4BeulLCnK1f4UVRFSPJucOQFv/ygN/lpmI0dT3a
 3tnZaJXWDCrlj8IRjiyfYILRz3NQeYDNkeF5vVlqlYjlrEeI3Br8KMool+2YwuRF09
 krct9VxlYJds9KOd3ZTLUaLLbPqq0kUWkMNgYIJ0aY0jjwk8SNJ+O7pvPP8tJPq4PJ
 RcYWqLLzJzgWaoAE6GP/zn3Hj8zNu8hPJkx9ubbl5fuSLqOZUxm+J2bd3ycy4C8w0w
 F1Nqs+/V3uaQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=P2XWd6YE
Subject: Re: [Buildroot] [PATCH 1/1] package/libxcrypt: bump version to
 4.4.37
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

Hi Akhilesh,

Thanks for this patch.

On 09/01/2025 02:18, Akhilesh Nema wrote:
> Release notes:
> https://github.com/besser82/libxcrypt/releases/tag/v4.4.37
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

[...]

> -LIBXCRYPT_VERSION = 4.4.36
> +LIBXCRYPT_VERSION = 4.4.37

When testing this new version with the command:

     utils/test-pkg -a -p libxcrypt

it seems all builds are now failing. The failures seems related
to the release archive autoconf "configure" script which was
generated with a newer pkgconf, which includes commit [1].

This means new dependencies might be needed, such as:

LIBXCRYPT_DEPENDENCIES = host-pkgconf
HOST_LIBXCRYPT_DEPENDENCIES = host-pkgconf

Could you confirm this analysis and send an updated patch please?
Could you also add the explanation in the commit log why those
new dependencies are needed?

Best regards,

Julien.

[1] 
https://github.com/pkgconf/pkgconf/commit/c583d49a3780c71c0d20a662a7cf562f6d01c171
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
