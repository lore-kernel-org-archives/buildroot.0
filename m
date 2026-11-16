Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E03606A32C
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 14:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ceT3f0Yz
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5FD4607B9;
	Mon, 16 Nov 2026 14:31:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7cx-4EfJ_7Xm; Mon, 16 Nov 2026 14:31:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F004760796
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794839484;
	b=lZObC5yF3mCsUqb3Rxp3gjSEA2AfgQwGbOLRMMUjxBVuVorbC4A09z9N6pSgyPSeVwSF
	 KVH2w1hzNl243DouQKuHTRv/kt6HfG/D6krWu3gE2+lQrjUHEMEXnSI7/lFOJzprfDL3Z
	 zi3Q7QP8QMcDRsNwRokgknEgs04I624GGE21yfGc7vtqmWLa0DSrsE9MxqhvOGuHmTaVU
	 i1+gYpHzo9P5J7DA7raa7OtVTyKu7Nex9IK66f9uG7vrOwCevKe+5sABpgYwxzRK5PDX4
	 SZ+oCo7ZvE0jkB2ATrQxzm4jiZtsvm7DcUBtTDqlUx6D4jQwQqHphwBuTYzloyRd0Mg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794839484;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ytnf9ly54Ywx07rS9faepDyAYIG+tG3EmeE+Injfypc=;
	b=T7gZVU/C9+tTgQOmtRr8SYlfMXaTIXZYgr1FNT2XbkudVJv0SXG+nyNKR64VaoHhcMj/
	 PsVky6DQ57a+SR67dUXCe1ZaaVzHb6lTmjdSNvnhnDYxpqYORSYie8knp8pZuCVO0LGHF
	 u2BlKU4QEWm/Pprl6sKSysAzJum79WU2XyHy5V5jFDYlXdSmKRz+AZpwW2kqJv9okbrbQ
	 wBA+XVyqqzFuJ+SK9WES6S8Ei0MZCnq4+WdouT1RaEl/SJSTc552X03FU1QhrRCNNdL4k
	 DUjco1qVGVgygIMkMsyAzPPFklVAxBSoRurzqLeOxdBZIjBIuktuZRrpC+Tj1Nj/NYw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794839484;
	bh=ytnf9ly54Ywx07rS9faepDyAYIG+tG3EmeE+Injfypc=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=ceT3f0YzYdmrEztuy8RhDkdeDIHSKmOY0tfiJpZ7GDGDVuRbvGLEg+dx4x3uxilYF
	 P83XNPrXUPLrU64yfGyC+Ukq3lx4O6JnZ1ANwpddQh8mr/tfR0y15awKolu49CIs9n
	 cj5ATzaDFhl1KpsmKStvit6zZAAGxyiV0hcm3JhRB8oERYVG8L6o3FxkCJ4lCpursi
	 6B2nBHrhsnuQSOxLCnGmgejZkYDzyDfzPgtyL/+5lS8GhfOzd095Y1poK3KDVtnv8H
	 dSvXfg6h94eYbZlshCLGLbTaM33/6tDHOsV3gvYvkqhE4liSuC+FupNSKp26/n/Fe2
	 UKHw3XyimXOJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F004760796;
	Mon, 16 Nov 2026 14:31:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F11D728C
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7DEB6079B
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:31:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jM7qjrw3Pl_5 for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 14:31:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 15B8060794
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15B8060794
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:31:20 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6b56221d361so5481279a12.3
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 06:31:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794839478; x=1795444278;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8OmIsxx9VXPUrqHYFO66J8j7RpbeTb3g8XfE+Bn6Tkg=;
 b=CgHmjYDMV42ou7zfVRwhEmY+BGs1dYixZ4f4eUzZuoVuPKtZ5XRTz+sORN+8wXm9EK
 0Zbvix/CzGJqBQMq4nVsvOVfnknf0ueyf6VsRlk4sDgZDTXyXbw1v3FRoUCFcR1OSYqo
 bx4sPc91RnNqeStf58DY5jQOb0aisgfakBX9sn+QnuubYIu+tusPCuMZTkBtpqKdU05U
 WyrE3Rn2Ls2fYRavWClqbnoDuK8pYfdrf6oBxSaheMy/gf09soUfu3nguoYuQgcCYMX5
 HIrXQ1odd7sD9XL/qj5GGAK8IyVRMV2yVl39e7xrM5K6bLmzqZCNQZu1sRgUFFFWK4EH
 q9lg==
X-Gm-Message-State: APuU4Z95x1UIah82DJdVzxI9uZkF1xCy+gDrMeND7kMdI0ntwgtLF4W9
 /vBDYyTuipCZEIpQ7retS7+aRcr/MoFGQeIOnCS0itQhTdCalE5j+2m8tJqktX2ikCtCzchg1Dw
 Mcqrl
