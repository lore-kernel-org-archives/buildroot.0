Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7E5C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 19:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75F3B403E9;
	Fri,  3 Nov 2023 19:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75F3B403E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tB7QQeC3AzHl; Fri,  3 Nov 2023 19:55:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E801940445;
	Fri,  3 Nov 2023 19:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E801940445
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6355E1BF357
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 19:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A1BB822BC
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 19:54:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A1BB822BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Imo-SY_OB-RR for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 19:54:32 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC9D1822BA
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 19:54:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC9D1822BA
Received: by mail.gandi.net (Postfix) with ESMTPSA id E0FF81BF204;
 Fri,  3 Nov 2023 19:54:29 +0000 (UTC)
Date: Fri, 3 Nov 2023 20:54:29 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231103205429.1b7d26d3@windsurf>
In-Reply-To: <20231103174755.2118753-1-fontaine.fabrice@gmail.com>
References: <20231103174755.2118753-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699041270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3juT8eLUvBPzubja6QMIFXtkkNCCnXB+RD/sGWr//Eg=;
 b=SzN2DG25esjMq/bNJdCOOUNYdlQEAqAuNW1NO6at7NMVUqE2tWIqTslxthR5ufyc2MtNSi
 ePqh9vmCgU+C8nJHcnQAEGYKSPRVDmM4w0hdVEVjgV2r+jVRNAoCl1PB+gx2yYT54P2oTp
 9pgcMnRhX7zdQK89AgpDiNJXyLTWTiQ1RfZ6JWzpMNVlRDV4C4+6ozB9UBOjs14u4eQoKz
 aqBBHs0pB2qRDL9Y4zFw24J32RHtCszc/VuPQBtb1Saaa/jNDHCiRSixLusITQO8czrFDm
 SYrYKfACcQk4Aeewpce1VTf3DMptqWpgaMLRKqjecHjlICo2H4mPl51XSIDSKw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SzN2DG25
Subject: Re: [Buildroot] [PATCH 1/1] package/apache: add host-pkgconf
 dependency
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  3 Nov 2023 18:47:55 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> apache uses pkgconfig to find dependencies such as lua, nhgttp2, openssl
> and systemd.
> For openssl, pkgconfig is used since version 2.1.1 and
> https://github.com/apache/httpd/commit/0d4387dedc4ad83460bf52fc326c475c64133634
> resulting in the following build failure since at least bump to version
> 2.4.54 in commit 78e5a9c40e0754bbe840ef7b8da85efc28eb8b48:
> 
> ac_cv_path_PKGCONFIG=/usr/bin/pkg-config
> [...]
> configure:28669: checking for SSL_CTX_new
> configure:28669: /home/buildroot/autobuild/instance-1/output-1/host/bin/armeb-buildroot-linux-uclibcgnueabi-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3 -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -L/home/buildroot/autobuild/instance-1/output-1/host/armeb-buildroot-linux-uclibcgnueabi/sysroot/usr/bin/../../../../armeb-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -L/usr/lib conftest.c -lssl -lcrypto   -lpthread >&5
> armeb-buildroot-linux-uclibcgnueabi-gcc: ERROR: unsafe header/library path used in cross-compilation: '-L/usr/lib'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d85c86ee1070582014c7b29b39f9a9f356988220
>  - http://autobuild.buildroot.org/results/55d6bad8572138e200730d3a9f2dd1b9048fd95d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/apache/apache.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
