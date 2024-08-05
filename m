Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBAEC3DA4A
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 14:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A53304024F;
	Mon,  5 Aug 2024 14:19:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ndD0yG3Nm7Xr; Mon,  5 Aug 2024 14:19:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C23340251
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C23340251;
	Mon,  5 Aug 2024 14:19:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A5CE61BF362
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 14:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9009B40474
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 14:19:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c8VtLAEty3Gg for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 14:19:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CCA2940010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCA2940010
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CCA2940010
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 14:19:00 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id B0F0335360B5; Mon,  5 Aug 2024 16:18:58 +0200 (CEST)
Date: Mon, 5 Aug 2024 16:18:58 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZrDfUiHpsx1ikBgv@waldemar-brodkorb.de>
References: <ZrDNQvSIPQNosVmQ@waldemar-brodkorb.de>
 <20240805155519.2f15b386@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240805155519.2f15b386@windsurf>
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1722867538; bh=/po8tWiYbQiAStuSP1gKy/sw75l9CEn7YTmpJmWChzw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mScH5f8BhtMOPApWoQzc/rnx1ztXNqp5Er0a5GbrnuXsAmXBxyG1kj2EfDqxfz5me
 neWk3BUmYtrUr+9kkE7GibEpSee8BTIjOn3q7FJiRr4hqhjz7SsPZkI8VQ2V9ftHOv
 d1/LYbRlMo+vQ95wTEaoDTxNmDXUkWvPKmW17ml6AMgcWTrdhUYo7p/TxrN16rqFTr
 iAlsRqC9s6U3sBSYVXMogtHO5v3GXMtPlSnmkjq9oogIsHajGpY6ZjjEShYWNTjCiE
 4H84/jeZYkD7Qo5BaeutYEICYG/qoNO5L8QWMDiGFWzs49LxDQhP3A8/LlqeoycJ45
 gTph69vzlC5pg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=mScH5f8B
Subject: Re: [Buildroot] [PATCH] package/nginx: security update to 1.26.1
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,
Thomas Petazzoni wrote,

> Hello Waldemar,
> 
> On Mon, 5 Aug 2024 15:01:54 +0200
> Waldemar Brodkorb <wbx@openadk.org> wrote:
> 
> > See here for a Changelog and CVE's:
> > http://nginx.org/en/CHANGES-1.26
> > 
> > Patch 0006 is no longer required as the openssl library is found without
> > this patch, which does not apply anymore.
> > 
> > Patch 0009 is no longer required as it was fixed in another way upstream:
> > https://hg.nginx.org/nginx/rev/fb989e24c60a
> > 
> > Patch 0011 is upstream:
> > https://hg.nginx.org/nginx/rev/f58b6f636238
> > 
> > Reorder the remaining patches and update .checkpackageignore accordingly.
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> > ---
> >  .checkpackageignore                           |   8 +-
> >  ...-auto-lib-libgd-conf-use-pkg-config.patch} |   0
> >  ...auto-lib-openssl-conf-use-pkg-config.patch | 251 ------------------
> >  ...inux_config.h-only-include-dlfcn.h-.patch} |   0
> >  ...of-endianness-for-cross-compilation.patch} |   0
> >  ...to-os-linux-fix-build-with-libxcrypt.patch |  38 ---
> >  ...ix-compile-error-in-configure-script.patch |  33 ---
> >  package/nginx/nginx.hash                      |   2 +-
> >  package/nginx/nginx.mk                        |   2 +-
> >  9 files changed, 5 insertions(+), 329 deletions(-)
> >  rename package/nginx/{0007-auto-lib-libgd-conf-use-pkg-config.patch => 0006-auto-lib-libgd-conf-use-pkg-config.patch} (100%)
> >  delete mode 100644 package/nginx/0006-auto-lib-openssl-conf-use-pkg-config.patch
> >  rename package/nginx/{0008-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch => 0007-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch} (100%)
> >  rename package/nginx/{0010-Allow-forcing-of-endianness-for-cross-compilation.patch => 0008-Allow-forcing-of-endianness-for-cross-compilation.patch} (100%)
> >  delete mode 100644 package/nginx/0009-auto-os-linux-fix-build-with-libxcrypt.patch
> >  delete mode 100644 package/nginx/0011-Fix-compile-error-in-configure-script.patch
> 
> This update breaks legal-info:
> 
> ERROR: while checking hashes from package/nginx/nginx.hash
> ERROR: LICENSE has wrong sha256 hash:
> ERROR: expected: ececed0b0e7243a4766cbc62b26df4bd3513b41de3a07425da1679c836d06320
> ERROR: got     : f19c4caea60247490199c5a6d0134281e3fb20b3d7577e6873c628597f5381d9
> ERROR: Incomplete download, or man-in-the-middle (MITM) attack
> 
> (the change of the license file hash must be explained in the commit
> message)
> 
> Thanks!

Dammit, why I always forgetting this? ;) Thanks for the quick review,
v2 sent.

Best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
