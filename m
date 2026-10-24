Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42FD606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jVdxLZNz
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDA7580F47;
	Sat, 24 Oct 2026 21:24:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tBiuFFDVLHZA; Sat, 24 Oct 2026 21:24:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D911980E01
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792877040;
	b=h48p2LqkqkHUJwr2kzKpt4cojdlqqrsnLWqeI/rBk8u4P7EdVjq20RJsUy6OJxq6G75h
	 oW14GLcOtMwi0znX/Jcl+VQZSzUZUiQX+b+7uio4dazNzl5P3oVPfJ4q9M/gtxA1wtk4P
	 Xg0jBjEsTXS58i0ZcwWFS8eteV3zUWnoEIrPP1o3dm4WLWNKsvURhQsdYOmwJ9Rs7CRL2
	 20ECypVvf6rNrSMbkg3LiefamaXjftH0ug4usraS0i+938fkHvOPsNy4XiiINyYMVWOSx
	 cNXTswbuZzuB927Sv4zxwrnvHYTWO7VknZhhc8ZkjFbZ2ciryq2HqvqnbdtRaZWkGaA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792877040;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DjM96MQT7IUtPOQtl7mFRYmDB3Bqs0IMQU2iGF44vqc=;
	b=IcuOR24m/huUZgHmuHA7GMLebLvSEOolXpMaRoHQjKON2rj6dW2f/PBHTLgF/Sb00V+u
	 Mz2xrrWz2MWf+rm5rgBHsG0nP/1//9+fMpQxShVg1D3Q+QnpGP4l7aex5B3PZWypNLLVo
	 iOcNsxb4D7zAQ+PgBB5CDWA2YQ7er2id/jAH91Jh2gRAP6fqHetzcc2tJNqb6P2FoSiTR
	 /+D5dZLp59s3un8c6hP1d48h8zw6j4kwPcDcCd9NKNy3s/XsmWmZkscv5/xzquFF4lfwY
	 tSZDHserbPlSIenPqqtsf/X25OgiH6ErwqJSjVnYpy4QgbhqmU+EvBGfrYmEphMP3sw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792877039;
	bh=DjM96MQT7IUtPOQtl7mFRYmDB3Bqs0IMQU2iGF44vqc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jVdxLZNzKKEQUevDJKRdeA7cvlA7SKDt2ye4HBnXN2/TxenaPSlkBkTFvFBFSCZUv
	 vvhVika75EA1cmzFkyZgTGO7QTsQYOgiFNkTn3cSMrH7F/q5yD8gzKqFG4ffuDTo3X
	 WyHDSs2qnv5Gu6W9YI77haIFzUwg0Itn/j1fVFlx26EU4WRlWwiAXWyhaNsYaUSf59
	 n5zN/83OkKVWLAjubJrLtEUx5vAQ+IsveEt7HQB8uTfDd3RHM8/zmiYRVgi5ywofZn
	 YPlHashWBGYJPXYw73gPzbRwjmalCLGqlRaIGLG+0pFG4GGaRU0lRFs2U0wJJ34DL6
	 atGXtAGbiuNwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D911980E01;
	Sat, 24 Oct 2026 21:23:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C4612F5
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3909040665
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:23:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1n4tEjN_Iugl for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:23:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 721B240582
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792877037;
 b=BMVsADMtRf0X4HKqz+plM2tYG6lZTeq8fOufslARDZQqdzGQCIrOhwbKEXClAPHlTgys
 rLg5Uo3dJdPUdjMgIVTd+H9yxU7EpxKElPRz3DrLf2BDj271LiDzu5xPG62nAkBWmqnoY
 Liy9KOciYJKTyvzdAz/e80D++1fj02bjmUiEjmJMTlWeCLkk9cMx2PrGaQ28NUaliMVTx
 txchqcEwEyO+QcpzJi40F3WLRQl4de/ch1hvMEkvECrgmnFND0O5K+LoZoq/VFmmT8MjH
 Gk/SQrcIdgssbUj7eFbBDPcMzhswpit4dhrE12oN/c/GkoY8e28atpVs3Li6oKSk8ww==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792877037;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=b4w0U0B6yssbe94s0Yu+Y07d+jPB8FFPEViRhEnAj7w=;
 b=llmnYIIWulRxjYtNuHqNcWuG0J1T4L5hILbbpTrSTxGf8HA9Dfo6rtG/GJlAHC6ZHapF
 6vddM6cbBwVpOstb9B7kg24NOJbJWuBIIpFOrkB2MSn/pQXqH24WmMRJiqXdZZnDH34QG
 Z0CDpFYYRQ1bQHCTXvsVRP6VyWHM02ob1zn40vDQuTOQPK0wg6TM5upYs+o+LqfrfAAPj
 PFwAfNE1K8lS0mYBTGSpWejectZgt5+vU35aCM4vX3XmRJGq4p5HkHAy3Kobff3lJmyHl
 9ZFq8o4nLrp1RJ6aDiSD2+D4xG8o9uOhsJ5pShkH9p9p37OVxo9KK5DZlAgODybSb9g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 721B240582
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:23:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 554449CDCB; Sat, 24 Oct 2026 21:22:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 23:22:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2191cb7c281f404d42d04f7887d4c60b9690b44e
X-Git-Newrev: 9ff55f528b5ddbdadb8fd86c3f481d573b0d05f2
X-Patchwork-Hint: ignore
Message-Id: <20261024212232.554449CDCB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rust-bindgen: bump version to
 0.73.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9ff55f528b5ddbdadb8fd86c3f481d573b0d05f2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/rust-lang/rust-bindgen/releases/tag/v0.73.2
https://github.com/rust-lang/rust-bindgen/compare/v0.72.1...v0.73.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rust-bindgen/rust-bindgen.hash | 2 +-
 package/rust-bindgen/rust-bindgen.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rust-bindgen/rust-bindgen.hash b/package/rust-bindgen/rust-bindgen.hash
index fecafcd4fd..cc47145758 100644
--- a/package/rust-bindgen/rust-bindgen.hash
+++ b/package/rust-bindgen/rust-bindgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8e5a0999c2f4f6ab1cdee508e913e2ffef5225fb313816a0151742cd2103576c  rust-bindgen-0.72.1-cargo6.tar.gz
+sha256  7b9902040f3ecbe84d2acaca91f171ab34cc19b84cbd3c4cba89a637f714e6c7  rust-bindgen-0.73.2-cargo6.tar.gz
 sha256  c23953d9deb0a3312dbeaf6c128a657f3591acee45067612fa68405eaa4525db  LICENSE
diff --git a/package/rust-bindgen/rust-bindgen.mk b/package/rust-bindgen/rust-bindgen.mk
index 55f3b4d5b7..a1a129be43 100644
--- a/package/rust-bindgen/rust-bindgen.mk
+++ b/package/rust-bindgen/rust-bindgen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_BINDGEN_VERSION = 0.72.1
+RUST_BINDGEN_VERSION = 0.73.2
 RUST_BINDGEN_SITE = $(call github,rust-lang,rust-bindgen,refs/tags/v$(RUST_BINDGEN_VERSION))
 RUST_BINDGEN_LICENSE = BSD-3-clause
 RUST_BINDGEN_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
