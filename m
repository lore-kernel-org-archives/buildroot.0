Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB727C35FF1
	for <buildroot@archiver.kernel.org>; Sun, 16 Mar 2025 22:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E67C8205A;
	Sun, 16 Mar 2025 22:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cjWDPksEcpOb; Sun, 16 Mar 2025 22:33:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7330C8205E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7330C8205E;
	Sun, 16 Mar 2025 22:33:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C56C16E
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 22:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70D088205E
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 22:33:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id syyE4VPb1Gx0 for <buildroot@buildroot.org>;
 Sun, 16 Mar 2025 22:33:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 833908205A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 833908205A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 833908205A
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 22:33:26 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:5419:6efd:b79f:c072])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 42CA62003BE;
 Sun, 16 Mar 2025 23:33:17 +0100 (CET)
Date: Sun, 16 Mar 2025 23:33:17 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Julien Olivain <ju.o@free.fr>
Cc: Vladimir Oltean <olteanv@gmail.com>, buildroot@buildroot.org, 
 Ioana Ciornei <ciorneiioana@gmail.com>,
 Brandon Maier <Brandon.Maier@collins.com>, 
 Romain Naour <romain.naour@smile.fr>, Akhilesh Nema <nemaakhilesh@gmail.com>
Message-ID: <jcudtyyagluxd6cbdpxn3wyh3l4fhtb76jadbdqb6c7rw4pjxx@gppoquvg6tz6>
References: <20250302215219.1276480-1-olteanv@gmail.com>
 <20250302215219.1276480-8-olteanv@gmail.com>
 <eb97b1c9f855846fa3ec2ec8b6332616@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eb97b1c9f855846fa3ec2ec8b6332616@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742164403;
 bh=2oKs6oFGequ7W0vXoUAgvHGGh0qUEY/T5EiQldgmaTg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cKRwrwgh/ZZ6gkIIX8eNSgPfFfq+fLMijLoUYzqpExBJPuQ9G/HC1OQtd5EDUfE2+
 Tt+MYousZ1B1dahBxwGpmrZ+iTnnlRHGTh4ai+fR3F9pHm4LOHeNT2pvO19jGd66v7
 MITF2CvI7gAu1VrX9/nzkQF4rZaiW+gPO9KZaNiPzBbRrNyiVFyHagtcn2FeFTJt91
 aAmy9KQ2FzfQqWrh9yaahYeMD2daNHmnd6iis7zvcbAFITWJXok2nyIWciHFKOVLWT
 LYsHGYixUPN6EIT98PaOaUgBNhtUdebJQr7CcW+aCQpXgywEQJ/bNzts8DfRH2aT5k
 qLNPGFAAfgEGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cKRwrwgh
Subject: Re: [Buildroot] [PATCH 07/15] package/qoriq-restool: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, Vladimir,

So running without pandonc on the host, what's about the following, see
below.

>     utils/docker-run make qoriq-restool
> 
> Fails with error:
> 
>     pandoc --standalone --to man restool.md -o restool.1
>     make[1]: pandoc: No such file or directory
> 
Assuming a patch based on:
  https://github.com/nxp-qoriq/restool/pull/2

then, we could have:
 define QORIQ_RESTOOL_INSTALL_TARGET_CMDS
-       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) prefix=/usr install
+       MANPAGE="" $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) prefix=/usr install
 endef

which allows building without running pandoc.

My 2 cents,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
