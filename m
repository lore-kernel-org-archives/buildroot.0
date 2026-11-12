Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC80606A886
	for <buildroot@archiver.kernel.org>; Thu, 12 Nov 2026 16:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=G5AyS83c;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=BsUfJ+BP
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D870F80B88;
	Thu, 12 Nov 2026 16:46:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TdC8nGgDLtFN; Thu, 12 Nov 2026 16:46:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0008E813AC
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794501966;
	b=nZ4PA5ypm16b2dsyvhP0oFMvJMBF0i20ZA9e1hPA9okTHWTQNGHr5Qyo8vxdtOymstWP
	 UC+GpKE/U1nVpfedec9zsTBSTU0xHlUs3ZS5lsr0mKk+ypLDU0eXKIYGaEZRd7ta3gdDX
	 DOmqTs/BI+CcUB4705VdbqrTALKaLoC+gblfZdWyTe9J6hoic/5wNiCQc256TwVwEQ16L
	 FXhIl4uR4m3kEgGhKN9VUB1Z6SJ8dEXBOcCLiQ2EqhKIQE410gS0GlXlHd++bGALiCsGU
	 smIAV5EcspE9HvsQyfZXtYBXP3zK2qa/b7vFUjXErre2mXzxDm3njOiJeCMrBHd7r+g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794501966;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=HPTY8iPNhyH2y/0YFnLr1OD9V4rdEo+LxiefLdTUklU=;
	b=TUwSRpi/74z5IOn4+PuomujuN1+x3Nt6vGz5ZRxZS6sHv7gDI4PQs5y2y8k2IkjEkk8U
	 bcs3mLPaR+QReiaM/n0VZZurtfQfWqyo7d8cCWVBBgl31wzZylVIV80rwlbALurtPldmC
	 wdUKDA1EzRwaJ2mwrnpRVYYBpdm/G9SLYcVzI59cA0rvpIPoyfgN1eImpUpaIPbUSvDgu
	 /2tnZttKYrrmLEuBtYZHlmvpCeBmjqrLLyADPMTw45xkMGX7ctVdB1bWPezjmLLjAJyuk
	 WIINacjK+RzM/gwMKgxWuF/9WSVrs/FJCyAbfS4Y74ZLsTePi/OoEIUd12XIECjhWVg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794501966;
	bh=HPTY8iPNhyH2y/0YFnLr1OD9V4rdEo+LxiefLdTUklU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=G5AyS83cKmtJ8Q3HWlm9BvyLjrmI/qdbuRLOqgIFihz+EmVR/ulhXGMIUaksVXMx/
	 +K8ow1IDx7zYxKUDJbIeZMmWcgrt38oQ/uMw1i09IVswXkOEW5O3FBtsqITK0XVtjq
	 gudhgwLEh6i6nP9TZLrvatEncwEbAtAJCPOQYMYjHvyPoC8MRdykrJ8LmkFJEXrm3K
	 M488EY0ajdFqXa1x5yE7u8ANwyr6XoP6BDIonnQXcuikmG+8VkMnQhUq9YvItnOE8I
	 NXVOW7lgiwEIIF+pXBzqAu6ljfdB1ZCc/DBaMVNduPGhVfQ95kb1MPwy+rmjWICOgt
	 Sg9VWHdq1buKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0008E813AC;
	Thu, 12 Nov 2026 16:46:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 52CD3E09
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 16:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38F0E40873
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 16:46:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IkffRlImYSl7 for <buildroot@buildroot.org>;
 Thu, 12 Nov 2026 16:46:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9560840A30
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=62.149.155.149
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.149;
 helo=smtpdh19-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=BsUfJ+BP
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9560840A30
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 16:46:01 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id RXvxxXpAsb24ZRXvxxGjFs; Thu, 12 Nov 2026 17:45:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1794501957; bh=Ye84AxsB/BQJD/cPv2VbwUKH8j1BKM50I/rAoFxFVX8=;
 h=From:To:Subject:Date:MIME-Version;
 b=BsUfJ+BP8h3bTrCdzfar51NEmgcg1WK+i+zBAjbhDOBtHIjA+kQPWxd2/n2vTD2J3
 0zx4/tNYnXS23ffaoBWolOgYMhqwsV0VKiFy+8zlbQlJfHJELRa3i6h5TUxzAoPdYt
 CZpDUZBs9n8tJYWIYpLgR80/2bhDhSDoc0UOhdaZyhg60A8mxLWPhQ+LOYw6kcnr0p
 BAiK7i/Mp2p/H3lubN38OAcimZyqcWUROgq1pbHOly0pMf6UHgprLlv6CXf8vTdEKi
 crFr37tImwexXYQKJFdFuu/+8ueluQ0B0+vgo4/zA61tMXOKatjxGq0MKL2ZA7/l6A
 7jq+lEt1kKm5g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 12 Nov 2026 17:45:56 +0100
Message-ID: <20261112164556.371971-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDPhjcmoHO1X2qIhtLLoVVWYHqFLN7b5BzHiNkALCIP3a0upBBzBh6fHFw8OaW6AEvuPMjHTX4rYchBynggchXARZzJYiFgBWOkrdDfJnbsLct0msxxf
 t8I+ClPiy1WT2kXFoj1u7BRjjCcIOcCVJ/yMvU/f/PsU+Y85Ti2BFgeTG5rSEPMXvvtMSb0Ccj1URwXemjO2YcAUJtvFZNzhzx0q3K3W3/xfUFv9REBwVGay
 /3TJJlXqAX1zv4+Ptlx6AO0Xk2Bc73maXiRlFou7yPy9pFAKMvSbUimnWLqIggIDL0U+CCa/vFn/E+3rcP0FuQ==
Subject: [Buildroot] [PATCH] package/nfs-utils: fix build failure with musl
 libc
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

Add local patch pending upstream to fix -Werror=format that is now set
by default.

Fixes:
https://autobuild.buildroot.org/results/7c52ec55756d30da14609d57766b85340dc020dd

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../nfs-utils/0001-gssd-fix-build-failure-with-musl-libc.patch | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/nfs-utils/0001-gssd-fix-build-failure-with-musl-libc.patch b/package/nfs-utils/0001-gssd-fix-build-failure-with-musl-libc.patch
index 047a2a1923..a5230c74d0 100644
--- a/package/nfs-utils/0001-gssd-fix-build-failure-with-musl-libc.patch
+++ b/package/nfs-utils/0001-gssd-fix-build-failure-with-musl-libc.patch
@@ -12,8 +12,7 @@ Let's explicitly cast pthread_t to unsigned long wherever it's printed
 with '%lx'. This keeps the output unchanged on glibc, where pthread_t is
 already an unsigned long.
 
-Upstream: N/A, not yet submitted
-
+Upstream: https://lore.kernel.org/linux-nfs/20261112164210.369677-1-giulio.benetti@benettiengineering.com/T/#u
 Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
 Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 ---
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
