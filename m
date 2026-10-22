Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DE6606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 22:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=couW/a2b;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=Uj1E+Io0
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0DB6811C5;
	Thu, 22 Oct 2026 22:27:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FurP1AQg44cr; Thu, 22 Oct 2026 22:27:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BCFB281287
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792708078;
	b=KjgC8QsPQT6ywAYM5HYOJivdNF0FSF93s52iwqYbJ63vdahO5mZXjGavNBaVgIJSt4G0
	 HMthGmXzIK3FX/Y90l9JiSeW4meMAGw/sDt9V9qdUEm/PTosBqVLOTJpAaucCY6eBZgfB
	 UfAYBAgqpi0tBOL3foCTgjoR2JF9exxlWPykNvvTY+xCQtlE0MxIY8guvShkhXN5izBTj
	 ak9OhHtiEefQo6Id4+90HlkTQ+d3fRkajAAQ3a3GfGcMWPQYujmQLyQ/ovbylMf3Ri0hW
	 amAZ82rbBLXtUCgFZHshA6xMYf82dxvNZUmw+m76/CF6LktqYV39Edg8rgtM6DC/bUg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792708078;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=COvHb/v/ClzhSe5lFnNQNQU+LB/9fuWZLT9uc5TEE8M=;
	b=KQL5Auae6MU5i0TsiwyMfHNO3RkDjxOV3bDvSdQJfF3B+esNvYRamDMveqEJ7b9wacf+
	 mcRbcnDNwfoWbR1l3dOS/YYxiEy1iLEXSJ3pC0xXyyjL4x2yXLbzRCoM+IIRFQqMtevvT
	 O2e4CeYTCso7ROL0h8ahc/kN/7NSLfaHAEUXyMM3fHS/s0MK+BvOR6fuOnHM85mYHHZ+6
	 hkh9Pjv3U1tptVggigr2k9YaTKyVDCAx6SSy1qFbnGJ2JEx1GqwxpqbTbafKUF0MpQqrC
	 qrpPDE1bXPIi/152RvQogbR380V+Tm1Q69sssRbEX2Msw6qWbBcBu7jG6PlTg+bFKqw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792708078;
	bh=COvHb/v/ClzhSe5lFnNQNQU+LB/9fuWZLT9uc5TEE8M=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=couW/a2bOppcmMvcxU6QtRS3242kXqaqMUOkPiHzWcf/1DuutXAFV+G/qqT+iWVI9
	 uFht/SAbP/ygqLE6Lj84tfSf2zP0X9n7yMeM9PpU23CiGrkohvnKhx/SsQw/pkKo+9
	 u/sddBPk6xwobozUzs4W2vtP1fj8AZiFINdj3OZOhfW0VwwQq6195hl97i78j53sP4
	 KR3LoJGB8YbnbDFl7ATDrlZKKM64WwjdDlXaoqiIpo8z4pLG87bMfLeSAR55VzFSiQ
	 RXLMu6Eq/k0PhUw8E4CUwwbrbx4Bx3TBSAmu2xB1wc6sy11Z3f6lAVos8viCT8oJpP
	 z2sZ4hOP6q2tQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCFB281287;
	Thu, 22 Oct 2026 22:27:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A0B2F3C1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 22:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8692D608AB
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 22:27:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tSTaQ8yYwDxG for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 22:27:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7577E60883
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::530"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792708076;
 b=qdPjay1o59dhV2GLr+as+lS/SU8FMQzm23DPJYbRfoAHsDtZADI9OZ9CMBhPKeRAAHQS
 K8fpxtDobpnEh+Pmfh/kgvc3zgcp+Mq9xYmCteTZuS5yE17k1wXpi0/xPHlqKSqZ0km3a
 XIyTyYQ4ksp1TwMcnoEMfICHQ6k6yd56o95xw7h45CH1UUPydhw5unRKFcdfqWTd8OMH0
 aXkO9juncovvcLERQ6E0bv6KsivSGrM2t3UXDcyeKcOOeR3iyROX8INU6xNWSUc5hiasq
 wEqN0oQ1e3NfU7pMi+7EeCF+r1jBd7g1E81smEX2Cs9B+AgbJGbTb6VSuR5jxxCG8Iw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792708076;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=JUBcxF10fb/lNrvrY3wZ5+9vzC0XHqRQhCrkeRhW6pI=;
 b=bTvssTYtY05/bYDw+alwjZQ7LTdUOz4orpWk0MwZZprGoeEiaOk7K1lN3fynJM4rcOFc
 6EocB2HMbMPM9s6ytqKd28kZdOkWzNVq+7pnviRT8Gahqsvo6zNYaU5K8uJHIXCIyZF5u
 tdc3W6EqOx2f7P9/2bAshoPozX+vtpNoxhunsT6+3DHG5Wk5lVyMF522lC2w1d7PjfrFO
 3mfpI2814Fdme9e/ur8TuthCyUbfkN7w65jrS0MYY1tulocO7sRpODxvXcfLkbqxTIdVq
 cui2C/71ZCbhfXMlT7EHhm97TlrK/rcJztAF1BjeIHwKP2i47FhPrZzTk+ka992XMjQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=Uj1E+Io0; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::530"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Uj1E+Io0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7577E60883
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 22:27:55 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6a642495d81so316369a12.2
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1792708074; x=1793312874; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=JUBcxF10fb/lNrvrY3wZ5+9vzC0XHqRQhCrkeRhW6pI=;
 b=Uj1E+Io0U7BsFfhisVo8OS7gc3y7cDrgeD/rJ1Jby4+QDD7dtJlJmn4BOHT9WbH5+t
 8p7/8G+7V9ltuh+k0nmeiZBpPA5MyRab5Y0N1jjCYGQdzjiWLrlNDRgdl60UnqYnsbB4
 njRDDnmtWpApzVXvqzEcM5ccFyHIoTGpJQzJtNdx7b27QXORB1goAAHc87au9c2n01Ut
 g2FPadZnsEO6XBlqRV+g0Uwtp4zvM6BQfveCNlmHTl/jkZEwB6ajHzRlBRlqtNhsslVS
 f9GqaHfhXWOFcyKCQKv4Y17eWO4tjjvubYE+kxeAFNP/4PLBMBAqdvzSLqtB+ZtC+FFn
 BpSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792708074; x=1793312874;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JUBcxF10fb/lNrvrY3wZ5+9vzC0XHqRQhCrkeRhW6pI=;
 b=pTtZrb1imHT9mEB+ZXqHwTPQ+9iFmoH/dv1eUJ8BSOsfTTJrUn4OIOkcgnFzScQkhl
 TSUd+++N3bMBEOJksPa0utwcxma5XbtyaH1Ms5vprFwHRfbHsAyJIcJ9OvKrZj8gIo8z
 MhAdUSrI9JUaUya38dJDYR9x4V9qd18IGmhgmLoF8AxHY/cGHkpplaUwbTXgf7LiPx3U
 jPxKnTXiQ1IgrDWHsqIEw/DWnb7GPiY1tQabkedbGE0qCWHlfWj2l/jVIg4xd4Ea+pfr
 ZyOuVvhxKz1ZBiXIValX3Ixt2MPTBqby5kVL8up6vDFDJFs2nxbJj1rLmAAcGqeCiO0o
 +88Q==
