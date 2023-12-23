Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C32C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 06:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D107B83CE1;
	Sat, 23 Dec 2023 06:42:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D107B83CE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nS2jodwKzqX1; Sat, 23 Dec 2023 06:42:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36ABD83CA9;
	Sat, 23 Dec 2023 06:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36ABD83CA9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DD7BC1BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 06:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9BBB60AFF
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 06:42:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9BBB60AFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5N9WLAoqtuy9 for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 06:42:32 +0000 (UTC)
X-Greylist: delayed 305 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 23 Dec 2023 06:42:32 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BEA660AFD
Received: from mail-108-mta191.mxroute.com (mail-108-mta191.mxroute.com
 [136.175.108.191])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5BEA660AFD
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 06:42:32 +0000 (UTC)
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta191.mxroute.com (ZoneMTA) with ESMTPSA id
 18c95648f9e0003727.001 for <buildroot@buildroot.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 23 Dec 2023 06:37:24 +0000
X-Zone-Loop: 49041101db2a7170e5baeb53bc001889e150ff45cecd
X-Originating-IP: [136.175.111.2]
Message-ID: <2f0cff7f-b526-44da-a831-85f70218f2aa@grantnichol.com>
Date: Sat, 23 Dec 2023 00:37:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Grant Nichol <me@grantnichol.com>
References: <>
Content-Language: en-US
To: buildroot@buildroot.org
In-Reply-To: <>
X-Authenticated-Id: me@grantnichol.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=grantnichol.com; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 To:References:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=16J7MpX1ovExx/rNfF6pAnEVlyglwpSblXtHOBsF3RE=; b=HZfPM6zkmUBHelqNnS7KVW7z8u
 GLFNrhbhpKnOUr9iAZH37gX3hFbPYB59JYI6rLjO8/UgEnE92H6aq32de59WMq8E81GI+QWoFV9lp
 vpm2sexlrlzw2gG+V66CtYjj+6WeI31RIjHC0CGOzJe+MtCwOM5jbia07nP6wu+GFljxN6l6s4r1K
 U0oJw2wBnRSHRuRpxICsiZgXi0bFwS9cJYlry76oDk7DQXJPlnXkb6SKNYxxgX9z04hWwL/ofrxJy
 y2+bKNA3yoABtO8cmrK53wRZ3Pzkoatu4pcxCPM27RNssNqKO5fK/j1kRNErx+L5NqjselnrdeceS
 wp+IPfsw==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=grantnichol.com header.i=@grantnichol.com
 header.a=rsa-sha256 header.s=x header.b=HZfPM6zk
Subject: [Buildroot] [PATCH 1/2] package/libopenssl: add riscv target arch
 support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adds BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH for riscv32 and riscv64.
Otherwise, riscv targets fall back to the linux-generic libopenssl
configs. This exacerbates the issue partially addressed in
openssl/openssl#22871 which causes build failures.

Signed-off-by: Grant Nichol <me@grantnichol.com>
---
This change solves an issue on a riscv64 target as commented in:
  https://github.com/openbouffalo/buildroot_bouffalo/issues/83

This also addresses the recent riscv32 autobuild failures for libopenssl-3.2.0,
though an upstream bug fix patched in part 2 is also required.

I tested the libopenssl build from:
> wget -O .config "http://autobuild.buildroot.org/results/fae/fae2655249b2f0c01e358810eb1d8c3cb52f14d2//config"
> make

 package/libopenssl/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
index 3199de8cfe..49958d9fd6 100644
--- a/package/libopenssl/Config.in
+++ b/package/libopenssl/Config.in
@@ -23,6 +23,8 @@ config BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH
 	default "linux-x86"			if BR2_i386 && !BR2_TOOLCHAIN_HAS_LIBATOMIC
 	default "linux-x86-latomic"		if BR2_i386 && BR2_TOOLCHAIN_HAS_LIBATOMIC
 	default "linux-x86_64"			if BR2_x86_64
+	default "linux64-riscv64"               if BR2_riscv && BR2_ARCH_IS_64
+	default "linux32-riscv32"               if BR2_riscv && !BR2_ARCH_IS_64
 	# no-asm is needed with generic architectures such as
 	# linux-generic{32,64}, see
 	# https://github.com/openssl/openssl/issues/9839
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
