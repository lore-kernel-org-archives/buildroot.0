Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B04C7EE39
	for <buildroot@archiver.kernel.org>; Sun, 29 Jun 2025 16:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52C0940A29;
	Sun, 29 Jun 2025 16:58:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cQExYCbIyVHC; Sun, 29 Jun 2025 16:58:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8403140A17
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8403140A17;
	Sun, 29 Jun 2025 16:58:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C9BEDDF
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 16:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6C1D40203
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 16:58:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O1rLhc_evHTK for <buildroot@buildroot.org>;
 Sun, 29 Jun 2025 16:58:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E798C40082
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E798C40082
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E798C40082
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 16:58:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 6862B6012D;
 Sun, 29 Jun 2025 18:58:36 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 29 Jun 2025 18:58:36 +0200
MIME-Version: 1.0
Date: Sun, 29 Jun 2025 18:58:36 +0200
To: yann.morin@orange.com
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <026284a73a78b0273882e10fc31b16b5bac5c566.1750318763.git.yann.morin@orange.com>
References: <cover.1750318763.git.yann.morin@orange.com>
 <026284a73a78b0273882e10fc31b16b5bac5c566.1750318763.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <1125bc629f55efa54f7a31010f5643b7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751216318;
 bh=XkdpKFPy5GwHIrDntgUDeM1ZyzSUDgsj0n6jITgx510=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mHOUxiAHrbH0f3+0BaAd5LrO33cn/SeFPPrUVAxi/4ED4y85dLmFw92vzofKNthJw
 w3rax8DnH0yxl6yaoxcEqGJT6yVdz145Q3BH7OqiyjxLUY9qEjvV5l75ZJ+HlX5JHc
 8WclzmVS8aRa3w9wpZTV2TNm9jPWHRs9J9wr9oHce32E9dWlDheXkP2xD1mAwGSI+O
 8GgySY/p9KCShyyUEkR1go9pHJa8d3RHJjQyPdnAjGCItYHJh6Nj4PVfdwpkzJ6kbS
 36NUxYBf41qWKRjSOALcO93zXQ0dhRtEz/ZlzITel7CpL4rcMxjHdgoQEY1SvBAc9d
 NKi2EHDsN22pg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mHOUxiAH
Subject: Re: [Buildroot] [PATCH 1/3 v2] package/containers-image-config: new
 package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 19/06/2025 09:39, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> The container/image repository is the standards regpository that drives
> the image management in container tools, like podman or skopeo. Besides
> a Go library, it also prodvides the template configuration files used
> by those tools; those files can also serve as default ones.
> 
> Install those files instead of the canned ones we cary in podman, and
> change podman to use this new package too.
> 
> The registry file needs a fixup, as it by default does not allow
> searching unqualified images (i.e. those that do not contain a registry
> name) in a default registry, for security reasons. However, the Docker
> Hub is traditionally a registry that can be accessed without being
> specified, so we make that possible.
> 
> As was noted in ebbaac08e3f4 (package/podman: new package), 
> "[p]roviding
> actual files is going to be use-case dependent, and interested parties
> will have to provide their own config files, e.g. in a rootfs overlay."
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.

While testing this series, I encountered a build issue which
is not introduced by those changes, which is why I applied it.

The build issue can be reduced to:

     cat >.config <<EOF
     BR2_aarch64=y
     BR2_TOOLCHAIN_EXTERNAL=y
     BR2_PACKAGE_PASST=y
     EOF
     make olddefconfig
     make passt

which fails in passt compilation with error:

     In file included from vhost_user.h:14,
                      from passt.h:29,
                      from qrap.c:36:
     virtio.h:13:10: fatal error: linux/vhost_types.h: No such file or 
directory
        13 | #include <linux/vhost_types.h>
           |          ^~~~~~~~~~~~~~~~~~~~~

This error happens here:
https://passt.top/passt/tree/virtio.h?h=2025_02_17.a1e48a0#n13

This vhost_types.h header appeared in Kernel in v5.0. See:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=4b86713236e4bd6ea6c881a97711ae039fc4069b

So maybe passt needs a dependency on
BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0? I'm a bit surprised as the
https://passt.top/passt/about/ website mention a kernel 3.13 and
4.18 compatibility. So maybe it's an upstream bug which just needs
to test for the presence of this header.

Could you have a look, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
