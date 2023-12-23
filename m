Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD69C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 07:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 101A483D07;
	Sat, 23 Dec 2023 07:18:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 101A483D07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BDUsqZC7OdFU; Sat, 23 Dec 2023 07:18:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E75581EB5;
	Sat, 23 Dec 2023 07:18:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E75581EB5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8EA841BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 07:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 729AC4016F
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 07:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 729AC4016F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2g7htb6peaNk for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 07:18:14 +0000 (UTC)
Received: from mail-108-mta221.mxroute.com (mail-108-mta221.mxroute.com
 [136.175.108.221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E6BB40169
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 07:18:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E6BB40169
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta221.mxroute.com (ZoneMTA) with ESMTPSA id
 18c9589e4540003727.001 for <buildroot@buildroot.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 23 Dec 2023 07:18:11 +0000
X-Zone-Loop: 910ec299f7e4563333bc46cc7d3f632c7fbba7fb86a0
X-Originating-IP: [136.175.111.2]
From: Grant Nichol <me@grantnichol.com>
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 01:17:55 -0600
Message-ID: <20231223071755.2417948-1-me@grantnichol.com>
In-Reply-To: <2f0cff7f-b526-44da-a831-85f70218f2aa@grantnichol.com>
References: <2f0cff7f-b526-44da-a831-85f70218f2aa@grantnichol.com>
MIME-Version: 1.0
X-Authenticated-Id: me@grantnichol.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=grantnichol.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BD7SMCtjsDrc6hsD21wXiFMNlW5CXdJzkGbo3kjMeQo=; b=aHzoswcmeBSGblbzYrwOa2/RKK
 dT6GKDLbsQNOOWwvgDJWm6+Ds2YvFhnhZcWKhQqklbk8ZpREJJKxzJvjMEFi4KOMso6sov3ZOTKLg
 5bfTXRzVEnKvefthqK27MECXUnqkFF6VAggKNlLi/pk8qPySaafMKXRzZtXf9juQk4bkznQeF00MJ
 DCYXXHn0up111fP5ci2rXe8VklcSma80u6Y9m3cEk2AUx+IZUca0gd5XM2nOK4WNk57urcXRJbaYV
 4q7EVCbsbiyxUYDCx96ejZIg6aooP2cIvTGOYmcUsfJDpU5zs2XyIICeS7k/Nm7x/j61b56P/LDMi
 m0mB7VmQ==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=grantnichol.com header.i=@grantnichol.com
 header.a=rsa-sha256 header.s=x header.b=aHzoswcm
Subject: [Buildroot] [PATCH v2 1/2] package/libopenssl: add riscv target
 arch support
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
Cc: Grant Nichol <me@grantnichol.com>
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
Changes v1 -> v2:
  - Rebasing series

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
