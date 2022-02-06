Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14882C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 10:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBFC68174D;
	Sun,  6 Feb 2022 10:39:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fpdYnwFIS2nY; Sun,  6 Feb 2022 10:39:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11F3B81699;
	Sun,  6 Feb 2022 10:39:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B4191BF83B
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09EA660B6A
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:39:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZuWyZIqDRcz6 for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 10:39:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFC5D6059E
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 10:39:10 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GewnnJQDTX0z7GewnnKav0; Sun, 06 Feb 2022 11:39:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644143949; bh=Gu7wTqohhk9KtLVqZxFlAZPWimtQxGLHYZa1t5QgWpw=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=A/XX7OwQLUfSPVqCTBe2AhQlVYFh/iUa9/7Pad4F5oVJAcsuZfgpZxzRRXg+0qo4u
 lUQhtV2J/vcjQjMafFtcmbTC1ZTVkEWXS+fUtHkcf/bc2ZHhx5nGHUzMB6l+vntPgr
 BEUau7moAPh/vKUQ1Q1lSaKNwPvrVh6/J+uyc8dQxAHBrCVW8g5rQD6K+c/x77Anac
 7vhTEIwJ6dXc+DrkNspZ5F2knSnCOKPgaLiJ57BYHpqES9p4Cv/awq7C2mxxHmpK9l
 de1FYpqhJUncctfTeWdahzw/quPhKZV1aOOTRaBYREn5xM/InhDLcdpj0CElV7ZeIw
 4ksNhGjeZnNZQ==
Message-ID: <4271dc4d-6096-4f9a-11d3-125f1cd5ea2d@benettiengineering.com>
Date: Sun, 6 Feb 2022 11:39:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20220206103733.1580146-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220206103733.1580146-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4wfF/iQ4kQsyTbAWWHqtfTwYcuQ7fpmptPkoIFMGZC5JtUpLtCAKJwfPu2ljcCwzUJSCCyGYgqe29YL1qswdmW/MphiEVLcVSBdIbir2IYpA/pzmjBE+GG
 ve4ZjsUv8sJUcMeHt/NdtV90En+kA3AFVfU+/M3j4OoDsLpZwa6psx1kRsOsCwGTK4Wv0cuLHT9FTXlkMrRPjhvZi/CELA+i5LfXxIZc8ICdgBWBsnw3fpDx
 Xud0gPIc+tSOzlUze60fppsN166ms6DZNdo31MBcYy4=
Subject: Re: [Buildroot] [PATCH] package/systemd: don't treat ld warnings as
 errors
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 06/02/22 11:37, Giulio Benetti wrote:
> Nios2 ld emits warnings like:
> '
> /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/7.3.1/../../../../nios2-linux-gnu/bin/ld: FDE encoding in /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/7.3.1/libgcc.a(_umoddi3.o)(.eh_frame) prevents .eh_frame_hdr table being created.
> '
> Since '-Wl,--fatal-warnings' is passed by default, build fails, so don't
> treat warnings as errors by appending "-Wl,--no-fatal-warnings" to
> SYSTEMD_LDFLAGS the same way I've done for Microblaze in commit:
> https://git.buildroot.net/buildroot/commit/?id=cc53d5357d84ff9b78d76e45ce216061df8a37c1
> 
> Fixes:
> http://autobuild.buildroot.net/results/5fc884e11e46ab165ea21c8e8f2901516d79ff80/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/systemd/systemd.mk | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 5626b54e8e..0f7da5cb28 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -90,6 +90,11 @@ SYSTEMD_CONF_OPTS += \
>   	-Dumount-path=/usr/bin/umount \
>   	-Dutmp=false
>   
> +ifeq ($(BR2_nios),y)

s/BR2_nios/BR2_nios2, I send a V2, please reject this patch

Sorry for the noise
-- 
Giulio Benetti
Benetti Engineering sas

> +# Nios2 ld emits warnings, make warnings not to be treated as errors
> +SYSTEMD_LDFLAGS = $(TARGET_LDFLAGS) -Wl,--no-fatal-warnings
> +endif
> +
>   ifeq ($(BR2_PACKAGE_ACL),y)
>   SYSTEMD_DEPENDENCIES += acl
>   SYSTEMD_CONF_OPTS += -Dacl=true

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
