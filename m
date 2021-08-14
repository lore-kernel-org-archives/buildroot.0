Return-Path: <SRS0=c1N3=NF=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3601C4338F
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 22:11:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BB1E60ED5
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 22:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7BB1E60ED5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 527D4605F4;
	Sat, 14 Aug 2021 22:11:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rFAJ3v-SMujo; Sat, 14 Aug 2021 22:11:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7DC260601;
	Sat, 14 Aug 2021 22:11:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 590F51BF962
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 22:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E7274034B
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 22:11:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PFlea077dYM6 for <buildroot@lists.busybox.net>;
 Sat, 14 Aug 2021 22:11:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0651.aruba.it (smtpcmd0651.aruba.it [62.149.156.51])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB96140353
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 22:11:32 +0000 (UTC)
Received: from [192.168.47.129] ([141.136.135.234])
 by Aruba Outgoing Smtp  with ESMTPSA
 id F1sJm5A99xC2nF1sKme8BF; Sun, 15 Aug 2021 00:11:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1628979092; bh=5g0xGgmqFpRgjU6gpPf+DW3mbudV9JLsLBkCRxPS8bA=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=EzxKD+8vihObvxFuqXitBig2kRgZX2J88hcSigUdQAEeNBgo4sipR/XjAejDbsjF4
 STj4EiaCWGHF/UzOX6nMfuE3uySeqAXQ8FY/ju82GlSWH5+fH0YXw/WagoUbDAW0Nz
 hoNPcPpvdaOKjY8Z+oNnQD6GOzvSVGcgONCygu/544zAIsqJxLkYDzBmKxsoYXHV07
 51xsmdIdIBffDuAL4x8fFfxDFDB484rAkonnNfwaSL/AX0cCZ4AIxQJLTtHdV2pM4w
 81vHaTSfY3cmJA/swY08jRaxLTjGwM0EKEsuU39aWeJ2WDMt2qpwpDBoH7PdmRWy+k
 gaK9uArmfyWYw==
To: buildroot@buildroot.org
References: <20210813213745.1555522-1-giulio.benetti@benettiengineering.com>
 <20210813213745.1555522-3-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <684a24d1-15df-e586-a4af-d684ecf19e9a@benettiengineering.com>
Date: Sun, 15 Aug 2021 00:11:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813213745.1555522-3-giulio.benetti@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfP68602yL4Sl4Ui7a40W4YxgATDJaSMWJgXJAyaLjpkYIIPkw4YkhOmijkw9pDCXH7IIVuXweAt7hJ90mMhG9k6Z1LkY8sy2TWe+bQ3UkPocICFqu9wY
 o+dbGgXQRZ8nFYeNrPKEzmgGR3+9vBCEgHjGln94wnjjwBrfAPk8q4vs9bIXE+7FF7TJPWGzKFUV4ZgwN0nHibvUlgtvLOc+rmGdilJoX2JvamjBoWagVcpV
 +Tjtu8CLJANjvPgGfRBBC0oAqdflmWJHo/0p0uYPL+oLfODB6bt0t2tH8KUvQrHH47yPGOtfhKffbAT98DifsC7u2sboWPxIXIth40Jx8KE=
Subject: Re: [Buildroot] [PATCH 2/3] toolchain/toolchain-wrapper: use Gcc
 bug 97208 instead of repeating it
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Please drop this patch, I've already set it as Rejected in Patchwork.
Sorry for the noise

-- 
Giulio Benetti
Benetti Engineering sas

On 8/13/21 11:37 PM, Giulio Benetti wrote:
> Now that we have added Gcc bug 97208 we can use it instead of repeating it.
> So let's substitute bug condition with bug presence. Also note that gcc bug
> 97208 is still present in gcc 11.1.0 so better to make comment more generic
> and keep a detailed description in toolchain/Config.in
> 
> Cc: Roman Naour <romain.naour@gmail.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   toolchain/toolchain-wrapper.mk | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
> index 8b551e3a18..c56ec7c054 100644
> --- a/toolchain/toolchain-wrapper.mk
> +++ b/toolchain/toolchain-wrapper.mk
> @@ -33,11 +33,10 @@ TOOLCHAIN_WRAPPER_OPTS += -DBR_NEED_SOURCE_DATE_EPOCH
>   endif
>   endif
>   
> -# Disable -ftree-loop-distribute-patterns on microblaze to
> -# workaround a compiler bug with gcc 10 and -O2, -Os or -O3.
> +# Disable -ftree-loop-distribute-patterns on compiler affected by gcc bug 97208.
>   # https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=5879ab5fafedc8f6f9bfe95a4cf8501b0df90edd
>   # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=97208
> -ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_10)$(BR2_microblaze),yy)
> +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_97208),y)
>   TOOLCHAIN_WRAPPER_OPTS += -fno-tree-loop-distribute-patterns
>   endif
>   
> 

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
