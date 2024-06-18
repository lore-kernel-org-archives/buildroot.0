Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FC2C27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 20:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC21840290;
	Tue, 18 Jun 2024 20:29:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2f4GW2cv6Ybg; Tue, 18 Jun 2024 20:29:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FEFC402B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FEFC402B3;
	Tue, 18 Jun 2024 20:29:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4604F1BF4DD
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 20:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 325E0402B3
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 20:29:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U4cvmBFTDTlO for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 20:29:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 24EEC40290
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24EEC40290
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 24EEC40290
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 20:29:32 +0000 (UTC)
Received: from pps.filterd (m0346905.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 45IHF20a010501; Tue, 18 Jun 2024 20:29:26 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3yttjqmsxf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jun 2024 20:29:26 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 45IKTPlJ030165
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jun 2024 20:29:25 GMT
Received: from crulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45IKTOPg011273
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 18 Jun 2024 20:29:24 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id 9EB56A5D0;
 Tue, 18 Jun 2024 15:29:24 -0500 (CDT)
Date: Tue, 18 Jun 2024 20:29:24 +0000
To: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@rtone.fr>
Message-ID: <ZnHuJFdwC2VTaGHm@bspbox.kirk>
Mail-Followup-To: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@rtone.fr>,
 buildroot@buildroot.org,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>,
 Athaariq Ardhiansyah <foss@athaariq.my.id>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
References: <20240607071359.767329-1-gael.portay@rtone.fr>
 <20240607071359.767329-2-gael.portay@rtone.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240607071359.767329-2-gael.portay@rtone.fr>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_03,2024-06-17_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_03,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406180151
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406180150
X-Proofpoint-GUID: 1sfU1tkcpfuRkyQ7va3ms7f4sNTh14ru
X-Proofpoint-ORIG-GUID: 1sfU1tkcpfuRkyQ7va3ms7f4sNTh14ru
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_03,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 mlxscore=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2406180151
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=jMLDIA2jPEA718lNVYV5aY3QbQlUuSo1ljO0yvNUor8=;
 b=l7RhiccorkEM4Gb8awvz6i+DletubTJNSFXXhi4BR8asF/PLObowVToIpdTvrVzxBJCU
 EhAc1MLsG0RtiXPGMokZHBCwXRPip58arApdqOTlQQRvbf/eOLUBngR2MPo7HNHJ1zTL
 fIUSnIbfN7d3r46F1GYgG3EswiSBwGreWFjPUancvt51ro56rwqIrDLwLc+umjuczpv0
 gMnYrNlzdXTLQYK0i4CcVOf5qn6ocMDl2aD0EhGEYbm+kG6XA0oyeTbhCOOn7MVifTcd
 3NuKRdgPoAwOQ5jhcNWfVcPaFtWbO0zPmjS7r2MMlG/1C4um/EW0i2PHQegHjrkRjfeA Dw== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=l7Rhicco
Subject: Re: [Buildroot] [next v2 1/2] configs/raspberrypi*: bump kernel
 version to 17f135b (6.6.28)
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
From: Brandon Maier via buildroot <buildroot@buildroot.org>
Reply-To: Brandon Maier <brandon.maier@collins.com>
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>, Athaariq Ardhiansyah <foss@athaariq.my.id>,
 buildroot@buildroot.org, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Ga=EBl,

On 2024.06.07 09:13, Ga=EBl PORTAY wrote:
> Now based on 6.6.28 (from 6.1.61).
> =

> Signed-off-by: Ga=EBl PORTAY <gael.portay@rtone.fr>

I enabled BR2_DOWNLOAD_FORCE_CHECK_HASHES on the rpi configs, so the
file board/raspberrypi/patches/linux/linux.hash needs to be updated for
the new version.

I built this locally and updated the hash like so

  --- a/board/raspberrypi/patches/linux/linux.hash
  +++ b/board/raspberrypi/patches/linux/linux.hash
  @@ -1,2 +1,2 @@
   # Locally calculated
  -sha256  4d3a2af178ac6ed8f35b773836c8d216493a850aeb80932b379348e2df0cf5d2=
  linux-17f135b742c4edb340afb365873c3a574f7e16cb.tar.gz
  +sha256  dab3052783c68c46a5bc645b1c38d9705da995ab42823566518b62eb1fa1ef97=
  linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz

I boot tested this on a rpi2 and everything looks good. Pending a v2 for
the hash,

Reviewed-by: Brandon Maier <brandon.maier@collins.com>
Tested-by: Brandon Maier <brandon.maier@collins.com>

> ---
>  configs/raspberrypi0_defconfig        | 8 ++++----
>  configs/raspberrypi0w_defconfig       | 8 ++++----
>  configs/raspberrypi2_defconfig        | 8 ++++----
>  configs/raspberrypi3_64_defconfig     | 6 +++---
>  configs/raspberrypi3_defconfig        | 8 ++++----
>  configs/raspberrypi3_qt5we_defconfig  | 6 +++---
>  configs/raspberrypi4_64_defconfig     | 6 +++---
>  configs/raspberrypi4_defconfig        | 8 ++++----
>  configs/raspberrypi5_defconfig        | 6 +++---
>  configs/raspberrypi_defconfig         | 8 ++++----
>  configs/raspberrypicm4io_64_defconfig | 6 +++---
>  configs/raspberrypicm4io_defconfig    | 8 ++++----
>  configs/raspberrypizero2w_defconfig   | 8 ++++----
>  13 files changed, 47 insertions(+), 47 deletions(-)
> =

> diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defcon=
fig
> index 74a8477cc6..b2b7351ac1 100644
> --- a/configs/raspberrypi0_defconfig
> +++ b/configs/raspberrypi0_defconfig
> @@ -6,20 +6,20 @@ BR2_ARM_EABIHF=3Dy
>  BR2_GLOBAL_PATCH_DIR=3D"board/raspberrypi/patches"
>  BR2_DOWNLOAD_FORCE_CHECK_HASHES=3Dy
>  =

> -# Linux headers same as kernel, a 6.1 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=3Dy
> +# Linux headers same as kernel, a 6.6 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=3Dy
>  =

>  BR2_TOOLCHAIN_BUILDROOT_CXX=3Dy
>  =

>  BR2_LINUX_KERNEL=3Dy
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=3Dy
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call github,raspberrypi,li=
nux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb36=
5873c3a574f7e16cb.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call github,raspberrypi,li=
nux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a=
05c796051d7343ea4.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG=3D"bcmrpi"
>  =

>  # Build the DTBs for A/B from the kernel sources: the zero is the same
>  # as the A+ model, just in a different form-factor
>  BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"bcm2708-rpi-zero"
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"broadcom/bcm2708-rpi-zero"
>  =

>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy
>  =

> diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defc=
onfig
> index 03f6a805e6..a198596b40 100644
> --- a/configs/raspberrypi0w_defconfig
> +++ b/configs/raspberrypi0w_defconfig
> @@ -6,17 +6,17 @@ BR2_ARM_EABIHF=3Dy
>  BR2_GLOBAL_PATCH_DIR=3D"board/raspberrypi/patches"
>  BR2_DOWNLOAD_FORCE_CHECK_HASHES=3Dy
>  =

> -# Linux headers same as kernel, a 6.1 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=3Dy
> +# Linux headers same as kernel, a 6.6 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=3Dy
>  =

>  BR2_TOOLCHAIN_BUILDROOT_CXX=3Dy
>  =

>  BR2_LINUX_KERNEL=3Dy
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=3Dy
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call github,raspberrypi,li=
nux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb36=
5873c3a574f7e16cb.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call github,raspberrypi,li=
nux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a=
05c796051d7343ea4.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG=3D"bcmrpi"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"bcm2708-rpi-zero-w"
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"broadcom/bcm2708-rpi-zero-w"
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy
>  =

>  BR2_PACKAGE_RPI_FIRMWARE=3Dy
> diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defcon=
fig
> index 79de3fbf3e..05870cc6e1 100644
> --- a/configs/raspberrypi2_defconfig
> +++ b/configs/raspberrypi2_defconfig
> @@ -11,17 +11,17 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=3Dy
>  =

>  BR2_SYSTEM_DHCP=3D"eth0"
>  =

> -# Linux headers same as kernel, a 6.1 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=3Dy
> +# Linux headers same as kernel, a 6.6 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=3Dy
>  =

>  BR2_LINUX_KERNEL=3Dy
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=3Dy
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call github,raspberrypi,li=
nux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb36=
5873c3a574f7e16cb.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call github,raspberrypi,li=
nux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a=
05c796051d7343ea4.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG=3D"bcm2709"
>  =

>  # Build the DTB from the kernel sources
>  BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"bcm2709-rpi-2-b"
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"broadcom/bcm2709-rpi-2-b"
>  =

>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy
>  =

> diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_=
defconfig
> index 5460cd8c62..ec309b2bad 100644
> --- a/configs/raspberrypi3_64_defconfig
> +++ b/configs/raspberrypi3_64_defconfig
> @@ -10,12 +10,12 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=3Dy
>  =

>  BR2_SYSTEM_DHCP=3D"eth0"
>  =

> -# Linux headers same as kernel, a 6.1 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=3Dy
> +# Linux headers same as kernel, a 6.6 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=3Dy
>  =

>  BR2_LINUX_KERNEL=3Dy
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=3Dy
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call github,raspberrypi,li=
nux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb36=
5873c3a574f7e16cb.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call github,raspberrypi,li=
nux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a=
05c796051d7343ea4.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG=3D"bcmrpi3"
>  =

>  # Build the DTB from the kernel sources
> diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defcon=
fig
> index eded94014d..ba2d5b6eed 100644
> --- a/configs/raspberrypi3_defconfig
> +++ b/configs/raspberrypi3_defconfig
> @@ -10,17 +10,17 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=3Dy
>  =

>  BR2_SYSTEM_DHCP=3D"eth0"
>  =

> -# Linux headers same as kernel, a 6.1 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=3Dy
> +# Linux headers same as kernel, a 6.6 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=3Dy
>  =

>  BR2_LINUX_KERNEL=3Dy
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=3Dy
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call github,raspberrypi,li=
nux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb36=
5873c3a574f7e16cb.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call github,raspberrypi,li=
nux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a=
05c796051d7343ea4.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG=3D"bcm2709"
>  =

>  # Build the DTB from the kernel sources
>  BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"bcm2710-rpi-3-b bcm2710-rpi-3-b-plus=
 bcm2710-rpi-cm3"
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"broadcom/bcm2710-rpi-3-b broadcom/bc=
m2710-rpi-3-b-plus broadcom/bcm2710-rpi-cm3"
>  =

>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy
>  =

> diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_=
qt5we_defconfig
> index 72e1c349f2..38f41f45a6 100644
> --- a/configs/raspberrypi3_qt5we_defconfig
> +++ b/configs/raspberrypi3_qt5we_defconfig
> @@ -11,12 +11,12 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=3Dy
>  =

>  BR2_SYSTEM_DHCP=3D"eth0"
>  =

> -# Linux headers same as kernel, a 6.1 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=3Dy
> +# Linux headers same as kernel, a 6.6 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=3Dy
>  =

>  BR2_LINUX_KERNEL=3Dy
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=3Dy
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call github,raspberrypi,li=
nux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb36=
5873c3a574f7e16cb.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call github,raspberrypi,li=
nux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a=
05c796051d7343ea4.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG=3D"bcm2709"
>  =

>  # Build the DTB from the kernel sources
> diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_=
defconfig
> index 8da3ecee12..5c6698fb37 100644
> --- a/configs/raspberrypi4_64_defconfig
> +++ b/configs/raspberrypi4_64_defconfig
> @@ -10,12 +10,12 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=3Dy
>  =

>  BR2_SYSTEM_DHCP=3D"eth0"
>  =

> -# Linux headers same as kernel, a 6.1 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=3Dy
> +# Linux headers same as kernel, a 6.6 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=3Dy
>  =

>  BR2_LINUX_KERNEL=3Dy
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=3Dy
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call github,raspberrypi,li=
nux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb36=
5873c3a574f7e16cb.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call github,raspberrypi,li=
nux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a=
05c796051d7343ea4.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG=3D"bcm2711"
>  =

>  # Build the DTB from the kernel sources
> diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defcon=
fig
> index 2c37631396..c14b77eacd 100644
> --- a/configs/raspberrypi4_defconfig
> +++ b/configs/raspberrypi4_defconfig
> @@ -10,17 +10,17 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=3Dy
>  =

>  BR2_SYSTEM_DHCP=3D"eth0"
>  =

> -# Linux headers same as kernel, a 6.1 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=3Dy
> +# Linux headers same as kernel, a 6.6 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=3Dy
>  =

>  BR2_LINUX_KERNEL=3Dy
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=3Dy
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call github,raspberrypi,li=
nux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb36=
5873c3a574f7e16cb.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call github,raspberrypi,li=
nux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a=
05c796051d7343ea4.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG=3D"bcm2711"
>  =

>  # Build the DTB from the kernel sources
>  BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"bcm2711-rpi-4-b"
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"broadcom/bcm2711-rpi-4-b"
>  =

>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy
>  =

> diff --git a/configs/raspberrypi5_defconfig b/configs/raspberrypi5_defcon=
fig
> index 73592c4a1a..3c88ce46cd 100644
> --- a/configs/raspberrypi5_defconfig
> +++ b/configs/raspberrypi5_defconfig
> @@ -6,13 +6,13 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=3Dy
>  =

>  BR2_SYSTEM_DHCP=3D"eth0"
>  =

> -# Linux headers same as kernel, a 6.1 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=3Dy
> +# Linux headers same as kernel, a 6.6 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=3Dy
>  =

>  BR2_LINUX_KERNEL=3Dy
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES=3D"board/raspberrypi/linux-4k-pag=
e-size.fragment"
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=3Dy
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call github,raspberrypi,li=
nux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb36=
5873c3a574f7e16cb.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call github,raspberrypi,li=
nux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a=
05c796051d7343ea4.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG=3D"bcm2712"
>  =

>  # Build the DTB from the kernel sources
> diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
> index c911ec63e9..03c81ebf39 100644
> --- a/configs/raspberrypi_defconfig
> +++ b/configs/raspberrypi_defconfig
> @@ -8,19 +8,19 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=3Dy
>  =

>  BR2_SYSTEM_DHCP=3D"eth0"
>  =

> -# Linux headers same as kernel, a 6.1 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=3Dy
> +# Linux headers same as kernel, a 6.6 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=3Dy
>  =

>  BR2_TOOLCHAIN_BUILDROOT_CXX=3Dy
>  =

>  BR2_LINUX_KERNEL=3Dy
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=3Dy
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call github,raspberrypi,li=
nux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb36=
5873c3a574f7e16cb.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call github,raspberrypi,li=
nux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a=
05c796051d7343ea4.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG=3D"bcmrpi"
>  =

>  # Build the DTBs for A/B, A+/B+ and compute module from the kernel sourc=
es
>  BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"bcm2708-rpi-b bcm2708-rpi-b-plus bcm=
2708-rpi-cm"
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"broadcom/bcm2708-rpi-b broadcom/bcm2=
708-rpi-b-plus broadcom/bcm2708-rpi-cm"
>  =

>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy
>  =

> diff --git a/configs/raspberrypicm4io_64_defconfig b/configs/raspberrypic=
m4io_64_defconfig
> index 75077263e4..e9d57091b5 100644
> --- a/configs/raspberrypicm4io_64_defconfig
> +++ b/configs/raspberrypicm4io_64_defconfig
> @@ -10,12 +10,12 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=3Dy
>  =

>  BR2_SYSTEM_DHCP=3D"eth0"
>  =

> -# Linux headers same as kernel, a 6.1 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=3Dy
> +# Linux headers same as kernel, a 6.6 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=3Dy
>  =

>  BR2_LINUX_KERNEL=3Dy
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=3Dy
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call github,raspberrypi,li=
nux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb36=
5873c3a574f7e16cb.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call github,raspberrypi,li=
nux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a=
05c796051d7343ea4.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG=3D"bcm2711"
>  =

>  # Build the DTB from the kernel sources
> diff --git a/configs/raspberrypicm4io_defconfig b/configs/raspberrypicm4i=
o_defconfig
> index 07adb962a4..537d077b71 100644
> --- a/configs/raspberrypicm4io_defconfig
> +++ b/configs/raspberrypicm4io_defconfig
> @@ -10,17 +10,17 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=3Dy
>  =

>  BR2_SYSTEM_DHCP=3D"eth0"
>  =

> -# Linux headers same as kernel, a 6.1 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=3Dy
> +# Linux headers same as kernel, a 6.6 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=3Dy
>  =

>  BR2_LINUX_KERNEL=3Dy
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=3Dy
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call github,raspberrypi,li=
nux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb36=
5873c3a574f7e16cb.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call github,raspberrypi,li=
nux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a=
05c796051d7343ea4.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG=3D"bcm2711"
>  =

>  # Build the DTB from the kernel sources
>  BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"bcm2711-rpi-cm4"
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"broadcom/bcm2711-rpi-cm4"
>  =

>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy
>  =

> diff --git a/configs/raspberrypizero2w_defconfig b/configs/raspberrypizer=
o2w_defconfig
> index 0b1457f407..37922909f3 100644
> --- a/configs/raspberrypizero2w_defconfig
> +++ b/configs/raspberrypizero2w_defconfig
> @@ -6,19 +6,19 @@ BR2_ARM_FPU_NEON_VFPV4=3Dy
>  BR2_GLOBAL_PATCH_DIR=3D"board/raspberrypi/patches"
>  BR2_DOWNLOAD_FORCE_CHECK_HASHES=3Dy
>  =

> -# Linux headers same as kernel, 6.1 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=3Dy
> +# Linux headers same as kernel, 6.6 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=3Dy
>  =

>  BR2_TOOLCHAIN_BUILDROOT_CXX=3Dy
>  =

>  BR2_LINUX_KERNEL=3Dy
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=3Dy
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call github,raspberrypi,li=
nux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb36=
5873c3a574f7e16cb.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call github,raspberrypi,li=
nux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a=
05c796051d7343ea4.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG=3D"bcm2709"
>  =

>  # Build the DTB from the kernel sources
>  BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"bcm2710-rpi-zero-2-w"
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"broadcom/bcm2710-rpi-zero-2-w"
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy
>  =

>  BR2_PACKAGE_RPI_FIRMWARE=3Dy
> -- =

> 2.45.2
> =

> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
