Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611A3C3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 20:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2680E40C8F;
	Fri, 26 Jul 2024 20:46:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gjb-mnEWTcp5; Fri, 26 Jul 2024 20:46:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1E2D40C1B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1E2D40C1B;
	Fri, 26 Jul 2024 20:46:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE7DE1BF852
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 20:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D91FD607EB
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 20:46:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ASYa7Ea1e75q for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 20:46:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 39EF06061B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39EF06061B
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39EF06061B
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 20:46:12 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([78.34.233.124]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MsHns-1sInMG2fPe-010tGO; Fri, 26
 Jul 2024 22:46:10 +0200
Date: Fri, 26 Jul 2024 22:46:09 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZqQLEUiTljvhKaWM@probook>
References: <20240724115554.2270864-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240724115554.2270864-1-fontaine.fabrice@gmail.com>
X-Provags-ID: V03:K1:zrB0rCW+dwSkHU5lynO/U5PWm1OY6Fz29ewohBL7l1RfBiEM5MK
 qmbPOGdJqP8A/7uyWfpyhuqeGLDAdje0t2EkpES/2TZJ94JQmgZvQkbKzzfe+mVN6kCcoyR
 TTO7HLvIro3kqBUV7CBuad0Sf7+I74eaY5c6GZSqT7l+zlpzCFGdvHrcOR7m+8oQkpXMOOH
 KZtXp1+ySxr8n/gKKoPnQ==
UI-OutboundReport: notjunk:1;M01:P0:ZdhGPXN6nfI=;Oi4ByfYtPns7q+VLxBW3MkbgsoE
 Jd0EPIussQherZysU2G8Jqow7zaVkTabJTay6jiUlMucx3ukr5sYzvb/pOTF7pqkLQuh6CBQM
 zVbQ3BKYDCulqcVYas/t2xx3rB0iInwAGAhNO8702JtMxmFV9yoXtfi5jYLfVgc5KXxz2O6sj
 VCf5Kufyq32Ba5NwHzGf3GeqC4D/U+QzaN4qznvGneI9QXd2C+QxoiQSla7pMQXZMC+aIxw53
 v5DinV5XTEsKoZB6GQ2feyO4OafcmD5gsCQh2yyLODWRoa53rWQcEnFoe0iPQF9yroa/xOJQO
 0N3FTW+534zrCFtIPdfDV3CfrCnM/Z0Qo3B39ixKHhxvuSc2fbO0lQDOPsPQmvAYdp02/56Gz
 g9XKHmQmA6N29dvKfIJJNQfKadJTVip2DG5Y5/Qlf6UJ9jZkqFy2NMmy9aLqyazcaSe9J67f8
 0BzbNsLgx1lmvH7F7okuYnirQAxDa+uOVHtCYa6AHIZbdmkX7yu5vvMuQdhURKQhkPcjtrfBN
 vK2TfTyrSyWuZ7sZrVtOmDrdLGNQAysNAUoThM8A5qKQtoQ7owCJ3Uh0T2DWSCiqLW3ptfWES
 C7TKgBBUlUh4IKKciKp/TA/fqGHft4Ju3F6V+urpDG5iDHibXFPS7Y+/VJfJ/fIlB/lABOTjF
 sM/0UejNC6sH5wk/E9M1IcsCRJLh6q2rT30sKUgNoOVSMomUyGpSM1UF8uHmqfklsOO+JlPch
 9+2QqblyI6O7AIfz9hCU8mvAdUBgKASb5KqpU7JVr0oqqaJlcB8cQh0DkrWByrg4n8Rgfuq6a
 a7jqmyTxQGROkzfTbDDrivUg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1722026770; x=1722631570; i=j.neuschaefer@gmx.net;
 bh=PrT8k2uSVIR+oz7exCd4p/fpr0sb/pmZWb+p2AB1etI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=osdE3Ip9pTyiVm+N0MEALbEyROmzOrbU/xRnRrGf+fF2wq1LPW8dirjOsq+nzxjY
 JsAl7HJ+HeY9ZxkOJkIysImKQ/Q1gwqNLdVwUVCHeVFzVmfneVjX5u1aL/hGIQrRl
 nwgGC0x2IjpPpPPzAYn9zGr5GT7kSyGIt1QZpDmexnYd7w4ck8sIv5baVABePDJK5
 LmqhaopOnFn3UmnbEoIiGBgiMxxIbuUaoZkyrqzfHZEyzAa7xaw/3Wk2EjlQhlmoI
 OkhWqnn+oKuhhEhBBMdbMK71t0+raikthIrP9jeKrdB5zTLp6q1o1TFY+VaSVFHem
 HO2ta5honI93tTNUtA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=osdE3Ip9
Subject: Re: [Buildroot] [PATCH 1/1] package/tipidee: fix uclibc build
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: J =?utf-8?Q?=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Jul 24, 2024 at 01:55:54PM +0200, Fabrice Fontaine wrote:
> Set _GNU_SOURCE in CFLAGS to fix the following uclibc build failure
> raised since the addition of the package in commit
> 17deaf60f66fc08a796233920a104e5233b501e0:
>
> src/libtipidee/tipidee_response_header_lastmodified.c: In function 'tipidee_response_header_lastmodified':
> src/libtipidee/tipidee_response_header_lastmodified.c:17:36: error: 'const struct stat' has no member named 'st_mtim'; did you mean 'st_mtime'?
>    17 |   if (!tain_from_timespec(&t, &st->st_mtim)) return 0 ;
>       |                                    ^~~~~~~
>       |                                    st_mtime
>
> Fixes: 17deaf60f66fc08a796233920a104e5233b501e0
>  - http://autobuild.buildroot.org/results/f07d6d6ae2331f9972974093c0503b9d3c6b914a
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/tipidee/tipidee.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/tipidee/tipidee.mk b/package/tipidee/tipidee.mk
> index 915b4f84bd..cb33b153e6 100644
> --- a/package/tipidee/tipidee.mk
> +++ b/package/tipidee/tipidee.mk
> @@ -11,6 +11,7 @@ TIPIDEE_LICENSE_FILES = COPYING
>  TIPIDEE_DEPENDENCIES = skalibs
>
>  TIPIDEE_CONF_OPTS = \
> +	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \

This seems fine as a stop-gap solution, but since upstream documents
that it only needs "A POSIX-compliant system with a standard C
development environment", have you discussed this issue with the
upstream author?


Best regards,
-- jn
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
