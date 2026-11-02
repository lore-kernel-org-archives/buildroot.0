Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BD5606A324
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 18:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nz1x8pU+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Krgv4Eas
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4962A405A9;
	Mon,  2 Nov 2026 18:13:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AEnsFaBEBXJ0; Mon,  2 Nov 2026 18:13:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 350A44062C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793643233;
	b=MgQcXpjvaecoaS/BYtpstNXK2lzDvnPdjaZlwixSc2yrVuC8Eyj1VkqJRE6bSKnAH9yH
	 N/xjAZ6so1dhhaN9KSr5a8NImFX01foiLof3rcpgYjveoUqI3FmdK9OXQs+LjuWDTxqsu
	 n+ZMhGhn4xYqD6+CiHLg4JFnX9uIDQD6P/bsjGl+iMrDyJTW4wk81bfYNN/QXFeEehf4L
	 DuZxKrG5VG1kPq9lkmk+fXiMvpYLPcLGovv8rlS1sQyj3Ve7Xpn6a+EBBNwk7JD0Yqmbm
	 2RW3VH7GNNX4j3sJBDTeo5e8pZe1vF2DmBfAH05ZNXRIuYv5JjiAbfC3ofLhOmnDFDQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793643233;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=is8fgf3oivZ6We3atFoTWjHz5EJzejjDrLlIloKs/AQ=;
	b=QNTiVA25xfcc6/DT1INZBu7Aqz2Tjvc/bt4JNwidn93fte1NfVpS2N3zKlpk/wMEQjQI
	 nAJEYydN3J8INilF+s/VHXVilaaVxaOhOSdSlcOse1KLR8Fz4IZTb8ZIJYItvyZbQpWeX
	 dKSvDEkEITdqRE7xskNHlHl1OLcQ+MIARG+7OhqiDW6/XG8kWM9ph5gKUd+bIK8MoT3bW
	 MtpSbBXMishYdtUHReRFIctausLKr66fRkDpMGJQIKptLFfG0uYZ4A8DdrTAOspSYpL8T
	 bmoGJkaN0oM+6Ju8ATqP0bfyg9FyL3VMK/Q8PwyiCcvUFE6LU4xUHgIRmoa8l8gEqDg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793643233;
	bh=is8fgf3oivZ6We3atFoTWjHz5EJzejjDrLlIloKs/AQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=nz1x8pU+agExxjzv4euAYnGfwYPdaK7Un8URZN4ovQiQjNtWQttJfwdm0hb3VLc8Y
	 hUfwJAcfykuMCS/07himIPfPbYC6DSLyJh+NlBlZMeGtacohKpqFFc3xr4T56+s6Vz
	 BLXadWvPNX3EM/zQtW12XOFOkX3Lu0LOgCvM6jb0pojdNe9h3175JHZDFEZbfHYVqP
	 lYkY/691uloKJbVmgBkni3M+LBo5MYrlR+wqocPiPVGXYdllnyauRxfWHEev/PKL7N
	 FiuTrVcbw+ujcoQSeqOPEKHPMyBfT+Yv4GaSr1FjvfccAJD5F+eEJ2QgAN/Pekw5g1
	 I3ihHpKUNLC9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 350A44062C;
	Mon,  2 Nov 2026 18:13:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FF644BC
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 18:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F271B4007E
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 18:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jyI7Y-Eot_4h for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 18:13:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0B0AE400C8
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793643230;
 b=LdSnfgrcMFcWA07MZ6hL1NNEzLYgCzaLyRJpnELGjsMgHnl7LUGrZCL+dlWJy0lWsySG
 r+Dtbwm67NkB6oI/9f/3QXWcEoL89yfWlupTwcKmsL13zaNmliBuNc4eo4p6memnod2I9
 TAZs9RIhEmHK7wjr6KXFiMshlXliy8L+qQk2UvOyfVWHUuWYzAvriU7S8e7h6tBf6asb0
 gY4MVe4JqMj4zJBzK4dsd2xOdI5ZlYsjhorq3x9rZOVrQ5lAU01ov7BOfwvArzGgNzQ3f
 ej14UNsB6aMj+dlUjhjBqu19d1Nf6Sy177lxZFvZy6/Toju3GC+jkg8IKYA9N0MnTwQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793643230;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=7mCuthYb/3YpMLPU2cQVHzlohZJ/nw0i/zFPmrEYpdE=;
 b=Io+Wl1e5kAq7/+oHdUojm2RIUWYi4Dpy7jY4Y6qaIEFpn8todhhkVArcz7ll823Xsj/0
 jc09+u/fpnL0MqPM20n135EUZHebtEQ/lYvK+eBO51IIvMh29a8lLtqbTnvysnFVB6Y3y
 KZHU+QPP4V1VdKROy1X2lW7gQyWxI+QN6N4Vfj2ohnOXQ15UapJDydZ/rowRQ1FoU2oiJ
 toHY9/OJczlnVF9m4j8qPqNb6ZuFXy8EU3u4Ts7FIRwvB77Ovpo4aI7yV/iocni05met9
 icmjyQ+WBoPcMfvDhzA/Ii/r7jNG5V9XwlbIPRoQ7ZRYSry8lXnD7AKbz6TPUtMI09w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=Krgv4Eas; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22e; helo=mail-oi1-x22e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=Krgv4Eas
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B0AE400C8
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 18:13:49 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-539a57a0b1fso1112744b6e.2
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 10:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793643228; x=1794248028; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=7mCuthYb/3YpMLPU2cQVHzlohZJ/nw0i/zFPmrEYpdE=;
 b=Krgv4EasjLKEo53+ovgsHCqL+14PPe+vBfC31IkOdl8rpGfJRpNjse8OkWxidIhf/v
 2tCPrNxZ91bCoquYIPI0vliqipzUCCDw8fTdwQMb0fRzelZgSj/kD080teYjEwEK0w3C
 bmc65swIacWpPKjHM4YLIMjMWzgAkHmh8F9thdxRufmhFDkw8sX9kny7Wu0/Bl3/Umkg
 M/73rlMnifvGYv8CcWpaUltGJCnSpypczXiGjQykgJLhOnxC2b17dHY7pF4bHuK4FA3O
 0fAfWDYX4W76dtalHexCq0ixEB8MSKiVmSzo38E99b67ZmJz5lEPQY6WYxExLP2gVo9o
 +EwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793643228; x=1794248028;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7mCuthYb/3YpMLPU2cQVHzlohZJ/nw0i/zFPmrEYpdE=;
 b=Etn7z66vHEvPuS2QvzTVLZBav8nEq3uVYk6CG3AZ8eUqhqEY0r++JpkmuR0/ke07vs
 GgKzjkc+JFnvi2AoLRaUc6T9vhziNMn5IryQyUTmjn1k6mk3yoJ7iYSGe7+ogRoWr1CA
 4jp1R51/sJ7ZCp4tAldSBr8OwxLlsp+Xj44t5mnoLrCUw8vOuw8NB1y9nWG64pSz68CQ
 sVUDSqAqNYLtZkaJs3C0tq5b08fkDNi8Pu8d7fIpxWBKhmWOYgKZwSrJreohqwEaUbOV
 uNTwXLMroiNjJM93Is+exE+slEqEOsFo8pHV1uIqLbsU6UQ1Cf2vDSKHO8x/hYPqhNo2
 27eg==
