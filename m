Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FD1C52D7B
	for <buildroot@archiver.kernel.org>; Tue, 13 Aug 2024 06:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 626FA4062A;
	Tue, 13 Aug 2024 06:58:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h4I0Rfik3qyx; Tue, 13 Aug 2024 06:58:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 284AD40661
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 284AD40661;
	Tue, 13 Aug 2024 06:58:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 009811BF410
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 06:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1FD040661
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 06:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oZ_QAXDX9nqz for <buildroot@lists.busybox.net>;
 Tue, 13 Aug 2024 06:58:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 33B114062A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33B114062A
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33B114062A
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 06:58:27 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 155473520C9B; Tue, 13 Aug 2024 08:58:23 +0200 (CEST)
Date: Tue, 13 Aug 2024 08:58:23 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZrsED1PkoKznI94O@waldemar-brodkorb.de>
References: <ZrhLQMty5kRy7Oo4@waldemar-brodkorb.de>
 <20240812221448.40e4d87a@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240812221448.40e4d87a@windsurf>
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723532304; bh=wcWptvexOWBb8H05ZK28x2BRKnR1pPQVbifHsDlPWa4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zf314rkgobDSAk+Yk0Dp4TCTIgSc+a1a8EO7TTqY4l2zMKSH/U5swiV1FYzZdhfvN
 Z440/MCohd3MuD7taiCBs34iptR5atQDIYZ7tDjbTEvXJirRrXu2NyvFWWzcaJBUwp
 RkIaJvcFurw0Y8rN6ykDrgecvRkv4HxovaD6RX40F51gRTFJpeWrMVVoFWGvTxWidm
 wIXSnvMB2/MakG3wbRnWL8scWTHSOKQeFIy/pSNoqEks+aaAEPYHLiqzWHHeabc/UM
 /V2sQ8LkcKvkXCYeG0tbVrswKVyHTZaz/gUsydF+4iwOSdJ2j3voUYZ4F1/qJR+eO+
 xRTzKhG8wK1dg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=Zf314rkg
Subject: Re: [Buildroot] [PATCH next] package/hiawatha: update to 11.6
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
> On Sun, 11 Aug 2024 07:25:20 +0200
> Waldemar Brodkorb <wbx@openadk.org> wrote:
> 
> > See here for a changelog:
> > https://hiawatha.leisink.net/changelog
> > 
> > Update Config.in to use the new homepage.
> > Update download site to use the new homepage.
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> > ---
> >  package/hiawatha/Config.in     | 2 +-
> >  package/hiawatha/hiawatha.hash | 2 +-
> >  package/hiawatha/hiawatha.mk   | 4 ++--
> >  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> You're going to hate me, but this bump also doesn't build.
> 
> Try to build:
> 
> BR2_arm=y
> BR2_cortex_a9=y
> BR2_ARM_ENABLE_VFP=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_HIAWATHA=y
> # BR2_TARGET_ROOTFS_TAR is not set
> 
> Successful before your bump, fails after your bump.

I only tested with TLS on, sorry.

It seems upstream is broken regarding ENABLE_TLS=OFF.
I tried to patch CMakeFiles.txt to add the missing sha3.c, but then
other symbols are missing. I added 5 missing files and still no go.
Uptream is not very active anymore, he mentions on his website that
he is doing releases, but no active development anymore.

We could remove TLS off case entirely and still have a small secure
webserver. What do you think?

> Also, it is worth nothing that there is also an issue with the 11.2
> version of hiawatha: the hash we have in Buildroot no longer matches
> the one from the upstream tarball:
> 
> ERROR: while checking hashes from package/hiawatha/hiawatha.hash
> ERROR: hiawatha-11.2.tar.gz has wrong sha256 hash:
> ERROR: expected: 99c64f76927f93469f062ab76b74eb79a397ea4be12da86bf746b2bb57cf1bc5
> ERROR: got     : e00a659225b5f201b1fd81014277bcfe96da476a165f92fc057f3d7036c8b993
> ERROR: Incomplete download, or man-in-the-middle (MITM) attack
> 
> It "works" because we fallback to sources.buildroot.net, which has the
> "right" tarball, but it would be nice to understand what's going on.
> 
> Could you have a look?

It is because the old URL is no longer available and a html is
downloaded instead of the tar.gz.

best regards
 Waldemar
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
