Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AC8EE4993
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 13:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA0D9415DB;
	Sun, 20 Aug 2023 13:45:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA0D9415DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eV5uFEQU6aUy; Sun, 20 Aug 2023 13:45:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80A11415E3;
	Sun, 20 Aug 2023 13:45:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80A11415E3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD8811BF46D
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 13:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 942AC60D79
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 13:45:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 942AC60D79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T6GHq9grBp7M for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 13:45:08 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 134A660FE1
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 13:45:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 134A660FE1
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 6C9F678035D;
 Sun, 20 Aug 2023 15:45:03 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:49968])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 20 Aug 2023 15:45:03 +0200
MIME-Version: 1.0
Date: Sun, 20 Aug 2023 15:45:03 +0200
From: Julien Olivain <ju.o@free.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <20230820125135.GI1778688@scaer>
References: <20230820103343.353423-1-ju.o@free.fr>
 <20230820125135.GI1778688@scaer>
User-Agent: Webmail Free/1.6.1
Message-ID: <519bd8e6c278a404c6f6db53c6a8c04b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692539104;
 bh=NpuzalUCTJJ4yIrzQIemXU5wa7n++IUidcU4UHVoAEU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vAEYH2x8hJmbUTODx+EzG353OjfSEgSzIwx07Svy0yr1CmGMKheOK/Y5Gx6bU4onb
 Q1AxVsSaaAoa0YW0nE19ikxiPyUWJKgUVywwWaUm40X9EMIR3KgaeJ9RO1f05oTmj4
 fNWoeY2kbOB3eZeBhy6LfutNkSR3YdkY+vL5FkJkQvM0SjGQUTqV1h5ow9HmGJcn7D
 iqk7v2Cx0vnQXmFDPnsSA5mvzwE5a/z4Fbag0QoDNVhTEBnkW0WvePwJC86NUAoAB9
 72NKD7UWhBeDnQJPDhU0+SOJ/xe4U9Xj5JDgFIgBZ4cAJmbRE6nV3Z6bWxAGs2010j
 +L0hShE/dNyBA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vAEYH2x8
Subject: Re: [Buildroot] [PATCH 1/1]
 support/testing/tests/package/test_nftables.py: new runtime test
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On 20/08/2023 14:51, Yann E. MORIN wrote:
> Julien, All,
> 
> On 2023-08-20 12:33 +0200, Julien Olivain spake thusly:
>> This runtime test was suggested in discussion [1]. It should detect
>> potential runtime failures such as the one fixed in commit eb74998125
>> "package/nftables: fix the build of the pyhon bindings".
>> 
>> [1] 
>> https://lists.buildroot.org/pipermail/buildroot/2023-August/672864.html
>> 
>> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
> 
> Thanks for this new comprehensive test! :-)
> 
> [--SNIP--]
>> diff --git a/support/testing/tests/package/test_nftables.py 
>> b/support/testing/tests/package/test_nftables.py
>> new file mode 100644
>> index 0000000000..7fcc2902b6
>> --- /dev/null
>> +++ b/support/testing/tests/package/test_nftables.py
>> @@ -0,0 +1,110 @@
>> +import os
>> +
>> +import infra.basetest
>> +
>> +
>> +class TestNftables(infra.basetest.BRTest):
>> +    config = \
>> +        """
>> +        BR2_aarch64=y
>> +        BR2_TOOLCHAIN_EXTERNAL=y
>> +        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
>> +        BR2_LINUX_KERNEL=y
> 
> Why do we need to build a special kernel, instead of using the 
> pre-built
> one?

A kernel need to be rebuilt to let the macro 
NFTABLES_LINUX_CONFIG_FIXUPS
enable the needed kernel config. When I tested the pre-built Kernel, 
"nft"
invocations were failing due to some missing nftables kernel support. I
hesitated to add a comment for that. I should have done it ;)

Do you want me to send a v2? Or will you do the edit yourself?

>> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.46"
>> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>> +        
>> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
>> +        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>> +        BR2_PACKAGE_NFTABLES=y
>> +        BR2_PACKAGE_NFTABLES_PYTHON=y
> 
> BR2_PACKAGE_NFTABLES_PYTHON=y is the default, so it is not needed.
> Except fir the kernel question, I could have fixed that when applying,
> but I'd rather know why we can't use the prebuilt kernel (because it
> takes so long to build a soecial kernel...)
> 
> Regards,
> Yann E. MORIN.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
