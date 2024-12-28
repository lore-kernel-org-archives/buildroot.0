Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A23E77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 23:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECBB980CE3;
	Sat, 28 Dec 2024 23:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BPtkCFniWBHN; Sat, 28 Dec 2024 23:02:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC92180CE7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC92180CE7;
	Sat, 28 Dec 2024 23:02:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B8B2C8
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 23:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C98F60627
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 23:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FNjiI9FTQHIj for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 23:02:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0ECBB6061B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0ECBB6061B
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0ECBB6061B
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 23:02:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A438F1C0002;
 Sat, 28 Dec 2024 23:02:04 +0000 (UTC)
Date: Sun, 29 Dec 2024 00:02:04 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Heiko Thiery <heiko.thiery@gmail.com>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>, Jan
 =?UTF-8?B?S3VuZHLDoXQ=?= <jan.kundrat@cesnet.cz>
Message-ID: <20241229000204.764dcc66@windsurf>
In-Reply-To: <20241219152105.298310-6-heiko.thiery@gmail.com>
References: <20241219152105.298310-1-heiko.thiery@gmail.com>
 <20241219152105.298310-6-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735426925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nByn/MdE8gBLlsY9qclUDTQBtZYPA6yaDJYnYuQpKqQ=;
 b=JgT+lnma0ea1sXfPQ31rCESOMH65cfZe8AD/+1DHiXwuIaml6HBumPH0eQ1pxJJ2CIRGzX
 dcQuxuYUm4eavl9awXmTo/C4+wwGqktFgzA7gYHge1pT/khDZvhVkJ/al9+TWJwxbCW+i3
 4fsFlvLERKL96Qx8tclVCKXg7btwk6jvJrAa8Mlm6GWX5eVllYVTlG8W0seMBIO/2aeL6S
 tB8JxnpvN5rYVD4r06Zs34xaYcZq71cT4QVmzWHgEPJtoduwveifxnaMkZR3en21XmBwCW
 EmeRkuqSlk+QIvI8nMkNYNu5MUcdfALZY/O87dSA1ZgNesTJCZ7ZjGckdZg51g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JgT+lnma
Subject: Re: [Buildroot] [PATCH 6/6]
 support/testing/tests/package/test_netopeer2.py: add new test
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

Hello Heiko,

On Thu, 19 Dec 2024 16:21:11 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

I wanted to merge this test with the current version of netopeer2 and
related packages in Buildroot, i.e without your version bumps, and the
build fails with:

-- Could NOT find CURL (missing: CURL_LIBRARY CURL_INCLUDE_DIR) 
-- libcurl not found, url capability will not be supported
-- Could NOT find LibSystemd (missing: LIBSYSTEMD_LIBRARY LIBSYSTEMD_INCLUDE_DIR SYSTEMD_UNIT_DIR) 
CMake Warning at CMakeLists.txt:301 (message):
  Disabling netopeer2-server systemd support because libsystemd was not
  found.


-- Performing Test CMAKE_HAVE_LIBC_PTHREAD
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success
-- Found Threads: TRUE
-- Found LibYANG: /home/thomas/projets/outputs/TestNetopeer2/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libyang.so (found suitable version "2.46.3", minimum required is "2.28.0")
-- Found Sysrepo: /home/thomas/projets/outputs/TestNetopeer2/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libsysrepo.so (found suitable version "7.23.1", minimum required is "7.12.0")
CMake Error at cli/CMakeLists.txt:49 (message):
  c_rehash Perl OpenSSL script not found!


-- Configuring incomplete, errors occurred!
make[1]: *** [package/pkg-generic.mk:279: /home/thomas/projets/outputs/TestNetopeer2/build/netopeer2-2.1.49/.stamp_configured] Error 1
make: *** [Makefile:23: _all] Error 2

So it looks like there is an existing issue in Buildroot?

> +class TestNetopeer2(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        f"""

Please drop the "f" here, since you're not using this as an f-formatted
string, flake8 complains when checking this Python script.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
