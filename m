Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF63606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CSAY+RmE
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90E3860B71;
	Fri, 30 Oct 2026 14:07:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H31RUJtvR5W2; Fri, 30 Oct 2026 14:07:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9981760B3C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369247;
	b=A9Pjrtzhbz228W6AD2MbNEDcVRLFuSrzV/sSOySB9NW6QTQDIMA1nf98/UTzw15kYDpV
	 sAwhgBJnGU+dZYIOI10wh3xeCTMkWPu4035hhnFeMjxsl8OBKvxwA0ep8NRG9tb4dyXhn
	 9Kyz5/lrHaYfLB/DIqGkncJ50DF/jEH7DIHxrtjFV5APqbzphefXQAZLyZgsWFzuTS6aw
	 6JiFz4TASWe6zEYWKb6o/UpSwJWqFNlvB0q2EN1NJNEwoJPk13NXq8TUug6pi0UgFDKY4
	 CF8N6vVmtLCBcstyCmgaFl80vP2aPjXKApINU9xA88M9bmsLSuJVbOK5Z38vQenNRpA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369247;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=nQ8krj9bLFv3DNKBvde4Qgtgptx04dOvQw5fcZQh+Ck=;
	b=aLnHHrvpN0mMEzACo8BHj/uUZg5C0RIAwHITgiUmYAFyf7BQccJq6Le1BrwdicJ2BcKY
	 GPLj9OeHSvBoEUbDLH/reUYo0e06hhKtDfWzH+PTW2MxS824GFcbQXvliRTaDI2tn5ux3
	 QJjiREayTRYHmoFUuolE+VkS6pXkQpkUEZzjkMrzFEquufEKyG+4AC/UDVWa9Iv1Qdk7L
	 6UqM+2sNtoH0yQ23CyVT22NkAY9tg9I+t5eCsAsZSpuXaoRe0j5lJKO3jMa5U1N2+7xEg
	 Hn8NZNUxoCCy0d3PFgWxSohq2KR2A8QzwpYeGsb8H/JrxqCUzY9DWEqaE5wzZO3DoMA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369247;
	bh=nQ8krj9bLFv3DNKBvde4Qgtgptx04dOvQw5fcZQh+Ck=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CSAY+RmEzC5aIShQGnuln0PUa/VTcHCg3uypLDM8vj03HZZpjpfEGRRv9FEL89wkL
	 ndVTXbqg+upY/Wm/9FZxpkvTl4gNDdnu8z+ySlmIHizpeqyCgsEvLnZ9XL5klLTQ+7
	 Yvz0U5bq+Mbuz5bXm+iRWmqEmBs2ChCI+QcnnY+oYnBmzxo4BSyfu8oJkNA7femicI
	 v/51phPJ59NjQB8gvsAG7lPRU78r2AyWx/VtlpyUnfDxsihIVQDDzwrfJtJ9ZHNzQa
	 6QvqRytSh8xcZQCMo8cuhqRT7lKSjUVcbLmDeQ2o6Q7W3vWK2rkE2QTqup3SdFTvif
	 lsDAGwwo2uKdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9981760B3C;
	Fri, 30 Oct 2026 14:07:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CA8BD47
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 449F881191
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2r77wj1Qc8JW for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B64D681189
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369165;
 b=hPkpLJQMZsnv5UqgYAUSUs6ZRcHGLEWbYzYKy6GNPbV7xyajTtQBWC0ywIN9gV+WbUMO
 quOafMm+y8eZIjh7ap+OhYBa8wvBIYPXvDi9Pvfw6LiaGLdbWJghE6M3NE+LLQDBXu4SI
 V+OT+tfI95kxNXe1NwwVHKJTdOsBeE5z4SNsYovHIZmtuwVQw2oDAt9/b+l2oNORJEX5b
 0WuG01hYnfe7zWZLm0/YAITHHzkVM/s3/0uhA2Atwfblx6vD9RReS5oZ/pxHjiuQV1cf8
 Uycq8SodvnsnzGRwdkHoHhNPsgnURAfrqAtor7ArCGoPrIx5cQ93r3B17CzUAqCQAsw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369165;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=zAN+WWS6nhED64s6ujOFWT9Vlfo9fUKGFzbyKqEbGcE=;
 b=DAhMKioS0qhh1q+VX7Q3wyz/tT/rWDmt3PFhRPT9XGpaSX14KEyGe8S4U+ndAw3cLMJE
 3xPrJXn+ZYUFovaXByct4yB/E/GNJAV+ogqez2gDVVTUbp7dvxir0YY1ZJ+PYYmBgrbyL
 ak5GUEiGMtaPeg1cbxdma9YXUTXnP9r8Pa8slbm3UDphgrGTBHZdWIg6gN/YzLD+Ysc5q
 yMb3COpydphMEzEcnHerEWxbXKLmBMRDcfsJfx/pHvzfiL3UzVNvfrSbT6zQTyqdmrRo1
 YfMyGfDkaE3ADPmMFgcIq0UuDffPXNJru8d61BGyD38m8I0sOXhvcWPnFCOTr4K0FJw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B64D681189
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2A429D389; Fri, 30 Oct 2026 14:04:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:57 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0139d15ff6d6d4626ebfbf6b46e109294d6809d5
X-Git-Newrev: 900b7af13138a00f1ff11eac09c1f3561ffb382e
X-Patchwork-Hint: ignore
Message-Id: <20261030140437.C2A429D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libnss: bump
 version to 3.110
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
Content-Type: multipart/mixed; boundary="===============3007096111988791432=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3007096111988791432==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/900b7af13138a00f1ff11eac09c1f3561ffb382e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For release note, see:
https://hg.mozilla.org/projects/nss/diff/997c76f8a94c85b05ce85c9ae0ba3b3d600c26f3/doc/rst/releases/nss_3_110.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7336c5fa93a896130511d661f0d42359a046ec9a)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 9244a0000d..9b9252e77f 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_109_RTM/src/SHA256SUMS
-sha256  bea46c256118cd8910202f05339627d75291f13b80054527df58419b9d29c18b  nss-3.109.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_110_RTM/src/SHA256SUMS
+sha256  9cd610c40422a07771b9b45166be2d052ea2f00b605a7928129e1f2071b3ae27  nss-3.110.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index e25beacba5..83bfa422d7 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.109
+LIBNSS_VERSION = 3.110
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist

--===============3007096111988791432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3007096111988791432==--