X-Gm-Message-State: AFq9FYLMY1fqNya/YE9XE0nvYoahTkAkcHiMKkRt7zaLi2nel4UFph+5
 uVUc+lx4ougDgy3sbIHiH5Ri5V/7ZqW6bTUJt5vOTwE4xF2m74CSDl5+qIZW/Q==
X-Gm-Gg: AYBFou0KcFpOAvAidEbiTbo4aBeYYF1wLGXSoxVKKHhBijQ28GWnejU/Yb05bL7wXKf
 ab/h+CX9GTLTO0vsGkIIjP7pdI0aIkPYMGYJupTLHJpFbCauzErADmuS74A5t9s0Ixq02LIsGcP
 PUEvziUoaiu3W/XtRMPtCOQe9juB0NaWdNC9tu4lIgmfgVbJITP78hjTfu/CM2lCgkkV/eVcn1x
 mSNlwqD7knm0rqweud4Q4vm1/kmHJWJDfsskt5vTFMN0f5Yo35moNs22MGloDmkn+PNEgbltsJM
 kPEqnxZ3DGEM6z8fZEDD00pxUwPLVJnDzMSBXKSSBQjcqNBXLs9aVyI14xdOMcGh9auKTLZ/Gs8
 9oOu7xT0AJjr/Mv21tA8G5Oy6h8dKaPP+DyilQA/eDD8JmNGllGpEWN/Aqwy54xgHNRTXYq13rP
 xIWU9exB2mC+S0p/MvfwLf0cRQlhtOa2QEuEZ0lUKPWCe8mANydP3cafIyfwomvBk+Wi0K258V9
 5IedVObuAwdpP1NvrLNX/mRuCUI/vcIV5d/r1AWF2YZI6Hz4nYADzGyRQONH9pLGdN8t5LcRztz
 5+dmtbLhHR0/AS9AmwSwHU8kKxcDGmHQ2Zs=
