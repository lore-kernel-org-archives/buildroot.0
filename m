Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE7D606A328
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 12:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cRyKAvt5
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B3A340871;
	Thu,  5 Nov 2026 12:29:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FL_A1GP9Zhbg; Thu,  5 Nov 2026 12:29:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 458F540869
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793881764;
	b=kM1f0cSc4j0sqyLDGy5XMh/CxtVYvWqwITLTbXTgpjin3OQfNWy8vkb6+H1B6EL2uuX+
	 aFOLR+i9/xUykkZnBtHREQklUDhuDNYyYufSqX/u0WzeGAMQDuhRNl2pPcrj60D8eyizq
	 M76VyEutomxPE2dfLd8VipavraVgonqZ7TsWvzwKx+Zx+m6Ix40ugX0MDvfGn7xNZcORf
	 js8E5wHyV/W0lSBey/pMcx+J5YhkZiWpUhvulvmy0m9QP46jrNoEceAU/bjWNiA+Zit8x
	 iJWS9GcnlJ1i7ow/t5uGmmuGfCAcXEOTIMFQFwBKqzT/oMZipeRvS00Jwl6GrtqvDNw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793881764;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+Z/5KAQ5PjYYNnhSmBnyX3ngFzUGpZo+Rsphcj2R2LQ=;
	b=RBBRj5ddKOf44wmKDSz7FdYpe/U2uFI/DudG+0SCL/4VreGfgTMF9OhdCPRjcPGtPsmQ
	 u61XoHRp91gXrNSY0bk29KXs5EJVMAQL7h+fm3NJYXWtWqnNA9MwqhTcxdeoS2tgFPwgW
	 cwrvZiL82HjDRcGbSgo9aXVHWxYfUY1+OtnR5MB/op5tZMp45m/PJIrqh76/OVQkZgpN3
	 I29ZA7NDjKeWGJHphpLBZ4sHU/XGJxvupAsPnxv5rM5dVucP5gE3ws4nb4p4hhdCkdLLY
	 LfuIEvTPQhPaL+hgY/n3rzX4rP3kAe5PcDWJ+bfXElw1A3u60Epl+xnDX4TbV/5vqEQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793881764;
	bh=+Z/5KAQ5PjYYNnhSmBnyX3ngFzUGpZo+Rsphcj2R2LQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=cRyKAvt5sFUWcivgsToDPA7fn+PhevhGQyafbI+mqc7ctVyvF0bOdaHVYf2jZAx/i
	 f7pC7VmfgX7OspdWOe8KZ0gP0WweXb9R0vzTzitWqLY7AdIzQNPubIJCz4Ls7hPplT
	 eIaTpBuNaBWeVUpZydCqu7D5kZDy70O+fDAJvuKnoNY2KakO9Cddp/jiwOff6pSSvS
	 dRBlLz+JkZCvmjMEFuFXxdp8z76UyGoGtL3M/pfwNzPSNjOlTQOu+Bc7vN7i5Fb1qD
	 nVSxv0LVyX3/ObUxOTAiNM3ydwpn8ni0v3yJqejgWNmR/qZeX4OnHXHKX1NHMQQdRM
	 8MiPaBKWjIEQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 458F540869;
	Thu,  5 Nov 2026 12:29:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 012AE52B
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 12:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E754A81143
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 12:29:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZRKiX1CpYglZ for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 12:29:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C41B381132
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C41B381132
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 12:29:20 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6b47c1a3c74so2328010a12.3
 for <buildroot@buildroot.org>; Thu, 05 Nov 2026 04:29:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793881758; x=1794486558;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=12vICeyC7jU/4t8+0hYRN27Dpgdo0UM82a8qi4TL1DE=;
 b=PR0J7hxkEQDRgz/lfSfiUp544DCCJ3Djx3oHEfe590aF7u1sfrFsRQn2biCiGVuuvF
 U+2VsFnf/U83cwHX/1b4tmk1BaWyykgF2UPMtnTbdfDpbFFBynOyHmkEqSaIkZa6lfi0
 Y6v3OrPpNRg1Fj7RzIF6Vd22q2Xazg+6QTEZF6Tvbd+FY/xmKzakZhSEsiFC4cRnoGE9
 24qj4qKENyOSDCdJe/OQHWllB2eA+zY0lWcvrnMqo/4YHI4V1KnD77GI2WboJYBr/im9
 NOgc84khs5/unSfsA3jVCMw5fcsN/+e5lOmPXDgX3ZAa6TLsvmrHJwt6DSfoD+roEdiQ
 B7jg==
