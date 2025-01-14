Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F03CE77188
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 18:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B7506078F;
	Tue, 14 Jan 2025 18:18:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id krCsoiymB01i; Tue, 14 Jan 2025 18:18:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4869C60ADF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4869C60ADF;
	Tue, 14 Jan 2025 18:18:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CECCE94B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 18:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF97C408BF
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 18:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MheIpZtB5p63 for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 18:18:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 137EE40154
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 137EE40154
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 137EE40154
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 18:18:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 9655A2003F2;
 Tue, 14 Jan 2025 19:18:27 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:53570])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Jan 2025 19:18:27 +0100
MIME-Version: 1.0
Date: Tue, 14 Jan 2025 19:18:27 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>, buildroot@buildroot.org,
 Guillaume William Brs <guillaume.bressaix@gmail.com>
In-Reply-To: <20250113153412.51ff0e04@windsurf>
References: <20250112223142.770914-1-nemaakhilesh@gmail.com>
 <20250113153412.51ff0e04@windsurf>
User-Agent: Webmail Free/1.6.9
Message-ID: <fcaf9348ede608925bad155bdbd2bf53@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736878710;
 bh=QPLrYnEXtk3al2OGfRAMDrAm0rWsmUPY/cAJpl1zDLM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=M3f8bIr3f5YmzPcdEgWgOX+EsygLay0oituqso20ERPS/qSWJWqI1ckD43/0YQVct
 Z+EqHZCqbzr0IGYYZ5wq5lhHT7jFS4E/MI0OUr34R2TIMp3Hvpas9uEjjCPurF5RGo
 RUKmjK22Uosv0Xug4SMte/TO4MW30nwrbOpxq6Cf6nrivbtRwJx4LkGZGoIZYKRm+q
 k6NjU19MCngVXh9eN9FkTtk3zEfQzv4C9tWL9CDR+MXfXxSsAiT7izcN3Zhec6fVvp
 sMmrSJAN3i2V4WHiOmXn+AvEjMOsC4cVUWCDq1z8IetOIVId429oaXZcgcim98xZRj
 EuVzI184OU9xA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=M3f8bIr3
Subject: Re: [Buildroot] [PATCH 1/1] package/libxcrypt: bump version to
 4.4.37
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

Hi Thomas, Akhilesh,

On 13/01/2025 15:34, Thomas Petazzoni via buildroot wrote:
> On Sun, 12 Jan 2025 14:31:42 -0800
> Akhilesh Nema <nemaakhilesh@gmail.com> wrote:
> 
>> diff --git a/package/libxcrypt/Config.in b/package/libxcrypt/Config.in
>> index 38c75b5e63..508e1a43cd 100644
>> --- a/package/libxcrypt/Config.in
>> +++ b/package/libxcrypt/Config.in
>> @@ -1,6 +1,7 @@
>>  config BR2_PACKAGE_LIBXCRYPT
>>  	bool "libxcrypt"
>>  	depends on BR2_TOOLCHAIN_USES_GLIBC
>> +	select BR2_PACKAGE_HOST_PKGCONF
> 
> We really don't enforce selecting this option, so I'd rather see it not
> done, than done inconsistently between packages.
> 
>> +LIBXCRYPT_DEPENDENCIES = host-pkgconf
>> +HOST_LIBXCRYPT_DEPENDENCIES = host-pkgconf
> 
> I'm actually surprised by the dependency on host-pkgconf. host-pkgconf
> is normally used to detect dependencies, but libxcrypt has no
> dependencies other than the toolchain. So why is it needed now?
> Explanations in your commit log would be very useful.

As Akhilesh pointed out in the v1 thread, this was an upstream issue:
https://github.com/besser82/libxcrypt/issues/198

Hopefully, this was quickly fixed upstream. There is already a
new version:
https://github.com/besser82/libxcrypt/releases/tag/v4.4.38

So we could just skip this 4.4.37 version, and bump directly
to 4.4.38 (and not add the dependencies).

Akhilesh: could make sure to test this new bump with at least
a "utils/test-pkg -a -p libxcrypt" please? (or add in a comment
the test you did).

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
