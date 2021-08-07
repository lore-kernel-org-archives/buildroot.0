Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F0FC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 21:55:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F024061057
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 21:55:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F024061057
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B43E3606EC;
	Sat,  7 Aug 2021 21:55:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Np5od7wz5uv6; Sat,  7 Aug 2021 21:55:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDD5460689;
	Sat,  7 Aug 2021 21:55:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D1B821BF3BC
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 21:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBD2560689
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 21:55:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 04ovWgRv2GXN for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 21:55:04 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0953A6064A
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 21:55:03 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.149.252])
 by Aruba Outgoing Smtp  with ESMTPSA
 id CUAgmlY90nyXHCUAgm7khR; Sat, 07 Aug 2021 23:47:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1628372879; bh=TmyQXXqj3UnKLr7CBaklueng067i3QCsnKGQ4MKPmIU=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=VnJpzQbFavthrz4BWaPKRmSq0xVaq2JYetSuvB3THHS9rdhVfuAc6X/IUFgx/NTAc
 4ua8i/JLjoXnjXkVDdF393OWT/UFOBRudw4FHFqfeMJ7Z8dZkY1IoOyIP5XqcqlDmt
 cG5QzjCkHAPBvYHldaj1vKT0qlDo2gJd9xR0xUEebN/NNR3jcg1G4bCMhAwa4Mlgfz
 CZrYAx07gsZnmlGo3wXLdMQpFTGPkse+LjeW1GpGGId8JM1M3Gl9+FP5steByHiT5q
 hBnNQv713MQYbNzC8CtIF40tDt3SXn6uq1iPzn+7KnHdyCW8n3Yvjv5v9Xdd74ePrm
 RmXySr/ag+3yw==
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210807213254.2103314-1-fontaine.fabrice@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <352f1f15-f569-cd20-db72-3b47b2949084@benettiengineering.com>
Date: Sat, 7 Aug 2021 23:47:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807213254.2103314-1-fontaine.fabrice@gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfJKaJBCyGQHK9H14amsq73s4NScnk6RxW8DKTeGY0Zr/2cBJJLTplMJ4KSGiwUnDWnzblFOMr1njU4QB3Q+KU2GqXdZEXHjoUaN4AB4pt6z0hNu5txgR
 HmkiPK4Cbh0+OQJHeVC2+47FiuS7mN2gGln6lhCJu8pThWsL8hZCacpYALMGCzzmJWgpB75ixDNWkf4ZrVlZ8N/P9oJM8uncG3AgNZXA5AJXbPflO70pnncS
 Qfrt8Uo34mlfTgpGYnyEkW5fAoga3vF1ORO9qmrB3SHztHw6ISOyfKqBxkjDkkPJ
Subject: Re: [Buildroot] [PATCH 1/1] package/libnss: fix build on ARM big
 endian
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Fabrice,

