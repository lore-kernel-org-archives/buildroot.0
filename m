Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B489BC83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BC5360869;
	Thu, 17 Jul 2025 20:25:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bmRfrjkpQTVK; Thu, 17 Jul 2025 20:25:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A305F607E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A305F607E3;
	Thu, 17 Jul 2025 20:25:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C45C226
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C7478111A
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:25:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VOGLreaPqS3a for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:25:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 59C8081104
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59C8081104
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59C8081104
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:25:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C48FFB977AA4; Thu, 17 Jul 2025 22:25:25 +0200 (CEST)
Message-ID: <2e92dbd4-3e0b-4183-b45d-a3fcd8286dd9@rnout.be>
Date: Thu, 17 Jul 2025 22:25:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yegorslists@googlemail.com, buildroot@buildroot.org
Cc: ju.o@free.fr
References: <20250707101837.4032434-1-yegorslists@googlemail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250707101837.4032434-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752783925; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=P0Js5FekKwUMZdNzy9rfgSbgQ6VypXtgKnknELpVK4k=;
 b=hprHZcuSpOfMfcJmCB/SVodxC17nRmKNFX9ufHBr05ly5zOnkIYxot8/MujULypO+DKXw1
 tt4YX509yVHOqplwnPnqRUZMh0y1j5JSVvJNFOoLwW/xVizmMaOL9tseapK9Y11BoFupZV
 xEs9TFDfRy9QRDdpe48nyriP4oRfkGmSV6QkMXTnJ2kg+876cXqWfxe1lsfaAEJhMFI4HZ
 cFN/dKnOEi58yAOoIWUmOgxZwvBTVW5Is0n8TaenwQ1NWRpl17KEewEm8r+Ds9SlYtFVqC
 bNKQGxfT16Qp01YDNKvoVIGbAee96vbIYYvfVk6Ww+t7YfzNjnfpMela/sf6Hw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=hprHZcuS
Subject: Re: [Buildroot] [PATCH] package/parted: fix do_version declaration
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/07/2025 12:18, yegorslists--- via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> With gcc 15-20241117 compile fails with the below error, update the
> do_version declaration to match the header in command.h
> 
> ../../parted/parted.c: In function '_init_commands':
> ../../parted/parted.c:2469:9: error: passing argument 2 of 'command_create' from incompatible pointer type [-Wincompatible-pointer-types]
>   2469 |         do_version,
>        |         ^~~~~~~~~~
>        |         |
>        |         int (*)(void)
> In file included from ../../parted/parted.c:28:
> ../../parted/command.h:35:39: note: expected 'int (*)(PedDevice **, PedDisk **)' {aka 'int (*)(struct _PedDevice **, struct _PedDisk **)'} but argument is of type 'int (*)(void)'
>     35 |                                 int (*method) (PedDevice** dev, PedDisk** diskp),
>        |                                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Upstream: https://cgit.git.savannah.gnu.org/cgit/parted.git/commit/?id=16343bda6ce0d41edf43f8dac368db3bbb63d271
> 
> Fixes:
> https://autobuild.buildroot.org/results/283f52d50ffef91d82a1bdc1f4dde1d54c5ffc23/build-end.log
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

  Applied to 2025.05.x, thanks.

  Regards,
  Arnout

> ---
>   ...CH-parted-fix-do_version-declaration.patch | 44 +++++++++++++++++++
>   1 file changed, 44 insertions(+)
>   create mode 100644 package/parted/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch
> 
> diff --git a/package/parted/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch b/package/parted/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch
> new file mode 100644
> index 0000000000..78709e07ad
> --- /dev/null
> +++ b/package/parted/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch
> @@ -0,0 +1,44 @@
> +From 16343bda6ce0d41edf43f8dac368db3bbb63d271 Mon Sep 17 00:00:00 2001
> +From: Rudi Heitbaum <rudi@heitbaum.com>
> +Date: Wed, 20 Nov 2024 12:22:22 +0000
> +Subject: [PATCH] bug#74444: [PATCH] parted: fix do_version declaration
> +
> +With gcc 15-20241117 compile fails with the below error, update the
> +do_version declaration to match the header in command.h
> +
> +../../parted/parted.c: In function '_init_commands':
> +../../parted/parted.c:2469:9: error: passing argument 2 of 'command_create' from incompatible pointer type [-Wincompatible-pointer-types]
> + 2469 |         do_version,
> +      |         ^~~~~~~~~~
> +      |         |
> +      |         int (*)(void)
> +In file included from ../../parted/parted.c:28:
> +../../parted/command.h:35:39: note: expected 'int (*)(PedDevice **, PedDisk **)' {aka 'int (*)(struct _PedDevice **, struct _PedDisk **)'} but argument is of type 'int (*)(void)'
> +   35 |                                 int (*method) (PedDevice** dev, PedDisk** diskp),
> +      |                                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Upstream: https://cgit.git.savannah.gnu.org/cgit/parted.git/commit/?id=16343bda6ce0d41edf43f8dac368db3bbb63d271
> +
> +Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
> +Signed-off-by: Brian C. Lane <bcl@redhat.com>
> +Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> +---
> + parted/parted.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/parted/parted.c b/parted/parted.c
> +index 3abb52f..fc2aeba 100644
> +--- a/parted/parted.c
> ++++ b/parted/parted.c
> +@@ -2172,7 +2172,7 @@ do_unit (PedDevice** dev, PedDisk** diskp)
> + }
> +
> + static int
> +-do_version ()
> ++do_version (PedDevice** dev, PedDisk** diskp)
> + {
> +     printf ("\n%s\n%s",
> +             prog_name,
> +--
> +2.34.1
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
