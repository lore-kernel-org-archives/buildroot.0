Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA893606A326
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 05:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VhZuaB+N
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F5C080AE8;
	Wed,  4 Nov 2026 05:29:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sxrcilInQNCF; Wed,  4 Nov 2026 05:29:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7FAC38096D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793770144;
	b=jeUbAGtHdmbdWFvR9WRTBYgxfFLrm1dZ/dP1th5uUZT4gabilwzYF/f9rE/qhULqKFDw
	 9hOI/3aoYyNly/dvmtIM1jEIWNhGxKjllMscrJZlRkcUQOrfzFgNMIIpgMFwtm4Ax2Gg4
	 MPlHPQs1qPBA/IKEAJf8dSEg1seHuy71/RKDWT/asJt0ov03P5bq7dW+Zv0gixydD+/sV
	 57CtMLITpqwNyokW6r4lmPSEIViAxLmE83gk7PvrSZV46Z7eKHN6my2kTH55w/lPJDdXH
	 WVp0vqPVMLHosjN+75fYz/vJ1Nt/Ew0Y7FxOqHUehjmeOFaA7/JsxkCSmfdAy++liHw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793770144;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:In-Reply-To:References:User-Agent:Date:Message-ID:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Z6ZrzxdfJG766EqKQDiG+uNceKa8N5K2Bv/aT0U9WHg=;
	b=dQTD1kZBe0Twr7FtYlYb+efWj3gQk+Oyfz1PHyYo1s9mR9HnwbeUQBuNJKSEKw53wkKh
	 qN/tsOx+HqPUab0c4Po1CTarAakzzsEANYksItwJhtOMdJldIS+JTRrNMfpfj8uT6TJ65
	 tN4oWdZTiDlr039iD/YdnFFSSRlhEAI4e5Y/H7bR0KBUcmToPqdz3rkRonpndG5OzqrvZ
	 iY+ICNKMJQAHjn7BqMsztJ3c3YfUEWpDQXvsaJsk3ZT6y1RdfUq7nbdC1pzTlDniBY/cC
	 oElpiIGVTbAkTjMql5AAsiqXElqjNjpGkxx701kCpifzoKaeMYmaWMvxhUgz6PCim0w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793770144;
	bh=Z6ZrzxdfJG766EqKQDiG+uNceKa8N5K2Bv/aT0U9WHg=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VhZuaB+NNtD4s+I9zpiTh5TdNvDD8mVrMzasV8DarLbWlWNIwizmTZkk/+RRJ+V0A
	 dwWZ8fAXaEaLC5c3D2btc7MvpB1EpiZcI0YHFcdjcB+wD8E5DGshBnG0LDXDCGKGUi
	 j/xaP77GyEW98GUql6fa/OIeusAvc2z2cXueeEtJp7H5BAmbfttB9ClZv6Pz/ZhzXm
	 yw7XEEUDi8VXNsDQXaKRXXkyLNQtQlchKQ52gu+fYiQr28QlLmOZjcCfA9IrqkkaC4
	 pD1KVUyN4N/295fQzZGEqwTbKHLH/L8ocOxwAqbiA1lNnY5GiJhvjJaa2TpNBhCKy8
	 bVR1KVZbA8b1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FAC38096D;
	Wed,  4 Nov 2026 05:29:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AD9252AC
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 05:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93C8840176
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 05:29:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0T9LsYjckCvk for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 05:29:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org DFB424004D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793770141;
 b=Fh38Z6dzyn3E8XApDWUGkPMixNlnyb0fTU3Bag5/3rQWjaTjy+Cmj73OeZ37R4AN96wQ
 86tVJhUMclR8jj1szr4kLdWoZ/kxjMSCY8ao7HUkUXWjQ6v7W2WaE3NRnnQc/nRLlpX+9
 jF+/UpgWhgZxMUQyi3ztpe7L3ethMUw/5677F2q1DH7JP7O9ZhAglBWzkAwIfVydkj+Jt
 5RdBZIJ7yIaah4rrckeUs/WR1UJkjIqfeeFhQgEQAHRTregGZBitmdfVu1bEcE+SzNB1I
 hk1gHWktRTkij8U3yiNmUDwhCmC4ecuJPZl/kjQnV4gcUOy3W8XHnj/zGYMrqnpwPOw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793770141;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
 References:User-Agent:Date:Message-ID:MIME-Version:Content-Type;
 bh=iZpSqBdLaUETNQroJ7nW+y0gGtRxj7AStNGMMI4tj6I=;
 b=kS7mAl5mNac2PUV8l2oMQFZGcOqVoIwI8vVHU1pN+iJs26tgYoL715SCGz7GINpUVdxT
 qsFzFiHxVkMAY3zEBg7AI6oNyGvxYyKkZlI8A3DGDajgn0i93IsdQefXdfQouLRbJTyAO
 llIXWQj/mHFicwrJejfC2T5lAYzpjQAMf6bH3l11nNXd/e6I0LcLDCKxZ/LCSgvAuqcPx
 eXKxAYEROWB2zhQ2kY6Jl7dEXuy3Fm+20UgDulZp1+qRcZdd9dAZXJyCqRp0bAf5F6+M9
 qAVnuzNZn57F2hLIPZubuVs4rgThi793X+K7VPC1dDzQXoIe9pujl6GDFAEDMdgYrig==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=tkos.co.il;
 dkim=pass header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b="MjSvxj/5"; 
 arc=none smtp.remote-ip=84.110.109.230
