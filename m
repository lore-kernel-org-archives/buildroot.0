Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02E1606A31E
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 17:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LjVXQ30v;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=H1Oz2s+F
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 598A480F66;
	Tue, 24 Nov 2026 17:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tkEGwLTzY5w8; Tue, 24 Nov 2026 17:24:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 506A680F7C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795541064;
	b=GTx03TYBlgMm7iAGXGf9QhbIcXthRcbV7zsT0SOG08Xh5Om8zlTyRhsilQenh047kJap
	 ZyygRAlcHhNldXY9HxTZj01PhcLaJ0Nstq6t/2ag0ZM5ekEG2lv6ofwNglacWo0JExN7S
	 hXaPxSec9TRJ1SMbzU1EOmk89AiQbcaWfzLmKT/SKOx4RsPh7w/NtyX/Ba+SQ+Z7B6wat
	 aBWecDZx6/a8R4cH76ILcPy+nXrm9qxTBaBM0NEISTHV1cK6YZD5AdI9JneD/lUD9unox
	 PVR+qhXUenVAocTPXIO4afjfKDwlWyx+XEAg2f6TzOnYhmt4do3Z5CfkeZeXWo6m4ag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795541064;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-CMAE-Envelope:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1qWbcOtY7NLHBt4207od6IRBCh4Mqc3IV9s8Sjbw99s=;
	b=BRYk6R/iXeVEH3CRkmaTCMOO5dHfvWJF+SUxtidZzRS3CcrS/YkcY9OP4LEudbjxmP6X
	 ysemlBPq4e6s+G6/WsaonMhnfkHJ6CeOIPEgVXl0LlRZOR7lcPO3hwBu3fc52qsC/Hiwa
	 U+edFSEt7Zkc/cvIILNMRRpKFnsM9KUirtDw/VBIF9lHtttq1ol3ntS8k18iPxcdCxKyP
	 3PuSVd1SQBNjvec7GXPJpdvbimPC/LRsmB6ohGQi/8eO7tTlLHSsoMUungc4XaqMw3SyN
	 DpBymDAbmUpguBv/oLk+w/DUgGj2IecSjE/sSAwPvZIRv7E62oER9KTTK1sJCkD1NeQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795541064;
	bh=1qWbcOtY7NLHBt4207od6IRBCh4Mqc3IV9s8Sjbw99s=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LjVXQ30vSPhI5XPoy3IDmHUFu55kVhi/f2JcJOWvv76GRM1yfAiFqvfv12/7OoCzy
	 XoOmg7JMdHDOBi3qNx+qberyJa2ZQSNq+Ohrd+97dJTRLs0wfDgxro5M36m8AFxZ5+
	 wtqIaJrlep4wkRI7ZvT6J5YBnzA+fM8M1NptU4hqiDqJwMNQmcBy5VTveVTQR6cL5X
	 LfnOmYTINqAgio2GkrPxu8s3wmu/s+sLLtqaPI3dil3s14x63C6++wHLVPsnZ730Xc
	 eBY7gStp+NgrbAb0MXyz/AVvYLI9IzJmPIE2ddDuRNzj/E3bjGTNyvPgtYWiDJcCsy
	 TpSU06PSX+hew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 506A680F7C;
	Tue, 24 Nov 2026 17:24:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 65F5627C4
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 17:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49B07400E6
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 17:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TH_Vq6v61q53 for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 17:24:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org DDA78400B3
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=62.149.156.132
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.132;
 helo=smtpcmd12132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=H1Oz2s+F
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DDA78400B3
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 17:24:12 +0000 (UTC)
Received: from localhost.localdomain ([95.249.82.110])
 by Aruba SMTP with ESMTPSA
 id VuFWxJwxPV5J9VuFWx2gKR; Tue, 24 Nov 2026 18:24:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1795541050; bh=npzi1s9z2ujfc23DE5eDkvaOUurcNlDaLm+JCmr+E/k=;
 h=From:To:Subject:Date:MIME-Version;
 b=H1Oz2s+F0Hr1SqTFoLk84rs19CnBmr6bIhi7AK3QTW5bguh6UuyFBrL3Izi8Q7jym
 7C0+V6bAmm4z85eO/RHgpT+ZQvovG6KmkQpY79P57jljY0D2IUB3FW8jaLRD6CgSsJ
 4UrNP8IfQqoQdre5iRbHp4d0Fylq3IjOoPMO+2Gnrlitn+LPL/FwAZvCNOa4B/cCDn
 C+d9bt5WUZohlfUH0ElJZRMwzTtYHdl53n1ysZgot7gS6I9xUt/H2BIUajtlqgkSqy
 kJsKnFdtzawQu65/Do/uPfNMWSk0cndcVtCrmHxUl3iQ0d6aOfeaeHxpM+Rg2iLSw6
 bpBBsfX0NzlCg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 24 Nov 2026 18:24:09 +0100
