Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B2DC25B76
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 07:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87EB9605E1;
	Mon,  3 Jun 2024 07:35:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PsaQEENEmMJy; Mon,  3 Jun 2024 07:35:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 945C260663
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 945C260663;
	Mon,  3 Jun 2024 07:35:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1FAAA1BF2EF
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 196394018E
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:35:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8mzHUgHMAKYt for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 07:35:50 +0000 (UTC)
X-Greylist: delayed 377 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 03 Jun 2024 07:35:48 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D24EF40010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D24EF40010
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.209.10.33;
 helo=libero.it; envelope-from=dariobin@libero.it; receiver=<UNKNOWN> 
Received: from libero.it (smtp-33.italiaonline.it [213.209.10.33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D24EF40010
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 07:35:48 +0000 (UTC)
Received: from oxapps-12-070.iol.local ([10.101.8.80])
 by smtp-33.iol.local with ESMTPA
 id E29gsRj5Co6ZQE29hsz2ZW; Mon, 03 Jun 2024 09:30:57 +0200
x-libjamoibt: 1601
X-CNFS-Analysis: v=2.4 cv=Qr2V3kyd c=1 sm=1 tr=0 ts=665d7131 cx=a_exe
 a=INVnJeSsuNg8HEc+evQ4ig==:117 a=7FGnZS6rfqEA:10 a=IkcTkHD0fZMA:10
 a=pADFtF_7AAAA:8 a=3HDBlxybAAAA:8 a=iP-xVBlJAAAA:8 a=ZDLCKTo8smJQbbgAmQUA:9
 a=QEXdDO2ut3YA:10 a=SIJ3zCUs7LZk56CadGmo:22 a=-mK4jGaHXJwEiCVHQkBg:22
 a=laEoCiVfU_Unz3mSdgXN:22 a=lHLH-nfn2y1bM_0xSXwp:22
Date: Mon, 3 Jun 2024 09:30:56 +0200 (CEST)
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
Message-ID: <495831771.8429.1717399856997@mail1.libero.it>
In-Reply-To: <20240603071726.532652-6-peter@korsgaard.com>
References: <20240603071726.532652-1-peter@korsgaard.com>
 <20240603071726.532652-6-peter@korsgaard.com>
MIME-Version: 1.0
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.6-Rev61
X-Originating-IP: 2.196.43.202
X-Originating-Client: open-xchange-appsuite
x-libjamsun: D0R4BiGA8Z9UmOzChlrgn2PMH+umjCaO
x-libjamv: Z1VeSakjqAY=
X-CMAE-Envelope: MS4xfIP+Fg1uZUzm/OoM6aJR9jR+MSe0y0LdiNpyLyt9D3buGoUSr03Tjk8Exz1I6aKhM9qiyy16Iv19cJZW5uTW/ttj+Hct8D+wCZmZuLlv1ob/L+C0VJZa
 jpxoobFXHQOzgdXQgCVw3XMIapXsSuaaIUSROzAa0zILmA83LIkzVn7d5ewndzq+1d2GrN3YUNF9YhLNdeDjcBzpEKlQ4AXV9faqH0BmfOTCibhgyKLfPLsI
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=libero.it; s=s2021; 
 t=1717399857; bh=G/TEvF9+lIx+fZ8Ayd72LU4QdCzXRxyyarM93S2plZw=;
 h=From;
 b=HFuK9s/x1n0NVrWFMP41sJiGl8rO65FN771R/rpSeRGL7UL4B97kYxZ6oJfLSE4p6
 2LYxfSOoyGv34H0H8upDrkct6unEwFjzrVkce65XVYMdbaKbyNp38kUJplWt/QGOeM
 ofo1qgHWUVhvy9immB+XO1Qu5TeSTRm0FXQg4CWZ+OxnquTI7uP9flXeDvhzwk6Ycw
 2V3JYUtPoQoZ6b8i5rLbXGH0n9sH6Kd5dy3ZL57JVCDTpbN+i7q0gk3IkqS+fFq4eM
 3UyPD6z7U1WR8wL7BCN4bJD2/sfmBzFxpcWk2l4x4Em5Dx2XqfPh5t1RmN1f/6/U9y
 hVagfACkDneHw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=libero.it
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=libero.it header.i=@libero.it header.a=rsa-sha256
 header.s=s2021 header.b=HFuK9s/x
Subject: Re: [Buildroot] [PATCH 06/23] package/libmnl: use https for _SITE
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
From: Dario Binacchi via buildroot <buildroot@buildroot.org>
Reply-To: dariobin@libero.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

> Il 03/06/2024 09:17 CEST Peter Korsgaard <peter@korsgaard.com> ha scritto:
> 
>  
> http redirects to https, so use that instead.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/libmnl/libmnl.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libmnl/libmnl.mk b/package/libmnl/libmnl.mk
> index 08eebbaed9..3bd3a03c89 100644
> --- a/package/libmnl/libmnl.mk
> +++ b/package/libmnl/libmnl.mk
> @@ -6,7 +6,7 @@
>  
>  LIBMNL_VERSION = 1.0.5
>  LIBMNL_SOURCE = libmnl-$(LIBMNL_VERSION).tar.bz2
> -LIBMNL_SITE = http://netfilter.org/projects/libmnl/files
> +LIBMNL_SITE = https://netfilter.org/projects/libmnl/files
>  LIBMNL_INSTALL_STAGING = YES
>  LIBMNL_LICENSE = LGPL-2.1+
>  LIBMNL_LICENSE_FILES = COPYING

Reviewed-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Thanks and regards,
Dario
> -- 
> 2.39.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
