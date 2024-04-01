Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FBACD1292
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 11:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C3BF4061F;
	Mon,  1 Apr 2024 11:29:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G_FcPtfGB5Qc; Mon,  1 Apr 2024 11:29:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BF6440628
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BF6440628;
	Mon,  1 Apr 2024 11:29:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A55AC1BF378
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 11:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FD4881E64
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 11:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z9fyjQGR3YbT for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 11:29:32 +0000 (UTC)
X-Greylist: delayed 305 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 01 Apr 2024 11:29:31 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 83C1781E53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83C1781E53
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83C1781E53
 for <buildroot@busybox.net>; Mon,  1 Apr 2024 11:29:31 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([212.114.183.170]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1Mqs0X-1sdnvz1srB-00mvpf; Mon, 01 Apr 2024 13:24:22 +0200
To: buildroot@busybox.net
Date: Mon,  1 Apr 2024 13:24:21 +0200
Message-ID: <20240401112421.27763-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:dNVJQruZ+eXX4aGa5+dTl6rgSztyue37omepfKaoYQiZ/quY9Uf
 X0hua/MY1JNCK41hGucqM89qoU2W3M/aJln/sqg0CUKcFL8Ze2ec93qifDwbOsMr9cACJW9
 S6je4Xx9vibNRQ33hLrX/dElzPo0UadfE6bvuok1ECDO9UWboFCJBB7iFs133ziAi6Y8zue
 Iv6KTYRQWu0Euu1mi/tgQ==
UI-OutboundReport: notjunk:1;M01:P0:qf+vJxzAIwo=;4K3xYD82la8OLtl9Ynr+ILQSi00
 LdR6QE4eePT3br7hv70UU7e82xfyQIp4Ekdes6Dzz2iFMYbz1Fe+rLJ+r/K6bvrt7vh8S1vfM
 AMc0IYqIUzp1dm6Zu9N6lD318phGHHVvlKietBqh17H4srxcqUusRVE74yGQzxIrKb5KU5Yyu
 byuhyLtDxNrPxlSoNTfIRv47Z73mz5+priJVuNGjs5qWPs+8jF0qhBRL8OhInWK0QI9K3MGO1
 fm2AXET0ovTR14rcSbDIx4cWQqzH3JUYYVxzFO5lckrAUYV3rUMQdQoLIi8nH+RVhrA7ICXb5
 ZVNMRoxWqCY8La1OpX1/bBcDTj7TWbHts3VIybBQ44R+hLmRaSUVUVvxyF2XfBo5mM7Jxp5H7
 UTzSIANy3IMXmhBQGX095KNH4YdfAMCJEX6p3zCrI2ErClGrZ3oV/REI/THRRdU0Jg4ti7hY6
 dWJjU3PSni5Ma6Feof9U/QXku22CJHxNBPVJDV5Qy0/iVPZR9Axbup2kIVB/z6FILFdHTaD5m
 D45xQwJhVkoA9h8dn+aTRfU2Yj4R8+16imGhnxtgZOAqbSVB0OlFY0VrSiQLLWZZDAl5klLY/
 gAAp7EnZesXZC/c1QjUclwNNF07AlFI/tBvgxyy1GNqa677G2C2nH9qW3fK2lHjmR7Ea3YQ/1
 OzKbPKzUE6D8QZmS0PYD9JhUUe1gN1HY80eQEqoFbi/plnQyCOScE15VtDYkMrWV/IRv0UOVK
 2vfHZJIFfXYxrwMe2xLqTJgs9p9ef89GD5y4TddPBrLT2qr5bnuj8bum4jnUJhP/l8CLxSHvH
 XhVSAuLZuVYnOpqqezHEHQuuOFesfu4hWbPPC3f17MexE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1711970969; x=1712575769; i=ps.report@gmx.net;
 bh=GKBBwBYFLOB18xqELeKlcxCCTQC8N46KHw0QhDE7zDQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=AFIq3+wkQLMnnlDrdkxh+AFu7MSZ6mweJmAmPQyWq1Oyhl3GhQ5ttlb3OS5+mpjt
 4HbFybM94mYRlEtQrqSR0MBvSVkbEDN88P9Q+IBppIFYNxuSEAApfVz6l6IAKKnLz
 atrnlkzktOprs57UEpqqf/sjmPsfboS2XZwvUEb8z3QyRv9PMHSqjH/lxEbUwwQLv
 /ZJysCVTHLWpAjGxctGVj+wxmKYuRaxBuN1YejXZKcJPv2qTRNhDg9lPtvYuCA6ey
 jC6XhpSFOsfr99OcotmqSTnh8wyUO/BaM/lNZGtTvsvl/H6XaKqXssSKF5mgyBogZ
 LPkRu28u5DYBGt7LEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=AFIq3+wk
Subject: [Buildroot] [PATCH v1] package/zic: fix host compile (needs
 CC/HOST_CONFIGURE_OPTS set)
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: Kadambini Nema <kadambini.nema@gmail.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Host compile of zic needs CC defined since version bump to 2024a (given by
HOST_CONFIGURE_OPTS).

	$ diff -ru build/host-zic-2023c/Makefile build/host-zic-2024a/Makefile
  --- build/host-zic-2023c/Makefile	2024-04-01 12:44:14.515490354 +0200
  +++ build/host-zic-2024a/Makefile	2024-04-01 13:10:50.138333771 +0200
  [...]
  +# To affect how this Makefile works, you can run a shell script like this:
  +#
  +#	#!/bin/sh
  +#	make CC='gcc -std=gnu11' "$@"
  +#
  +# This example script is appropriate for a pre-2017 GNU/Linux system
  +# where a non-default setting is needed to support this package's use of C99.
  +#
  +# Alternatively, you can simply edit this Makefile to tailor the following
  +# macro definitions.
  +
  +###############################################################################
  +# Start of macros that one plausibly might want to tailor.
  [...]
  -cc=		cc
  -CC=		$(cc) -DTZDIR='"$(TZDIR)"'
  [...]

Fixes:

  c99 -O1   -c -o zic.o zic.c
  make[2]: c99: No such file or directory

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/zic/zic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 95fa1eaa96..8abcec9360 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -12,7 +12,7 @@ ZIC_LICENSE = Public domain
 ZIC_LICENSE_FILES = LICENSE
 
 define HOST_ZIC_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) zic
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) zic
 endef
 
 define HOST_ZIC_INSTALL_CMDS
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
