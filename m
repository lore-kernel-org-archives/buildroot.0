Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C74DC7115A
	for <buildroot@archiver.kernel.org>; Sun, 22 Jun 2025 10:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D98741C88;
	Sun, 22 Jun 2025 10:27:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OJ0FQHapdhWr; Sun, 22 Jun 2025 10:27:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5230541C76
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5230541C76;
	Sun, 22 Jun 2025 10:27:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 87FE412C
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 10:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6557C60A3F
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 10:27:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i-IxjJ9T2cXx for <buildroot@buildroot.org>;
 Sun, 22 Jun 2025 10:27:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9B75660A38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B75660A38
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B75660A38
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 10:27:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 6DCE0780372;
 Sun, 22 Jun 2025 12:27:26 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Jun 2025 12:27:26 +0200
MIME-Version: 1.0
Date: Sun, 22 Jun 2025 12:27:26 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
In-Reply-To: <20250621190820.516046-1-bernd@kuhls.net>
References: <20250621190820.516046-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <2148bd7422a7bc56e413ce389a9931b8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750588049;
 bh=R1Qn3iGS1L91UXvNDnZYfTmE8D6BK5BrR8QbrWOH4UI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OkCoOigEsYaRz0GTcuo04zNXLF4jKoomSXYDTYxsfeovg8dQ97W5B3g8f5VMYK5ew
 AZ1sX+Pn+dwA072IF1xZjPubWZKZ3ASU01v5gblqeVb8aVu+xF0z3Js1ANYfYzG1Z5
 RigEu1ghJMBH+LD1SIsakd+VuLrP8a1nrm4gMP7Yb0aa5esIpvVeL/O1ZwiwaTvYtI
 JXWH13A6MDbQhuR4cYosjOtL5u8ZY2yrifMMZcU0jVyTxwPOPPqbybJj0RkQ5KlcUt
 Jhl5mBTfSG3r1/eet3jM8K6U37zYbRv70dKY3t8dSXxTMCg/fg/CGn6y/tOoR4gv4S
 ggrjeiqRhX0nA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OkCoOigE
Subject: Re: [Buildroot] [PATCH 1/2] package/freeswitch: add optional
 support for OpenCV4
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

On 21/06/2025 21:08, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/freeswitch/Config.in     | 3 +++
>  package/freeswitch/freeswitch.mk | 5 +++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/package/freeswitch/Config.in 
> b/package/freeswitch/Config.in
> index 80d18e064d..4d700e549f 100644
> --- a/package/freeswitch/Config.in
> +++ b/package/freeswitch/Config.in
> @@ -14,6 +14,9 @@ config BR2_PACKAGE_FREESWITCH
>  	select BR2_PACKAGE_OPENCV3_LIB_HIGHGUI if BR2_PACKAGE_OPENCV3
>  	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC if BR2_PACKAGE_OPENCV3
>  	select BR2_PACKAGE_OPENCV3_LIB_OBJDETECT if BR2_PACKAGE_OPENCV3
> +	select BR2_PACKAGE_OPENCV4_LIB_HIGHGUI if BR2_PACKAGE_OPENCV4
> +	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC if BR2_PACKAGE_OPENCV4
> +	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT if BR2_PACKAGE_OPENCV4

This patch introduces Kconfig warnings:

     WARNING: unmet direct dependencies detected for 
BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
       Depends on [n]: BR2_PACKAGE_OPENCV4 [=y] && 
!BR2_TOOLCHAIN_USES_UCLIBC [=n] && BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS 
[=n] && BR2_TOOLCHAIN_GCC_AT_LEAST_8 [=y]
       Selected by [y]:
       - BR2_PACKAGE_FREESWITCH [=y] && BR2_INSTALL_LIBSTDCPP [=y] && 
!BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU 
[=y] && BR2_USE_WCHAR [=y] && BR2_PACKAGE_OPENCV4 [=y]

BR2_PACKAGE_OPENCV4_LIB_OBJDETECT has dependencies that should
have been propagated. See:
https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05/package/opencv4/Config.in#L158

Could you have a look please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
