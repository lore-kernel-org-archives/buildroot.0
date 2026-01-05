Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A122AC79F9C
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 14:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 604BD60AA7;
	Mon,  5 Jan 2026 14:42:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SyjUxSi5mSIZ; Mon,  5 Jan 2026 14:42:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8717660A9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767624159;
	bh=53zvMl7kV8A5lOXotF92EGWpZbZSJbzIxALeOCan3Rg=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=ipVj3kxSSjaA6x9elW2uafVSWmdMHG7ZinpVVuNpuYbPqzHa4kV8et81QGjUcdt/w
	 VNUxWqt6sstpwjHqgjgT56+2BQHwrIiSt58BYADmmVQNLuMvk/6vL92yIadVTGLDyi
	 aIrjidvXoUvCFVYrqBCLHFymeXf6yMeIzRbW+qtF1HTkCzdj0b/3ZOn+Lc/3UGLzbC
	 gwBDek2ZWrH8WechpkjpV46SnbcGhw7qzCaH/jsTsBY6aXOfbqwN6b/OmfhA0Ajxjx
	 Onq+/Nask1XWABOpnVYLVUvJpN03xiFU7NiGOz9pm1wFkD0sP6ZNYIKGp7KVcaKJdP
	 gZ5R30jhkw0Yw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8717660A9D;
	Mon,  5 Jan 2026 14:42:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 04BF5249
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 14:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF0CA60A9D
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 14:42:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TaTI_4EwzAAQ for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 14:42:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5B06360A90
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B06360A90
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B06360A90
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 14:42:36 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.30.53]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mi2Jn-1w7Aee3iWv-00bWJz; Mon, 05
 Jan 2026 15:42:34 +0100
Message-ID: <9bff7357-ef32-4d03-873e-7d052655158b@gmx.de>
Date: Mon, 5 Jan 2026 15:42:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260104143240.4126891-1-fiona.klute@gmx.de>
 <20260104143240.4126891-2-fiona.klute@gmx.de>
 <20260104174637.3421eaea@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260104174637.3421eaea@windsurf>
X-Provags-ID: V03:K1:eZdkpJ2L68xpFgeeovOHGpjR3a+oBNT82zTjsfmkWwfh4SywvbX
 YfnUP2x31zhDKzffGGkkcKWkYueqTLpbGTKDQQg7kIjoXTxvzM714KuhPLn9vHyO0ge7jpk
 zLcjkyKrmzaCvQsEAMQxJ4J60lTTimjIYBAHUpnuPfMzEAYOoH7eEjLi6uqN4Cc0t11dUA0
 B86E2w/K+LQQg2zhi3laQ==
UI-OutboundReport: notjunk:1;M01:P0:Wyj4vQh/C7o=;ARC47rCeM1FZUzQdRY9Ya3jOUOP
 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
 gLcXEXPUZ9ls7hejX5L4kLUkVVLV1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1767624154; x=1768228954; i=fiona.klute@gmx.de;
 bh=IBiPRw69iATXacu1I/d5x9Y//a+RJCnsb0slnoqGlHg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=KPUWl+mAeojrdRLgx3Z56sYgBQuphoMM1nHJYdDeznotJzhACqOTDMyiNJGSP0tA
 Jt0CdrnLVbr0Uz//rfOEWC6Ek9X3kpF84LmSvnNXIcn9IZnnI3J+jvBql5eaI4PRn
 Hlf3SPPH+E3FIVOy3DUMRqidI5uMWGSf+Nlvl7dLMtNoDfdhugPhNK9ciaVUEoz0+
 mIGexi1TgN84bKsGP2HOqdr13wz9rndNFbmCjq9iSyraYWvi30UMEbSd65U8l0qcw
 ESameS9GwKA8lgP63CBIJ8M0DJwRkLTPnkSk4SoEGAUWIuP11D9Ktn7+3hbXhuK7H
 1w8y4Bodc3MG4ysebw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=KPUWl+mA
Subject: Re: [Buildroot] [PATCH 2/2] package/python-memray: require
 toolchain with C++ support
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas!

Am 04.01.26 um 17:46 schrieb Thomas Petazzoni:
> Hello Fiona,
> 
> On Sun,  4 Jan 2026 15:32:40 +0100
> Fiona Klute <fiona.klute@gmx.de> wrote:
> 
>> During the build Cython creates C++ source that needs to be
>> compiled. The missing dependency did not show in the existing runtime
>> test because the Bootlin stable toolchains include C++ support.
>>
>> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
>> ---
>>   package/python-memray/Config.in | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/package/python-memray/Config.in b/package/python-memray/Config.in
>> index afd0adc901..75f13e8597 100644
>> --- a/package/python-memray/Config.in
>> +++ b/package/python-memray/Config.in
>> @@ -5,6 +5,7 @@ config BR2_PACKAGE_PYTHON_MEMRAY
>>   	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
>>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # elfutils/libdebuginfod
>>   	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
>> +	depends on BR2_INSTALL_LIBSTDCPP
>>   	select BR2_PACKAGE_ELFUTILS
>>   	select BR2_PACKAGE_ELFUTILS_LIBDEBUGINFOD
>>   	select BR2_PACKAGE_LIBUNWIND
> 
> I realize that the whole package lacks a Config.in comment documenting
> the dependencies, could you add it, perhaps as a preparatory commit?
> 
> Also, please indicate in the commit log which commit introduced the
> issue.
I've just sent v2 of the series that should address both issues.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
