Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC47606A31E
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 15:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KaIikFK0;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eyNUK6k0
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0421D607BC;
	Fri, 27 Nov 2026 15:11:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hUJLZtzLssRd; Fri, 27 Nov 2026 15:11:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2E73D608C4
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795792303;
	b=emxMkgy0xi+uchnYEujP6BCGg7mk9WXsOIhic3TekMlac7ibl2x5z/Vq77vXMcun8RRj
	 XT3aeMQNVOzqdFL63Z+02Bjc45qFoT6G5Rhopxj/P2yezUZYS+G1vBp4UILLSL8hlzgCH
	 fW1YMoE/7vaFNVyoDjurKevGyYtqCStOKtY5ROUL5QsIWTjrV45Ok2rEVJFZby3cHP9o/
	 YJYMw7GJPYXUfOAgQMv7iwb3dC7czoSztXZCkFX9nXR49NAFz6FmbqmJti7JNTxDHHBfT
	 bFCAuJi6RSoZREqc9/YC6IQn+k/H23iiQwDb618Rwr0O1sCFHaufKANfWaCbtk/bRhw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795792303;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=D09LjiO2679rdp9fS7MV35SD6cuWOyDm3kD1runlbpM=;
	b=jt8f7STe6tq1DwfCNuRXe27jxfs6jljfxmQcDIHBjOwato7JnIVp3gGaA9TzIhRnh5CM
	 yHChzgm20t+skd4pzqWPJ5urpW7PZneJC3nqIdxO9pPpVEqW2iitcE85JzNNWeOhTr5lF
	 s0ZI6kzcVE4Gj+XWu6UF3r7oWYpXFH25+bA4LO167Hk0e6MGIDiFryBVki+d9LiRXVuUb
	 rU5cdzJqWt2407wtWgRdm7IdbpKZTABFJ2UxtZsyoxmfnVngN7tgrh2mUc4V5x1IlG1O7
	 n3m3oZnUsq4ULNn/vsBRtjTBWTeQTYh2nuOFzCcippo3leAIKHjhRU+Nag7vnR+XhmQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795792303;
	bh=D09LjiO2679rdp9fS7MV35SD6cuWOyDm3kD1runlbpM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KaIikFK05QObbrkdxtlbKu/FzrvAI0DRU5M2mvv3BNKubt9HfOe7pHegnPjpSPrId
	 jUBh/qFTRhbF+p4uvAsxjkR4laWZIwqA/1zkpZGvm3P/AiBGeUbNElnuu5/jHYVig5
	 HIiwOEqluQ0g/nh+3Vgj77uoyWeqn6oY+fAS1skn+ENWJxHHkzZsOLM030nsVpMyyq
	 PU6jXOVWFKhuclwqIRneD/8If65S5wOw6RCwpMwb+YZW7unvJ3UiN67PdAo0+UOM+u
	 PbHKLaorbdXauS0HKaKDBny7Pw2GLyDIZOpSO40h/S4GxZCZtXlEvcgvzFVIF/4k9v
	 7PP28PpB5mnMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E73D608C4;
	Fri, 27 Nov 2026 15:11:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CD0AE2BD
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEC4981184
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:11:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qkgd49jJbfTI for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 15:11:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EDBE080A06
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1333; helo=mail-dy1-x1333.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=eyNUK6k0
Received: from mail-dy1-x1333.google.com (mail-dy1-x1333.google.com
 [IPv6:2607:f8b0:4864:20::1333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EDBE080A06
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:11:40 +0000 (UTC)
Received: by mail-dy1-x1333.google.com with SMTP id
 5a478bee46e88-33bf40b0c8bso17440734eec.0
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 07:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795792300; x=1796397100; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=NJpkUX557eE/cExEbvIxz9W3/Hamn0lRRJto0qYAOU4=;
 b=eyNUK6k0UcYEZEsXiRyupLJRHBOm+TNGh9hM1VFLkzOs+YjdBAW05QqOrM0XSPQOU2
 0OUSLSFW+tjh4suNotYxMV4uH6fzabD9v/9m9F3o17udTu0U8Au1EvhFs0P4RtdV4zNZ
 DUzaFgbVgNY2tNUV3kIKtMvGdxfSUhv0lgdIz6MREdn2hTriommcHgLTnZAkKxmCqnq3
 zWWuXljmuWLHV+/DaGnU4XXjAC3Cz6/8xsbOn1GacH9BwyuodXQu16KMsNfbcRer12w8
 VDMVlbzEL3rfcFmg5Z7JxqO01ArT5UC4CnqSPgWTdXQQyKi7/KQ2qCCNBDM5//5oT4X+
 r3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795792300; x=1796397100;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NJpkUX557eE/cExEbvIxz9W3/Hamn0lRRJto0qYAOU4=;
 b=wXcXjdC74KJk9+1n+E+xFJhhwvVb4xVLCPICirSDBvvNOBkrgBOG6Di1jp5YdX4cws
 +rukWWspN7sZfyd9g9F+rTsx8VOeLZYkGhB6axP86555wTWwV1wxqh9IjwfN1QHR5oc7
 PwFbtPASKeMd3FZFPM3DjSgpJzp+VX4RYoDRDUI3AMILtTqBe452AjrzjFTLWMVn5Xix
 H784P6UEObPWdWtOuKb+4oMFX3GClPIF+c6b5+eAE/7AHnS5J5cXq21c8oeD4R2xUJXi
 L1XOJ/I8ZbqZFfnr9WLIKpj5fhjWlV19yJ+1Wm/gXjhnCRDjELWoacovjicdkkrCBQka
 tqig==
X-Gm-Message-State: APuU4Z+cFVHug1p4777M+7VTnkzVyl8prvrltSYKmY9AXRzvEM57grDE
 Dl9Efxez1CEhEmLpwyfZpSZn8RFUZTK/36b2YSHcxkvoSTFcD561W9ggcJHslw==
X-Gm-Gg: AZFdTZfep6rYZ4X0cRt3Lf+02fG7XlviOFDdp3ED6Tl29Qcma5rt1zh/SjjigakF2LD
 83eRhy7i5fVY46JmLw4eN/fdk5uEdF38We27ixTT8hss0Q9X0EJelPAfq0EoE60M54jAcrlLSPO
 Q/wZJ4kj2f9DSWbmGq0uzgODrdzbKVZRQkvq/sBxk97Y3pdbYuRo+jZAgjFhf264esdRo26KDsK
 jS2EuTOCTP44Bvn/HHO7Ty0ZvnydOeuqyNuXBp+Ap/i2q1WNBAXi9wcbvx/BnHm/6VKYgSOcaeA
 de5mH0TGwswHqNmukaojKdnSsbcZYdUzIw40yZ1st/ZqqrGdDPT+id9trv5MvevmxQO9miVXsnc
 3wzybFRI5zI2mLKGJMXIQ3fKk0nRNAqYsScUcEJub1v77zhVJ3tr2YTPvzgAZlymXHct2hL8rhg
 dRBUZDC+0yl97BT087D8QOct69QX+l7WOpfUVISXQRfqXidUCODkQ0KCBZJ+Y/6arGt+OBD8tNb
 WZ6bxn92lK/l76dP4RTGcBeAwrybKTRdoUhOwGVJPMhKIM1eWLJUaIxeJLBpak33O5jP5+G3wT6
 z0cVEsVayy+CeZ2NX5/LSKZ4Gk5lQ3Kt+kxXZzVZ5LPTiUEM1Hh8WAXJEiqqIqr6czdnsu3+okU
 LPn8w5g==
X-Received: by 2002:a05:7300:2156:b0:386:42f5:37c4 with SMTP id
 5a478bee46e88-38642f53d72mr31949848eec.6.1795792299521; 
 Fri, 27 Nov 2026 07:11:39 -0800 (PST)
Received: from fedora.taildae27b.ts.net
 ([2409:40e5:9a:8d55:be15:fb2f:b58:26f1])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-385677c349csm78042668eec.22.2026.11.27.07.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2026 07:11:39 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Fri, 27 Nov 2026 20:41:31 +0530
Message-ID: <20261127151133.2261076-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/lsof: bump to version 4.99.7
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For change log, see:
https://github.com/lsof-org/lsof/blob/4.99.7/00DIST#L5652-L5683
https://github.com/lsof-org/lsof/releases/tag/4.99.7

Tested using:
 utils/test-pkg -c lsof.config -p lsof
 (Result: 6 builds, 1 skipped, 0 build failed)

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/lsof/lsof.hash | 2 +-
 package/lsof/lsof.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lsof/lsof.hash b/package/lsof/lsof.hash
index 8002080e23..f76d3ad917 100644
--- a/package/lsof/lsof.hash
+++ b/package/lsof/lsof.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2ce65158694e9c44dfc54916f5b843d887763c03128e0a1c77d62ae106537009  lsof-4.99.6.tar.gz
+sha256  bac1b0acbc50aede42fc97dffaa0b0475e97973e36a6351de5f349c6155afc68  lsof-4.99.7.tar.gz
 sha256  225222ff9bf38abc2cef7205e9b05c60935efa9ec28d1fd01e503c9316088718  COPYING
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 62a4d15d8c..22d7d6d954 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LSOF_VERSION = 4.99.6
+LSOF_VERSION = 4.99.7
 LSOF_SITE = $(call github,lsof-org,lsof,$(LSOF_VERSION))
 LSOF_LICENSE = lsof license
 LSOF_LICENSE_FILES = COPYING
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
