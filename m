Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CBB4C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 574DE61120;
	Fri, 16 May 2025 10:49:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JAz7bGGp4HLk; Fri, 16 May 2025 10:49:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D32260B0B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D32260B0B;
	Fri, 16 May 2025 10:49:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 79DDD13D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B1D483CF7
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:49:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C86WLxGcdkUK for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:49:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7679383CF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7679383CF5
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7679383CF5
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:49:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 733E11C0FE9; Fri, 16 May 2025 12:49:33 +0200 (CEST)
Message-ID: <1d8fa180-4af2-4bb5-8336-ba0e732796f5@rnout.be>
Date: Fri, 16 May 2025 12:49:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
References: <20250430091523.96309-1-titouan.christophe@mind.be>
 <20250430095312.104032-1-titouan.christophe@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250430095312.104032-1-titouan.christophe@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747392573; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=uOhq1dx1b5ZCurq6vTfUcZhF0ISTusfqrGtRq+sSfxc=;
 b=bb3UC4odvOvcu/ZQZGbUTrAE9kmZk30va0ZT4R12u8+cuYiTo2fk8AY1FTquFj1+2/2uUp
 RsryUUA5w8wttdcE2U9oUzHKr833VyIEJxG4u6XyJmhuhVFsDyHzdYQ+fGdRQ7RPnxfcmd
 49GonmRFDHXLjAf6vcZl3NFICBFXi/PsTQcFumPDr9u1vQLeZgfuVCb8DrJx8a9V8ixF7I
 zusiA7+lLBvo1F1EIjksTMCAYgLAAV9loHI6L5tyRxOE/2xBGTouKgBBYM6lZj2wAb5Poy
 USjMOm4IsmJR7uSx4ymYikR5g2BSNlMeP2Mx7XF3DrtU6TZICKC6U+o7u2QL4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=bb3UC4od
Subject: Re: [Buildroot] [PATCH v2] package/yasm: add patch for
 CVE-2021-33454
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



On 30/04/2025 11:53, Titouan Christophe via buildroot wrote:
> This fixes a potential NULL pointer dereference
> 
> As a side note, this package has many opened CVEs, but upstream doesn't seem
> to really consider them as security issues, see their disclaimer here:
> https://github.com/yasm/yasm/blob/master/SECURITY.md
> 
> We could speculate that this disclaimer has been written as a consequence of
> the many small CVEs opened in a short time, that don't have a substantial
> security impact (besides the command line tool crashing). All of these small
> CVEs have been opened for bug reports issued by a third party who used a
> fuzzy tester to manipulate the assembler input
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
> Change v1->v2:
> * Fix patch location: in package's directory instead of patches/ subdir
> ---
>   ...-dereference-in-yasm_expr_get_intnum.patch | 32 +++++++++++++++++++
>   package/yasm/yasm.mk                          |  3 ++
>   2 files changed, 35 insertions(+)
>   create mode 100644 package/yasm/0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch
> 
> diff --git a/package/yasm/0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch b/package/yasm/0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch
> new file mode 100644
> index 0000000000..976c2f7a13
> --- /dev/null
> +++ b/package/yasm/0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch
> @@ -0,0 +1,32 @@
> +From 48ced849ed621a05cec4c04d4567323af3a76e81 Mon Sep 17 00:00:00 2001
> +From: dataisland <dataisland@outlook.com>
> +Date: Fri, 15 Sep 2023 18:20:49 +0000
> +Subject: [PATCH] Fix null-pointer-dereference in yasm_expr_get_intnum
> +
> +Fixes the following CVE:
> +  - CVE-2021-33454: NULL pointer dereference in yasm_expr_get_intnum() in libyasm/expr.c
> +
> +For more info see:
> +  - https://nvd.nist.gov/vuln/detail/CVE-2021-33454
> +  - https://github.com/yasm/yasm/pull/244
> +
> +Upstream: https://github.com/yasm/yasm/pull/244
> +
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + libyasm/expr.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/libyasm/expr.c b/libyasm/expr.c
> +index c2c868ede..6838eca56 100644
> +--- a/libyasm/expr.c
> ++++ b/libyasm/expr.c
> +@@ -1260,7 +1260,7 @@ yasm_expr_get_intnum(yasm_expr **ep, int calc_bc_dist)
> + {
> +     *ep = yasm_expr_simplify(*ep, calc_bc_dist);
> +
> +-    if ((*ep)->op == YASM_EXPR_IDENT && (*ep)->terms[0].type == YASM_EXPR_INT)
> ++    if (*ep && (*ep)->op == YASM_EXPR_IDENT && (*ep)->terms[0].type == YASM_EXPR_INT)
> +         return (*ep)->terms[0].data.intn;
> +     else
> +         return (yasm_intnum *)NULL;
> diff --git a/package/yasm/yasm.mk b/package/yasm/yasm.mk
> index cdb8e15bee..766d29df3b 100644
> --- a/package/yasm/yasm.mk
> +++ b/package/yasm/yasm.mk
> @@ -10,6 +10,9 @@ YASM_LICENSE = BSD-2-Clause, BSD-3-Clause, Artistic, GPL-2.0, LGPL-2.0
>   YASM_LICENSE_FILES = COPYING BSD.txt Artistic.txt GNU_GPL-2.0 GNU_LGPL-2.0
>   YASM_CPE_ID_VENDOR = tortall
>   
> +# 0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch
> +YASM_IGNORE_CVES += CVE-2021-33454
> +
>   # This sed prevents it compiling 2 programs (vsyasm and ytasm)
>   # that are only of use on Microsoft Windows.
>   define YASM_PRE_CONFIGURE_FIXUP

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
