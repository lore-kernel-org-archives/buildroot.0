Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF656606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 11:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=e/BGCNBp
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92F27810E3;
	Sun, 25 Oct 2026 11:03:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3fKDDjmOZtCo; Sun, 25 Oct 2026 11:03:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B13F0810E6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792926232;
	b=cLRkh48E3TIP8EK14Z7N+f2N0UgX+Vp/PkusvpkOPl8r50KByMoBJ/p96iWT5fOAMx5O
	 Hp9sThP4QRsbGNlB3AIMeBxZmQZY2UE+WL8G813OKnSScOcOl2MoSjBYHYh5JJK5rgXLF
	 OrZ3iiBd43VaI6U5GJMYJ7hfFrMpGMY8/UoygXPHs0eaPXwB22Tr/kkzqEOMjoYQRrX3d
	 6yFM1blXG9M+NsLicQ4kiER6pXPOl65/qgh3erpUp03rMBOktY1xvYPvDKITTHHpG7Aev
	 tKR4iYXxbNQDWCrBeuElNN7tRsRPd2UMDA/0EPLFXdiIsmKzzhM/Mj/n7mMuho6xtXA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792926232;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=b3fLbDdi89ROEBkWYr0hsLzaqH8UIwnAAY/Zq7ODpq8=;
	b=DgJtwEgQZMZruroehiLVMkOP8DQKpAt51PQPqVAu6ehG/ow9r7OC4R1CWVE6GnOAMAEJ
	 NSr2uq3u4/lgScIB0Jp1CDMqWwrjY93zqw4B2gIxhKR7O8vV01zZwAwPnqgBIwJ4FZXH6
	 C1IbZdbeIRerk/gUr4jad6OuDT/AQgj/1d5hMsU+4i+ewsGQl2OPe7nAyz6Cj5ziE70A3
	 Q5N+O5ONc4a3ab88BkkoX0IwMkJLG/p1IZ1hK56gCsr78/yQbYekpQkFJdUfwfX5bEWau
	 A8Tnxs0LCYT8PUmjY6HCSwElb/2WWRPlPCibiNmbxNUX5fe3jRQjpPite509v4UEEAg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792926232;
	bh=b3fLbDdi89ROEBkWYr0hsLzaqH8UIwnAAY/Zq7ODpq8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=e/BGCNBprrMyyHShRh9njL2VWpTxadHhoBhg5EP/8QXhklNLiqvYHr0tSKl0R2B68
	 dHJN7CUyoNfuxNzyJCX5q+KmJK8xAkGWaLcZ107cmj2vwNwNAG7MHr05e8UNXK2ttM
	 QliQN0YZ570nhtz5gFg4HwIPPDja+DUBddkh6OZUsg4j+L6i3B8GVCkbRZe4Jo+azO
	 85qnzu+CofPWI5JYYWNZBPSijF9I06vjCntDm0toxz73x5A9YjUENQ78UFCLTh7Ut2
	 IqWoxOIyVW9jntJWjC+4J7D13l2dLKYlc+7EPSxMWYXtRh14d8Q2XPEvLB7WWuwjns
	 j7Dj1ws5+JBcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B13F0810E6;
	Sun, 25 Oct 2026 11:03:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EDC32C7
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7C5E40A11
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:03:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XCNULoIXNzg9 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 11:03:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BA70940A0C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792926230;
 b=X2U12iocsFsqx1i53PTzx1lkkFtimBDAkK6Yn0M3BlV5WlB9L3id9iKv65NL1nEbenj6
 F9wJu7ucOQpEpMiOWHqAGgp0Zl/pDyWAaznTXraK89gEMpsa0ctXYk3Pdvn01vQix5SSg
 DEOYnul1tODlgXYoYUp0ByQ5jQSWhZIdMyjvMJ6+tsumlVFJ28WsWhoH/btvx0BLeQ4f9
 okEr2qmJSE8YV/pME4VEnR33rKmdYFmE5UY4RY1jqT3tUHXcIUMNMesOgX9UA0rFkaVEh
 Vdmz4HWo3EV6xJ+ZGdYwoJjH3guu7lDdA1fjjhh7jx9osDMPWzuE8UVv5LDRGlpCzNg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792926230;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=VeAz8G9aLiyRX8uM3w3C2K96wzsEF9To1I1atiqWFiI=;
 b=AtI1zdc/10i9EwlixZipxdvv/b3n4TTNbiowhHmRHzjtsHpqLTdJmXu7U3Kcr4Dp8/LL
 NsqPEwbSAHwOFU/xfzrwrJejolHqFM3PDyawX/N5NtJ+Lq7OnSL0P9HnrgFRRiY3uHct7
 +STjKdw7p8zbDHA3Ok3bwhM7D9yinxcAtMb+/YqQhkMt8hL4N6W+CRn34mVfFHkdaw2Bt
 nlraNOc89iM2E2CNbU2udZ4n2o85aTcmP8V+7jEK9QTE4giiqlhqfOQ+fQrYpOOaPUgq+
 w87nV1on3mggaHmztdiF3RNw7hpEwyGWwMy5tPKLdTKqTRHjvvz+1k/k7gvOJjJe8gA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=dhGKct0x; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA70940A0C
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:03:49 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a35db1f202so6230355e9.3
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 04:03:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792926227; x=1793531027;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VeAz8G9aLiyRX8uM3w3C2K96wzsEF9To1I1atiqWFiI=;
 b=Inn5vBZydIAhMEygogAXTU8W4gQBd0iZpyLLHAa48Hqgm9DmdkBlZfj07zYag3pECx
 bAQ/mIA8Dunx6rSC9VMlMhUm0WNpW3xvg8o2lmckmt1Q6vjE1ZqFBT2AUMm+Pi99vz/b
 03ssrV9zZmvmKTSr2f03hanVi16yZnp21cZEKBxuN6fqkQrUYMpCw3pKcYl0wfvXtIDL
 Lmvp7WkPfQFLE/fLhtg+JXgqbWkoNEYGy/GenzaXQmknVI1zsUbB9xF6PDEBC4A1xr7O
 urh21L3wckBXocp6bq+PVohyhs0jaaf9hAAmZ733ZyN0hx9lqpC9OlLYItTKwwWNqYVn
 1nXg==