X-Gm-Gg: AYBFou0AKIfbA87/SzuclZs1HDlx0SAkY8SvHqVYq4rOY4DZ06kw1gaI8mQXzZDHdhi
 R9XREU04oGIzksyEwSg5SreitwgKs0Dc55hATPnCR0ctpWNHWv963g4iLCFTWs58/oIpfRczE9h
 GA9x6Yq29AHLrqqBcbVcD8Y8OWq9XSdjXngGaNe39N2Dfn8KXQ+j0RXeE8cEifXppMTC+wIAOu1
 BZpt4wD2AvNZR73VsoY6CIzcKardfcZiw0ya4n2iLEh7NhU8V8v3nkYGlWVFcpBVocmPo6NDGLN
 36IFI7NSYUby8vxGEhaq0PlIh3cGq5v++5HHu9c/qUiXqYAFjtDnroFG5OADaoP9xVwns4Frct6
 vpxmRwG8MMojhGwMe/vUyQVE5R2SI7vrXZysJ+H0L4I0+kqyGopbgJK3t9hnzBpVyTxMoTPAaWG
 6du58WjIcOzDGDYyxdbazDd6dD4z1rX7sEHGX+1ecOJ3VfU0xmSob2Tj4vgKiRobLDo4CWA397f
 pZBKZgn9tVK2Y2sKugE6bCSqpPl6L6thMs0QiUhTCfKEAGjLzqrlgk8QUU1b5zcHF2Y1qKQJ5ro
 YAx2U6aXbypr9qWZDMXGjhyrysn7XTNR02mbe8zNq69i
X-Received: by 2002:a05:6402:3444:b0:6b7:d55:87e0 with SMTP id
 4fb4d7f45d1cf-6b7c0bbf2e1mr6128896a12.21.1794839478298; 
 Mon, 16 Nov 2026 06:31:18 -0800 (PST)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c608cf46dsm24346284f8f.43.2026.11.16.06.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 06:31:17 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
	Vincent Jardin <vjardin@free.fr>
Date: Mon, 16 Nov 2026 15:31:16 +0100
Message-ID: <20261116143116.967132-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2025.02.x] package/dpdk: security bump to
 version 24.11.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an LTS release for DPDK.

See the release note of the new versions:
 - 24.11.8 https://doc.dpdk.org/guides-24.11/rel_notes/release_24_11.html#id24
 - 24.11.7 https://doc.dpdk.org/guides-24.11/rel_notes/release_24_11.html#id20
 - 24.11.6 https://doc.dpdk.org/guides-24.11/rel_notes/release_24_11.html#id17
 - 24.11.5 https://doc.dpdk.org/guides-24.11/rel_notes/release_24_11.html#id14
 - 24.11.4 https://doc.dpdk.org/guides-24.11/rel_notes/release_24_11.html#id9
 - 24.11.3 https://doc.dpdk.org/guides-24.11/rel_notes/release_24_11.html#id5
 - 24.11.2 https://doc.dpdk.org/guides-24.11/rel_notes/release_24_11.html#id1

Fixes the following CVEs:
 - gso: fix overflow when writing to very small buffers (CVE-2026-100236)
 - vhost: check number of queues for VDPA (CVE-2026-86856)
 - vhost/crypto: catch incorrect request length (CVE-2026-86849)
 - vhost/crypto: drop crypto session cache (CVE-2026-86845)
 - vhost/crypto: fix TOCTOU OOB write in finalize path (CVE-2026-86846, CVE-2026-86848)
 - vhost/crypto: fix write back chains termination (CVE-2026-86847)
 - vhost: fix double-fetch vulnerability in control queue (CVE-2026-86562)
 - vhost: fix header copy to multiple descriptors (CVE-2026-86566)
 - vhost: fix indirect descriptor table double fetch (CVE-2026-93683)
 - vhost: fix inflight descriptor table overflow (CVE-2026-86565)
 - vhost: fix log base address mapping offset (CVE-2026-86563)
 - vhost: fix missing memory size validation before mmap (CVE-2026-86561)
 - vhost: fix out-of-bounds read in control virtqueue handler (CVE-2026-86562)
 - vhost: fix VDUSE stale vring pointers after IOTLB invalidation (CVE-2026-86567)

The license was updated with upstream commit [1].

[1] https://github.com/DPDK/dpdk/commit/a048f51065d0db7aaf54f151f40796ede18195e0

(alternative to commit 3c1cb086df0e0a174b6e140f586262a93a0fe7a4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/dpdk/dpdk.hash | 4 ++--
 package/dpdk/dpdk.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dpdk/dpdk.hash b/package/dpdk/dpdk.hash
index e9a22736b0..1201ba45d2 100644
--- a/package/dpdk/dpdk.hash
+++ b/package/dpdk/dpdk.hash
@@ -1,6 +1,6 @@
 # Locally computed
-sha256  bcae7d42c449fc456dfb279feabcbe0599a29bebb2fe2905761e187339d96b8e  dpdk-24.11.1.tar.xz
+sha256  f3dbfac841b2db8e53a97d68a5e14ebc943327a955f0afb97f8c14f544fbc4aa  dpdk-24.11.8.tar.xz
 sha256  9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  license/bsd-3-clause.txt
-sha256  e19808bccd90c238fac06da2fc3683e094c64f7ba647e9d86f03a98cf5f2ce05  license/exceptions.txt
+sha256  6be99eb90a152a920c0dd9fe6b8dfb5bfd55fdd0a5fe554ed4adb78cdeaef0b7  license/exceptions.txt
 sha256  6c54c4d44faf3cba829b3d0c21c6955953e758767018fd7244f809b01d4f4845  license/mit.txt
 sha256  cae178052c96959741acb7f00634a09a8294e6cafb5ad53e158d63e3510875ab  license/README
diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
index a422cdde06..bca3a2ff39 100644
--- a/package/dpdk/dpdk.mk
+++ b/package/dpdk/dpdk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DPDK_VERSION = 24.11.1
+DPDK_VERSION = 24.11.8
 DPDK_SOURCE = dpdk-$(DPDK_VERSION).tar.xz
 DPDK_SITE = https://fast.dpdk.org/rel
 DPDK_LICENSE = \
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
