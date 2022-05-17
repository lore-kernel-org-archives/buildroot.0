Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9963C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 19:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72ADC4013E;
	Tue, 17 May 2022 19:57:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EMAQX8Sk1Dg1; Tue, 17 May 2022 19:57:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76684400F2;
	Tue, 17 May 2022 19:57:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 574B61BF403
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 19:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5455481A18
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 19:56:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qY0ajInMF5l8 for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 19:56:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BB8281463
 for <buildroot@buildroot.org>; Tue, 17 May 2022 19:56:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 29F82C000C;
 Tue, 17 May 2022 19:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652817394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kWrYct6wVPbVPdo1sGjh1RD1kQe0YiqeUwvIi19TP7g=;
 b=UErWuTd+PsvMbiMYvoXNd5dHNuMejZOlSRhVJ2dr1JJqb9oTaRvQFfwHpYBq/E/tnfpuEL
 AOK5Yh5e8/Oa7VYxC4unQflBRbAvY+XZPLoFwnc4YBQMZt8ryvtX/+KyPzvZdCDi1YjInq
 K+F8TyRQj+vCfYUVfiUwGEExguRPUFy5opJEA/dZKAFhwqmz4xWqJdCSSS6G2xgRxdn9mr
 TAenz25NIMeUcQUJh5VfbvSAfGtfVMWr1G4zB6YKkfSwyXNM8oUwpTugEmr4Hg/1lxmE+e
 OhR6r7iiRtGX0bVV1ZIOlDHGwG0Hi6/B0niANGNGTeYqclza1cxnb2SaLAOKDA==
Date: Tue, 17 May 2022 21:56:33 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220517215633.216b348e@windsurf>
In-Reply-To: <20220514224200.1156944-1-james.hilliard1@gmail.com>
References: <20220514224200.1156944-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/pinentry: add missing
 !BR2_ARM_CPU_ARMV4 dependency
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Sat, 14 May 2022 16:42:00 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Propagate this missing BR2_PACKAGE_QT5 dependency.
> 
> Fixes:
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_QT5
>   Depends on [n]: BR2_INSTALL_LIBSTDCPP [=y] && BR2_USE_WCHAR [=y] && BR2_TOOLCHAIN_HAS_THREADS_NPTL [=y] && BR2_HOST_GCC_AT_LEAST_5 [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_5 [=y] && !BR2_ARM_CPU_ARMV4 [=y] && !BR2_STATIC_LIBS [=n]
>   Selected by [y]:
>   - BR2_PACKAGE_PINENTRY_QT5 [=y] && BR2_PACKAGE_PINENTRY [=y] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_USE_WCHAR [=y] && BR2_TOOLCHAIN_HAS_THREADS_NPTL [=y] && BR2_HOST_GCC_AT_LEAST_5 [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_5 [=y] && !BR2_arc [=n] && !BR2_STATIC_LIBS [=n]
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

I have applied, but after also updating the Config.in comment with this
new dependency:

comment "pinentry-qt5 needs a host gcc >= 5.0, and a toolchain w/ wchar, NPTL, gcc >= 5.0, C++, dynamic library"
        depends on !BR2_arc
        depends on !BR2_ARM_CPU_ARMV4
        depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
                !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
                BR2_STATIC_LIBS || !BR2_HOST_GCC_AT_LEAST_5

However, I noticed that the !BR2_arc dependency no longer makes sense.
It was dropped from Qt5 in commit
16ffc6549465cb5d68b751f10603e8b0363bf9b0.

This means that commit 16ffc6549465cb5d68b751f10603e8b0363bf9b0 did not
properly drop this !BR2_arc dependency from reverse dependencies of
Qt5. Reviewing this shows that package/wireshark also had a !BR2_arc
dependency due to Qt5, which probably should be dropped.

It would be good to fix that as well.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