X-Gm-Message-State: AFq9FYImzia68u0bX/O9xv1rMP7M3tPQFHqjpwy7ye0BB3weU/2hTT3F
 HmCQg7xMkJ4jIfMg31gX7sRPWkN+aq23n9tr8dF0xOLHiEsjo+rHVpRcv1xJMQ==
X-Gm-Gg: AYBFou3zQQZAW93jtCzO+uIW/fiELdLh899j4H21nSpu6R+O7MLDj5du3baqM/DXmae
 BV7/5JHzJq4ng7TIO23PBh/cwRbmuyB1y0JiOlJdxO2q02Y4yo1uMmhkfX2a3DW99upjQnwv2oT
 XZjCbXCGZZzcCRSZSct6MbunBu43rbONq9zAc61Jj3wVwLAI23BORL08/1KfH/2zWCU1MsvbusJ
 77VidH7T4cmoy/9KQMyuFF6nn03qQw/xzxzMMgkRAgTGhSRCA/9SEsWEWsEXjj1ym7XfZ7C27m/
 AplV+DFrTRHbVP+AT/cKkdewZTRm2pQoRR6PG+qFbTRVh9cCNtLaV5rvxJxJvXIG3tgHeZjzV/a
 V6DZKFLLBupRkChqqatal9TwqBXDEaTSy4JRnuqLdS5ZgMLOu7/5yuuVKkTmOLJFpbWk5sHPd56
 5rwDp4qEs1NDaoV9VCM8xpeQbBizRpzbmhOBKyYPrOgXOPRjgbSz1omsnqwrwfCgkY14fC+wgPs
 9rFf4ukA+Jd9Gkhlo9TT89cwEOeBKySWOK+UHabIxVOfbpq4BAbcGvdbhpI3KvMohzIY3wI7iCb
 z4P8h7GqAxfx/9Z46B+Hb8Ko/M7mmWzjey5WFOsHBBefweRGJkRiovd6B3u/Z68ndfIOBzS38Mh
 vgUSbsGfWA0tY5u+YII6EkkQUQnDFk+yPARb0W3pIXx+KoAN++yFupHl1Qs+eBcvXrjLUAMYf0Q
 YTWm4vPh0v4wf8CZ8lunpnOkAy96y67c7msb1daAuWRlSUaAgcVZR66qubFvkCKgIE6X/0poxcQ
 w==