X-Gm-Message-State: APuU4Z8HZYM3QGhYX/SN7dM2bqBf5JsKnVZO70DLDxLW6iG3DzNgPTK9
 Bg58wzvsS791zv8w1gIzjntAuh5Mv503PKAei037hAQCDtKSs1+qijNC3cKcgQ==
X-Gm-Gg: AYBFou033YxArAy+ZZkpO2LUN2LSa0BogyJUzxWcAORaWX/dW8bw3CIOzH6d491ecyG
 Tl+fs+AEC5LrlgECmrM9cYZ3VDpNFZndCcrANjCuFkwluADUKRQiRRm6oVroK3nWxPwNgb1yv+g
 mluY5TyeO5CtSx1NROycsdXcvYsMi8phqtL1Opt0/CO/J8E1v9ejqiZu3azRd/aRl/yUs3+l2Id
 hHqi4ZHoP5WAMLB8ZhrNoYpO7eVmrTWJ75vYEZRM9CUIg7LI1zBUy/tzk3NhW5oRlAy4HzPto1f
 84q5YDn5cpw0bptVlu2NKT6mAL5YsWXU3Gd90hg6jF/X49kkL4UUCKkjuwbH4HT9k098fe8bOmR
 LeEXS+T8SRnEPO52HmqziPvF8+gusUYoJzdOKPtPVGROX3QOzz+QKePGdmOv/goFEBep+ApLfiQ
 a9for/XrDb0EitYAuC9lSgidV1ra+TsUQWULVyHh+up9Kx3JLvSOCCP6AD1EhSwkq1dTdyb/2ZD
 6v3d7NELT6OFTuhMz3YX7DXhNHtsrEivpzzHAXPPPv8l8XAqXf+k1G25hQ0CcNZlBTV9fQpjMGo
 GGEXAXin9dgrrITjevwSmebS4IwK/3wWfIVeFrkHeFFESEQis72f47g5HioPxqbwK253ac2rK17
 FE5+AhBGF
X-Received: by 2002:a05:6402:681:b0:6b1:eeca:87c1 with SMTP id
 4fb4d7f45d1cf-6b4d46789a8mr11267746a12.21.1793881758288; 
 Thu, 05 Nov 2026 04:29:18 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b55ac442bcsm1804326a12.6.2026.11.05.04.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 04:29:17 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  5 Nov 2026 13:29:17 +0100
Message-Id: <20261105122917.1277295-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/json-c: bump to version 0.19
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For the changes, see:
https://github.com/json-c/json-c/blob/json-c-0.19-20260627/ChangeLog

This release also addresses CVE-2026-9146 (documentation update only)
and CVE-2026-11322 (in apps/json_parse, which Buildroot does not build
as it passes -DBUILD_APPS=OFF).

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/json-c/json-c.hash | 2 +-
 package/json-c/json-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/json-c/json-c.hash b/package/json-c/json-c.hash
index 88bb49cb9d..c63a399e2b 100644
--- a/package/json-c/json-c.hash
+++ b/package/json-c/json-c.hash
@@ -1,4 +1,4 @@
 # From https://github.com/json-c/json-c/wiki
-sha256  876ab046479166b869afc6896d288183bbc0e5843f141200c677b3e8dfb11724  json-c-0.18.tar.gz
+sha256  37ad0249902e301bd9052bf712e511fcc6acff4ecaad4b5900aad9ce564e26de  json-c-0.19.tar.gz
 # Locally calculated
 sha256  74c1e6ca5eba76b54d0ad00d4815c8315c1b3bc45ff99de61d103dc92486284c  COPYING
diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index 20fa767c23..385a11105a 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSON_C_VERSION = 0.18
+JSON_C_VERSION = 0.19
 JSON_C_SITE = https://s3.amazonaws.com/json-c_releases/releases
 JSON_C_INSTALL_STAGING = YES
 JSON_C_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
