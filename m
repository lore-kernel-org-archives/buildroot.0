Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF55B606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 18:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nXH+gtNx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=mBGHrXsh
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A09BB6FE2B;
	Wed, 21 Oct 2026 18:43:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v41E__Y-N_ht; Wed, 21 Oct 2026 18:43:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 175AF6F5AE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792608193;
	b=DhK2rmWdTTFPNq3aD/3VwvXBoevdgJE4WT7evCjZVLW43bddRLOhQ06hUVfKVIkQ8b7K
	 GxGYteLTMTNXhk92kCEtlfSTHdNUKL1OQXBtODIzYGZgJYm7fnZKLUpR5x7yhhp3DZQoc
	 INUZcZ02FlggaGq1Ey6velTodzOKhJn4bC5BzGSCWySYFOnLf9ruWTRksZrGN19VX+sJy
	 /k1M/22bHvqj/1+gNF3UCTvXHSDxSKQv/x4BU/9kbgx2p6VMLd8QQItQC1ZI+QAoYSyyr
	 l5Z3CjhEGvvsXnaQQyrqVp/UzMEs1qgttqD/4pksgcM2RkAsMFdOnUNpolkthjOrNXA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792608193;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=l6Pp5Ijp9xKKdXuDIY1xasdU38aQXA8tsyLdXf2BYFc=;
	b=HNh/0z7NFFtJaBQA4onOJOwVuLyNeRq8qSNj9OjSsP3TB2ANMp0oU/gnTbm40LcWO5VI
	 9ePhj3OZJfNd8yJKZjWcUnzGwSx/CYTl0YlQ/7xbsiRpCmQac64P81XvohK6tDpZAb1tx
	 8QFZpPAhOrUD2TKYoLF6+/i1CC5Zx+TSRNqlRMMYqAZn12l0j0HW26kOcnV6YEDvGftLX
	 +Sy2IV81wjJxmME/s0eFZkOAzqu4d79w2y5fIMtrK+8QlGDUhgEeAj3nnDZAgvnlbVr18
	 MWAt7/2KKkRxa2h1Hj7AaaCOjYvppK9VjmTiqFsQmO2RD6YBxxfMpljYrptAE8iJ3rg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792608193;
	bh=l6Pp5Ijp9xKKdXuDIY1xasdU38aQXA8tsyLdXf2BYFc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nXH+gtNxVc4f90m8vvLvxbW3VlcJLgYoMI1JBsFqBK1L0pVEzWwJ0IqO6IvFC1s3z
	 OCzGCDD0RGFx5v9okNr/T5uov31ysYRUDqnoVRmVeh6/qYrZLmDunWkoS6SW9laz5R
	 P90W45dcMEZHKOAsXajlTzrB1ybYdbEbGgLU02BvjUJDMwIkGYXFPvfWLaeNML8rmx
	 Wxp5jAX/8cyRpeg26mzfEV8hDxz7m0D/2ROJ845yhVRUs7nXQBUaXH4hd/Xo4xW0xz
	 vCFQJPWX0vqgcoEaGlHMyR1sbChpf1uj8b/IFWh5OT4P+B29ozfOJCtAZDgd/yfKZT
	 bJr9WAZCQusyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 175AF6F5AE;
	Wed, 21 Oct 2026 18:43:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D3E0769
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 531E44F108
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:43:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YqMshGP2PnjN for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 18:43:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 822A64F1D4
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792608130;
 b=WOly15A7oGAvfbSmxA7mq1URqca+ALky3MgDf8hCrTfRj2e1U6m/nglPBQDfogVzm/4T
 rhbdZDasdEPF7L+cU2c6fa9N8YRF5qXRaKjMS+ibYrwmFH2+KO9yaJINzQxkrg1h4M92o
 ID50tLh9ChLt8WMS59F2EmRSPKzSmKz7EwGWU9x8RY2ccWYCRjose3M7FwxW1lBUxVGIe
 GENgWBrMEvnz0vWNp9yqhxW3qyyl83deVAFTTQ1WdG0dnUMIpYEneHqTjpHchPx/8D3Jf
 N8Vf5JlzmeI5x93DTsZkAeN+OSNXj0lbzMLzYGFiChveg3koBLZ8UKAjk6EkZfX9F8g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792608130;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=rcrlf9hCuhenCxJel/ynWxLXtIxojJuFVHm3lrQf9DI=;
 b=q4CGsZFjK7oPltmd8xRsJcLD2S/qY/FEI/hHNXp49hTLb4TJOdo+59YOUC8JT3yiL3Fx
 36zD5J/+ZMh6x0VHZBCHkE3xICKKeWC+cnCR6797Y83BuYyvKhWL4EFWiYwcIYGrib5cl
 xfWzL2xwSMOlVEJcNFRFNExxK4pDc/DE+0t65lcejHv2AoL5Ne9HyeHIcHsEm+BZkW1AW
 H3jh1Ogxlnsa0fsfj+wvbgImnHlDYDw7gjuaj58rZb3UcLhq4mP1XWB1AnVFmrAPWCVmu
 dEl02NtOi/AltSeVMiEQlfWGj70aC8f3vmgnbmW96iQCCfrbemHR07bLpY0Bqtsqv+w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=mBGHrXsh; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=mBGHrXsh
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 822A64F1D4
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792608099;
 bh=rcrlf9hCuhenCxJel/ynWxLXtIxojJuFVHm3lrQf9DI=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=mBGHrXshKpShyR4sX3QoSLzh6y+bthz9SDEwNoh97neN01pHH2pakJPjf42qhk1zf
 2Rd7A5A/WA3/f/GaK7y4//MRbOvqqOCM4bPJOUkwv31bj4zU2QHt/U2jRezbSbhHfI
 84UWeBpFPQfNp/7bvnZV6peqm2VkYo1yY4tkKmB9aJor5t3Vf3bHeJ1aQzVqX8fE9S
 N5lPi7mnlHXKXHIOQ60eF8+mB7IR98ERXyz71J4rbHwNIMvb2e4eNU3BXx0dJW9ncL
 k0QWnJHt9RQ/aUmrQg8/38uBazNcKDLl4PRuF+Ca/3oMs3ECbsxz2sq6svF5mxh0sz
 dy9b8YIKpXSyw==