On 8/7/21 11:32 PM, Fabrice Fontaine wrote:
> Fix the follownig build failure on ARM big endian raised since bump to
> version 3.68 in commit 0a73b9b962421ce7a72c88e5f5bbd8849f21b041:
> 
> Linux2.6_aarch64_aarch64_be-linux-gnu-gcc_glibc_PTH_64_DBG.OBJ/Linux_SINGLE_SHLIB/sha256-armv8.o: In function `SHA256_Compress_Native':
> sha256-armv8.c:(.text.SHA256_Compress_Native+0x0): multiple definition of `SHA256_Compress_Native'
> Linux2.6_aarch64_aarch64_be-linux-gnu-gcc_glibc_PTH_64_DBG.OBJ/Linux_SINGLE_SHLIB/sha512.o:sha512.c:(.text.SHA256_Compress_Native+0x0): first defined here
> Linux2.6_aarch64_aarch64_be-linux-gnu-gcc_glibc_PTH_64_DBG.OBJ/Linux_SINGLE_SHLIB/sha256-armv8.o: In function `SHA256_Update_Native':
> sha256-armv8.c:(.text.SHA256_Update_Native+0x0): multiple definition of `SHA256_Update_Native'
> Linux2.6_aarch64_aarch64_be-linux-gnu-gcc_glibc_PTH_64_DBG.OBJ/Linux_SINGLE_SHLIB/sha512.o:sha512.c:(.text.SHA256_Update_Native+0x0): first defined here
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/237aba0c16a34fec1b0fe50fe08cace438eda1bf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   ...2.c-fix-SHA256-redefinition-on-ARM-b.patch | 47 +++++++++++++++++++
>   1 file changed, 47 insertions(+)
>   create mode 100644 package/libnss/0001-lib-freebl-sha512.c-fix-SHA256-redefinition-on-ARM-b.patch
> 
> diff --git a/package/libnss/0001-lib-freebl-sha512.c-fix-SHA256-redefinition-on-ARM-b.patch b/package/libnss/0001-lib-freebl-sha512.c-fix-SHA256-redefinition-on-ARM-b.patch
> new file mode 100644
> index 0000000000..f925f20051
> --- /dev/null
> +++ b/package/libnss/0001-lib-freebl-sha512.c-fix-SHA256-redefinition-on-ARM-b.patch
> @@ -0,0 +1,47 @@
> +From 434d79c52db5b680accc531572319bd7094fa470 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sat, 7 Aug 2021 23:19:01 +0200
> +Subject: [PATCH] lib/freebl/sha512.c: fix SHA256 redefinition on ARM big
> + endian
> +
> +For an unknown reason, SHA256_{Compress,Update}_Native are defined in
> +lib/freebl/sha512.c if IS_LITTLE_ENDIAN is undefined since version 3.68
> +and
> +https://github.com/nss-dev/nss/commit/e1e00f21f2d73e0d5d27651ad5606efa5714abe4
> +
> +This raises the following build failure on ARM big endian:
> +
> +Linux2.6_aarch64_aarch64_be-linux-gnu-gcc_glibc_PTH_64_DBG.OBJ/Linux_SINGLE_SHLIB/sha256-armv8.o: In function `SHA256_Compress_Native':
> +sha256-armv8.c:(.text.SHA256_Compress_Native+0x0): multiple definition of `SHA256_Compress_Native'
> +Linux2.6_aarch64_aarch64_be-linux-gnu-gcc_glibc_PTH_64_DBG.OBJ/Linux_SINGLE_SHLIB/sha512.o:sha512.c:(.text.SHA256_Compress_Native+0x0): first defined here
> +Linux2.6_aarch64_aarch64_be-linux-gnu-gcc_glibc_PTH_64_DBG.OBJ/Linux_SINGLE_SHLIB/sha256-armv8.o: In function `SHA256_Update_Native':
> +sha256-armv8.c:(.text.SHA256_Update_Native+0x0): multiple definition of `SHA256_Update_Native'
> +Linux2.6_aarch64_aarch64_be-linux-gnu-gcc_glibc_PTH_64_DBG.OBJ/Linux_SINGLE_SHLIB/sha512.o:sha512.c:(.text.SHA256_Update_Native+0x0): first defined here
> +
> +Revert this change as it seems completely unrelated to the commit title
> +"Bug 1655493 - Support SHA2 HW acceleration using Intel SHA Extension"

I'm not completely sure about this, since I remember most of armv8 
accelerations only work for LITTLE_ENDIAN. But I can't login to the 
Mozilla Bugzilla because of two factor authentication I've never enabled 
and I've asked help to fix this days ago with no answer. Do you have 
access to it?

Can you please clarify if that acceleration is valid on BIG_ENDIAN too?
It's not written anywhere, but more than one lib/freebl/ lib 
acceleration has been done only for LITTLE_ENDIAN. What worries me is 
the hash table at the top that *maybe* is only suitable for LITTLE_ENDIAN:
https://hg.mozilla.org/projects/nss/file/tip/lib/freebl/sha256-armv8.c#l24

For example check this patch I've sent time ago:
https://hg.mozilla.org/projects/nss/rev/fa0d958de0c3cf99a7ec66e819b128c7bc88ff9f
and the related bug:
https://bugzilla.mozilla.org/show_bug.cgi?id=1580126

That makes me believe that is only LITTLE_ENDIAN compatible also due to 
this:
https://hg.mozilla.org/projects/nss/file/tip/lib/freebl/sha512.c#l167

BUT I can't reach anyone, and they don't sign off the commits, so no 
e-mail to CC. Maybe you can through Mozilla Bugzilla?

Thanks in advance
Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> +Fixes:
> + - http://autobuild.buildroot.org/results/237aba0c16a34fec1b0fe50fe08cace438eda1bf
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + nss/lib/freebl/sha512.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/nss/lib/freebl/sha512.c b/nss/lib/freebl/sha512.c
> +index 946ab9f7f..3ec414b52 100644
> +--- a/nss/lib/freebl/sha512.c
> ++++ b/nss/lib/freebl/sha512.c
> +@@ -164,7 +164,7 @@ static void SHA256_Compress_Generic(SHA256Context *ctx);
> + static void SHA256_Update_Generic(SHA256Context *ctx, const unsigned char *input,
> +                                   unsigned int inputLen);
> +
> +-#if !defined(USE_HW_SHA2) || !defined(IS_LITTLE_ENDIAN)
> ++#if !defined(USE_HW_SHA2)
> + void
> + SHA256_Compress_Native(SHA256Context *ctx)
> + {
> +--
> +2.30.2
> +
> 

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
