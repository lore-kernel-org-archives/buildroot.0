Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B16C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 17:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E92661340;
	Tue,  9 Jan 2024 17:49:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E92661340
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hf6aJC4Bb-ev; Tue,  9 Jan 2024 17:49:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 281B460757;
	Tue,  9 Jan 2024 17:49:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 281B460757
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 45ED91BF3C8
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 17:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EBBD417DA
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 17:49:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EBBD417DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BgALMvQ2qSTA for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 17:49:33 +0000 (UTC)
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C63BD417D4
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 17:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C63BD417D4
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 4B2F42C801DE;
 Tue,  9 Jan 2024 18:49:30 +0100 (CET)
Message-ID: <db063503-1757-4d25-8abb-20c43d968a9a@bubu1.eu>
Date: Tue, 9 Jan 2024 18:49:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240109045635.3951040-1-james.hilliard1@gmail.com>
In-Reply-To: <20240109045635.3951040-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1704822570; bh=Z9d5StIU/C1Es+IfE4ZMBALys7rQPIotO7GPAj/qqjY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=gGL/wed9pQhxW8oPrPUwaBNMTdK17BFaDeFA3TLGk6GmJCV9NAcw97eX19mRP6BVt
 ZRbfTyIxOSL2G1KmJLmKeVu3aFtmZAYfcdoaijXEbAQ+x64rxVtIB6TiEGX+UM9+Qq
 J0Kf3TJ2d9t6vnoUmZxylQg/p+2clr3kMxbXNP2cCVyphq1hLQ+LlQhPplkURRWQQR
 8fex8+a1es/PbFRxm2cFUgc+JMPY4JwF2SIamtakOtGlShCELfmnk3KBkf7Kg/NEsd
 HnU/ek1vxSi9qtqjIWtKNXKjltbTStQqbf+e3ICiPXSyhFcUEkPAvzDas5tjajuKVY
 5b9Jpnc4AaVBQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=gGL/wed9
Subject: Re: [Buildroot] [PATCH 1/1] package/python-can: bump to version
 4.3.1
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

On 09.01.24 05:56, James Hilliard wrote:
> Drop no longer used python-aenum runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/python-can/Config.in       | 1 -
>   package/python-can/python-can.hash | 4 ++--
>   package/python-can/python-can.mk   | 4 ++--
>   3 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-can/Config.in b/package/python-can/Config.in
> index 68a9ffca71..27dc16fa33 100644
> --- a/package/python-can/Config.in
> +++ b/package/python-can/Config.in
> @@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_CAN
>   	bool "python-can"
>   	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime

setuptools is no longer required as well:

https://github.com/hardbyte/python-can/commit/1a3f5e3769aa565ada8c27177a94f7db43d019dc

>   	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
> -	select BR2_PACKAGE_PYTHON_AENUM # runtime
>   	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
>   	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
>   	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
> diff --git a/package/python-can/python-can.hash b/package/python-can/python-can.hash
> index 35e752ea54..4e706519be 100644
> --- a/package/python-can/python-can.hash
> +++ b/package/python-can/python-can.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/python-can/json
> -md5  26d799fe952cb590fba03f3d26ee66a4  python-can-4.2.2.tar.gz
> -sha256  6ad50f4613289f3c4d276b6d2ac8901d776dcb929994cce93f55a69e858c595f  python-can-4.2.2.tar.gz
> +md5  a84ace55fdeca8efd50986deacfba584  python-can-4.3.1.tar.gz
> +sha256  008bea1c12e31586e1aa76971126b831bf01056a900e91862a11360e011ab933  python-can-4.3.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.txt
> diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
> index 012c82682c..c7100e3dda 100644
> --- a/package/python-can/python-can.mk
> +++ b/package/python-can/python-can.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -PYTHON_CAN_VERSION = 4.2.2
> -PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/dd/f1/327caaf05b6bca594250053058a2adac537a88dfb5c41bb5498cfda9de78
> +PYTHON_CAN_VERSION = 4.3.1
> +PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/02/fc/d5fd33ee93f17a4eb0dcd75aebf522396e3f511bf474058e99e86ae4e33f
>   PYTHON_CAN_SETUP_TYPE = setuptools
>   PYTHON_CAN_LICENSE = LGPL-3.0
>   PYTHON_CAN_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
