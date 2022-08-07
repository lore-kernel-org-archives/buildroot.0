Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0FDC19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 17:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD8C360B71;
	Sun,  7 Aug 2022 17:33:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD8C360B71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J5kN4qcP031m; Sun,  7 Aug 2022 17:33:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D60D260B67;
	Sun,  7 Aug 2022 17:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D60D260B67
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 40C341BF3D6
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 17:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B9F682560
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 17:32:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B9F682560
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lMoCxr2Ssel7 for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 17:32:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C71F581BA8
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C71F581BA8
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 17:32:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9D34D1BF204;
 Sun,  7 Aug 2022 17:32:44 +0000 (UTC)
Date: Sun, 7 Aug 2022 19:32:43 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220807193243.24c657c5@windsurf>
In-Reply-To: <20220807135357.3940300-1-fontaine.fabrice@gmail.com>
References: <20220807135357.3940300-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659893564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y02IFsP+RCfF2VcFUpyGuU+oyfQ4sYCP8Ed4yu2d2uM=;
 b=aI3IpMC44j4DkNpT/oFNHJ+8hIJzcpg3avcRGHLqznLJEcPRiqFVWoyQlnLNjU5Zz5P9+u
 HLi8pZ25HVuuplBGy8+S7K2RUNNdnYGI87ABT+L1jVuxBKRGKsP8xZWamL7oTlYfn+fbvD
 hmZmph8Rd+tFoXi8fwsGACGk6fk1saI60fJPDxo3HX3KnRjR79NPIUjfab+x2pAXl48tUC
 QcogKwmxtw6UOiRA/WqOObzGtjBJcvMCzLTlcEKELfHGk7q0/2FVUA36fv5OvvRJc+PBMr
 OoZBnyJgNUezYHQ7JozmRswcaSlVQOhyyjgTZyFGPglhGhxwL8mIMe0rJcek6Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aI3IpMC4
Subject: Re: [Buildroot] [PATCH 1/1] package/waffle: bump to version 1.7.0
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  7 Aug 2022 15:53:57 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This bump will fix the following build failure raised since bump of
> wayland to version 1.20.0 in commit
> f94ba5c31cf7f863e6fae996fc042a56e20118f3 thanks to
> https://gitlab.freedesktop.org/mesa/waffle/-/commit/71d46212a9d23a951d5d38f0bfd1cdf1194c8c8e
> and
> https://gitlab.freedesktop.org/mesa/waffle/-/commit/2c33597245bb74f19104f0a858cd40e80b26991d:
> 
> /home/giuliobenetti/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64-buildroot-linux-gnu/9.3.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: ../../lib/libwaffle-1.so.0.6.1: undefined reference to `wl_proxy_get_version'
> /home/giuliobenetti/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64-buildroot-linux-gnu/9.3.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: ../../lib/libwaffle-1.so.0.6.1: undefined reference to `wl_proxy_marshal_flags'
> 
> https://gitlab.freedesktop.org/mesa/waffle/-/tags/v1.7.0
> https://gitlab.freedesktop.org/mesa/waffle/-/tags/v1.6.3
> https://gitlab.freedesktop.org/mesa/waffle/-/tags/v1.6.2
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1fb1540b0ae6037140f386f44d6e17735f0674c4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...lags-from-.pc-files-to-waffle-cflags.patch |  2 +
>  ...yland-fix-build-against-version-1-20.patch | 59 +++++++++++++++++++
>  package/waffle/waffle.hash                    |  4 +-
>  package/waffle/waffle.mk                      |  6 +-
>  4 files changed, 67 insertions(+), 4 deletions(-)
>  create mode 100644 package/waffle/0002-wayland-fix-build-against-version-1-20.patch

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
