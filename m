Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DBA5C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:30:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04EBC60EEA
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 04EBC60EEA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCA0C60A8A;
	Wed,  4 Aug 2021 20:30:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nsN364DO3Ccf; Wed,  4 Aug 2021 20:30:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D9F9608BA;
	Wed,  4 Aug 2021 20:30:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 822191BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71A998267F
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:29:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5P4lMdSsfD_k for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 20:29:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9246982446
 for <buildroot@busybox.net>; Wed,  4 Aug 2021 20:29:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id ADD38E000E;
 Wed,  4 Aug 2021 20:29:25 +0000 (UTC)
Date: Wed, 4 Aug 2021 22:09:38 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Michael Nosthoff via buildroot <buildroot@busybox.net>
Message-ID: <20210804220938.2e9609b2@windsurf>
In-Reply-To: <20210804114539.82015-1-buildroot@heine.tech>
References: <20210804114539.82015-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/grpc: bump version to 1.39.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Michael Nosthoff <buildroot@heine.tech>,
 Robert Rose <robertroyrose@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Wed,  4 Aug 2021 13:45:37 +0200
Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:

>  * drop CMakeLists.txt patch applied upstream.
>  * Update patch for wrap_memcpy.cc to match changed target file.
>  * update patch numbering.
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  ...ix-cross-compilation-with-gRPC_BUILD.patch | 43 -------------------
>  ...he-availability-of-pthread_setname_.patch} |  0
>  ...y.cc-add-GPR_DISABLE_WRAPPED_MEMCPY.patch} |  8 ++--
>  package/grpc/grpc.hash                        |  2 +-
>  package/grpc/grpc.mk                          |  2 +-
>  5 files changed, 6 insertions(+), 49 deletions(-)
>  delete mode 100644 package/grpc/0001-CMakeLists.txt-fix-cross-compilation-with-gRPC_BUILD.patch
>  rename package/grpc/{0002-Properly-detect-the-availability-of-pthread_setname_.patch => 0001-Properly-detect-the-availability-of-pthread_setname_.patch} (100%)
>  rename package/grpc/{0003-wrap_memcpy.cc-add-GPR_DISABLE_WRAPPED_MEMCPY.patch => 0002-wrap_memcpy.cc-add-GPR_DISABLE_WRAPPED_MEMCPY.patch} (85%)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