X-Gm-Message-State: AFq9FYJmyjwA5wupe7QDHeMcw2j8vkqSkuGg5lzNsU2G5jaR8RE7eRzk
 EPWBhFk0ugZx3Xh7mUvaIEo8L2+IU9shDyuK2l5BcPQWaRSHjH+bzNs92QK42NcXnHdX075IiYK
 OzAvR
X-Gm-Gg: AYBFou3WngutJcdA0h2wmAQvyF3SzLtTY5CO8PFWgXdfB/t/GcdxOZEl7vqZTuBsc4x
 vxs3qMKGXnHNVqHQOfskcWEfn7lITm97jpD55L2S9FzJhiJkRBlCpuMN1BBL8JPzQiywKnLsj2t
 sPpxDXXTPH9itUXOwnuot7ljoGwccuRH0URhNaPyluqTqJAV0i4UGpsSM2lFY4JNdPs2NR+dOTy
 IAij2iTmEzi8i7tgo8kWBALsipTwh3I/cjV1sb4G4mGxNOyVG1XN/U0u5IS9T0ROGMNWpitO5tx
 mZoWQRVXsvOlzP0h6zT/JOykxhlo9l6mNlWT78NY6gNaLGej3TdlfCqSlxMQ3jstzf/FaWLOsVE
 8Fbo8qIO/soZOMgqQBdiqjnI5b9gvAjSgUe3a4hpInM3nNQl9VBJkC017RUYp/muZS8y9YnwM5v
 qv7I2ey+Bl10i2koyfkmgzzkYRelkPZ44ZN0qomb7yzyCcGh9BXay65ATYFa4n0vznsE1TtmrV/
 vnCfPJppfDBTgpdlEmx2kyfOXVXjVen81nmiSO27IeGNYbOOk5Epfr+CId14N9uAxJ3zFoP4ujK
 426/rVJWIYpbqTh8lEbYZHeL94CcUnE0
X-Received: by 2002:a05:600c:3b8a:b0:4a2:d:5ccc with SMTP id
 5b1f17b1804b1-4a35ac99e81mr64874565e9.10.1792926227128; 
 Sun, 25 Oct 2026 04:03:47 -0700 (PDT)
Received: from dragon.home (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a04ae28sm118956725e9.2.2026.10.25.04.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2026 04:03:46 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 25 Oct 2026 12:03:24 +0100
Message-ID: <20261025110324.2226886-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/xnnpack: add support for aarch64
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

XNNPACK officially supports aarch64, so it can be added to
BR2_PACKAGE_XNNPACK_ARCH_SUPPORTS.

Because some NEON intrinsics calls are flagged as type incompatible by recent
GCC versions, do not consider them as errors. This issue was already
noticed and reported upstream some time ago; and this is the recommended
fix from upstream. See https://github.com/google/XNNPACK/issues/7733

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/xnnpack/Config.in  | 1 +
 package/xnnpack/xnnpack.mk | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/xnnpack/Config.in b/package/xnnpack/Config.in
index 794c5c47d2..434cc823a7 100644
--- a/package/xnnpack/Config.in
+++ b/package/xnnpack/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_XNNPACK_ARCH_SUPPORTS
 	bool
 	default y if BR2_i386
 	default y if BR2_x86_64
+	default y if BR2_aarch64
 	depends on BR2_PACKAGE_CPUINFO_ARCH_SUPPORTS
 
 config BR2_PACKAGE_XNNPACK
diff --git a/package/xnnpack/xnnpack.mk b/package/xnnpack/xnnpack.mk
index bb53188f9e..22f4b059e9 100644
--- a/package/xnnpack/xnnpack.mk
+++ b/package/xnnpack/xnnpack.mk
@@ -10,7 +10,9 @@ XNNPACK_LICENSE = BSD-3-Clause
 XNNPACK_LICENSE_FILES = LICENSE
 XNNPACK_INSTALL_STAGING = YES
 XNNPACK_DEPENDENCIES = cpuinfo fp16 fxdiv pthreadpool
+# GCC >= 14 errors out on some fp16 NEON intrinsics calls
 XNNPACK_CONF_OPTS = \
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -Wno-error=incompatible-pointer-types" \
 	-DCPUINFO_SOURCE_DIR=$(STAGING_DIR)/usr \
 	-DCMAKE_POSITION_INDEPENDENT_CODE=ON \
 	-DXNNPACK_BUILD_TESTS=OFF \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