X-Received: by 2002:aa7:c618:0:b0:6b4:203:a1a1 with SMTP id
 4fb4d7f45d1cf-6b432bc564cmr978070a12.25.1792708073661; 
 Thu, 22 Oct 2026 15:27:53 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b432cc929bsm314515a12.26.2026.10.22.15.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 15:27:53 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 00:27:51 +0200
Message-Id: <20261022222752.3530250-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/iozone: fix parallel build of the
 linux-noaio target
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With uClibc, iozone is built with the linux-noaio target, which lists
libbif.o as a prerequisite although libbif.o is built by the
iozone_linux-noaio.o rule. With a parallel build, make also builds
libbif.o with its built-in rule, without -DHAVE_ANSIC_C, so the K&R
code path is used, which fails with GCC >= 15 (C23):

  libbif.c:191:1: error: number of arguments doesn't match prototype
  libbif.c:170:1: error: prototype declaration
  libbif.c:193:9: error: too many arguments to function 'do_eof'; expected 0, have 1

Commit d7233ae04854 ("package/iozone: Fix parallel build problem")
fixed the same issue for the linux targets only. Add a patch doing the
same for the linux-noaio and linux-noth targets, which were added by
0001-Add-new-targets-for-iozone.patch.

This issue has been present since commit 75891397abe6 ("package/gcc:
add support for GCC 15.x"); before GCC 15, libbif.c built with the
wrong flags but didn't fail. It therefore affects 2025.08 and later,
i.e. 2025.11.x, 2026.02.x, 2026.05.x and 2026.08.x when GCC 15 is used.

Fixes: 75891397abe60dbe3d82a1ec39654ff81d1b1406 ("package/gcc: add support for GCC 15.x")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...from-linux-noaio-and-linux-noth-deps.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/iozone/0005-remove-libbif.o-from-linux-noaio-and-linux-noth-deps.patch

diff --git a/package/iozone/0005-remove-libbif.o-from-linux-noaio-and-linux-noth-deps.patch b/package/iozone/0005-remove-libbif.o-from-linux-noaio-and-linux-noth-deps.patch
new file mode 100644
index 0000000000..0c4987d4df
--- /dev/null
+++ b/package/iozone/0005-remove-libbif.o-from-linux-noaio-and-linux-noth-deps.patch
@@ -0,0 +1,48 @@
+From 3bfbc2fe58400d32aabbceaa19a4348981931d9d Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Thu, 22 Oct 2026 22:59:56 +0200
+Subject: [PATCH] remove libbif.o from linux-noaio and linux-noth deps
+
+libbif.o is built by the iozone_linux-noaio.o and iozone_linux-noth.o
+rules, with -DHAVE_ANSIC_C. Listing it as a prerequisite of the
+linux-noaio and linux-noth targets lets make build it in parallel with
+its built-in rule, without -DHAVE_ANSIC_C, so the K&R code path is
+used, which fails with GCC >= 15 (C23):
+
+libbif.c:191:1: error: number of arguments doesn't match prototype
+libbif.c:193:9: error: too many arguments to function 'do_eof'; expected 0, have 1
+
+Do the same as the previous patch did for the linux targets.
+
+Upstream: N/A, linux-noaio and linux-noth are Buildroot-specific targets
+Assisted-by: Claude:claude-opus-5-5
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ src/current/makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/current/makefile b/src/current/makefile
+index ba5759f..168fe93 100755
+--- a/src/current/makefile
++++ b/src/current/makefile
+@@ -180,7 +180,7 @@ linux:	iozone_linux.o fileop_linux.o pit_server.o
+ #
+ # GNU 'C' compiler Linux build with threads, largefiles
+ #
+-linux-noaio: iozone_linux-noaio.o libbif.o fileop_linux.o pit_server.o
++linux-noaio: iozone_linux-noaio.o fileop_linux.o pit_server.o
+ 	$(CC)  $(CFLAGS) $(LDFLAGS) iozone_linux-noaio.o libbif.o \
+ 		-lpthread -lrt -o iozone
+ 	$(CC)  $(CFLAGS) -Dlinux fileop_linux.o -o fileop
+@@ -189,7 +189,7 @@ linux-noaio: iozone_linux-noaio.o libbif.o fileop_linux.o pit_server.o
+ #
+ # GNU 'C' compiler Linux build with largefiles
+ #
+-linux-noth: iozone_linux-noth.o libbif.o fileop_linux.o pit_server.o
++linux-noth: iozone_linux-noth.o fileop_linux.o pit_server.o
+ 	$(CC)  $(CFLAGS) $(LDFLAGS) iozone_linux-noth.o libbif.o \
+ 		-lrt -o iozone
+ 	$(CC)  $(CFLAGS) -Dlinux fileop_linux.o -o fileop
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
