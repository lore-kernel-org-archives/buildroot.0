Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D757AC433F5
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 08:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8511A6117F;
	Tue, 31 May 2022 08:17:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TPC4oaW-dzRS; Tue, 31 May 2022 08:17:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99AF960FF2;
	Tue, 31 May 2022 08:17:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 58B7F1BF313
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 08:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55D26415CE
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 08:17:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bc6ukRizC7fh for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 08:17:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBC7F415BF
 for <buildroot@buildroot.org>; Tue, 31 May 2022 08:17:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AB3DA1C0005;
 Tue, 31 May 2022 08:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653985065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=35zuTKxVpGt/vwAlY5G2gqegFBLcsVL/lZfEAM4504g=;
 b=RqmD33XVuvHR9/dNPWf1Z327WW6VEauTH+y2w24RwS5yQj6PM1W3hLWycHFPuzBAl2P+tP
 HcKkLAPMdng2YdQpc6ivEAFRESZt4WRBTl6nUo4h6ApMEENQ5WbspOWLF9nzfVZXAoF/HW
 ZBLK0ZaFi6OeRiiWdf7YcI3/632lefAn5nLiuqCTPp6TTMqjpyYe3/AaxsuPX1ZVyZwvy6
 bc8EPMKGn0qsf/aGkFqj6ESv6zk1kF0r0We3Sv0HWxOh/9tEX7SPUeSTQ+zM25jhzxw+VT
 nCz7OcvttemK7iUkPl+YqhTVgN6eWJmIfX9nf9aeZUC5ltlSq7dXyD7xjnQ5QA==
Date: Tue, 31 May 2022 10:17:43 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220531101743.6afd60f4@windsurf>
In-Reply-To: <20220530213324.3067408-1-fontaine.fabrice@gmail.com>
References: <20220530213324.3067408-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2,1/1] package/pipewire: fix uclibc build
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 30 May 2022 23:33:24 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following uclibc build failure:
> 
> /home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/10.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: src/pipewire/libpipewire-0.3.so.0.351.0.p/introspect.c.o: in function `pw_node_info_merge':
> /home/buildroot/autobuild/instance-0/output-1/build/pipewire-0.3.51/build/../src/pipewire/introspect.c:216: undefined reference to `reallocarray'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/374582f75713c4116ae23f972c5bc55214879502
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Backport correct upstream fix (previous one was broken)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
