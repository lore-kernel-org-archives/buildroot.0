Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0679C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 20:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7341E60AC9;
	Mon,  8 Aug 2022 20:41:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7341E60AC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hWwLOj6f8vNU; Mon,  8 Aug 2022 20:41:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 888DE607F7;
	Mon,  8 Aug 2022 20:41:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 888DE607F7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 24F5A1BF291
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F38F981464
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:41:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F38F981464
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GyEoQyKa5N0p for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 20:41:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70A878145C
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70A878145C
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 20:41:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 167D1240002;
 Mon,  8 Aug 2022 20:41:45 +0000 (UTC)
Date: Mon, 8 Aug 2022 22:41:45 +0200
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Message-ID: <20220808224145.2705f093@windsurf>
In-Reply-To: <20220808150641.19475-1-nicolas.cavallari@green-communications.fr>
References: <20220808150641.19475-1-nicolas.cavallari@green-communications.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659991306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KoBKt3JB4iOlVFUvbcUVTp2weVhrx67BwX/9z1dvx2U=;
 b=gWEtGC8n3qpsBysCKFOgjPF6XzitAVg75szw0nHaCCo3hkqDRJpOotIsj4HnrdhBdJq5s+
 n/2/+YWhom+32SVl7VqyJYWuNg9mNdKnGt5tWDVIL8TpwBTfDU7mHTf2dYdrKvLqw7brmb
 16W0DEw0wdMozggaTJkl5hM2FaKtrlyvztBUOcPKPoVRqRpQKR9VU8wEsMOIqFniwav7W6
 SroaK6WT2Xg300y+NqhBNlO3+0Wkf9WseEixjiUn86obNHjqPQ+4V8N4fkbKbbrMrYHqGd
 ZlqYlpQYS2P2+0OsriFH9wubH9RyloFx18eLztnkjZvax2luODcFIJ+Lh/KQeg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gWEtGC8n
Subject: Re: [Buildroot] [PATCH 1/2] package/libgit2: depends on native
 64bit atomics
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Nicolas,

On Mon,  8 Aug 2022 17:06:40 +0200
Nicolas Cavallari <nicolas.cavallari@green-communications.fr> wrote:

> libgit2 does not know about libatomic_ops.
> 
> This wasn't a problem before because it is a shared library, so the
> missing symbols were simply added as undefined, and no project currently
> depend on libgit2 to expose the problem.
> 
> The next version of libgit2 can also build a binary, which will expose
> the problem.
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

Which build failure do you have exactly? Indeed when building for
SPARC, what I see are calls to __atomic_compare_exchange_4,
__atomic_fetch_add_4, __atomic_fetch_sub_4.

Is this what you are referring to?

If yes, then these are not sync builtins
(https://gcc.gnu.org/onlinedocs/gcc/_005f_005fsync-Builtins.html), but
atomic builtins
(https://gcc.gnu.org/onlinedocs/gcc/_005f_005fatomic-Builtins.html).

The Buildroot options BR2_TOOLCHAIN_HAS_SYNC_xyz are for sync builtins.

The Buildroot option BR2_TOOLCHAIN_HAS_ATOMIC is for atomic builtins.

So, your package needs to:

	depends on BR2_TOOLCHAIN_HAS_ATOMIC

and then in its .mk file, so something like this:

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
... make sure your package links against libatomic.so by passing -latomic in LDFLAGS
endif

Note that libatomic.so is distinct from libatomic_ops.so. libatomic.so
is provided together with the gcc runtime, and implements the atomic
builtins on architecture where they are not implemented directly by the
compiler (a runtime library is needed).

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
