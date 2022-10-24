Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9675BC67871
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 21:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31CF5812E4;
	Mon, 24 Oct 2022 21:14:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31CF5812E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id etnsilhrJi9Q; Mon, 24 Oct 2022 21:14:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F954812A5;
	Mon, 24 Oct 2022 21:14:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F954812A5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D53621BF30C
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE0CD60B57
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:14:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE0CD60B57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Dm1EKP5lH4m for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 21:14:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4680560B10
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4680560B10
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 21:14:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E1F1920005;
 Mon, 24 Oct 2022 21:14:25 +0000 (UTC)
Date: Mon, 24 Oct 2022 23:14:23 +0200
To: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Message-ID: <20221024231423.24f384e3@windsurf>
In-Reply-To: <20221024174911.75444-1-abrodkin@synopsys.com>
References: <20221024174911.75444-1-abrodkin@synopsys.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666646066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=obhpXzkYrQEInv5Pu/hHa3cHMRJolWs7rLMb3Ps2vrI=;
 b=F0Ruc2SeGhzbBNhhil05Olz5N7Ks5BzcdaRrSo5gJAiv+4cvTfFRrUhr6uCoE2XMKRSY9U
 S3R6EkhIIhcxCkFmTeIxMRZwammCSk7R7teCT97aTf3ewsjXivX+jLtCALNJDMjKOlPP/y
 64Ot3FwsQ+kwIzktWJq++0Sg+7USUSXG9zD7UvtiqQkFTYFJzxZARbSdz/Yffv6sMa6TzM
 uFjbyUfrW7wYqluEhz4BycU2c61+1E05nnRnd5XVQn7uTQ8mTlJLknQovaDOr7A6oYiyKR
 skLEqGLG26lKNhdsJcF8YHrelUTvaQQV7FJUX0foe8Z75bHbVgpJakSRRdIA/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F0Ruc2Se
Subject: Re: [Buildroot] [PATCH] package/numactl: point to target libs via
 LDFLAGS
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alexey,

On Mon, 24 Oct 2022 19:49:11 +0200
Alexey Brodkin via buildroot <buildroot@buildroot.org> wrote:

> In the commit a699a667bd64 ("package/numactl: add -latomic to numa.pc")
> we opted-out from unconditional linking with "-latomic" and made it
> a conditional based on real availability of __atomic_fetch_and_1()
> in the toolchain. I.e. for many targets "-latomic" was not used
> any longer.
> 
> And in those supposedly rare cases when libatomic was required it was
> all OK until there's a LD_LIBRARY_PATH set with something where yet
> another libatomic.so instance exists, especially if that's the one from
> host (in my case I used a separately built host toolchain). Then we see:
> ---------------------->8-----------------------  
> /bin/sh ./libtool  --tag=CC   --mode=link .../buildroot/output/host/bin/arc32-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -Wl,-z,max-page-size=4096 -fPIC -std=gnu99    -o numastat numastat-numastat.o  -latomic
> 
> libtool: link: .../buildroot/output/host/bin/arc32-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g0 -Wl,-z -Wl,max-page-size=4096 -fPIC -std=gnu99 -o numastat numastat-numastat.o  .../gcc-5.2.0/lib/../lib64/libatomic.so -pthread -Wl,-rpath -Wl,.../gcc-5.2.0/lib/../lib64 -Wl,-rpath -Wl,.../gcc-5.2.0/lib/../lib64
> .../buildroot/output/host/lib/gcc/arc32-buildroot-linux-uclibc/12.2.1/../../../../arc32-buildroot-linux-uclibc/bin/ld: .../gcc-5.2.0/lib/../lib64/libatomic.so: error adding symbols: file in wrong format
> collect2: error: ld returned 1 exit status
> ---------------------->8-----------------------  
> 
> That happens because libtool of numactl adds contents of the aforementioned
> LD_LIBRARY_PATH to its "$searchdirs" and then the first libatomic.so it
> finds becomes the one used for linking. What's more our precios cross-built
> libatomic.so never even gets considered because that first found libatomic.so
> is used with full path, not as "-latomic" as otherwise it would have been used
> without helpful libtool.

Thanks for the patch. However, I don't get it. Where is LD_LIBRARY_PATH
defined? Do you have a reproducer for this issue?

> +NUMACTL_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -fPIC" \
> +		   LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/lib"

This is really a red flag, $(STAGING_DIR)/lib is already in the default
search path of the compiler, so that should never be needed.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
