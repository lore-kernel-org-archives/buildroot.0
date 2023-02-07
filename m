Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9D9C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 20:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A24861045;
	Tue,  7 Feb 2023 20:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A24861045
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Tz-OdBTrD1d; Tue,  7 Feb 2023 20:16:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E43AD6104F;
	Tue,  7 Feb 2023 20:16:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E43AD6104F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 503E51BF31D
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 20:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28A4B6106A
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 20:16:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28A4B6106A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id areESzSrjiTy for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 20:16:02 +0000 (UTC)
X-Greylist: delayed 00:05:50 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62ED46061B
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62ED46061B
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 20:16:02 +0000 (UTC)
Received: from pwmachine.localnet (18.103-178-91.adsl-dyn.isp.belgacom.be
 [91.178.103.18])
 by linux.microsoft.com (Postfix) with ESMTPSA id 2D18220C7E38;
 Tue,  7 Feb 2023 12:10:10 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2D18220C7E38
From: Francis Laniel <flaniel@linux.microsoft.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Lang Daniel <d.lang@abatec.at>
Date: Tue, 07 Feb 2023 21:10:08 +0100
Message-ID: <12146851.O9o76ZdvQC@pwmachine>
In-Reply-To: <VI1P190MB04936E3BDB708B8974C8287B9F139@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <VI1P190MB04936E3BDB708B8974C8287B9F139@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.microsoft.com; 
 s=default; t=1675800612;
 bh=YRAkH40ZvcWLmPe7fMtrK4Q+bYHmrb90GJBNRsWLODU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UHut8sJHaXGDJGJxLDjLfqCfs96UdvtYR/1nyOKL6WOP9fnDpQQjNVd8xcELu5TQN
 iCvdlRG8aBkIMHJuZ4xaN6DaWM5kORL/Ni1Vup129BfhFTLMPYYencxpBjEJzsFISU
 BEoVWjh7rE8Un/FWu3groSP79tRq16I8Kd8hvCXk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
 header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default
 header.b=UHut8sJH
Subject: Re: [Buildroot] [PATCH] package/libbpf: Don't remove bpf.h on host
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi.

Le lundi 28 novembre 2022, 16:06:20 CET Lang Daniel a =E9crit :
> libbpf >1.0.0 defines libbpf_bpf_link_type_str(enum bpf_link_type) in
> src/libbpf.h, which is included by host-pahole.
> bpf_link_type is defined in linux/bpf.h, therefore the comment stating
> that pahole doesn't need bpf.h is no longer valid.
> =

> Fixes:
> -
> http://autobuild.buildroot.net/results/d126a4b6eca786402dc362c86f8df3adde=
c3
> d217/
> =

> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> ---
> I wasn't able to reproduce the mentioned compile error in the kernel.
> The mentioned file (tools/lib/bpf/strset.c) shouldn't be compiled when
> compiling the kernel as it would recompile libbpf.
> ---
>  package/libbpf/libbpf.mk | 17 +----------------
>  1 file changed, 1 insertion(+), 16 deletions(-)
> =

> diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
> index 820f1dc4bf..0381fd833a 100644
> --- a/package/libbpf/libbpf.mk
> +++ b/package/libbpf/libbpf.mk
> @@ -39,26 +39,11 @@ define LIBBPF_INSTALL_TARGET_CMDS
>  		-C $(@D)/src install DESTDIR=3D$(TARGET_DIR)
>  endef
> =

> -# We need to install_uapi_headers so we have btf.h to compile
> -# host-pahole.
> -# Nonetheless, this target adds bpf.h which generates a conflict when
> -# building the kernel:
> -# In file included from libbpf_internal.h:17:0, from strset.c:9:
> -# relo_core.h:10:6: error: nested redefinition of 'enum bpf_core_relo_ki=
nd'
> -# enum bpf_core_relo_kind {
> -# ^~~~~~~~~~~~~~~~~~
> -# relo_core.h:10:6: error: redeclaration of 'enum bpf_core_relo_kind'
> -# In file included from libbpf_legacy.h:13:0,
> -# 		from libbpf_internal.h:16,
> -# 		from strset.c:9:
> -# /home/francis/buildroot/output/host/include/linux/bpf.h:6497:6: note:
> originally defined here -# enum bpf_core_relo_kind {
> -# So, better to remove remove it now since we do not need it to build
> +# We need to install_uapi_headers so we have bpf.h and btf.h to compile
>  # host-pahole, the only user of host-libbpf.
>  define HOST_LIBBPF_INSTALL_CMDS
>  	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
>  		-C $(@D)/src install install_uapi_headers DESTDIR=3D$(HOST_DIR)
> -	rm $(HOST_DIR)/include/linux/bpf.h
>  endef
> =

>  $(eval $(generic-package))

Thank you for this patch and sorry for my very late reply.
Sadly, I do not think the patch addresses the underlying issue.
Indeed, this is not pahole which does not need this file, as pahole relies =
on =

<linux/bpf.h> to be built.
So, the whole point of this comment and the rm is to avoid a problem when =

building the kernel when pahole was built before.

Sadly, I tested your patch and I hit the problem described in the comment =

regarding redefinition of bpf_core_relo_kind.

Did you also hit it or you were able to build the kernel with =

BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE?


Best regards and thank you in advance.


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
