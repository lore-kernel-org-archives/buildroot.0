Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E62ACD4F4A
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 19:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAA8B60788;
	Mon, 18 May 2026 19:33:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sGBP8rS50y0v; Mon, 18 May 2026 19:33:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EBB76068F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779132785;
	bh=lfnR7BmKhij+asOiEFXqg35GTh96LECIBwBtjq9OY/k=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YriYqrW+u6CCSSQmJRYcEO3llcJ05F11ARjIfIiDjTXLHFH9VSs7GC3iR5/A0SU5l
	 ZxtyCLoPo0QM0EosThFYWO0/fQz+eBI0NG6dYGgy1jYLcG/jAn2mUiJlVmXO6NoWvC
	 tWi33x9pRbBqSUlj+EhBOgB/w10qrqw3Wo4YhZmeyIKoZ4AJEe9ubM1TNPAtVWBdbf
	 9sFBqbi2tEdHAOyo93OZ3/uTB9Kne7E8naXmsjZPN2fayJBOnCK6RAiNX3q/bve+oM
	 96TV865hIygD23iPqPfN8nFUL30+I/vIeq2bEA59Do2deKIXXIwG0IED/SnQh26OBC
	 GpapOhZx5tZ4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EBB76068F;
	Mon, 18 May 2026 19:33:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 983EE282
 for <buildroot@buildroot.org>; Mon, 18 May 2026 19:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86735400D8
 for <buildroot@buildroot.org>; Mon, 18 May 2026 19:33:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q0PJ83ur5k6m for <buildroot@buildroot.org>;
 Mon, 18 May 2026 19:33:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9688B400D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9688B400D5
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9688B400D5
 for <buildroot@buildroot.org>; Mon, 18 May 2026 19:33:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1D144B97BB03; Mon, 18 May 2026 21:33:01 +0200 (CEST)
Message-ID: <3569b3a7-5bf4-4a78-adb1-80848503a557@rnout.be>
Date: Mon, 18 May 2026 21:32:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Ernberg <j@j-ernberg.se>, buildroot@buildroot.org
Cc: john.ernberg@actia.se, Karoly Kasza <kaszak@gmail.com>
References: <20260510193826.2846038-1-j@j-ernberg.se>
 <20260510193826.2846038-6-j@j-ernberg.se>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260510193826.2846038-6-j@j-ernberg.se>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779132781; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=TLa0FY2l5w8rgY2pEYcv/QCvKK4KyX1b0nNYR6F+SHE=;
 b=lW+oPwshkZKJVObUjqJYo7A6QxZ8thbOf2Dtwu67zPwCAEgh1ErynnUaQTwekCcX0JZeZ+
 n8fJfSEYXMejy/8du+b/krDMG1fpEHoMKw6OprZeO9sMOSt95f19KRG6hM8s/wk4/wSgcF
 Px5gQP1K9Y2LiobCnyIvL/dL5UR9vA1BtnFk6gNu3oaECFn7RFwgpUjEeVgA0bkNlspln+
 kODnN8azd2xlCvCk9rAQ42ms35GlSCgR29rbuWOAwQQ5e8TFIDz8qF51uWxcH9Ee03Huh+
 tjrp7N0qRMQ/axdusEsvXwltDidUMMaWbbP3+DibJ+rWi+DiMBUc7JDTZkSwSQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=lW+oPwsh
Subject: Re: [Buildroot] [RESEND PATCH 5/8] package/openvmtools: Add patch
 to fix build failure with newer glib versions
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



On 10/05/2026 21:38, John Ernberg wrote:
> Later versions of glib defines g_free as a macro, causing build
> failures. Add patch from upstream pull request to fix the issue.

  This in fact fixes an autobuild issue, so I added

Fixes: 
https://autobuild.buildroot.org/results/5c6/5c6407b9f8ac1959717e18d81d629b4a4455b06d

  Applied to master, thanks.

  I hope this mixing of master and next is not going to cause issues :-)

  Regards,
  Arnout

> 
> Cc: Karoly Kasza <kaszak@gmail.com>
> Signed-off-by: John Ernberg <j@j-ernberg.se>
> ---
> 
> RESEND:
>   - Forgot to subscribe this e-mail to the list
> 
>   ...GLib-g_free-macro-redefinition-error.patch | 34 +++++++++++++++++++
>   1 file changed, 34 insertions(+)
>   create mode 100644 package/openvmtools/0015-glib_stubs-avoid-GLib-g_free-macro-redefinition-error.patch
> 
> diff --git a/package/openvmtools/0015-glib_stubs-avoid-GLib-g_free-macro-redefinition-error.patch b/package/openvmtools/0015-glib_stubs-avoid-GLib-g_free-macro-redefinition-error.patch
> new file mode 100644
> index 0000000000..226fd5a15f
> --- /dev/null
> +++ b/package/openvmtools/0015-glib_stubs-avoid-GLib-g_free-macro-redefinition-error.patch
> @@ -0,0 +1,34 @@
> +From bfd12cf73d81919843383598e4a9e64c6e5fd97a Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 21 Nov 2025 00:29:10 -0800
> +Subject: [PATCH] glib_stubs: avoid GLib g_free macro redefinition error
> +
> +glib 2.78+ defines g_free as an object-size checking macro.
> +open-vm-tools overrides g_free(), leading to preprocessor expansion
> +inside the function signature and breaking the build.
> +
> +Undefine the macro before defining the stub.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream: https://github.com/vmware/open-vm-tools/pull/779
> +Signed-off-by: John Ernberg <j@j-ernberg.se>
> +---
> + open-vm-tools/lib/rpcChannel/glib_stubs.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/lib/rpcChannel/glib_stubs.c b/lib/rpcChannel/glib_stubs.c
> +index c32deb073..cb89c6a87 100644
> +--- a/lib/rpcChannel/glib_stubs.c
> ++++ b/lib/rpcChannel/glib_stubs.c
> +@@ -35,6 +35,9 @@
> +
> + void *g_malloc0(size_t s) { return Util_SafeCalloc(1, s); }
> + void *g_malloc0_n(size_t n, size_t s) { return Util_SafeCalloc(n, s); }
> ++/* GLib defines g_free as a macro, so undefine it before providing
> ++ * our own stub implementation. */
> ++#undef g_free
> + void g_free(void *p) { free(p); }
> +
> + void g_mutex_init(GMutex *mutex) { }

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
