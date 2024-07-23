Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E8FC3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 16:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53DF260669;
	Tue, 23 Jul 2024 16:22:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id exBX7o_gfTO8; Tue, 23 Jul 2024 16:22:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E70C607F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E70C607F0;
	Tue, 23 Jul 2024 16:22:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E62B1BF2FD
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 16:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 180F5405C4
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 16:22:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GHBB19-Yv7As for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 16:22:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=91.207.212.93;
 helo=mx07-00178001.pphosted.com;
 envelope-from=prvs=79348e9772=etienne.carriere@foss.st.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 98C4F405AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98C4F405AA
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98C4F405AA
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 16:22:31 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46NCKtvN013348;
 Tue, 23 Jul 2024 18:22:29 +0200
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40g44d2xag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jul 2024 18:22:29 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E972740045;
 Tue, 23 Jul 2024 18:22:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 50710241B55;
 Tue, 23 Jul 2024 18:22:15 +0200 (CEST)
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 23 Jul
 2024 18:22:15 +0200
Received: from SHFDAG1NODE1.st.com ([fe80::b848:dbeb:cd0:84a0]) by
 SHFDAG1NODE1.st.com ([fe80::b848:dbeb:cd0:84a0%13]) with mapi id
 15.01.2507.037; Tue, 23 Jul 2024 18:22:15 +0200
From: Etienne CARRIERE - foss <etienne.carriere@foss.st.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/6] boot/optee-os: bump to version 4.3.0
Thread-Index: AQHa3RsCM+e16b66pkqzGgv678KrCLIEfULd
Date: Tue, 23 Jul 2024 16:22:15 +0000
Message-ID: <f0fafa6e86cf49fb911457a911d3c3e0@foss.st.com>
References: <20240723161142.2728577-1-etienne.carriere@foss.st.com>
In-Reply-To: <20240723161142.2728577-1-etienne.carriere@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.48.86.128]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-23_05,2024-07-23_02,2024-05-17_01
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 6wa3rYBrKERk2qkRxOYg1x1yCklkAXZAiKPm7Y81Rjk=; b=i5Xw6p3XEh8Y4pqO
 HEJjJpPfC+EGsnUwx6H5oQ/MLBCoXpspcizIUk9brGVemvphYwDtQbRiErkJlLW2
 7R35KZ6uLDcOxbt5SWRwwDMx/QNpmk8Efpbh+bZg7IWmE/XGFz+7X7MlO243p1kH
 cM9t7TsaSfHePapsa9SLXmqS2drQtdWyr7ug9nsL4mete1l7J5BMkfT9RY949fFa
 6IYh7Nn6MvoE5+9v5bKIoEsRhSyyhhkrlRzJ1LhrIJymP6qDsiKli+mc0z3Qt+DI
 gIni6hX3yBwI/d+s0avIdnzQPM4Pp/nlpPDdTEWQprugRlr/Im3jPu8G5bHkuhqo
 wFZR3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=foss.st.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.a=rsa-sha256 header.s=selector1 header.b=i5Xw6p3X
Subject: Re: [Buildroot] [PATCH 1/6] boot/optee-os: bump to version 4.3.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tuesday, July 23, 2024, Etienne Carriere wrote:
> Bump OP-TEE OS package to OP-TEE release tag 4.3.0.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>

Discard this patch as well as patch 2/6, 3/6 and 4/6. My apologies, I just saw a equivalent series was posting few hours ago.
I'll re-send a series with only the 2 last changes.

BR,
Etienne


> ---
>  boot/optee-os/Config.in     | 4 ++--
>  boot/optee-os/optee-os.hash | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
> index 7870629732..2f996cbafc 100644
> --- a/boot/optee-os/Config.in
> +++ b/boot/optee-os/Config.in
> @@ -18,7 +18,7 @@ choice
>           Select the version of OP-TEE OS you want to use
> 
>  config BR2_TARGET_OPTEE_OS_LATEST
> -       bool "4.2.0"
> +       bool "4.3.0"
>         depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
>         select BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY
>         help
> @@ -70,7 +70,7 @@ endif
> 
>  config BR2_TARGET_OPTEE_OS_VERSION
>         string
> -       default "4.2.0"         if BR2_TARGET_OPTEE_OS_LATEST
> +       default "4.3.0"         if BR2_TARGET_OPTEE_OS_LATEST
>         default "custom"        if BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
>         default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
>                                 if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
> diff --git a/boot/optee-os/optee-os.hash b/boot/optee-os/optee-os.hash
> index 663640b2ce..16b3d7430e 100644
> --- a/boot/optee-os/optee-os.hash
> +++ b/boot/optee-os/optee-os.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/OP-TEE/optee_os/archive/4.2.0/optee-os-4.2.0.tar.gz
> -sha256  ce70f0d177001bf4855cd6cd6396f515af6126e4bba9b12c716a437a5cb40c7b  optee-os-4.2.0.tar.gz
> +# From https://github.com/OP-TEE/optee_os/archive/4.3.0/optee-os-4.3.0.tar.gz
> +sha256  390b271905c828d6def9fa6a77bbaa425f3b434d733c8eb18f582ccbc6896096  optee-os-4.3.0.tar.gz
>  # Locally computed
>  sha256  1247ee90858f4037b6cac63cbffddfed435d0d73c631b37d78c1e6e6ab3e5d1a  LICENSE
> --
> 2.25.1
> 
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
