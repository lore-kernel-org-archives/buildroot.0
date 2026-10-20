Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14952606A31A
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 20:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=W4+/n31D
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E038480D09;
	Tue, 20 Oct 2026 20:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MYt9Knl1PMau; Tue, 20 Oct 2026 20:39:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D87C780D58
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792528786;
	b=SgiQIomMyvG1BLH6YfjdzeIhw6D1fNWJRXT7d5Mgh18gFgn6RvfmQpSH+92cq9MwBB+8
	 c3wJTy3IQXkCncC6d94wnRp8VLDcnJcVxGUyJOQSvU6emkAqdl9wIAchy8BJlIL3s8iGT
	 mUPATKbZg2+A8BV4K9PuAJozIxtE3JmPXXmsNGr35y136h0CyGs/F6f86Kq5150yzLke3
	 mkYje5/K5XCFasP5htS0ILOWzhgqZBSFRob0Xl9HVtpvQj6QQ+6K3Uj+SpzVkMT0YhBJQ
	 qBQTfLAgRxAapAurnKDxjLCBOTP8iLXExZuWQAWAFVIwnAY+iTx76fz47tnPeW4Dmng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792528786;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=bFApWx0zaQV09ngqtUbMlKF1ij/xqPz4Ihkf8cWXMkM=;
	b=AhvPhDvH4CZpMcGsCzwXthVMsk/x7hBcBy3WVDTJCpJ5aT9Nu/PlQDJwfzdaI7HLIFee
	 PnUVOywmL8Og0HqZGY74mPA/vQllF6lF2EkOvSS+OiFHdWTWpxL8eXIOCSi1r+yZDOf0M
	 wER91/qINRxbSejletgu481ZDUQfDZy2dScmhHA6Yu93AuFcX1r80PkxCeCQoHmR3piFt
	 xK8HhJlimqDDM3GM9d/8ECPWSvaOF8JRNBO3UqpFRi+KhwElZOw8GnsZIogwiEF2Kho/N
	 KdSirZi1L4xK7Y9cASU1FDTf5zO/DsGMPXagtlKcKsWcQGv6QRZtrZY7TDbDEToOAPw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792528785;
	bh=bFApWx0zaQV09ngqtUbMlKF1ij/xqPz4Ihkf8cWXMkM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=W4+/n31DA6oG6M2Cjq1yo6muKD+vO27UukIMokK49dJyGpEHViwPX6xDL49mz80MW
	 KO8+pl+t/osThhIs9Y0bAR+HDEeLzzeehlWcwHSHdYcFkIClJLPmvHsYl96dMbRlAf
	 2eIO9Weszr2FtNOXFFlk2CFIXJAaAbQO+R4l2dqk1/9h6RNqOBYPCkXUmK4Ols6OXX
	 1b3iU4bqdxyTMXVqlJ65HWKBKtp3f3OhepNHIeYr/qi8vg58C6l9BsXNKoLWrmq4WL
	 dAV6OQXBx+5b9JUMJlr93BoVVMoY7P6z3mjzy/hUKkFo8KORlD4TYCDfajk3bTUEzq
	 66hVpFB7zadtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D87C780D58;
	Tue, 20 Oct 2026 20:39:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C1193A8
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 20:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85ED740112
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 20:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XzHFuPX7Ae35 for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 20:39:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 963DA4006F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792528782;
 b=ZMsyfel8ElGtQ0u4pNx6vP4y7NYzK2yqYnOzkIYSl9pEFSdBa0EvNyVOHkCbnvWf2elY
 y+N0JAyWTI7n4smpdESdn6P2mdNOAGMFRoPrTxzmyUEqfn0RVvrD2an+NhoAnimJwta6r
 SDdho/v2D0fhb8qmaAsjGhDGqArilJja8sC3X8jIi48avDbjilwW5/wYK8dJB7G386Vel
 M+zbI127VyqR6QGXHA1ZvYIrD+y/BMZh15cXyYBSdsMAr0OmzfO9LodfvFPNP5vRg6+fs
 QyRBzL8FkTjaFceLwPKOoD3cT9CUHiNkMlffkJzsgtkSRboGbGxdwRYsAE4ijeJdmNw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792528782;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=3zr2+xyb9RXiq92mZXx+9iiKgQ85AYl8sx3XWPVyZPU=;
 b=NpGQG079sS/MzLwjy9LYhC8QjPt+eZiq+FfJ3ugqywRC7nVC6Vw2TqN0+idYiZNrU07m
 QWrEwB3Bie7CFxHMLJnQuvDLFhnt2OhNKjyXeX5yjO/3FstBLL/bEQYj66PGjqsvcPBBD
 xhVDA0w67tmj5MRQpgmYg9w7P6LGghsJJH/mCAMqEbawk1ELgl0qD2YWx1o3WDenLIsS2
 xJsxldTIrRvpm+5gJf2QnVD3QHoFLaJ/0ScnF3Gu86ij6d8pGJFnoXOZMTeXEPGXq+N3b
 sreAT1DDfqdhjitgcjegwM872nbP2rF4Bv4qyC4BcRuDKcu8rNoHNMP/WZem9mABjuw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ODCg0Qxq; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 963DA4006F
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 20:39:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 5E3C91A128B
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 20:39:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 204B460393;
 Tue, 20 Oct 2026 20:39:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D568610328934; 
 Tue, 20 Oct 2026 22:39:37 +0200 (CEST)
