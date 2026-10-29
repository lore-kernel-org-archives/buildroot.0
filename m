Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD987606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fzA2eoMj
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BBD940E3B;
	Fri, 30 Oct 2026 14:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lQVjRuRzL_VC; Fri, 30 Oct 2026 14:20:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A0E0540E02
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370038;
	b=Qen7fIeCvu8bj06Ljc6Go6prHeyLmjG+2LpuAFYv0YJqHKs6GZbwbTnQ1dxkbVk4Oya6
	 9e7N3dOYmJMUaM0WEBe6R1UyFlzV5z+Rl196ulZcWAUYMqFVEmrUva4nYXQClG9WHPVmU
	 Tzaojlw7CIFgeeV97tvWVBqdF9xLLIJPx+6ZiQnwMFc+n97//LFXwDAL1IjJeGkNDfW/s
	 YW2heYkcFNs4ePQIFJnWCtRty0I0Gn9pnu1irVO3FjICTJldUaGLIoUqtGZNb5GegmSF2
	 5GbXOf6G4Kd4fTH0h8TXWnRyMxSAGGxJ27KRujeIOMxUy1Q2vsx8to8PLbsqBKmqZuA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370038;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=JcZ7yExGtYA3TjWkOndhwpTbySgtJVC8FYQENxk7Mso=;
	b=kohO6zJ7ce096QVA3cPKhCMNYFEmEhPdG6dCR6FTAHNHuWXHkxABGyXeqh5/AmrCTkEL
	 6yRJ263+HxI3UulexXg5JeMXgRfoUo1zq7Rd5pnZCwlKV2zU6gc3ySzGkZJmt2YfA/PLG
	 zCKRgYgV/6FldKjy9eg7TDYD6iop5EaEegFbFD5IJaMxUWspPd5UBWWpbf1Cw/SQHOyoi
	 2BSI0tdLmriJpG8N+AZBn5HAj7YzU0zsf7bvRn+p7ofIH7TMWu1cegbfNwOkiBtrLMoiL
	 TevdjDqyb9QObykMNjsxZH4L027oBTrFFvd3JkxeWr23FLEAhIyWTjtqziw45P7vpUQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370038;
	bh=JcZ7yExGtYA3TjWkOndhwpTbySgtJVC8FYQENxk7Mso=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fzA2eoMjqfShAHtf/x/a9oa6s5p+E5urSRcV2p9FX4JSNTTsQGRgqpcWCpb6+QeLl
	 g4oV53HT3FewAcudyO+v/WR7tW8+hEBKhkheW1O+6dP4WbsYduK/ySsw4dpAIMiV0T
	 MDJfl1UL4RRcnp4iy34y4+Q8hd1LEh1SO5DIO7EpAbUaWJoFr5+8rL0H5SskAFQZVl
	 YiH5D7GU1tFuQukvdZYJ4uVdaHA7bB8+TklH0elfflnG3AVO/bQChRINw5sXrEHA61
	 pCVb/2okZPv23sMnQtb7taqQwHpFjKVoafLSmbLQwG6C82kF0YJs2WHSxc3FjpZkDD
	 Dr1DCrMytBZIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0E0540E02;
	Fri, 30 Oct 2026 14:20:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 69005712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D36C81412
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fWVwuCu1Ow1j for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EAD0E81336
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369896;
 b=O82Ty0uTMUrc2zVv3o709v8IutPjIiPl1hAgaXZl1gmroUUqXBIcDkuHQPW6prEGRK6J
 wUpjY8dwo5Wl7kCNX501xfZjIzK/VpGaQPL1hWq7/178wvrsFfnkBDMoDubO3FQUOtlwD
 JatZ1C8N0vmPKYTQm21lQca/imBeDy4fDWaXCryRMwa6AKdmItiqXk62f+Ky5EoEF0Zvx
 It/UEnFHqM8E6OpSjQC18gQEwUgYLAs6c9lxU1J+wFiDOxhYhHVpHhUet1bJp+o/aEBdu
 gopgkMiENbZ+PmxZporsXklb3Oisa2gtyZMrQXPYJUljtq1PZzTzM6UAUpdrsMomE6g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369896;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=dUVdprfOKXto6RqriXxkypcBPj3a6iKzjx1MmWvM6ow=;
 b=NvLDXRzxsqP8Nf2lVFt3OjhKAkTL/vklUyX2tOLxQrx5pZ6KWkZPBlNd96Hb1nkMncCk
 xp7GVO/m5MHRN1aWaVJtlTBNC69X24GMyd1Wq6kjHKE6wgPjhqKghaguustL5n2PRZpNG
 FC7BL5IfgzjlXl++7mB/fwGgCRPbPhmK49B2E/ionwccJXGGO9Vd33rtmza6SlphkIKlS
 a/7bWDgxRrdCdP/uwUNcjJMHUcOTMqc4IJR2CLjGGCntMEKKuW5gkBnk/GvROnxPAtLxY
 KJ7rN0FKgo0VDPoXJVkkTRx08QVA4PTaT002dzbYIZ5pkWizVcRA5ktyqXYO3HiuDdQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAD0E81336
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 151CA9D388; Fri, 30 Oct 2026 14:16:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:11 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: ab3fa77c4ff9c69bed2a5424dad4ebff0dc6b916
X-Git-Newrev: 4319aba0cd97e64ead38f904c75f470843ac0baa
X-Patchwork-Hint: ignore
Message-Id: <20261030141648.151CA9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/containerd:
 security bump version to 2.0.14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4290306169530040148=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4290306169530040148==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4319aba0cd97e64ead38f904c75f470843ac0baa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://github.com/containerd/containerd/releases/tag/v2.0.14
Fixes GHSA-hc94-p972-ch66.

https://github.com/containerd/containerd/releases/tag/v2.0.13
Fixes CVE-2026-53493.

https://github.com/containerd/containerd/releases/tag/v2.0.12
Fixes CVE-2026-53495 & GHSA-rp3h-jf77-q9p4.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7f0381b3074862c1f287a4a4036b6bd154cd4869)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 410e5d61e1..97d2691c5a 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  eadaa5301c0f633f6fed6a3b22f5cf4343ac522401ad2e84bb3299f811a35976  containerd-2.0.11-go2.tar.gz
+sha256  a07e4bc9959ffdc409d2df22bd199be93fcb7a88f77b3c3dd1c07c199c01b42b  containerd-2.0.14-go2.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 4a3a371ee4..753011e125 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 2.0.11
+CONTAINERD_VERSION = 2.0.14
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE

--===============4290306169530040148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4290306169530040148==--
