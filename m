Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026EAC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 12:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89B8841868;
	Wed,  5 Feb 2025 12:59:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pBhgLhW-Q07L; Wed,  5 Feb 2025 12:59:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FA23417C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FA23417C1;
	Wed,  5 Feb 2025 12:59:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DFE7212A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C171C40CA4
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:59:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BoGKGbAM9jUI for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 12:59:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E25E340BA4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E25E340BA4
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E25E340BA4
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:59:17 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.119.32]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mel7v-1t7Qhy0wVR-00dhHS; Wed, 05
 Feb 2025 13:59:15 +0100
Message-ID: <f70aa72c-8c8f-4cc1-b7e1-96ed51997596@gmx.de>
Date: Wed, 5 Feb 2025 13:59:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Spenser Gilliland <spenser@gillilanding.com>
References: <20250124124710.2838253-1-fiona.klute@gmx.de>
 <20250205102036.77588f14@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20250205102036.77588f14@windsurf>
X-Provags-ID: V03:K1:By/cEbHn4FmXNKCpSu4XuhOcrUNGBfQjiVNItoeXXzG76XFjzRu
 ELxNWHycP6w4UfHZ2WNloZMnhEywT08V5jQ3kDOdJ2e6XbMv/FPpl0isSSWnNEXHGwtaGRt
 TH/57cMUcmEKSZH9gEUd9swjFyEIOrGVl50guoMMIaVVzKkAMoLjBqo+0fh2MFnIle40bam
 ZiuvhOiAGYmw+7ECfMhWQ==
UI-OutboundReport: notjunk:1;M01:P0:8QkWnvq09Ik=;UIAUKHGSXRetKMUo/1EaJ/EQrT4
 /5+/O3Q7FUBozkri5GgW0WSCIzgDKNH/EkLOrDRrQj2wCJN4qrVXxFOb6WAicODCuzAe9RIvs
 kzRj0XwD2nLKBBginC9mUagnPmsz5ULMufmvCgRTsHhuA8RDyjCVUtO20tsQoORfg1PC5QSnu
 XHmwmDYh9ISkP6rhgg2vO/TwzdOSsAZjel1+JAgmCISksbkHfQu7kcSWECo0jgXw0X6ORgp+g
 ecZNNEBVY3JHP7LUIMEgGJH718Z2klCtDcmVhgLQDV1Uzg8qpcD/iLzO/EwkuR7Hf+N/kKgST
 CqvZZU4dOzmhK8hZLQghltD+BxTEwGLbcW7oJpWRFjkjHzRoJSAeMhLhYXtXwKTUFL9pIz6Ma
 OiJDHL+Eyzlv4hX/ALJU/TCF+qmArrFUFoOxYH9MckQ0LQcSn+D2LnmbPE0t/2Zjf6/njgF+4
 5x6SMQnzSYVV214LxMzeuGjs6MQPC0P72u0gp9TPLNWcaMkGmLZcAqsfGJ1X6AIy/HAoMI+bE
 BnmZFwGoVI0lg7RwrdfeT1Nyv/OIpQ1ob+mVmeByLjf6S3GE+MS2axOe4QWHdtr+q+tnM6NDC
 pTZSSWW8y0jbHSWxVrikaEb7lefM0niMUiWP1HHDEaf04Dl1dCGHFw2exAIfOlUxlH8+YzDjS
 GnQUKJgs2lMpetQWY7QMmz3hQyOwo9SOUiBFQdNaPrfmU9zcp925+IM/Wx+SoSnoXLdMZ3eTW
 h6WKEawd7DQuKCO6TAwEXry9LbgcVxMDCyWZBdbH5so7dC6OsSmB3fyB2EJNhsgyUEPko4fFi
 O9ArD0mq7JfJ+HbRBKlDxBnSmcuCTj293cnWaQriT9vldotvgHdN+9CRqoj+ScBaxeN9PyBBm
 RNF85pD4cqf0sm4imKWHV3MUYqM5Xi/0o+68r0jv0mGwRfuh++qtoE8lbK/VbL/v+8eXnCT5q
 3cnKCUph9KHr1xua8xUskP0EZ/dnbu9UhAczwQQ2Vlmb2xx/D7SM8a1TesNEgqSRMHxTaTmPC
 wl1bU3G4AJcUYunVBqWp5WJ03cu2vVCnKThjoRhG8mUc7exzbRYs1+iqdbvKRv5kAgWO1soDN
 DBsZm29yHsfuFV5mAvifVy+9akpgbDJXnHhF4ZFDt133Z1JaxuLyodyBICjylyxv43cHaGLfP
 ycbjweAXvIfMNAGrL5caCyMPhVqZHILGNFvtKIJxlcfIk8dV4zhNjXNxFhoZAyAoJBOK/rMlm
 C0e/CGiFdYntCPVezpJOIvlovk3jKqhXlKVgYar+eUwgTvSHP2jL7aHeK4hH5+cwzgK+XZt+v
 m2hYKF2ES+IKdFE2FK648H1GDBoQT6d+/OKfOxo1VxOR0dnmxqpf8RZ/LgGnyYqke/dUR3sRb
 dk7t76Uh8gkgKdxnBN0pWHNl8+FCDgRaPU/vfCjhhgDf9MuUtHYuHx0E9WkpzbqTCgKMwVDx8
 3fn7ehA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738760355; x=1739365155; i=fiona.klute@gmx.de;
 bh=VbMGJWvmATqjJmNymkjideNQlHBEmWS90CwH2kvuoCI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=KmPFZa73KyurIbtAM8mP8H5jjT+wk8EbC4XxP4H+21luQPKGi0+wWhmmiNHahZ5n
 9fHjzaX8Gd6YA6vamo7QIyawE+EYr4IRHuo9XFEsEkTmdbiHB/M3LVAAF/t1zLQaP
 La63/2ondQmM0m3n4xumBKLO6dUQ0uRpDnsV+Sb/qnNH9YiH3t+X8IiMpvhqWLnzE
 ENcpfFR3XzwM0pxmm1AYybKMEwfsMdYPwcHu/scbuvVJPkAtVgDq/DhYR0PlAhpv3
 aRAv5wZ+gGi1r1qBCP60z5i/PJ/kd1i86PZqF/gWpEUGrx60T5VmmYYyUzehkY3+O
 yDPkYgXD7vrE5n/DOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=KmPFZa73
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d-demos: fix build failure
 on musl
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas!

