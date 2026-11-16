Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7E8606A32C
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 12:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cOD7AHfZ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=ndvxkoin
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D78974058B;
	Mon, 16 Nov 2026 12:14:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f99RkkLulFgS; Mon, 16 Nov 2026 12:14:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F244E40583
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794831290;
	b=r+Hm40sf43OiMi6CrPNI/F55mFWJ91kuL6KT585Gf1mQdLIZSfY5F8dkXKnxOPmKIboW
	 uShoAdcPPp6MUgRdKVwerKIwsnqYHbKTrhCmzxyugZCDKOROYdWJNOaae3mBUMxP5V6eg
	 ZuBtRvyoBmazrVpCJ7i4AZmJBCuRjl2XPSAvu6z1ArR42Xl0k+YXsFBVCqDp/ynUhkQ1S
	 yfwN1uRmGwcyjPEHh/Dg5QqJWir111XCCoh2tKPG4T4Y3fmrpATH+ef9LfXs5commNC3a
	 uA4Auj2ADqdcfWDXr83qLJQlyj/hd5GFTZrHYCl2ZUCMRzqJEEZWy3VZ9ZEShTSyXsg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794831290;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=ocpj+fvbSVwsbRNIAp6WFOhVCgxa6jZTRfmnlm3SYf0=;
	b=RBH08G8BQv2gcKYf3Xp0YexMKYvwZeu9UCFAKANnzyQ4/x/cZSZUbk7gaye2K4sjZN+B
	 iAEoFseaUCh5+Qh0wOBKynlMtpQ6jYqBOXGL+JgOKcmo6tzp8AX19Z5P/wehkQktLEN2Q
	 L6zK2DBbMbOWWwQts+++YgTqEr5+baxXvN5EsvprDHzHEh1uSAacr2bGqS/fuX91oIByC
	 1PvqREUqkRqPlOD0YmvPZjtlf3OZf2M4aN9ZRwKKep3IbdbFWONbQEbpCa9snHkYpgyEo
	 Keu8gDRafgwP0dWjw12ymInbR0o+xU08l0n7ECiDtSaMUxcP1R3tLU2xcGVq8G0tAyg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=benettiengineering.com;
	dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=ndvxkoin;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794831290;
	bh=ocpj+fvbSVwsbRNIAp6WFOhVCgxa6jZTRfmnlm3SYf0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cOD7AHfZwxTPQCslUSAuYunteLjInF5iIopgvnZcKg3N0FUgmZuvZzZQmgqPQt8bH
	 v/zU/dya2buIEuSGIri3CtL8okZjItjBmPSxwJ20XqoV/dFCc0jJZ+asSSKl95feA1
	 p08/5drOsZN4wKsvDF9bBcM/jCM5o1NhwYrEKMRzdgmcCIpEF8T9F8VdIJRtdM2ixJ
	 yBycYWGclT84K28TpDR/nDE0aLGoNAaRRQh5eHHDSm0Dh55Pn70yQhWxbRGloK/Ejw
	 KV388DED3KuI/G0HlJs3qvYI6PBYQG6haX9MGHwFbfEFWpZnhpjhFLJ9PTwv0u+FW5
	 4im5FJb81d4fQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F244E40583;
	Mon, 16 Nov 2026 12:14:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BE9372FE
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 12:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4B8E40549
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 12:14:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e9UUN7ZsO-NJ for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 12:14:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 394CB4052C
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=62.149.156.161
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.161;
 helo=smtpcmd14161.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=ndvxkoin
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 394CB4052C
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 12:14:45 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id SvbexcvC2TDqGSvbex55Cb; Mon, 16 Nov 2026 13:14:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1794831282; bh=Gdx/+B5l3HOYQpJzDzYA1c006o9ok6oO2loHTaZWzKg=;
 h=From:To:Subject:Date:MIME-Version;
 b=ndvxkoin/f3tcng2DijOe5ofolyMZVuEzE+3C1JJEQZ+CpqhjpCbAYockiD81i/jA
 uki9aqhWK4Gzxpf8ktcsvUk4AEK8sfjVAD4bkusKBUvSjt7cYy3iZXtjrak8oWX3BZ
 QmNPqHt4GNhM9dU+7Lu4coj5BpKY5QPywe1zJmoBy/CEOC8ZIqHPSYyBo6Dpw85xCe
 /xx6QoPPqbSdrDg/N8t4HamckAq9taEU6Ikh6ayCFHKqXvsG1m3OfgE0SIM4lFS8vU
 QVrIFME6bsOSz/Lx55ToorK9NPDc4xfnvleqthzYXPYzwcMfj1+MZo1hIj7e5+X5uf
 EhstlQsOfunig==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Claude Opus 5.5" <noreply@anthropic.com>
Date: Mon, 16 Nov 2026 13:14:40 +0100
Message-ID: <20261116121441.6513-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfK7m1V6Az1OVlUKMOGassMYOFviA/XV5rO/fPrEYTaItIq0JwyGjSQ5+Fu/mX3Bt5n9w0NvSsH/AbaMXsaS2dVWCs3sWXMmkTA8CuhnQiup4sxqmFQnt
 AK53OKnQa8AWOkmBgF5TTSyhwC0kwMk5dceUQjc7oLR881nDEI0xIcdETYkF1ICkFF//nOEWLS5BO/x68j5YJyFMFKu1pvERRpOZYqq3tRe9IRGldg8OlJK4
 oMzZJDoPjLhTu2BVpolqLIOqci0eYdfUdIwFFWarfm2YlJuHFGscZL74iTvHSgc7RHSSzqGKi1unn9nw1tjcOg==
Subject: [Buildroot] [PATCH] package/tmux: bump to version 3.8
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Changelog:
https://raw.githubusercontent.com/tmux/tmux/3.8/CHANGES
https://github.com/tmux/tmux/issues/5584

COPYING hash changed because the informational header has been dropped
and the copyright line now reads "Various Authors"; license is still ISC.

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/tmux/tmux.hash | 6 +++---
 package/tmux/tmux.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/tmux/tmux.hash b/package/tmux/tmux.hash
index 34419940f3..0b50aa9127 100644
--- a/package/tmux/tmux.hash
+++ b/package/tmux/tmux.hash
@@ -1,4 +1,4 @@
-# From https://github.com/tmux/tmux/releases/tag/3.6b
-sha256  390759d25fdba016887ec982b808927e637070fd7d03a8021f8ef3102b9ae3c7  tmux-3.6b.tar.gz
+# From https://github.com/tmux/tmux/releases/tag/3.8
+sha256  e79c699c7e949dccd0a4a125e17b8d1261e311b16979dbc8eb34542f3966d82e  tmux-3.8.tar.gz
 # Locally computed:
-sha256  c031bd37f464c534277814f6aa38686fa023d094261d57fd2545ad592bb53ccd  COPYING
+sha256  2116115d46eeb1e736acfa562eed14fe6c34760794bc5b484642fe694adde0fd  COPYING
diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index b435c62a8c..74a8633bde 100644
--- a/package/tmux/tmux.mk
+++ b/package/tmux/tmux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TMUX_VERSION = 3.6b
+TMUX_VERSION = 3.8
 TMUX_SITE = https://github.com/tmux/tmux/releases/download/$(TMUX_VERSION)
 TMUX_LICENSE = ISC
 TMUX_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
