Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5494606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mVutMInZ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 813C760613;
	Sun, 25 Oct 2026 20:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tKDptp4uzgHF; Sun, 25 Oct 2026 20:59:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A254E60607
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792961973;
	b=iIF1gsSOPcrYqUKjRXeqs8qX584PrPCOqRPeJRqnnxQLRd4F3IieoK0GqaT82R1S5fFh
	 fSNz24Hkxe+49LXSCh+p4x6c+G6ZTQ/Ak+1r5WvjBJ9JytoQ7qgqtdpJlkBzQVhyS6ps5
	 2pj1FTbHeqBt/nGX/tIhbjlFlfCZaz2AGRJHb+jz4V7kh9DeTdxoU71/Hzh9oH8OVYfb9
	 LHricfleLgjxlp3n1W9um/zVyQMq/Lm/i109/4sNU3a/lOQ1E1GB3ZWY7e5KeoBDCNfti
	 t0vIJl/42oVCks6W15PJX+OuC1uBpykg3VVxS9/lfWa7jNoFLCVrgtzWJeQwihP7epw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792961973;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nxgqnfiNGG3WLKibgA/vBhx5rU3a0labZtvY3NAErgk=;
	b=H4Lkk8eiYE6kBTaAUmSij/IfV7zjEpjrqhGZIfdBwij38rrDIXeP4GtP02aPtlKv32S4
	 ujm0Fy+S07XwwJYnOmCXB23ZVV7sB48dJNtG1HRkKuFhjGAfXg/jX1RrOGXArk913PIMf
	 KLe0zRZHoQY4v10ZUBIK2Ywqh11jbPaahlpL50o3k2diAjr3+6R9m/XmsIWUdi2gbMhlT
	 NMA2JA7zlW8vv/80ZALgUHfM2UJDrCYZllNANnD7El7sT8Fr+rV+Ms+KMTl53BxDZ/rKk
	 uvTKuzB/6OqgSA3YMs7QnWECmerc3IIESoZCEYqz7fI8pj92vIZUT1Gk7fk4CQdmPpw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792961973;
	bh=nxgqnfiNGG3WLKibgA/vBhx5rU3a0labZtvY3NAErgk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mVutMInZX+Oxir/fSEDQNft3fXmL2mFrt4BWsJXEFq2M5Dz4bOmIc+DQeEYVAQQOM
	 1VRVitpY4zwYn9WobsZU0sr5bZ+jwA8/9AXENpKNDA5zs3gZ5XfEpHFQqGwpaBUove
	 UgxzLdiTovVM/B3YFMXthtGIGYBXsTaBaGwEqOuvnwdFyt48gpEGzfKRuIzegtX/dC
	 +btPYcoueDZXWhyAMuLdHZE4Y2v8uRLsbOATxbNm1QHhPPs2G+rSNpJMY5DXlOpfU7
	 BGUf4vP/wt6LeCXSDydFIavisC0YWKhWbTzF4IiVcSVZtRjLT9dyX9LiIHNm5zQmAF
	 7DX2rOGavhrBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A254E60607;
	Sun, 25 Oct 2026 20:59:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 12656380
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 042144009C
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:59:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KGEIjiUF1X59 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:59:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 54E5340098
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792961972;
 b=NAvSH+xEzsPJLx9keUO0G4W/3GEqO/y+XlzjHFBTV5XpvtBRISHIDfQQfrcZU3k3m5FA
 D5iJtztoG4bd3jdL9tbP12TgJj1sqCoq6mDyZZQXqxkp8IIinOuvl2zQaNN44Y91V45Be
 noFz+alFKfFaz8+fHhfk7d6eyyBoowe4OvVt45Ma0R0JYiQskQPo9qojefndLZHIAjx2e
 nROo62w+z2JbWPn3yk5DkU89W7qklXJHbqGrwkdYKeR3Pm5zeeciWfuwvRyPYl2f0zmUC
 5/0n6t3362YetKB81hVH26GjQk5mmTWLX6GLanxZhc4hs0J5FXeVGNrYN7okh+9RI+g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792961972;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=+LCObj2XBSBX56tbwEMPNi3S8ffx9iGKaDRTTx0wHZ8=;
 b=UVtAwYfxVl0JfOjyqm5GHd4DT1M9wGeP1t4YjFtdaLbqdOxiisL9+BAm4X8jWSp2xPYF
 qdCEaB64/VTegUNY+ekdN91V8ti1IyUXBhaKwNi+VprUempncvDV7w9BqfYbMu6+BmTS9
 LcGLZbAVhGVExEIwU+lbZLiMXHy5ZGgsW+EBYGXohNby22DwfqCd6jKw4c65qQoBOEeE5
 w0GlwkL7804RSpYRO4aF6bE7VwX5a/nXvJIm71lxR7Ucc0liFDU831TqgArZkssKeN5Tj
 cq/pRqNCAsIib7mcnklOJgyqu2bjZo7XQ9rWqxlCL6VEOJlkOhJ/8O8Zt5Hh5yXD0JA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54E5340098
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:59:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC19C9CEC7; Sun, 25 Oct 2026 20:58:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 21:58:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 86240fa45d11e3388968520b4a35f0a40954c132
X-Git-Newrev: 5797aeb95f2649af8096e20dab8a0e6e459803f1
X-Patchwork-Hint: ignore
Message-Id: <20261025205806.AC19C9CEC7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/chawan: add arch mapping for
 BR2_i386
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5797aeb95f2649af8096e20dab8a0e6e459803f1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

chawan architectures are different to Buildroot ones, so
add another mapping for f.e. i686 toolchain.

Fixes:
 - https://autobuild.buildroot.org/results/16888bbe55bc290733c79a8cdd0517f5f4df2a30

Fixes: 9ec34dc363d7db8d5bc460d2607b1facf2103961 ("package/chawan: new package")
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/chawan/chawan.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/chawan/chawan.mk b/package/chawan/chawan.mk
index 9f36d300e6..cfaad13ac5 100644
--- a/package/chawan/chawan.mk
+++ b/package/chawan/chawan.mk
@@ -14,6 +14,8 @@ CHAWAN_DEPENDENCIES = brotli host-nim libssh2 openssl
 
 ifeq ($(BR2_aarch64),y)
 CHAWAN_TARGET_ARCH = arm64
+else ifeq ($(BR2_i386),y)
+CHAWAN_TARGET_ARCH = i386
 else ifeq ($(BR2_x86_64),y)
 CHAWAN_TARGET_ARCH = amd64
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