X-Received: by 2002:a05:6808:1a0d:b0:503:aaf8:ef12 with SMTP id
 5614622812f47-5640ddc34e8mr7184976b6e.34.1793643228454; 
 Mon, 02 Nov 2026 10:13:48 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-5640fd95562sm8445016b6e.4.2026.11.02.10.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 10:13:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 Nov 2026 11:13:33 -0700
Message-ID: <20261102181345.3238554-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-cbor2: security bump to version
 6.2.0.post2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fix shared references bypassing the decoder's nesting limit, which can
crash the interpreter when deeply nested objects are hashed:
https://github.com/agronholm/cbor2/commit/c2c8062eb28d6c4a884f6a4ba9418ac9d1476ab2

Also add the strict_hashable_types decoding option to mitigate denial of
service through hash-colliding map keys and set elements:
https://github.com/agronholm/cbor2/security/advisories/GHSA-p6xp-9h6j-r278

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cbor2/python-cbor2.hash | 2 +-
 package/python-cbor2/python-cbor2.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-cbor2/python-cbor2.hash b/package/python-cbor2/python-cbor2.hash
index 4ec5434b49..963b44b6f1 100644
--- a/package/python-cbor2/python-cbor2.hash
+++ b/package/python-cbor2/python-cbor2.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  c0be697accd3e106feb9a082f52b6c6e2b83428148ab78ce6732a76c380233f8  python-cbor2-6.1.5-cargo6.tar.gz
+sha256  7b1ae9426ff8a39baa881e9eb54211568f24aa205c861d8ba7e5e93c0c058047  python-cbor2-6.2.0.post2-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  a6afd126d8f545a15166a22f25fadff4b9fb4978bbdd17e97d97d950b66d2fef  LICENSE.txt
diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index b35fba187a..845c062e15 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CBOR2_VERSION = 6.1.5
+PYTHON_CBOR2_VERSION = 6.2.0.post2
 PYTHON_CBOR2_SOURCE_PYPI = cbor2-$(PYTHON_CBOR2_VERSION).tar.gz
-PYTHON_CBOR2_SITE_PYPI = https://files.pythonhosted.org/packages/39/34/d443914ea562a985ccb357682e17b7190d5d58eff797c741379be47a8f31
+PYTHON_CBOR2_SITE_PYPI = https://files.pythonhosted.org/packages/cd/eb/e2ef5f241f15131babf4854032953b97c88b2c2700d7712a0ba8f57cbe81
 PYTHON_CBOR2_SITE = $(PYTHON_CBOR2_SITE_PYPI)/$(PYTHON_CBOR2_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_CBOR2_SETUP_TYPE = setuptools-rust
 PYTHON_CBOR2_CARGO_MANIFEST_PATH = rust/Cargo.toml
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
