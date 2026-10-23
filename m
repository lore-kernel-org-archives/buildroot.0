Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD3C606A31D
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 07:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nsSoiYCI
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89ECF811DC;
	Fri, 23 Oct 2026 07:27:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GtySJ2koJD3n; Fri, 23 Oct 2026 07:27:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 13DAA811CB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792740423;
	b=T+5bBUA9pTJR6ybZ66ilQMvePfGu/SA7bFvBab1WXpPDNZY51Slt//KRlkvCQvBAobtm
	 hip9wVUgC+mPQ8lLl5Zx3zbaD3xoKf4PnNmeYn1svklh2Xgk4slgXW2GVx8ACpiuZo5lq
	 Vwn6I3PiJz93f9p779SwH3SVFmBTtXBQbbLra26sgT6kvvdFQZgk1hLtSfE3hoGTILylD
	 6nr9YI8spW16Jt8TzthHG3wFC3Q7x+ghH0mUGxBRAgXSGSCBvL5jWFfRWbdyPR3h+sYXX
	 fIqIXss0ykBpU0rvEpAGCr5o4FAtAGsKz66lRJezxrSZX/WpjtR1oUlHkyO8awgdJLw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792740423;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZNFgZlHmB7hGfXSS76QzN2fZIWpLVpC3Js2wVjT6j6Y=;
	b=SK2dg2I6RBDnTVLMump4ryuh1cEhn8Hh6jdOYZKFA+noUyTCt9E5H/eRm6Ec8iaDkd4t
	 r1a6FSK8PVVK7WY8WVsTX5YfZw8A1ETThEqvkELjRMLX9fMm1rpNxKjo25jrdx6Q9yXlk
	 h5mDeIVpnIvW7o1ZKZ1yybdgI0/P2WTyNq6DeymYtVbMl3D/mcD1a5WMZFBmHDIMoZuY3
	 NjiQBi/WgXWtmLb1bgc09Iu2galvRArrrfGV0aUvzPx3dZJoQUtkXGAOSPKvFcXdGwI5D
	 pnnPP0FLWYulf5793/SOSx5db7iWp2MIsOTkd5Vn96+CubT19Zxz+3+JVKGOrORZYBA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792740423;
	bh=ZNFgZlHmB7hGfXSS76QzN2fZIWpLVpC3Js2wVjT6j6Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nsSoiYCISJBnHUEvPk9zx3cuv07g5PiW35VEEmWjDqmb7LTTsdOB62D9raj8TqPx/
	 uF8vttAk0Xm2LPYGEwQxOGX2FHVm+1KxqbStuwhWRQGnyWMYIUCcrcRcCuLHBCgHFf
	 nC0UjRuqhGeU9rNjZt8+0y69Y+97TIX/47dnv/vWo80BgML/rTKdsHljmGoli9d0+D
	 9tTg6NWWnPTNeP38tIE9ghyzoxAzUrJPGS9nJW4AU0w4ADIiokRasdXv3QsXTRZdp4
	 CMKNNHMr2KXxTSwkd/X4LxzkvjnMXvaBwOpVHH8+BmqBiSUTYNMQl4iONUmopi0Bdl
	 34xr1qCEgkmGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13DAA811CB;
	Fri, 23 Oct 2026 07:27:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EF2E49D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7549B40921
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:27:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNrwn__GAnNO for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 07:27:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BA10040913
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792740420;
 b=TfSGJBT/cddBTdqB0x5tFx1d8/H/F6XwVnOf2gG83vs7bOn+yykL3W53+DaN5+44P4sl
 Rpt9ZIbCkqNLUfvaZ+T6yN9uOHQ15VeStdPBo+2eRiI3Q7tR7QB5GdMlXK/rtNqznZcyQ
 RPySu9kDWxAKRbulpcqRBny1PYc4wsgT7S9RYnaBfYs+E107rxLTQCMR8Sp5gctE97QhJ
 QkcqVsOplGeX+zgmZ6dMF9H+MRSjnrXP2znsXMVSLLpKBpK62v4TSva2AVJU6CHKt2QZM
 mIpuK7zf3oi69uHdZ3Mmnx/ntIlGM9w5iJW3W+LTslUeS8xkVt6sVcBuaofiEmkMXCA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792740420;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=g6dqNTAUOBj/5B0ZhS5vJXBMlJNILk0Yp+Lv5N5e+Qw=;
 b=Bk9PpWK9YKJc9sF7NAH/b8pFhLZYcRsQrVuhoxnWIYKVTT22f77QDBv/q91IU0HuXnaG
 gBN34+TcxMPwFkNYAhSpURI6PHQiWlHLJUoMVxx03F9pI71ExnZzhKwGA8opopmk2ozlC
 He4s65bZBjCQLAqpMasLSKPonk0w0r7r8fPqQvT1fFbpWwGpgs1Xq0iasB6sxJJtSKuzs
 y7vEvq6PEYlzYK09uAKoB3WS2U1kVoto9nZFKf8gcYarEb7k2X+xyU7Do25ACSPPWKW/z
 YLjQWR+U6usNmrXrqCEXfw0zG93a8ImTidrUMsG+SdQOhiwVxGIIWBboSF8SfB0xBQg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA10040913
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:27:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 551829C640; Fri, 23 Oct 2026 07:25:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 09:14:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c30740a15b9cf72e70de56fbc7ee9ef42a5cee20
X-Git-Newrev: d035a9a7f368f2336fc9d3a3912129c1ed8856ec
X-Patchwork-Hint: ignore
Message-Id: <20261023072536.551829C640@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm-project: bump version to
 23.1.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d035a9a7f368f2336fc9d3a3912129c1ed8856ec
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://discourse.llvm.org/t/llvm-23-1-4-released/92564

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/llvm-project/llvm-project.hash | 4 ++--
 package/llvm-project/llvm-project.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/llvm-project/llvm-project.hash b/package/llvm-project/llvm-project.hash
index 7df2f28873..2327c20408 100644
--- a/package/llvm-project/llvm-project.hash
+++ b/package/llvm-project/llvm-project.hash
@@ -1,4 +1,4 @@
-# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-23.1.3
-sha256  c44186a7762ed28954be72e5ff6df9808e0779d4f1bf014ecc4e7e211d31ee34  llvm-project-23.1.3.src.tar.xz
+# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-23.1.4
+sha256  819ecf7351f1a66f76b2d701d8942faaf5faeb324cb90c9d5b090de142434bb2  llvm-project-23.1.4.src.tar.xz
 # locally calculated
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index fa141fe8ff..f0020b4804 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 23
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.3
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.4
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 LLVM_PROJECT_SOURCE = llvm-project-$(LLVM_VERSION).src.tar.xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
