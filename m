Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5099C5B572
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 15:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D30860632;
	Sun, 16 Aug 2026 15:49:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C5FxqMmS3xIv; Sun, 16 Aug 2026 15:49:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E6826061E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786895349;
	bh=PG36VkMe6tVRbRr61mqEOZQtp1ahGPv0ItUVQfUCoDo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gzCXGV0HNqNDfTZLCw4jiHiuJFry0ZQ7QxzZhHhUZ2CboM3+tf5vWWdyTxerBmZ4K
	 5t5o3S7EknTTWoOvu5xxvbpghEN+vTLmHKwFWeoJWhw3LnB8Q8GPTYwT31LrlHDs/J
	 P3zZuQiiFY509I3LjeCQZM6Ir/Tngt34eyhvp0/mzBccmCw6A8VJFQAbMAQ9/XyiC2
	 c2j30NxlitedBPdxZMTwqTzpWlhvpyhY3JdcyfKDvI97qwGd7ww5pl26jlffsmn08G
	 DvgImEgCM0Rwmxnh80R0gboLBqTKSS4jhUcwy1tlsxv8memPfH5ZsCpFZnf9ENRl8Y
	 Ij/h2nUA82+OA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E6826061E;
	Sun, 16 Aug 2026 15:49:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E91EA2B2
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 15:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6705406CF
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 15:49:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id um0sEi4m1LOZ for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 15:49:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AE88440684
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE88440684
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE88440684
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 15:49:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id C381E2003CA;
 Sun, 16 Aug 2026 17:49:01 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Aug 2026 17:49:01 +0200
MIME-Version: 1.0
Date: Sun, 16 Aug 2026 17:49:01 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org, Sergey Matyukevich <geomatsi@gmail.com>
In-Reply-To: <aoGwcjcKAP0U4OnW@waldemar-brodkorb.de>
References: <aoGO11vvqxF6VTOy@waldemar-brodkorb.de>
 <aoGwcjcKAP0U4OnW@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <baca04d491cacc42082435db7be33f74@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/wpa_supplicant: security bump to
 2.12
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Waldemar, Sergey,

On 16/08/2026 14:43, Waldemar Brodkorb wrote:
> Hi,
> 
> forgot to add Maintainer to CC.
> 
> Waldemar Brodkorb wrote,
> 
>> See here for a Changelog:
>> https://git.w1.fi/cgit/hostap/tree/wpa_supplicant/ChangeLog?id=e6386389448a4e0ec568fa7a27026e03f95bb768
>> 
>> Security issues fixed in this release:
>> https://w1.fi/security/2026-4/incomplete-bounds-checking-of-mesh-ampe-messages-in-wpa_supplicant.txt
>> https://w1.fi/security/2026-3/unexpected-sae-commit-message-contents-terminating-wpa_suppliant.txt
>> https://w1.fi/security/2026-2/missing-network-context-validation-for-pmksa-caching.txt
>> https://w1.fi/security/2026-1/missing-ml-parsing-validation.txt
>> 
>> Patches 0001 and 0002 are upstream.
>> 
>> Tested on Raspberry PI4 (64 Bit).
>> 
>> License changed:
>> -Copyright (c) 2002-2024, Jouni Malinen <j@w1.fi> and contributors
>> +Copyright (c) 2002-2026, Jouni Malinen <j@w1.fi> and contributors
>> 
>> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
>> ---
[...]
>> diff --git a/package/wpa_supplicant/wpa_supplicant.hash 
>> b/package/wpa_supplicant/wpa_supplicant.hash
>> index 2f38dc257a..bea1e99b1f 100644
>> --- a/package/wpa_supplicant/wpa_supplicant.hash
>> +++ b/package/wpa_supplicant/wpa_supplicant.hash
>> @@ -1,3 +1,3 @@
>>  # Locally calculated
>> -sha256  
>> 912ea06f74e30a8e36fbb68064d6cdff218d8d591db0fc5d75dee6c81ac7fc0a  
>> wpa_supplicant-2.11.tar.gz
>> -sha256  
>> f1b5992bbdd015c3ccb7faaadd62ef58ed821e15b9329bf2ceb27511ccc3f562  
>> README
>> +sha256  
>> 08e23937e16d0155e55cab2b51f51fbe10d80a1aa91c4e15442645059b737ef6  
>> wpa_supplicant-2.12.tar.gz
>> +sha256  
>> 83be1b142c59ccf0d6c5dde0695d8f84dfba109bea058e78ec2942389ccf327f  
>> README
>> diff --git a/package/wpa_supplicant/wpa_supplicant.mk 
>> b/package/wpa_supplicant/wpa_supplicant.mk
>> index fe4bc34d55..93ac228947 100644
>> --- a/package/wpa_supplicant/wpa_supplicant.mk
>> +++ b/package/wpa_supplicant/wpa_supplicant.mk
>> @@ -4,7 +4,7 @@
>>  #
>>  
>> ################################################################################
>> 
>> -WPA_SUPPLICANT_VERSION = 2.11
>> +WPA_SUPPLICANT_VERSION = 2.12

While testing, I was wondering if we shouldn't also update
hostapd to v2.12: https://w1.fi/hostapd/

What do you think?

>>  WPA_SUPPLICANT_SITE = http://w1.fi/releases
>>  WPA_SUPPLICANT_LICENSE = BSD-3-Clause
>>  WPA_SUPPLICANT_LICENSE_FILES = README
>> --
>> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
