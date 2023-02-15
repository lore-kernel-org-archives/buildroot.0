Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FFEC636CC
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 21:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DAF9417C1;
	Wed, 15 Feb 2023 21:41:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DAF9417C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2z1wVuapxC7v; Wed, 15 Feb 2023 21:41:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2ED80417BA;
	Wed, 15 Feb 2023 21:41:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ED80417BA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 534071BF3A0
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D172417BA
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:41:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D172417BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W_kq5QgUVj2L for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 21:41:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1468417AD
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1468417AD
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 21:41:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 588F7100007;
 Wed, 15 Feb 2023 21:41:41 +0000 (UTC)
Date: Wed, 15 Feb 2023 22:41:40 +0100
To: Norbert Lange <nolange79@gmail.com>
Message-ID: <20230215224140.212f6e6b@windsurf>
In-Reply-To: <20230215151302.140387-1-nolange79@gmail.com>
References: <20230215151302.140387-1-nolange79@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676497301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/4FikYBoBTwlUaO2d0g7soNnz+Hoyb/FHzTtQBo3yAE=;
 b=b3d0WU/X7YW88whzt8key9Kuf2wmbExdjJi8xGXdqox5OEVUo7PH8hiGsaEo5b0sP6mLXh
 P7NC2f/ckOTg2FmEVHsQn4of0KGYpllb2NpP1XG8bd7qyESEYoXs7MG0IJVQhD/qZoc7mx
 icyi7/8D5Tx98aWxUttgc/bj4RavypIh+90cda3Mun8gpTi54GGLj3SfcF+2AzI5C2xllt
 4T3sDeUToKxP7iAhxgg+hZoqPj0j/JQ/DBNmzdCLV7/3whi2QZdMVg3G1l3WDtsa7uZcCZ
 PO7lNx9YduhmTe/00l1XYOioBd+1VJ1ekcFey4gwjfE41k4mWXI72X1WpaooQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b3d0WU/X
Subject: Re: [Buildroot] [PATCH] package/zstd: bump to version 1.5.4
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Norbert,

On Wed, 15 Feb 2023 16:13:01 +0100
Norbert Lange <nolange79@gmail.com> wrote:

> The LICENSE text has changed, nominally the copyright owner changed
> from "Facebook" to "Meta Platforms, Inc. and affiliates",
> reflecting the name change of that company.
> 
> Add upstream patch to fix zstd-dll build.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  ...-zstd-dll-build-missing-dependencies.patch | 179 ++++++++++++++++++
>  package/zstd/zstd.hash                        |   6 +-
>  package/zstd/zstd.mk                          |   2 +-
>  3 files changed, 183 insertions(+), 4 deletions(-)
>  create mode 100644 package/zstd/0001-Fix-zstd-dll-build-missing-dependencies.patch

Thanks for the patch.

> 
> diff --git a/package/zstd/0001-Fix-zstd-dll-build-missing-dependencies.patch b/package/zstd/0001-Fix-zstd-dll-build-missing-dependencies.patch
> new file mode 100644
> index 0000000000..bbb008c3b3
> --- /dev/null
> +++ b/package/zstd/0001-Fix-zstd-dll-build-missing-dependencies.patch
> @@ -0,0 +1,179 @@
> +Fix zstd-dll build
> +
> +https://github.com/facebook/zstd/commit/c78f434aa4f5f1097c8edb975f4c1635817a5a71
> +
> +Signed-off-by: Norbert Lange <nolange79@gmail.com>

Could you use git format-patch to generate this patch, and preserve the
authorship of the patch from its original author?

Essentially this:

 - git clone ...
 - git checkout v1.5.4
 - git cherry-pick c78f434aa4f5f1097c8edb975f4c1635817a5a71
 - git commit --amend
   (add your own SoB in the commit log + reference to the upstream commit)
 - git format-patch HEAD^

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
