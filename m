Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E01C369AB
	for <buildroot@archiver.kernel.org>; Thu, 24 Apr 2025 08:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A74160759;
	Thu, 24 Apr 2025 08:01:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u9Qt6Gfm4DP4; Thu, 24 Apr 2025 08:01:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 496F260E46
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 496F260E46;
	Thu, 24 Apr 2025 08:01:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E612E28C
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 08:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D727E81EAE
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 08:01:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xcy6qbGHlQda for <buildroot@buildroot.org>;
 Thu, 24 Apr 2025 08:01:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7031781ED3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7031781ED3
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7031781ED3
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 08:01:20 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id A3FE74408C9;
 Thu, 24 Apr 2025 11:00:16 +0300 (IDT)
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250424-fix_gmp_c23-v1-1-b2474a9585b6@rivosinc.com> (Charlie
 Jenkins's message of "Thu, 24 Apr 2025 00:29:44 -0700")
References: <20250424-fix_gmp_c23-v1-1-b2474a9585b6@rivosinc.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 24 Apr 2025 11:01:15 +0300
Message-ID: <87plh2f0ok.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1745481616;
 bh=DADY3RfY6/07aLSyx0rgInYpmdqscnXOq1xEFT7wzps=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=RWrd2mGiezBAXixxU/wHu6a+eEdg7gbNmky1U3psOO9+Ov+m3sxmW4WsA/eeR1fSG
 U9qMLVjDaGjKpdBE1TrvnaK8S8a0YFyg8lbepvWjkKwz8sDtTMXeO8XKnEUdYsMWir
 lL8Orh1lB4xz93mDqog1RRYrPwewDb+x16lxwFUyz1eVsSXniUf/KLoKUx7zJu8H8L
 OWL7oGVUhB5dZZVp6cUIKRIW3RFi4eQdiNvO7txs5Rc5Q2TD59mN0rNzUeGzgOGNpT
 0gWWS/QuNkgGMm7IP68JX9NyiF7doCXYgykjTBkeSm7jQ+tYJgHl2foZmlXJniMsoF
 iASdA5cTF2sLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=RWrd2mGi
Subject: Re: [Buildroot] [PATCH] package/gmp: Fix for c23
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Charlie,

On Thu, Apr 24 2025, Charlie Jenkins wrote:
> GMP will not build for a C compiler configured for c23 because its
> autoconf scripts use deprecated function prototypes. Include an upstream
> patch that fixes this issue.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---

[...]

> diff --git
> a/package/gmp/0002-configure-Patch-configure-script-for-c23-function-pr.patch
> b/package/gmp/0002-configure-Patch-configure-script-for-c23-function-pr.patch
> new file mode 100644
> index 0000000000000000000000000000000000000000..d60c4d39f670d8c4f9dc937b14659695e3cc36a3
> --- /dev/null
> +++ b/package/gmp/0002-configure-Patch-configure-script-for-c23-function-pr.patch
> @@ -0,0 +1,39 @@
> +From: Charlie Jenkins <charlie@rivosinc.com>
> +Date: Wed, 23 Apr 2025 23:55:25 -0700
> +Subject: [PATCH] configure: Patch configure script for c23 function prototype
> +
> +The distributed configure script is pre-generated so it will not be
> +updated by acinclude.m4. Patch the configure script to allow gmp to
> +compile with c23.
> +
> +Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> +Upstream: N/A (patching generated autoconf files)

When patching autoconf source files we usually add PKG_AUTORECONF to
regenerate the configure script at build time. This patch should not be
needed then.

baruch

> +---
> + configure | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure b/configure
> +index 7910aa0..259f7c8 100755
> +--- a/configure
> ++++ b/configure
> +@@ -6568,7 +6568,7 @@ if test "$gmp_prog_cc_works" = yes; then
> + 
> + #if defined (__GNUC__) && ! defined (__cplusplus)
> + typedef unsigned long long t1;typedef t1*t2;
> +-void g(){}
> ++void g(int a,t1 const* b,t1 c,t2 d,t1 const* e,int f){}
> + void h(){}
> + static __inline__ t1 e(t2 rp,t2 up,int n,t1 v0)
> + {t1 c,x,r;int i;if(v0){c=1;for(i=1;i<n;i++){x=up[i];r=x+1;rp[i]=r;}}return c;}
> +@@ -8187,7 +8187,7 @@ if test "$gmp_prog_cc_works" = yes; then
> + 
> + #if defined (__GNUC__) && ! defined (__cplusplus)
> + typedef unsigned long long t1;typedef t1*t2;
> +-void g(){}
> ++void g(int a,t1 const* b,t1 c,t2 d,t1 const* e,int f){}
> + void h(){}
> + static __inline__ t1 e(t2 rp,t2 up,int n,t1 v0)
> + {t1 c,x,r;int i;if(v0){c=1;for(i=1;i<n;i++){x=up[i];r=x+1;rp[i]=r;}}return c;}
> +-- 
> +2.43.0
> +
>
> ---
> base-commit: 1fc51abc27d37c2874823ab864db0f32ae774eb6
> change-id: 20250424-fix_gmp_c23-c374e940b045

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