X-KAS-Sym: v3:f51bdf72230551df:V7ipQ9HkfkQ/854DwVDvAgDWVhfkomLpXYySyH7LcgFKs
 pkW4v1vaHqCWlaGpihusj2SQk4EAcyAOv8CR1Kw+QeInnqWmUW0bmINeg2ze7HvKZdXn4mF0sGp
 QKUEtpgMdGt0YWbJfFjFfVkpSVkBJfB6NmQ1W1sWSNoTq9DYA9048wfmD288GZeBC7jgFkom/vX
 pqsllhwScrJg3243HkxGBX/8ANze4akT6wjvPRlnmtGVcHzqjVbNRUL75JSIdvgvrCrcFSwrkuE
 HS0PLOQ1gEbiZYiUfjgLTN9vL3fBxQ3dOAWO0kFAL9aM7rT8CNBiCMKmcHs7Rb2lECXaKLUw==:
 iamZ/s4mYMfeR0ja3zFpnl/zj4PfGBE4BECE1LW9qyDDl/oWkj6iWY1Ac7aopisPoK/qzRdooeO
 RRsZfpY6B7XUX+4pW0hFoUl6nLc82g/WxiVaza/xlDSRTGGTW7wAqi8BZRyUdjNKXTmpd4Jtiy8
 evR+z35Fj8879jiTBeyTRQIj0n7gFTaXqZa7Jx8JnCxI5Jo0ORr+cq1UKExKDskn1r1SPgxMMTf
 m3hwROi5RZl6lIUFmIa17jntp5c/VAk8XWX/UKndh2J6JsgTpoWySLZF1hyNdtvEBjUBNhVcDu0
 EiPizUnYbjRtDiCsud8Rzm+QFGTZK0qZThgB0tJ7+FrbWgPhXR4WHUcOO+eelDW5dehfxOKNyns
 ZrAa/0OfAmRLBmJjxg6aTWTgoxIaAlpKtC3QgCU3IxzvAdOdNc/7k4IMuz3AGltEHAA7jVb6yA0
 dToqy1CEFlL0T4FElm2yPwyVnCsglkKuFjUss3DUDmKTGIvLaSlBh2qLj3skKrHqXJmEN3mjW7N
 v3XHKGSwI7RGYgX0WVooypCqC9ggObIdgbx0soIgVdMvZevCywaCow+IQnZ6rxV/ef7IXe2UB9z
 fGwFIw==
Received: from fli4l.lan.fli4l (p54a1bacd.dip0.t-ipconnect.de [84.161.186.205])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C2A02A4C6476
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:41:39 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48174)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xJbFr-0000000034c-2Ccr
 for buildroot@buildroot.org; Wed, 21 Oct 2026 18:41:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 20:41:39 +0200
Message-ID: <20261021184139.1135207-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021184139.1135207-1-bernd@kuhls.net>
References: <20261021184139.1135207-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 3/3] package/xxhash: bump version to 0.8.4
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

https://github.com/Cyan4973/xxHash/releases/tag/v0.8.4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/xxhash/xxhash.hash | 2 +-
 package/xxhash/xxhash.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xxhash/xxhash.hash b/package/xxhash/xxhash.hash
index fb8e384122..c2697a1054 100644
--- a/package/xxhash/xxhash.hash
+++ b/package/xxhash/xxhash.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  aae608dfe8213dfd05d909a57718ef82f30722c392344583d3f39050c7f29a80  xxhash-0.8.3.tar.gz
+sha256  5738270935e7c3d38a79b3adf7c9692566ce7895a25f67de43ad52ab504acd32  xxhash-0.8.4.tar.gz
 sha256  6ffedbc0f7878612d2b23589f1ff2ab15633e1df7963a5d9fc750ec5500c7e7a  LICENSE
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  cli/COPYING
diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index fc2084c878..80bb81dbf7 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XXHASH_VERSION = 0.8.3
+XXHASH_VERSION = 0.8.4
 XXHASH_SITE = $(call github,Cyan4973,xxHash,v$(XXHASH_VERSION))
 XXHASH_LICENSE = BSD-2-Clause (library), GPL-2.0+ (xxhsum)
 XXHASH_LICENSE_FILES = LICENSE cli/COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
