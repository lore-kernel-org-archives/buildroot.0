Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18BCC4707C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 21:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A162703D4;
	Fri, 12 Jan 2024 21:15:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A162703D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q19HlDcBpe0L; Fri, 12 Jan 2024 21:15:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9139D703D2;
	Fri, 12 Jan 2024 21:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9139D703D2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E6DFA1BF2C5
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 21:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFA3F703D2
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 21:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFA3F703D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BYE5RxhXIDpq for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 21:15:21 +0000 (UTC)
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F09E6FCB6
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 21:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F09E6FCB6
Received: from [192.168.50.163] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id OOs1rP2n2mADrOOs1rjad0; Fri, 12 Jan 2024 22:15:17 +0100
Message-ID: <2c5c98ae-1bd7-4773-94ce-5b4409503053@benettiengineering.com>
Date: Fri, 12 Jan 2024 22:15:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240112192003.1004726-1-fontaine.fabrice@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240112192003.1004726-1-fontaine.fabrice@gmail.com>
X-CMAE-Envelope: MS4xfOuS9dGgWosmS/G88aCABWzooGM1TUW6YPnM3t0HPidNVs7opRev/gkEFUJW1ZSC/yL0VgqN+b09mX0HEiq3NPn4lPnPY1UaIe5siTe8PNXFdAe9uZDz
 CRJNEu3uJf8SBOyG5rEptrIkyboWfMIiQCTtKZ7wTbsT1q2t8jIRXUbhcu6lQ2hs+Plv55mvDsCifDBwVpUSoZ3xoSsbyWIsOnitnru90MU4uRKcsinB5+8W
 AH/LPru12AwKsoHUpuXFKkobZSV2qjCPXUUEIjj6/3z6l/8t4+mIGVeAwnp2gRGU
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1705094117; bh=02eyHT5yYbzawofj5RJ23lGh55DyUJOj9xaDBcPyUng=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=MQ/gA+xZYrbTAMvCWWJiyyXwkqrT9CKez9G0TXsaCXloTXcytkM8LpUsxl4tUAMaq
 3yc8eOu0oWKfX1RK4H9brcJZEt6jjcWNs6RQssl9iQvBb0lUQYQycyp1HzWUif2Eap
 XhFP/dh2Ht5BDduaZD9XE20fcUkg/906AWA+PGZ2wCVjFytFZ3tRtgvfdqcb8hjXZf
 iFOJt10yWX/1rK5iUdH26ip4Df4GPwfCxnSlDr6HilATKny68yauCk19tdO1k58XoV
 RFmS0oET4AobLclz97P3nSrEwMfrGI+I01ebREvrEUXXDSG7gPdcNYxOx8ZxeEdzLx
 So/aS0KAWlIHA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=MQ/gA+xZ
Subject: Re: [Buildroot] [PATCH 1/1] package/libnss: fix musl build
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

On 12/01/24 20:20, Fabrice Fontaine wrote:
> Fix following musl build failure raised at least since bump to version
> 3.84 in commit bcdf2fc0e41832147d3fc398070074be29c159d4:
> 
> /home/buildroot/autobuild/instance-3/output-1/host/bin/microblazeel-linux-gcc -shared   -Wl,-z,defs -Wl,-soname -Wl,libfreebl3.so  -Wl,--version-script,Linux2.6_microblazeel_microblazeel-linux-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/freebl.def -Wl,-Bsymbolic -o Linux2.6_microblazeel_microblazeel-linux-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/libfreebl3.so Linux2.6_microblazeel_microblazeel-linux-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/lowhash_vector.o      -ldl -lc
> /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-musl/11.2.0/../../../../microblazeel-buildroot-linux-musl/bin/ld: Linux2.6_microblazeel_microblazeel-linux-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/lowhash_vector.o: in function `loader_GetOriginalPathname':
> (.text.loader_GetOriginalPathname+0x1c4): undefined reference to `PR_SetError'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/9a51138bb8a65f7f76a01d0e73c451273e6eb49e
>   - http://autobuild.buildroot.org/results/d00d22f1bfee5c175f3266ff16124632906463c3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thank you for the patch. This is not a fix but a work-around. I've tried
several times to fix the problem from the root, but I haven't made it
and given up in the end.

So to me this looks ok, at least better than the actual situation, so:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

> ---
>   ...l-genload.c-drop-call-to-PR_SetError.patch | 39 +++++++++++++++++++
>   1 file changed, 39 insertions(+)
>   create mode 100644 package/libnss/0002-lib-freebl-genload.c-drop-call-to-PR_SetError.patch
> 
> diff --git a/package/libnss/0002-lib-freebl-genload.c-drop-call-to-PR_SetError.patch b/package/libnss/0002-lib-freebl-genload.c-drop-call-to-PR_SetError.patch
> new file mode 100644
> index 0000000000..fcbb434727
> --- /dev/null
> +++ b/package/libnss/0002-lib-freebl-genload.c-drop-call-to-PR_SetError.patch
> @@ -0,0 +1,39 @@
> +From ac93583db67145467c0698f6adba5ee907d9216b Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 12 Jan 2024 20:13:30 +0100
> +Subject: [PATCH] lib/freebl/genload.c: drop call to PR_SetError
> +
> +Drop call to PR_SetError in genload.c as already done in
> +lowhash_vector.c to avoid adding a dependency on a function defined in
> +nspr and raising the following build failure when FREEBL_NO_DEPEND is
> +set to 1 (default on Linux):
> +
> +/home/buildroot/autobuild/instance-3/output-1/host/bin/microblazeel-linux-gcc -shared   -Wl,-z,defs -Wl,-soname -Wl,libfreebl3.so  -Wl,--version-script,Linux2.6_microblazeel_microblazeel-linux-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/freebl.def -Wl,-Bsymbolic -o Linux2.6_microblazeel_microblazeel-linux-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/libfreebl3.so Linux2.6_microblazeel_microblazeel-linux-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/lowhash_vector.o      -ldl -lc
> +/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-musl/11.2.0/../../../../microblazeel-buildroot-linux-musl/bin/ld: Linux2.6_microblazeel_microblazeel-linux-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/lowhash_vector.o: in function `loader_GetOriginalPathname':
> +(.text.loader_GetOriginalPathname+0x1c4): undefined reference to `PR_SetError'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/d00d22f1bfee5c175f3266ff16124632906463c3
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Upstream: https://github.com/nss-dev/nss/pull/28

This ^^^ is not Mozilla upstream and I think they would never accept it,
so I would set Upstream: to "N/A"

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

> +---
> + lib/freebl/genload.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/nss/lib/freebl/genload.c b/nss/lib/freebl/genload.c
> +index 832deb58c..1f145048b 100644
> +--- a/nss/lib/freebl/genload.c
> ++++ b/nss/lib/freebl/genload.c
> +@@ -43,7 +43,7 @@ loader_GetOriginalPathname(const char* link)
> +     PRUint32 iterations = 0;
> +     PRInt32 len = 0, retlen = 0;
> +     if (!link) {
> +-        PR_SetError(PR_INVALID_ARGUMENT_ERROR, 0);
> ++        /*PR_SetError(PR_INVALID_ARGUMENT_ERROR, 0); */
> +         return NULL;
> +     }
> +     len = PR_MAX(1024, strlen(link) + 1);
> +--
> +2.43.0
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