Am 05.02.25 um 10:20 schrieb Thomas Petazzoni:
> Hello Fiona,
>
> On Fri, 24 Jan 2025 13:47:10 +0100
> Fiona Klute via buildroot <buildroot@buildroot.org> wrote:
>
>> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>>
>> Patch has been on upstream main for close to 2 years.
>>
>> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
>
> Thanks for the fix. Since I don't see any autobuilder failure, do you
> have a defconfig that exhibits the issue?
>
> I tried:
>
> BR2_arm=y
> BR2_cortex_a9=y
> BR2_ARM_ENABLE_VFP=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_MESA3D_DEMOS=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
> BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM=y
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> BR2_PACKAGE_MESA3D_OPENGL_ES=y
> # BR2_TARGET_ROOTFS_TAR is not set
>
> which has a vulkan driver, but it doesn't build the problematic code.

As far as I remember you need need to build full OpenGL GLX, not just
EGL. This is the related part of my defconfig:

BR2_PACKAGE_CAGE=y
BR2_PACKAGE_MESA3D_DEMOS=y
BR2_PACKAGE_LIBGLVND=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_LLVM=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ZINK=y
BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM=y
BR2_PACKAGE_MESA3D_VULKAN_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_OSMESA_GALLIUM=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XKEYBOARD_CONFIG=y
BR2_PACKAGE_LIBDECOR=y
BR2_PACKAGE_LIBFREEGLUT=y

Note that the X stuff is for libraries required for GLX, it's still a
pure Wayland setup.

> Also, we need to understand since when the problem has been happening
> (i.e when the problematic code was added in mesa3d-demos), in order to
> be able to backport the fix if needed.
>
> Basically, when fixing an issue, we should never just fix it. We should
> always explain since when the problem has started happening.
The "uint" use was introduced here:

https://gitlab.freedesktop.org/mesa/demos/-/commit/813ebef7671f0e54d1b55be9e15ae5586b2b9eb1
https://gitlab.freedesktop.org/mesa/demos/-/commit/5aaa7faeb4de9497535738830e6ebb8f10071877

The first and so far only mesa3d-demos release that contains those
commits is 9.0.0 from March 2023. Considering that was added to
Buildroot in early July 2023 (commit
80304d9911f34f8a0173a4f37d52f93177478cc7) it's probably safe to assume
it's in all still supported releases.

That said, making "since when" a strict requirement for accepting a fix
seems problematic to me, because it might discourage people from
participating. In my situation (getting paid to make things work,
including upstreaming) it's a perfectly reasonable request. But people
who send a patch here and there from hobby coding might feel their
contributions aren't valued, and someone who has a manager breathing
down their neck and complaining about time wasted might decide it's not
worth the trouble. In case of doubt having a fix on the development
branch (and backporting if someone bumps into the problem on a release)
seems preferable over not having it at all. ;-)

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
