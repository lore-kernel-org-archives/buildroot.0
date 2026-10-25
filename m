Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3E1606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Xm5TS6UB
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 315446060B;
	Sun, 25 Oct 2026 20:48:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zLUSbe29J7bH; Sun, 25 Oct 2026 20:48:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4B5D5605F4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792961334;
	b=HVQr25cy+j+UYM7Torb0eoFQzMEDEBxo8iIJY/8GNx1N81x9wurS0byoW0loJtsCYKL2
	 Ofm+XN+nGBFQe1TR9DMegkUdc97INJchWod930P6VkpAYqxA2R74IOJxRFD8ABhU2hURT
	 SX+o2PtV4TKnw4oodtSnxxaaCQ3G3ZQYPSP9/tmWX0gBpRNxeDq6ZyRJ5/aN7P3xGO8uS
	 s9YaPCx07aNaeBoYvKkizDM9Ft6oLjXJxoa9N80Nrk19gREKgjVUMc0L735eLOgRr/mqV
	 Le+vQ9FW1in118juCQR9wcNtHjOairV4lPFoTgBpP+q55efdyhtlh20VqXqGSNJZf6A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792961334;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=68tFbS3sRxrrOyva3DCmxW3Hg/rMop57AOp3yBbD87c=;
	b=ANCZa4XgSg76OeQlYE/6dOs8OykRMga8xDY/bPu0hYmiF256DlkRLiFp/bUyqA13V1md
	 Q04YBnyJaVU6pt2bO+bud+M/qC1R/UiHPunAHYFqkJt3g8qQAIW7d3iCa85KZUcpqLz+A
	 IWPcabk5rKlpIkEWx/5PM1W/uIIBUZsg4gMKdHazyIP38rzUyBdBePwdZk46gnllXjrje
	 AsyuQY4xfpOTDY5RN6PP173NR7ehgngrztGZ7+HPnF7uEWteEWqTj3uvjn8EivLLHUsMa
	 /5dXVVKLm/GPSA5GhcFXgyGPkrUAy+gD4LZKPdfiVtEkiWD3wOvedlrXiDn4v8G+k+w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792961334;
	bh=68tFbS3sRxrrOyva3DCmxW3Hg/rMop57AOp3yBbD87c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Xm5TS6UB7j8LVB9ao7q5dybo8rmC+8GJLVzD81HLJlRdn69duar27jFXTe422+acE
	 17aX0RBbm2ZfDOI2UXg6UZaysMemR3xLjiKDBbrcGbaaBLA7pc6Hv65cwXV1UtPWtl
	 oUIoTHc7fUAPWZzth85xTOT95ghvntxX9nTlcvaco1LW7t4SRRW+k0rp7/cf1vumT1
	 ujoRlEyNPEy5EAlchNtJE6UgD2gF+8oTBqHmd0py60fD1lZsUc7l0BMM/RvAJNUxpE
	 hsVqYlHwLb5n6Z6hh1m1sbszIAWI1NQZyVUqGUE3MtGjFyI6KZtEEWuFUUs+YgrKl4
	 i2oWgkTkViaOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B5D5605F4;
	Sun, 25 Oct 2026 20:48:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CB656356
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1E52403E4
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:48:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5wZ1A0Bpuj0U for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:48:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F3ACE403C8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792961332;
 b=pC8B9MH8W4m1TVaCiQVF0SoQNXJUOZ2iLDO/UoKyHv4MmGxzumWAvMYlhAR/TENfEzlJ
 bgc4ys30BqkcYS6Q+ICbqPhyE4ynDJsKSIodM+mVht8dnVabLWCdMlLpLyyGKt6gswfIq
 6uxaodQcFM2zSem4Bc6dVlcf7314bUNVaYR7JRDbRlEasgw+ZcuEWUTOkfjwZStn4o/Nj
 M0uMOpozYJ0TUKiCuoIGFDvDJLgGj/29fUrMrzzupAi+6R2e44i0TeuaTl7ZxxfWgh3zQ
 f2fS2lsSyGv4f8dF5/9F6XNkT95yBV7xcC6SkRu4DIJyBYcDSA8RUC+t5F7M2rrnFfg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792961332;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ivkTvjEz7KGDBplzOw8LSh4mMnPP0JyCTYE52TLjFLs=;
 b=JBHcYTgJvTxcz4uroxptD4y8pzsPRZSUtbi328FNWxRp4/MfHaHnGOjylN0CXlOUu5BP
 k18WgwJCUAWxc2Bh9ibJSCQAeItC0cNQP7KLH0jypHPyRV3qrCFrCg2Jhr+D5jfQkq+SI
 TeN+nJxk8rH30Nh9Xm7lzROKQZ3/b+rSPuOXVHjkLqXFavICZ0ZbDXaXDmYjllW6ljApV
 13AvrPI3EVfgxnOJpxjojXGZeN5pSYRl2JHmC7fdb17vbIM8esBcOfghryq7ksKy39ojb
 WAoYhZVhXbyvSviMm/6skIqnMsvNxSRR7Evkl49sJUOsaqFwliTsAwBRRoR1yeLKGcA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3ACE403C8
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:48:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6211E9CE88; Sun, 25 Oct 2026 20:47:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 21:45:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3259ab9f4d88b87811bfae6be291da1e5a91b22c
X-Git-Newrev: f5b1cdc0454d5d0fc5d9c5b734c38795625f16a6
X-Patchwork-Hint: ignore
Message-Id: <20261025204726.6211E9CE88@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_104820
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	WEIRD_PORT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f5b1cdc0454d5d0fc5d9c5b734c38795625f16a6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

-fzero-call-used-regs is broken on MIPS before R6, which still has the
hi/lo registers: gcc either rejects -fzero-call-used-regs=used for
functions using them:

  sorry, unimplemented: argument 'used' is not supported for '-fzero-call-used-regs' on this target

or, depending on the code, the ABI and the optimization level, ICEs:

  during RTL pass: zero_call_used_regs
  channels.c:437:1: internal compiler error: in int_mode_for_mode, at stor-layout.cc:408

This has been reported upstream, and is still present in gcc 15.3.0:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104820
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104817

MIPS R6 doesn't have hi/lo and is not affected.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 4e6a8d7927..5f4c5f5fb7 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -210,6 +210,16 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_104028
 	bool
 	default y if BR2_m68k
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104820
+# ICE: on MIPS: in int_mode_for_mode, at stor-layout.cc:408 during
+# RTL pass: zero_call_used_regs. MIPS before R6 also rejects
+# -fzero-call-used-regs=used in functions using the hi/lo registers.
+# This bug still exists in gcc = 15.3.0
+config BR2_TOOLCHAIN_HAS_GCC_BUG_104820
+	bool
+	default y if (BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) \
+		&& !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
+
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107728
 # https://sourceware.org/bugzilla/show_bug.cgi?id=29621
 config BR2_TOOLCHAIN_HAS_GCC_BUG_107728
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
