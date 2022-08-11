Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E10C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 20:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ABD882771;
	Thu, 11 Aug 2022 20:48:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0ABD882771
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oIJ2NldIQ0q0; Thu, 11 Aug 2022 20:48:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28C0B82496;
	Thu, 11 Aug 2022 20:48:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28C0B82496
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C063E1BF2B9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 871ED60E40
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:47:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 871ED60E40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ILtm3YvPwX8Q for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 20:47:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD97060A8D
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BD97060A8D
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 20:47:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 098A360006;
 Thu, 11 Aug 2022 20:47:53 +0000 (UTC)
Date: Thu, 11 Aug 2022 22:47:52 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220811224752.1a1e53b7@windsurf>
In-Reply-To: <20220810233824.714623-1-giulio.benetti@benettiengineering.com>
References: <20220810215104.107714-1-giulio.benetti@benettiengineering.com>
 <20220810233824.714623-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660250874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x7JFzd1c4AV4IxH2AHV70ZNOwcrgQIisIjgU05jb26U=;
 b=nfmyVjOsG98sYTqsli2edBjRSjj8ZtslUch5Nr2dlY8TTe7DmhCBIz2f5DSDsp9jrJK+uH
 aai3v3vJtA5DArX7VI6gfODHxynE1PhaB6X+Lg6MWLDK3xJmXmzRxJ3PiyRa/wrfRjob17
 9GTkyYcuQ46Lq0K/jeRt/+VB6sBQfdNmMr8IJzm9NdS5t1hZkHHDwuVS2RKQ4itx6MBbu8
 BHca/Xf1xyjNffXuLvQT7Q2cLcyebNP1ytZAQIZImjcV8tV2df0A/P/CjHzWHlcXurcHaN
 BO/qkvt39Qxz3L3iite5u8uF6DMRDl8+DNSbdaw30UMaE4mITtUEgpijgBW4rg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nfmyVjOs
Subject: Re: [Buildroot] [PATCH v2] package/nfs-utils: improve local patch
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

On Thu, 11 Aug 2022 01:38:24 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> As Thomas Petazzoni made me notice the actual local patch is not a good way
> at all to deal with pkg-config with Autotools. So let's rework the patch

It is recommended to avoid first person sentences in commit logs.

> according to his comment that represents the standard of Autotools
> pkg-config usage. This impacts host-nfs-utils too that is used to build
> nfs-utils and so libmount must be present in host. We do this by adding
> host-util-linux to HOST_NFS_UTILS_DEPENDENCIES since it is the libmount
> provider.

So, host-utils-linux is now only needed by host-nfs-utils because of
the new check in configure.ac, but nfsrahead is in fact not built for the host?

If it's the case, then the configure.ac change is wrong, and the mount
library of util-linux should only be checked using PKG_CHECK_MODULES()
when it is actually needed.

Another nfs-utils thing I noticed:

ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),y)
NFS_UTILS_CONF_OPTS += --enable-uuid
else
NFS_UTILS_CONF_OPTS += --disable-uuid
endif

but BR2_PACKAGE_NFS_UTILS selects BR2_PACKAGE_UTIL_LINUX_LIBBLKID so
this conditional doesn't make much sense.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