Received-SPF: Permerror (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
Received: from mail.tkos.co.il (unknown [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DFB424004D
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 05:29:00 +0000 (UTC)
Received: from localhost (unknown [10.0.8.3])
 by mail.tkos.co.il (Postfix) with ESMTP id 4090F4402B1;
 Wed,  4 Nov 2026 07:27:14 +0200 (IST)
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261104045834.3308280-1-yegorslists@googlemail.com> (Yegor
 Yefremov's message of "Wed, 4 Nov 2026 05:58:34 +0100")
References: <20261104045834.3308280-1-yegorslists@googlemail.com>
User-Agent: mu4e 1.14.2; emacs 30.2
Date: Wed, 04 Nov 2026 07:28:55 +0200
Message-ID: <87a4npupuw.fsf@tarshish>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/uclibc: fix copy_file_range()
 declaration without off_t
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,RDNS_NONE,SPF_HELO_NONE,
	T_SPF_PERMERROR autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Yegor,

On Wed, Nov 04 2026, Yegor Yefremov wrote:

> uClibc-ng 1.0.59 declares copy_file_range() in unistd.h under
> "#ifdef _GNU_SOURCE", while off_t is only defined there for
> __USE_XOPEN or __USE_XOPEN2K, which <features.h> sets when it is first
> included. Sources that include a libc header before defining
> _GNU_SOURCE, typically through an autoconf config.h, therefore hit an
> undefined type. tpm2-tss does this in its FTDI SPI TCTI, which includes
> <stdlib.h>, then config.h and, through ftdi.h and usb.h, unistd.h:
>
>   .../sysroot/usr/include/unistd.h:1166:30: error: unknown type name 'off_t'
>    1166 | ssize_t copy_file_range(int, off_t *, int, off_t *, size_t, unsigned);
>
> Add a patch, submitted upstream, that declares copy_file_range() under
> __USE_GNU instead, as glibc does.
>
> This issue has been present since commit b94d3eb72854 ("package/uclibc:
> bump to 1.0.59"), as copy_file_range() was added in uClibc-ng 1.0.59.
> It therefore affects 2026.08 and later, 2026.05.x since 2026.05.2 and
> 2025.02.x since 2025.02.17, where the bump was backported.
>
> Fixes:
> https://autobuild.buildroot.org/results/1408ad5881aeff754b0493f1a0d0970d1afdaaf6
>
> Fixes: b94d3eb728546aeb196941472b98922843e36279 ("package/uclibc: bump to 1.0.59")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  ...lare-copy_file_range-under-__USE_GNU.patch | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/uclibc/0008-unistd.h-declare-copy_file_range-under-__USE_GNU.patch
>
> diff --git a/package/uclibc/0008-unistd.h-declare-copy_file_range-under-__USE_GNU.patch b/package/uclibc/0008-unistd.h-declare-copy_file_range-under-__USE_GNU.patch
> new file mode 100644
> index 0000000000..6cf0a13eb6
> --- /dev/null
> +++ b/package/uclibc/0008-unistd.h-declare-copy_file_range-under-__USE_GNU.patch
> @@ -0,0 +1,45 @@
> +From 9cf18aedf41589b11ce5328a85726441d3b86282 Mon Sep 17 00:00:00 2001
> +From: Yegor Yefremov <yegorslists@googlemail.com>
> +Date: Tue, 3 Nov 2026 23:54:41 +0100
> +Subject: [PATCH] unistd.h: declare copy_file_range() under __USE_GNU
> +
> +copy_file_range() is declared under "#ifdef _GNU_SOURCE", but off_t is
> +only defined in unistd.h for __USE_XOPEN or __USE_XOPEN2K, which are
> +set by <features.h> when it is first included.
> +
> +When a source file includes another libc header before defining
> +_GNU_SOURCE, for example through an autoconf config.h, _GNU_SOURCE is
> +defined by the time unistd.h is read, but __USE_XOPEN* are not, so the
> +declaration uses an undefined type. This breaks tpm2-tss, which
> +includes <stdlib.h>, then config.h and, through ftdi.h and usb.h,
> +unistd.h:
> +
> +  unistd.h:1166:30: error: unknown type name 'off_t'
> +   1166 | ssize_t copy_file_range(int, off_t *, int, off_t *, size_t, unsigned);
> +
> +Test __USE_GNU instead, as is done for the other GNU extensions and as
> +glibc does.
> +
> +Assisted-by: Claude:claude-opus-5-5
> +Upstream: sent to devel@uclibc-ng.org on 2026-11-04, Message-Id <20261103230715.3240121-1-yegorslists@googlemail.com>

Better link to your message in upstream mailing list archive:

  https://mailman.openadk.org/mailman3/hyperkitty/list/devel@uclibc-ng.org/thread/UXSNFB2SYQEX2ITN3Y7AEQH5PXVPRN5S/

baruch

> +Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> +---
> + include/unistd.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/include/unistd.h b/include/unistd.h
> +index 1956eee18..fb0ea0ff7 100644
> +--- a/include/unistd.h
> ++++ b/include/unistd.h
> +@@ -1263,7 +1263,7 @@ extern int getentropy(void *__buf, size_t __len) __nonnull ((1)) __wur;
> + extern __pid_t gettid(void);
> + #endif
> + 
> +-#ifdef _GNU_SOURCE
> ++#ifdef __USE_GNU
> + ssize_t copy_file_range(int, off_t *, int, off_t *, size_t, unsigned);
> + #endif
> + 
> +-- 
> +2.34.1
> +

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
