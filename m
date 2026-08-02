Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3EEC55175
	for <buildroot@archiver.kernel.org>; Sun,  2 Aug 2026 15:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D9BA80C7E;
	Sun,  2 Aug 2026 15:30:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WmmtsVDCef4d; Sun,  2 Aug 2026 15:30:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5090380C98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785684626;
	bh=IZgs9JGzSOmYqNLuVHoHsAiRTq6Ol2wxmgTDw4lpVtI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mhSkqveJX6bn1kHSeCJsNcN09iS6X96vpmjKjg7Up8VS08NV799dGLDWtzLqZcbUs
	 3ssJcU3zaQ75Z7ck1R/vGH6EEP+oym7qMO9XutEr7ozXtxrL9MFx+M3Abo0BK95m3y
	 jLlc2ltVozSOHK2CphpMtDllMOliWjWrlTXYyGSXT4KW0XwQpXP6FvWHm0YGNj3XuW
	 rvSpkjgVMFce7rUwxhpWVr5WywGcS+7RSxuowx2z7CTCcZplPSbHqPsBp2+xnzKNw0
	 0QbNyPPwfZTG0bQA0z0Ls1Twmv7azAkqtK+XrZXJMxgX2r2aFq7t6HwwxBdOIDzvby
	 tqkjtArnRT8EQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5090380C98;
	Sun,  2 Aug 2026 15:30:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B420FE3
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 15:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CA3480C98
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 15:30:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yxE4yehnVgqg for <buildroot@buildroot.org>;
 Sun,  2 Aug 2026 15:30:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9434D80C7E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9434D80C7E
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9434D80C7E
 for <buildroot@busybox.net>; Sun,  2 Aug 2026 15:30:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id DF266780368;
 Sun,  2 Aug 2026 17:30:21 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 02 Aug 2026 17:30:21 +0200
MIME-Version: 1.0
Date: Sun, 02 Aug 2026 17:30:21 +0200
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
In-Reply-To: <20260721093932.282565-4-francois.perrad.86@gmail.com>
References: <20260721093932.282565-1-francois.perrad.86@gmail.com>
 <20260721093932.282565-4-francois.perrad.86@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <7c4213c5b29762331def910834f668e3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785684623;
 bh=Mpm58al80raSvSdJHp3YOFwauHDZNwb2BKuy7BGpRRk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uqA/Keo8QvqLDuRlGItyBarhLnaJWgmPhWv1aO+usNo2ZrWmg/2Om8aNzTFcmPQfb
 FxKfwYfIOw3X2+Q/4kCeEg9qIyd028e0faiYlxCVGnjdMzdZcBFMDLe+x15msgH+Az
 ngeTKArjJkNNPUt4P3WfN+t+vWQPCR7qfjmX2xeAbrQ6InbInf5E6fdIz1S1xvcEM+
 HUzjuguY3aDBnUG0pDuNjzs+aBrmDsKsWTb87dVQra0MtcrN32t7kqPxhWgo1N9hEC
 OzpOxS8GdMHRaNKksK8lvhVHwnbPrcWdej8iZKbdHBjhgzL7J5KDZyXrVFadi/xQSY
 WwpwbNYZowI1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uqA/Keo8
Subject: Re: [Buildroot] [PATCH v3 3/8] package/harec:  new host package
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

Hi Francois,

On 21/07/2026 11:39, Francois Perrad wrote:
> dependency for host-hare
> 
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
> ---
>  DEVELOPERS               |  1 +
>  package/harec/harec.hash |  3 +++
>  package/harec/harec.mk   | 26 ++++++++++++++++++++++++++
>  3 files changed, 30 insertions(+)
>  create mode 100644 package/harec/harec.hash
>  create mode 100644 package/harec/harec.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 442fe4e6a..0b99456a9 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1176,6 +1176,7 @@ F:	package/copas/
>  F:	package/coxpcall/
>  F:	package/dado/
>  F:	package/ficl/
> +F:	package/harec/
>  F:	package/janet/
>  F:	package/qbe/
>  F:	package/libtomcrypt/
> diff --git a/package/harec/harec.hash b/package/harec/harec.hash
> new file mode 100644
> index 000000000..0c3679bfc
> --- /dev/null
> +++ b/package/harec/harec.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  
> 5581bc16dcf22969c7d33b0f2a9535ba37d4cf1bb39dec252e98ff2781175629  
> 0.26.0.tar.gz
> +sha256  
> 3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  
> COPYING
> diff --git a/package/harec/harec.mk b/package/harec/harec.mk
> new file mode 100644
> index 000000000..df1096680
> --- /dev/null
> +++ b/package/harec/harec.mk
> @@ -0,0 +1,26 @@
> +################################################################################
> +#
> +# harec
> +#
> +################################################################################
> +
> +HAREC_VERSION = 0.26.0
> +HAREC_SITE = https://git.sr.ht/~sircmpwn/harec/archive
> +HAREC_SOURCE = $(HAREC_VERSION).tar.gz
> +HAREC_LICENSE = GPL-3.0
> +HAREC_LICENSE_FILES = COPYING
> +
> +define HOST_HAREC_CONFIGURE_CMDS
> +	cp $(@D)/configs/linux.mk $(@D)/config.mk
> +endef
> +
> +define HOST_HAREC_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) ARCH=$(HOSTARCH) all
> +endef
> +
> +define HOST_HAREC_INSTALL_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
> +		PREFIX=/usr DESTDIR="$(HOST_DIR)" install

Buildroot decided a long time ago to avoid installing
files in "$(HOST_DIR)/usr/". So the previous line should
be changed to:

		PREFIX=/ DESTDIR="$(HOST_DIR)" install

> +endef
> +
> +$(eval $(host-generic-package))
> --
> 2.43.0

Could you send and updated series addressing this, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
