Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A99B606A325
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 15:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Kc16mJf7
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 571A080DBD;
	Sun,  1 Nov 2026 15:26:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TLhln3phEvAP; Sun,  1 Nov 2026 15:26:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 98BF880DEE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793546801;
	b=DwaXf3w57j1tBvn8fKpDk9aP/voWJqaP7AFVOWmNaKvr/wRvUpgmkMYMp3gb4o0DO/Gt
	 JaESOt+T2tnnOEO1Hcuzxlduv08/zCsKBEFSKfUKK7kuV2le58UloikeO8ToGtMOJpNnW
	 MyVL01EdX8iviiAsY9JOqgtdXgxlKR1C6yUfuolAyNBn19nD/LkHJlaG72fcEft7sQn2Y
	 7+Gro8u3fG5Jfn3nV9z4h62UX4Ag0aNGo0nDENEq+zfkilRjO8K2I+5iZI5uqR8+aSQuF
	 YXktmCrKzw1brpl7GAyCtAJ7DQqMldgX/5s6VzUo91ZfODkTB+ilBk0zfiFFvVc0KEw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793546801;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qqq8zS/gQzJfiZswe6MJz5yCCiZ7g/UnlV2gUfTi5kw=;
	b=Ym0K/rU2+n5mb5vInoM4jJGaY1reYYrcqq7FD0cGKdwhxqn+yry2hIM4ERJmOPnfMYjr
	 s4VEfXEhvE73bt5Moqa9BEJquTMcRnZOlg8k8AnwR2TfQ/GandT1sCZrJGo4Dc43UmOwr
	 TiYWOQf9HWIa34agD01J3qkIgcga7niq/UNbfucGehbmEf7PGOXMkr7G/pxFlfJQV7Kp5
	 6SgvxAVZQc8YvliGNtcRmUmboECxfaVk/Sw0s3vq9vny8BT6OhXPSdQvwrwrsIFNNHcJy
	 v+dTRSYwesEb8gk7kyHIxZuvK6WqL9qvmGn22t0mKFfAwIXG7cAryQNG+1FdOVjaNlg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793546801;
	bh=qqq8zS/gQzJfiZswe6MJz5yCCiZ7g/UnlV2gUfTi5kw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Kc16mJf7pwa3a6o4t/Nv11rUyAL+OOovhOABQASm9CXWSJo0xgnXQ5yRLmQH3E5VF
	 TaVNLuEY0lT+zIwI3viplsXu6oMpgxlE8PY4Pn4TrAn1mA+4iW+rd3/uYQ0CVpvxH5
	 C+1b/vEq9tDBnipoeT/HjIR4ruW2oA7iuemmke0MDzB9VSdZjCfBY7tkMUrE8Od20m
	 WvChdGN1v1JE4x1pELfn5sZL3vzwXbuuHUB9YFZVK1Mi2BZjmo4XQ7liD2124BCNUd
	 GHxgTn9V5KgGXH/yNKdCdomCcAqXrXMjZrez+fhvJ1SECJLtZXBPK04M0v3SpQVHvE
	 FMnqXwQSXbC0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98BF880DEE;
	Sun,  1 Nov 2026 15:26:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C0CF3380
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 15:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0447405F0
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 15:26:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gsy1OgV8qv6v for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 15:26:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0F3AF4052E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793546799;
 b=bo5DkDsWnh0gm4MMMCq4o5YkHZzDBy0LavrHLh6k+VdViSH6D1gaXK//NWY7PuBV2iPR
 pMMSdeyDc55igpfjE2rz4VG7aUsyDbom8RhyDPRLSY/bPpogqCzVY0pSUIvzpjGcWcbo1
 INyNkI3I3+OvbxCGKaV+qHZcjwJTMP4W1YdTkjQJWqkZtsdf9v09OZqy/a+/IWt59Vx8L
 12xdE4nThaY+kZ2hItb3ftMriIsD7CC24qF+Oh3dfLR9uOz/pVS1f/3/zCXlTGuoy1fEY
 UepjgVqlT5fjb5qrYm45BeQUqcVYdnfMklzVODLa2Sslk7/wfKXWGu/bYelN3NQuTLg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793546799;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3m57/cREZ96L9iQCm2UmOvH0p8buFLdgS2AzmjyCwMc=;
 b=I1uiAc4gwqKHMY4IiFnK5klSRAT4kAv5A+lEYcqKtDEd63p3Hg/tI9NWTjLIzXS/eTRD
 FG+ewKvx3TlvZkEiNzWPhjEIkHIxQQPRY2tFvNXV1JOnnPvVxFUgtxUQy+6IACCwHyhS/
 Sl4nZVqHsfAJKu7+UjtTlqaV1cqiE3674WhFn6KT9DVkgRbC3pJw5UJIkTVtIVyRSY2VS
 LGbW4oUEGaHhJToe1YD9x1YtD9MR2p11LteeBExdyDqcCfquTsw7cBi3P9e4MTtzmByDY
 B0MISJYfaWQayh1ILOCReGtZ5FWoBRARabBlOZoqq2i+q4x3eaKER097C8KqodthdJQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F3AF4052E
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 15:26:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C255E9D49C; Sun,  1 Nov 2026 15:25:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 16:25:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f30f21626e31bd558c3074ebba7a578082e900a
X-Git-Newrev: 3ebe90bafdabf8c444d7a9a90bd592631614c58c
X-Patchwork-Hint: ignore
Message-Id: <20261101152509.C255E9D49C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: fix dependency for i915
 comment
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3ebe90bafdabf8c444d7a9a90bd592631614c58c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit 52ae9f49b215 (package/mesa3d: i915 Gallium driver needs llvm)
forgot to add the architecture part of the dependencies from the i915
symbol when it added a comment when LLVM support was not enabled.

Fixes: 52ae9f49b215

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd@kuhls.net>
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mesa3d/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index a62956bff3..a1a5db232d 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -155,6 +155,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
 	  Support for i915-based Intel GPUs.
 
 comment "i915 driver needs llvm"
+	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_PACKAGE_MESA3D_LLVM
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
