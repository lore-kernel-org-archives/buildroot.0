Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E088D4337C
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1079830C2;
	Fri, 12 Dec 2025 07:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mZgvM-ZLLSCN; Fri, 12 Dec 2025 07:56:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A895382314
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526179;
	bh=NDVYzf9JuwIaMdNGdf1L4PoQ/wRiZV3Q8T9/A5WY+H4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JgprSWwITM9Vb9HGP9w+++jnu+oMRWF2Km4rQNc9lYGBYeRtvPrL6GpFhWzeStNy+
	 kI9QhGiOPx4e9TCrTiN0qdyoIAn+kPHY6Zq7oYEWgnIx/xW27DA3PiTzD8i+3Hmntn
	 S8xArcscCFMAQG/HblATfIY2cD+Kc6AoI8i9Ej0IdQ3525HIzRNEnJAWISIFnMOCc3
	 2dfLtjRgUemJaT34XNqrTRhHp6bIxEAupDubBASEz8OPBMr3rUgwfdFP1zMDubvs0I
	 ITEtJcSLOQhKp7ew3cm/SXYWorKY5sK0f/UGRj/yXhZQ43L5WX+wi2Kns343ztxNEo
	 w1WjQSWaWOMFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A895382314;
	Fri, 12 Dec 2025 07:56:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 491C22C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF9BD41174
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U9SThgy61qmx for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09D4941125
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09D4941125
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 08E3986C94; Fri, 12 Dec 2025 07:55:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 26 Nov 2025 11:43:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9cdef247404757fdbebdbb26813024ebfd191d67
X-Git-Newrev: 8d278b8f308c54432bdfcd163580bf4ad583eb6e
X-Patchwork-Hint: ignore
Message-Id: <20251212075535.08E3986C94@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/xilinx-prebuilt: add xilinx_v2025.2
 hash
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8d278b8f308c54432bdfcd163580bf4ad583eb6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for xilinx_v2025.2 version, so that example defconfigs can be
bumped to the latest version individually.

Since the license.txt changes with each release, move the hashes to version
specific directories instead of having a generic hash file.

xilinx_v2025.1 hash is moved to boot/xilinx-prebuilt/xilinx_v2025.1_update1
xilinx_v2025.2 hash is added to boot/xilinx-prebuilt/xilinx_v2025.2

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../{ => xilinx_v2025.1_update1}/xilinx-prebuilt.hash                | 0
 boot/xilinx-prebuilt/xilinx_v2025.2/xilinx-prebuilt.hash             | 5 +++++
 2 files changed, 5 insertions(+)

diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.hash b/boot/xilinx-prebuilt/xilinx_v2025.1_update1/xilinx-prebuilt.hash
similarity index 100%
rename from boot/xilinx-prebuilt/xilinx-prebuilt.hash
rename to boot/xilinx-prebuilt/xilinx_v2025.1_update1/xilinx-prebuilt.hash
diff --git a/boot/xilinx-prebuilt/xilinx_v2025.2/xilinx-prebuilt.hash b/boot/xilinx-prebuilt/xilinx_v2025.2/xilinx-prebuilt.hash
new file mode 100644
index 0000000000..9828b6595e
--- /dev/null
+++ b/boot/xilinx-prebuilt/xilinx_v2025.2/xilinx-prebuilt.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  d292a52ac167631860b5e9a8d8356946289da164ddde4c5393977dc1652dcadb  xilinx-prebuilt-xilinx_v2025.2.tar.gz
+
+# Locally calculated
+sha256  e7ed8599c0cbf9e28d07883f94ee6ff694f6a702daa56c75b2cf4b30105baecc  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
