Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35281C433FE
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 20:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2BA183192;
	Tue, 17 May 2022 20:27:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ow4J7--UzNzP; Tue, 17 May 2022 20:27:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09B9881356;
	Tue, 17 May 2022 20:27:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0773C1BF83C
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA4294199C
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:27:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HI79VTAAcKFP for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 20:27:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8C6A41998
 for <buildroot@buildroot.org>; Tue, 17 May 2022 20:27:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 76781240002;
 Tue, 17 May 2022 20:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652819259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zwdf5gie/6B6ghWT06W4A7lXxw3TqgGSUXWVi9oy8EQ=;
 b=Q28+sCvAKhuoI9DP7atHO4XtLJ1MuHz0PpmZ98Y7kh6SGDKeDadLkU5fA1LjRr49/UTSHS
 Fp3iHd8a7JVIlpL/Uq/dnn7hhATmluR0kFLMp13QOpJx0wQ0TV4dkbf3an4VdyICQnh5nc
 lyocELyxIqTrNmqY2OzC+XN+9iNpm8zXPvfYeM9RQwLZvaJRUBfxXa7z19cZ3nwVCgQsrs
 9cCji7ek0F/HWpRk6AzhRFEPL9JGn5upCxWKKltA9Cwibi6Rx07yqzroguuQAhMwMFdXjP
 Fx174n+gTo1+gL0b7MM/HeVkFUFkMHh4m8F0bL/asn2uXZDB7MqgJnyXNZCvkw==
Date: Tue, 17 May 2022 22:27:38 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220517222738.532f7bab@windsurf>
In-Reply-To: <20220514223408.4119862-1-james.hilliard1@gmail.com>
References: <20220514223408.4119862-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/ola: add missing python-numpy
 dependencies
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 14 May 2022 16:34:08 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Fixes:
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_NUMPY
>   Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS [=y] && (BR2_TOOLCHAIN_USES_GLIBC [=n] || BR2_TOOLCHAIN_USES_MUSL [=n])
>   Selected by [y]:
>   - BR2_PACKAGE_OLA_RDM_TESTS [=y] && BR2_PACKAGE_OLA [=y] && BR2_PACKAGE_OLA_PYTHON_BINDINGS [=y] && BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS [=y]
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/ola/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master after adding the appropriate Config.in comment about
this dependency.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
