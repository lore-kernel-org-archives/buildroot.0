Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47452CF2561
	for <buildroot@archiver.kernel.org>; Tue, 18 Nov 2025 23:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28EB161BE2;
	Tue, 18 Nov 2025 23:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Ff7G5dtfTqz; Tue, 18 Nov 2025 23:07:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 704F061BB6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 704F061BB6;
	Tue, 18 Nov 2025 23:07:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CFA1D160
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 23:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B674441D27
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 23:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9rHgqWcwfeul for <buildroot@buildroot.org>;
 Tue, 18 Nov 2025 23:07:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C7CFB41D26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7CFB41D26
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C7CFB41D26
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 23:07:49 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 29FE32C80164;
 Wed, 19 Nov 2025 00:07:47 +0100 (CET)
Message-ID: <54db30a0-e629-47f8-b380-73489ceea59c@bubu1.eu>
Date: Wed, 19 Nov 2025 00:07:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>
References: <20251118220954.3080964-1-buildroot@bubu1.eu>
Content-Language: en-US
In-Reply-To: <20251118220954.3080964-1-buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1763507267; bh=/OXeUiKSZMqEt0mBqZxnR+HqmE9c5sG1j4LGdAYFquM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=nlNqWQ5jvvsKGp/HneAyybXiWYtI7Ut8jtJMprbV7iVl9tl/su1DwjrhsztPk5CRy
 /cnkJpTrLNhhIj4K+0yeFxIUEUpVwOx+zFvt3b9/v72XkIkrj7Kl5kmsMJPJ93iFWa
 ad+ggGa0j3kArtQCuC7/A7n+liFRxzpQPNHRj9bqfR8HKk79TorZoWhr7O5iYuK+/o
 K1Nvmdjvv+Sz6WVQGp0Bc/aJgbo3i+onzEWYkFxR2Q8RdcsSjmo2IwSidW4ZK5v2Ys
 Hk6fSf2Hur9jmNi/toYzR1JCZv7QuSju9PzzJiv8BYd1+9BJL6w0TXXrHaMepeFdTM
 VtUumZpIKkVZg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=nlNqWQ5j
Subject: Re: [Buildroot] [PATCH] package/systemd: bump to 258.2
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/18/25 23:09, Marcus Hoffmann via buildroot wrote:
> Noteable changes:
>    - Add -Dlibmount=enabled to host and target build. Disabling this
>      option disables building most of systemd's tools apart from
>      libsystemd.
> 
>    - remove gcrypt and gnutls from dependencies and build options.
>      openssl is the only supported crypto library now.
> 
>    - Disable nspawn build for host variant and add a Config.in option
>      for the target variant.
> 
>    - systemd now requires kernel >= 5.4 while the recommended kernel
>      version moved to >=5.7. This make systemd depend on
>      BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4, removing various dependencies
>      on older kernel header versions from sub options.
> 
>    - The sha256sum of LICENSES/README.md changed due to various
>      license clarification, removal of some vendored files as well as
>      changing some file paths. Licensing did not actually change.
> 
> For changelog, see:
> https://github.com/systemd/systemd/blob/v258.2/NEWS
> 
> test-pkg currently fails for the following toolchains:
> 
>    - br-mips64r6-el-hf-glibc [33/35]: FAILED, complaining that STATX_MNT_ID
>      is not defined even though it should be available from the kernel
>      headers.
> 
>    - br-powerpc64-power7-glibc [35/35]: FAILED, with an internal compiler
>      error.

FWIW, when building a modern toolchain for these targets with buildroot 
the build just works. So, I'd like to conclude here that these 
toolchains are broken instead of the package?

Marcus

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
