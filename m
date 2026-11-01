Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BDD606A327
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UVYjQbWu
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F87C80DA4;
	Sun,  1 Nov 2026 17:45:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RT4yCVqCI5nr; Sun,  1 Nov 2026 17:45:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A833780D88
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793555127;
	b=VuLV6o6rI5zQBtJlastlLoUvx8k4Ygqnkyo7QaBRX6CzsGIyqRkSzaD15dIZ/ut+RcXk
	 BxrNtykzcFyBVFKchyeTeGh3miTWVjBEIkJ+y6HMKFp00P6DT6068PkiT+v83Ir1VmEf3
	 mD94kThVMu77ZFIYYUnPVzLFkh4AZlfPtOjR3NsVIfJvSrLZhjulPINlAG1Pp4sBvM2Lj
	 lagFtzu/yJ96A8Z/ngRAqxh/O+WpjGaTrxyjzdYZrn2W/zvnU9GI3gm3JYeGDQSFNo8RH
	 EzIEkuepCwkFlc2S4v2K7kgy57j4MRz84PLOyA+C5aFVBxuh9OIG7lfgW2Pyinxq3Wg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793555127;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3zinKpJFJEHLn4T3tBXUJVMtUpzChnu3zc6mYTFtSjU=;
	b=NPUbfiD3S55vbujGBhA90ZNlmHfrods6hShuXtmabuvi3cXQtAAKP0dsbk96Hk5FCjSP
	 Kh7+ovFLm2esZH4vsc6IZ6nFNMxdVfu0M3k6pQ66UNC8s/Pw/JmACnUCU0steoY6JXptm
	 HhIxNLWMj+n8NtiCRbcFTL9nSviVMlxvWipw/HII7dKrJKyRjUJDV4WRSsKG0lNe6HF7H
	 y/nqnuMoqKNX1UJocQJzLQxUxuciEoVJT7t2vuUk4tUKeq9VoTXLhM6cE4hBzWWbvqr1s
	 eOrzCKBxlvR0r5+YfYV99k5D8Cs7PWiv8rFCr9wYt0fr9uAp5R5qZnRIDHc2qjGZceQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793555127;
	bh=3zinKpJFJEHLn4T3tBXUJVMtUpzChnu3zc6mYTFtSjU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UVYjQbWuWi4LXFeCq9uns1nDM0qA92gRBrXSV7ZniDNqQl4aWK0xFwNhToQiDvJ41
	 Bmyn6X3JaY0OBgxbetKnkowigb7WCaPF3lJHclNROKtXUPHDLOKGHbvUumIvz3u1Ef
	 tmcGcAjLDQDCbpTUv5+rMZC0JTQj3M4Cg5+VVxn+QZ22GgliPJnvNrPZm4u+qj9ceq
	 6OEBv+vJw0Dgbjg3p6vNXocH2GhByEAMDCRta99H0VaBoGQLD8arApBUCF2NNd2ok2
	 ZdK6UB3zTRnL1CnCrASfoKxfMYrDihQiJW0vq5Q7ucps5DMIXV/yOFTQUr2ZmrUQuJ
	 IV3cEJWOIdZAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A833780D88;
	Sun,  1 Nov 2026 17:45:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 42108323
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27EDF80D8B
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:45:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9QL8BHOUIfd7 for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:45:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 72F5580D88
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793555125;
 b=JiuIZ7omb0ls5hsJ4T0u6NBp3KJ1oikeuPTbW1JK5QeOL5Ir/Fc1c6iTjmLMSjZRf9Q/
 WpGg6cH3y12JMBtGBTgZon9hKxfwbK+lES+12lXVvYvJzv1RW4e47MFR7HmD/TjoEOMZ5
 N1iLZqs3vLff6lXZruibWdR+nOzogStW1xFBOyXRqUYF88XGjRb+T9oONa4kFEyv3Ka0K
 VJNBJ5sjWKYERD4mnk1wpZ/KkxOtK3RqDl9EEwsuu4ItqE8T+O3fpuBBK+NHY/Y4dXxL3
 JH7F+V0g81KS/l9hC63oFI6izf95HsB88PJG6ZJHKPQwhyE5FgAPyMjXbk7mz7bg0Zw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793555125;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Ak/D64AcsCCHpNTCKDvMHtgPcMhQRfZD4ML2yRf4Y4U=;
 b=W6etjWpBBhS+a13uw9bNKFCd1j1Pv3jknt1w30GkOyOf3WG0WRp7gIxaIIKXh1h72kpd
 jFvRO2tyQ0Bs8xErT6voRKCSDrTTukKCwfGcWMV5rEA+eQv61eiODpcStGcM+a1XgEvDw
 miuPnUuSvAnRituhTFZ+zC0Q/4ku00+zvoeoR62MMLJKnqRBjma8j8dMmC+UjAVUXqrUv
 mG/3F+cOdtP4nLb/zbqeAKhJVoao3utg/eSy2TAxNPmcAMw+fusBgeguXxe/rTnw4SXPV
 bgPdKwLVHsNtK5aRDNGOkC6vSllXtOBTtLFoAmPvo3ag7ge/j9tjNTPNazwm0eiATrw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72F5580D88
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:45:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F8619D53B; Sun,  1 Nov 2026 17:43:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:43:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: afeefdaf4a5c00fc7941a7bc9007b92d8639f38b
X-Git-Newrev: e18c3c8b4122cebdaaae4fef519074293373f459
X-Patchwork-Hint: ignore
Message-Id: <20261101174356.2F8619D53B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_x86: explicitly select i386
 architecture
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e18c3c8b4122cebdaaae4fef519074293373f459
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit [1] changed the default CPU architecture from i386
to Arm AArch64. Since Buildroot defconfigs are kept in their minimal
form as generated by "make savedefconfig", the defconfigs using the
i386 architecture now needs to explicitly select it.

This commit adds BR2_i386=y to qemu_x86_defconfig.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/86240fa45d11e3388968520b4a35f0a40954c132

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/qemu_x86_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 21e3d7657e..6b3b799068 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -1,3 +1,4 @@
+BR2_i386=y
 BR2_x86_pentiumpro=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
