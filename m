Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBB4C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D941815C1;
	Fri,  2 May 2025 11:06:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jB2VIA_vWziC; Fri,  2 May 2025 11:06:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BEB08164A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BEB08164A;
	Fri,  2 May 2025 11:06:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CB86EE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01F7F8164A
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:06:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 81YAtgA2oHC9 for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:06:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1913682F31
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1913682F31
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1913682F31
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:06:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7BCA11C0D8C; Fri,  2 May 2025 13:06:10 +0200 (CEST)
Message-ID: <928b33e2-054b-4dea-86a9-cade834924b3@rnout.be>
Date: Fri, 2 May 2025 13:06:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Joris Lijssens <joris.lijssens@gmail.com>
References: <20250422215249.2222735-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250422215249.2222735-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746183970; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=wcKf0iwMpmulh+jrW4tLlzPyYMSLJSSxVoM/D7YJQPM=;
 b=mvzhTb8i8cWFacZ8fpeq+bEsj3MqF50MP9L3nVBn2TK4KuW+Gxsg43cu5Grjn2QMbg1RZt
 DpAy7e53pR2KQvS8aLAMmo18AvQOncDZWy9KXh1De+TIb5HrKIsV22ZIBofNrbxWUxIQXh
 iL9QqoLbNJkh/QVySsfVBKI2jR7JMZ4Sut1s0LrU6vm0DagJPsZu7kVnGlB61Lli6eHy3x
 0sRE/ct99VryNVkCTzya1er398nvqlJ5SEdlMns3hJBaQt7QbNL+K20F6fsqQEcpn0N5IO
 Aii0rdekyPOyMvalUjSKoJNQRfHqFZMPgb7Nyv0HwPvLAE5HC3kp8gAV5MGrLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=mvzhTb8i
Subject: Re: [Buildroot] [PATCH 1/1] package/libcoap: fix build for
 toolchains w/o threads
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



On 22/04/2025 23:52, Thomas Perale via buildroot wrote:
> The version bump in [1] introduced the upstream commit [2] which made
> builds using toolchain without thread support fail to build libcoap.
> 
> This patch adds an option check in the libcoap.mk file to verify
> the toolchain has thread support and passes the correct configuration
> options introduced in [2] as well.
> 
> The build can be tested with the following config.
> 
> ```
> BR2_armeb=y
> BR2_cortex_a76_a55=y
> BR2_ARM_EABI=y
> BR2_ARM_SOFT_FLOAT=y
> BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
> BR2_PTHREADS_NONE=y
> BR2_PACKAGE_LIBCOAP=y
> ```
> 
> Fixes:
> https://autobuild.buildroot.org/results/9c0/9c0b675a64fb2576bc34457043f118cffe5fe555//
> 
> [1] 4df4d1d312 package/libcoap: bump version to 4.3.5
> [2] https://github.com/obgm/libcoap/commit/c69c5d5af0a30859e90756f535e2ca21cdeda0b2
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/libcoap/libcoap.mk | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
> index c5e5f85c62..d7c2a78944 100644
> --- a/package/libcoap/libcoap.mk
> +++ b/package/libcoap/libcoap.mk
> @@ -31,4 +31,10 @@ else
>   LIBCOAP_CONF_OPTS += --disable-dtls
>   endif
>   
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +LIBCOAP_CONF_OPTS += --enable-thread-safe
> +else
> +LIBCOAP_CONF_OPTS += --disable-thread-safe
> +endif
> +
>   $(eval $(autotools-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