Message-ID: <20261124172409.1613791-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124172409.1613791-1-giulio.benetti@benettiengineering.com>
References: <20261124172409.1613791-1-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKenaRu2Vm/LYGYe7i8PN24ce3oFHe4yplp+hw6eqk2S1xx/noWnDOV3zxEWKy/4GVQKt7nvnRaTHaGxG9AiXyRm7gmNKSN6rpkU+DGjdFy3ZdJIu3nY
 5MaCwYJhfdol8GBP6+0QKCKVdwjvcxqM4PAllyyor78pKyxh9J8lGXgV/Z27o8R3q8Y5Tk/7c7sW/2AZKF105RIitn6SSvhdEHJPReGzlPfxG4FaZIjdnC7o
 d03qcqXxJuVjsUW1mgQdAhppkO1FcPPSPkYPys9ZnZlbfcooeE6KZpiRvgGDQc2K
Subject: [Buildroot] [PATCH 2/2] package/kvmtool: fix build with Linux 7.x
 headers on arm64
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Starting with Linux 7.x headers, arm64 <asm/sigcontext.h> and
<asm/ptrace.h> use __u128, but kvmtool's own include/linux/types.h,
that shadows the kernel UAPI one, doesn't provide it, so the build fails
with:

.../sysroot/usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?

So let's add a local patch that adds the __s128 and __u128 types to
kvmtool's include/linux/types.h.

Fixes:
https://autobuild.buildroot.org/results/6d4/6d4c05915d6785064cc28c1680d85c6343ebb22c/

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...-types.h-add-__s128-and-__u128-types.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/kvmtool/0001-include-linux-types.h-add-__s128-and-__u128-types.patch

diff --git a/package/kvmtool/0001-include-linux-types.h-add-__s128-and-__u128-types.patch b/package/kvmtool/0001-include-linux-types.h-add-__s128-and-__u128-types.patch
new file mode 100644
index 0000000000..85021eb570
--- /dev/null
+++ b/package/kvmtool/0001-include-linux-types.h-add-__s128-and-__u128-types.patch
@@ -0,0 +1,43 @@
+From 3dbb804b934a58ed38e83025c963e97db58d8ebf Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Tue, 24 Nov 2026 17:09:57 +0100
+Subject: [PATCH] include/linux/types.h: add __s128 and __u128 types
+
+kvmtool's include/linux/types.h shadows the kernel UAPI <linux/types.h>,
+so the __s128/__u128 types it provides are missing. Starting with Linux
+7.x headers, arm64 <asm/sigcontext.h> and <asm/ptrace.h> use __u128
+instead of __uint128_t, so building kvmtool against them, where
+<signal.h> pulls <asm/sigcontext.h> in, fails with:
+
+.../sysroot/usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
+   81 |         __u128 vregs[32];
+      |         ^~~~~~
+
+So let's add the __s128 and __u128 types the same way the kernel UAPI
+<linux/types.h> does.
+
+Upstream: https://lore.kernel.org/kvm/20261124163248.782815-1-giulio.benetti@benettiengineering.com/
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ include/linux/types.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/include/linux/types.h b/include/linux/types.h
+index 5e20f10..039174c 100644
+--- a/include/linux/types.h
++++ b/include/linux/types.h
+@@ -17,6 +17,11 @@ typedef __s16 s16;
+ typedef __u8  u8;
+ typedef __s8  s8;
+ 
++#ifdef __SIZEOF_INT128__
++typedef __signed__ __int128 __s128 __attribute__((aligned(16)));
++typedef unsigned __int128 __u128 __attribute__((aligned(16)));
++#endif
++
+ #ifdef __CHECKER__
+ #define __bitwise__ __attribute__((bitwise))
+ #else
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
