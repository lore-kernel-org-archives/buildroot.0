Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8498C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 21:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 871BE4012F;
	Mon,  5 Feb 2024 21:45:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 871BE4012F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b8IYQZmkalBR; Mon,  5 Feb 2024 21:45:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8517640160;
	Mon,  5 Feb 2024 21:45:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8517640160
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 118161BF341
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFB1441953
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:45:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFB1441953
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qaLlIP4XE2E4 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 21:45:51 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89DE141951
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 21:45:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89DE141951
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0DD3C40002;
 Mon,  5 Feb 2024 21:45:49 +0000 (UTC)
Date: Mon, 5 Feb 2024 22:45:47 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240205224547.5435732c@windsurf>
In-Reply-To: <20240109214953.724112-1-fontaine.fabrice@gmail.com>
References: <20240109214953.724112-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707169549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rBvbPrXVDcDTGcGt68sCAcXE1j0PSnMUz1lU5SAanv0=;
 b=onEUAGzT6KvRy4Qzv1NUS8gVu2jkTch60tUKsAs2VhtG6MDnQJcAysZGRmlU2+PudQZLzq
 CtPZJbYBHSP60oaEHu2Q6zbHRSEbveTFgv9ue9SEq/rYQzWpw8h6y00HTTsrcZ8jDZItS4
 WRIBbT5ZhR/iKdkM6qApJbul4z2JLleBpjGSCWGFa5upF7fDOz/F0QrRhVupXkxFG7OfL4
 Mx8OKMVleaqekOfzBSfPiI0rfOFX8Ug9XhS5Kuxy7X7XCPWgo6KGEckHI40R34w2VAZIhq
 oGVxZlLoJUb6b9anPOKNWh8czQchR4QdNRMteeQ3mSuuWSsGzIhOsyohtpwhnA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=onEUAGzT
Subject: Re: [Buildroot] [PATCH 1/1] package/sdl2_mixer: force arm mode
 instead of Thumb mode
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Tue,  9 Jan 2024 22:49:53 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +# sdl2_mixer has some assembly function that is not present in Thumb mode:
> +# Error: selected processor does not support `clz r2,r3' in Thumb mode
> +# so, we desactivate Thumb mode
> +ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
> +SDL2_MIXER_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
> +endif

Thanks a lot for working on this! However, I think this is not the best
fix. Indeed, instead we should patch the sdl2_mixer code so that it
only uses the optimized ARM implementation when it makes sense. The
code goes like this:

    #if defined(__GNUC__) || defined(__clang__)
        #if defined(DRFLAC_X64)
		/* OPTIMIZED x86-64 code here */
        #elif defined(DRFLAC_X86)
		/* OPTIMIZED i386 code here */
        /* This condition is the one that should be changed to exclude using this code on Thumb */
        #elif defined(DRFLAC_ARM) && (defined(__ARM_ARCH) && __ARM_ARCH >= 5) && !defined(DRFLAC_64BIT)   /* <-- I haven't tested 64-bit inline assembly, so only enabling this for the 32-bit build for now. */
            {
                unsigned int r;
                __asm__ __volatile__ (
                #if defined(DRFLAC_64BIT)
                    "clz %w[out], %w[in]" : [out]"=r"(r) : [in]"r"(x)   /* <-- This is untested. If someone in the community could test this, that would be appreciated! */
                #else
                    "clz %[out], %[in]" : [out]"=r"(r) : [in]"r"(x)
                #endif
                );

                return r;
            }
        #else
            /* And so we will fallback here, the "unoptimized" implementation */
            if (x == 0) {
                return sizeof(x)*8;
            }
            #ifdef DRFLAC_64BIT
                return (drflac_uint32)__builtin_clzll((drflac_uint64)x);
            #else
                return (drflac_uint32)__builtin_clzl((drflac_uint32)x);
            #endif
        #endif

You can use some gcc internal macro to detect if we're building for
Thumb or not. Could you have a look in this direction?

Thanks a lot in advance!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