Date: Tue, 20 Oct 2026 22:39:37 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <atfRLgIqqBBd6TuN@windsurf>
References: <aq4_lUtScguSDLRY@waldemar-brodkorb.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aq4_lUtScguSDLRY@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 2/2] package/chawan: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

On Sat, Sep 19, 2026 at 09:53:57AM +0200, Waldemar Brodkorb wrote:
> Chawan is a text-mode web browser and pager for Unix-like systems, with
> a focus on implementing modern web standards while remaining
> self-contained, easy to understand and extensible.
> 
> It includes functionality such as CSS, inline images inside the
> terminal, and JavaScript through a small, independent browser engine.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

I've applied to master, with some changes.


> +CHAWAN_VERSION = 0.4.4
> +CHAWAN_SITE = https://git.sr.ht/~bptato/chawan/archive
> +CHAWAN_SOURCE = v$(CHAWAN_VERSION).tar.gz
> +CHAWAN_LICENSE = Unlicense
> +CHAWAN_LICENSE_FILES = UNLICENSE
> +
> +CHAWAN_DEPENDENCIES = brotli host-nim libssh2 openssl
> +
> +ifeq ($(BR2_aarch64),y)
> +CHAWAN_TARGET_ARCH = arm64
> +else ifeq ($(BR2_x86_64),y)
> +CHAWAN_TARGET_ARCH = amd64
> +else
> +CHAWAN_TARGET_ARCH = $(BR2_ARCH)
> +endif
> +
> +TARGET_CONFIGURE_OPTS += \

This was very very wrong, as it means you're changing this variable
for everyone in Buildroot. Variables are global.

"make check-package" actually warned about this:

WARNING: package/chawan/chawan.mk:23: possible typo, variable not properly prefixed: TARGET_CONFIGURE_OPTS -> *CHAWAN_XXXX* (https://nightly.buildroot.org/#_tips_and_tricks)

> +	FLAGS="--os=linux \
> +	--cpu:$(CHAWAN_TARGET_ARCH) \
> +	--gcc.exe:$(TARGET_CROSS)gcc \
> +	--gcc.linkerexe:$(TARGET_CROSS)gcc" \
> +	PREFIX="/usr"

So I've changed this to:

+CHAWAN_MAKE_OPTS = \
+       $(TARGET_CONFIGURE_OPTS) \
+       FLAGS="--os=linux \
+       --cpu:$(CHAWAN_TARGET_ARCH) \
+       --gcc.exe:$(TARGET_CROSS)gcc \
+       --gcc.linkerexe:$(TARGET_CROSS)gcc" \
+       PREFIX="/usr"

and then used CHAWAN_MAKE_OPTS.

> +define CHAWAN_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
> +endef
> +
> +define CHAWAN_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
> +	DESTDIR=$(TARGET_DIR) install

Continuation line should have had one more indentation level (minor
nit).

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
