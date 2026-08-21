Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E948C5DF87
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 08:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2165F408AD;
	Fri, 21 Aug 2026 08:42:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wIyMM6leeSFs; Fri, 21 Aug 2026 08:42:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787301752;
	bh=5vqRTA7Vb/DAgPR/zWZMmMDcM2xRPVMl2Wfdq85JYWI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=p/7rxSyRu2tvS4GYq+S3JjXzw8Yfd6qyZOpM7w8RYE4NfOON30233Xidrqo2LadzN
	 hKlmgjFBGUTpTQPlKhF9lZ1Tt5WWZTaDM5TdO5FHHPdqcPv3aAoCTR+0DQfQyY0m9c
	 r1dN+pbcK4/VI2Sz7l4ZqWTi+gdCJ+PXBEMRdx5koxi/EfrGwNUv5IvF/4Xztb4LyA
	 0TrdQE7XB9olyvSRTPmSBjnQCNcBZDKePLgESOW6MWPBJwQY/+iQEYEW5THsYfh8Lp
	 l3DvdhDxV9aXH1B8mkvUyQ76Xxn7NK65iCmfWI4ZQSomEIEbSTYTY53vZxao0d46jU
	 L6B8hqmLFuUmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22E86408B0;
	Fri, 21 Aug 2026 08:42:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D1B2E476
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 08:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE97E60662
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 08:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id re_pZhChQgge for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 08:42:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D529360661
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 08:42:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 7BB284E41251
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 08:42:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 42E24604AA;
 Fri, 21 Aug 2026 08:42:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 254FF11C76D6B; 
 Fri, 21 Aug 2026 10:42:19 +0200 (CEST)
Date: Fri, 21 Aug 2026 10:42:19 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aogPFYDwimNddpnl@windsurf>
References: <20260808060556.4358-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260808060556.4358-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/php: fix OpenSSL detection for
 SNMP extension
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Sat, Aug 08, 2026 at 08:05:56AM +0200, Bernd Kuhls wrote:
> Buildroot commit a9e5cf6ac2cb7ba62d23c842899b3f7816eca14c bumped the
> package to version 8.4.13 which added upstream commit:
> https://github.com/php/php-src/commit/dbdc79df954a22495d0939eceb3ab4e09ced1c1e
> introducing changes for netsnmp detection.
> 
> Since this bump building php with its SNMP extension enabled and openssl
> globally disabled is broken:
> 
> /home/autobuild/autobuild/instance-12/output-1/host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../i686-buildroot-linux-gnu/bin/ld:
>  ext/snmp/snmp.o: in function `snmp_session_set_security':
> snmp.c:(.text+0x677): undefined reference to `usmHMAC384SHA512AuthProtocol'
> /home/autobuild/autobuild/instance-12/output-1/host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../i686-buildroot-linux-gnu/bin/ld:
>  snmp.c:(.text+0x9c2): undefined reference to `usmHMAC192SHA256AuthProtocol'
> 
> because php configure misdetects the presence of openssl support in
> netsnmp although it is not present.
> 
> To fix the problem we add some autoconf variables to forcefully disable
> OpenSSL support in the SNMP extension when OpenSSL is disabled.
> 
> The build error could be reproduced with php 8.4.17 but could not be
> reproduced with php 8.3.24 so a backport to LTS branches should be
> considered.

I don't really understand this paragraph. If the issue does NOT happen
with php 8.3.x that is in 2025.02.x, then why should the backport be
considered?

> +ifeq ($(BR2_PACKAGE_OPENSSL),)
> +PHP_CONF_ENV += \
> +	ac_cv_have_decl_usmHMAC192SHA256AuthProtocol=no \
> +	ac_cv_have_decl_usmHMAC384SHA512AuthProtocol=no
> +endif

As usual, I don't like this approach. If the detection of NetSNMP by
the PHP configure.ac is broken, then it should be fixed rather than
worked around. Could you have a look at doing a proper fix, that can
be submitted upstream?

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
