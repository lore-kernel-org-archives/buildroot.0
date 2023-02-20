Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3521C6379F
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 20:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63E458229B;
	Mon, 20 Feb 2023 20:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63E458229B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Ff-uDk7P7Xk; Mon, 20 Feb 2023 20:44:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB17D8229C;
	Mon, 20 Feb 2023 20:44:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB17D8229C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 678D31BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4158661004
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:44:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4158661004
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qEMRZ7RBo3ed for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:44:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D04760E63
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D04760E63
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:44:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E9BC1C0003;
 Mon, 20 Feb 2023 20:44:23 +0000 (UTC)
Date: Mon, 20 Feb 2023 21:44:23 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230220214423.1a42a0e5@windsurf>
In-Reply-To: <20230220093336.77462-1-fontaine.fabrice@gmail.com>
References: <20230220093336.77462-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676925864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WwuSu+nkYDyFBMTepV6oaFcHhpkahz1kbvqiEWfmrlE=;
 b=Fu5yXpn6eo/8WAR3BPyd7FV5XvjVdPDTpbwwu3GUjVQR+2Sulbm0P2FG/ZaNbW7Hp1jwMx
 W5C+pdba7pSusKp58hROWXQKuO0JsaN2q40BYNeLUuW+Z0OCiLymL6R9+3TzTsOEUKxehV
 Dyq2uXsPclxmJTQ3VX1Bip6D6CoZ7KuZRkPq30hkeoseD7dQeN0Jjow56EukHJkZekV8mm
 0jpMmoHe6CKfBme38h/TLJS4Qi69RMCx4jR6fspY9v0F23o96obOLl+ItR5N8HhUFNhdUu
 /2FcUwDe3ZB0qJOVmBeNLevgy3VvRW+BS+e4E1XMwtN4CJi0PmbWrwf3zHch4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Fu5yXpn6
Subject: Re: [Buildroot] [PATCH 1/1] package/zabbix: fix libcurl build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Alexey Lukyanchuk <skif@skif-web.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Mon, 20 Feb 2023 10:33:36 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following libcurl build failure:
> 
> In file included from /tmp/instance-1/output-1/host/s390x-buildroot-linux-gnu/sysroot/usr/include/curl/curl.h:3195,
>                  from ../../../../include/sysinc.h:384,
>                  from ../../../../include/common.h:23,
>                  from simple.c:20:
> simple.c: In function 'check_https':
> simple.c:167:65: error: invalid use of void expression
>   167 |         if (CURLE_OK != (err = curl_easy_setopt(easyhandle, opt = CURLOPT_USERAGENT, "Zabbix " ZABBIX_VERSION)) ||
>       |                                                                 ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/053a62e9969046a7f8a0e1890c24d2bfb099ae42
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...se-parentheses-to-ensure-compilation.patch | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 package/zabbix/0002-Use-parentheses-to-ensure-compilation.patch

This was reported to curl upstream in
https://github.com/curl/curl/issues/10148, and apparently fixed in curl
by
https://github.com/curl/curl/commit/e2aed004302e51cfa5b6ce8c8ab65ef92aa83196.

So it apparently was considered a bug in curl, so perhaps it should be
fixed in curl rather than in zabbix?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
