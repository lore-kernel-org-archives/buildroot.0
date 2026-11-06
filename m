Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B853606A32E
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Y+JCWavP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GTTtRILm
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 610D2608DA;
	Fri,  6 Nov 2026 19:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c5fk8JsW2IIs; Fri,  6 Nov 2026 19:16:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 32D2D60A81
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992609;
	b=HIJKcERK5gnsEEIYVhBZoKdgI2w906idpMgbaTNnaBTsmdWEi1gS85O5Yh8UiSwVP6Lk
	 tjPpp1ubQnDX0sIP+s7C+6CaZ+Jk3bwQaAR37/Ve1kMcrmmWtPdJivbwfz3Sw1ES8C8O6
	 ByezUuXrbaBMMkpo0NfC7gCcAhSI7Mk+gKafIatxipSaPnJuTD5bPBprpMZTkHcEVuJsv
	 8BipzivGf6nUdsXMJ76fB4NieHtwPSsw9I80dP+TjznDrmpQik4XFfk+UR/WEkI2r9QQe
	 wqQGeMuSw6lqbJ8SVn3wqAADdakoZhJ+4ngen8A8u+WUpronhXwwthfpzSChDlxYfNw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992609;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=y1e4TtY7L1YlU+sgF0oNhi6Jf1KmZr979OyJpwdMOvU=;
	b=k2hlzN1VdoDIzBc3z0+YOCDjE2Gy6mONtW1qQMzE160dR4ombyipRoPSm+pqMroz8bEk
	 fvfxSvdsvJbdPxVQRvK3GPgMTZIACa5FT2oqtWrjzx13Gi3DzZ2D5pCvA6ZpUydlmgZRx
	 wb1PYNC77gk8IJwdpvbR4XK3q91EbQmuBCwLus6pz/mYH3wGpDtu/qKRdApKa40pcL/4I
	 2WrC0u6iesmc7nlD0kUKxSz4eTll9sB97KcKgpyb23fnXjI9iRD8H7ojkOx1Zjva0tLTh
	 m8HpIPNQyP+5QEbr/UgpN4NsEh64Xqo4rHvkAj6VrgmRrfNOSLiEr/RgfrzwcbbTuaA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992609;
	bh=y1e4TtY7L1YlU+sgF0oNhi6Jf1KmZr979OyJpwdMOvU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Y+JCWavPgGT5mLCk5VdvY7Wai70D9RJDuGKCmJSONApfpu10SvXKo8YXnewIv8vNP
	 aEb81hMWMCtRKPtsL29b/zsJ2dsIOGYkw34BDZqjdoPy1z+QG5Mw8JMBVRfn6Hn/C7
	 PoaF6LHu+pXqXAiPTT9dcceFNYRreQBjrXNKm+kM5cMRuggPxCm9nbiyjzApdGfVmB
	 9Xq/KnRsJ1s8olF90Fs6cdoqnneOH6vYUmzagSJC/vjZqPumDxYZv4SyIx3Qbq681U
	 pI+kTsnuk2jTU0Y9dk2Nsk/89d385jORcIJ/ygVfMVnJJxEOtSgRCtm6SU9VZgeCzv
	 oVo8JxduQW3uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32D2D60A81;
	Fri,  6 Nov 2026 19:16:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C31F4B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99701403FE
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HqBxDd98aQqi for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:16:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B7AA1400A2
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=GTTtRILm
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B7AA1400A2
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:41 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-844a8bf7e25so579945a34.1
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992600; x=1794597400; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=z3lSdi8QvO5G4HcPz1rsKrP9bGwBM/Da2BF40CVqyWA=;
 b=GTTtRILmkYntPC71Hyxq1uDjHScuuHQwt/H+HB5nYkz3i7EZJ2HHOLXjysDhPXISLL
 rYXmvNaLr/lK01+mpvWsIHC46Cstjhi7WfLZEGcvaGsIjnoZRdi830douuudnyb5zL32
 O7SgxTzyqTCHB0rpXQHFy4moQaAbbjw/X7dN+qUE43JYIH6JZfYdrvlxymLV4vM8zE4l
 E2mbqf+YPka9271VtIdTuUwueBXZLJCIpH2w0LTOs7RkJLAsuts3PkDvM+j0xINSUu6r
 SWKO0jn3Y9/rDE2DS5AmpdG2dxLByZad2m/9KwA0yaCfpdiGM3v5KFkNW4uiOT0cvfte
 TaBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992600; x=1794597400;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=z3lSdi8QvO5G4HcPz1rsKrP9bGwBM/Da2BF40CVqyWA=;
 b=U0SajjnbrFUzJT0gUFKBdFsW0F/hMTFX9c4irSx1MD2LlRFbDQCW7mbubUms+uRqJ6
 06s8ofibw1aRUIcrOCVNFh0KOaWiFcGlRfRoCxmts+ij5Wxmar6q7fF95kDgg5iIrGh4
 yqMcCzMVNiBMlm3OULN7cEBJMrYAdHMpgs9keXZpt/ZQ0MtREPeu26yKWYeJyRbEeyqS
 BMrRaKwvRYgW9+K3Al7dO0U4azIZjfkxOwWc9DeIrkAAoVQZmkDAYT1ePKDO9iG79BqQ
 SW66K7XO9zm9ychvhzd8cBMR9cTednDLUl5A6Aq0pr0vDcN0bS+lBnHBOPhSBuxCcE3w
 TG+Q==
X-Gm-Message-State: APuU4Z8rj5qAVMQoJbOhi5iVnd5bjX+YO5dJxfdOV95gp6SKQxVbQ/v7
 +kGAkozdN4A4yffCCflejyr1ehYmk3wQZD4gFqRp1hoF8fIIanBkHiHVskacjQ==
X-Gm-Gg: AYBFou0FqkmvUVnQALOqqUhzr6RnejJl8dMsQQXRD6VYyxME1+rn7M+9lBLYRdVyFgX
 NvYtDspE/daqDaU86JgkFkAe698lYWwhHHpoBuqJWYh+IOTAuZZanSR1psFbRRptV3ADkG/8+Mo
 +zUb3miyxpL+tVH69GE3Jlf1JZQ9y/5e4iEmVedFda7NfrDHTsOLgwkGnirV1lJM65cq7CWyQf3
 OyKe/YUwQm9goh1dBtUasq8338XNbT7SG0MrYr48O/nsjADgTkIPlbYQ8D8B7QThdrvB4MKbluo
 yEhbEwtNd1VgthhjSCyzZeBR6UftzXlZBAEPk+CgPzSRi1JWxTnXxiliTY8eXjh99cWDKv8UEJd
 hYu6cHiOwx4gwXnQ8wgUkjKDL6EpfVdqbXDHKmuO9OxDZQmdqPUhlcd4mCf1NzK0NCzsTgTURbA
 tIkJAZUbqDyhj6CNlLPkYNrxMqMP6/YbNr7veNugHmIKXJFPRstumm/z3q4ZIjOn+C8E9vIokAi
 lIaTGw0gd89RSy46urbQ01Iv15yt42OOa5GJx4/uWZCGd3wld7mgjxDkiKMxfx7J7W90XWedw0B
 zdINuUwitCdCb2Lhng6jU+E95sSbo/Pmdo4aVVOF4Y4ebSOq/Cvkqv7C0W5SL0ReSJVjKaZsJHa
 gB9w1+8DVP1m2YMY/DKlPGIBuLj/vFttSfsq2GJ7dkkree/+RwQBuLrfT2d7vBFcaDoYfX6GV4m
 ygH+P1Z6b/2/0uY6z0ae1BQbtw3jc6tYhJkqqAdLXuNhRNipnXcOl4ta86RqY0OLSueSNMTgEvz
 g==
X-Received: by 2002:a05:6830:3110:b0:85e:f659:3a7 with SMTP id
 46e09a7af769-85f1d0de664mr4131815a34.24.1793992600424; 
 Fri, 06 Nov 2026 11:16:40 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:16:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:15:00 -0700
Message-ID: <20261106191536.2120153-34-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-watchdog: bump to version 7.1.0
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-watchdog/python-watchdog.hash | 4 ++--
 package/python-watchdog/python-watchdog.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-watchdog/python-watchdog.hash b/package/python-watchdog/python-watchdog.hash
index 8026ead945..e40ec46caf 100644
--- a/package/python-watchdog/python-watchdog.hash
+++ b/package/python-watchdog/python-watchdog.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/watchdog/json
-md5  f557f9f886650d23ee3e5ba12ad54ad9  watchdog-7.0.0.tar.gz
-sha256  128583e0ffa0e5c0531f9f37e2e24be1e7b0503561f6aa8b0aac5a1d646e2bf2  watchdog-7.0.0.tar.gz
+md5  e58c49ff618f1c9f93c760a8fad879be  watchdog-7.1.0.tar.gz
+sha256  d3861e255416f49a1384474cb2efa097de165fb330d4c5432ce6708b509ed922  watchdog-7.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8dfd87df299f156db7dd6387dd025f914568419b10db3e074d224e67d7621d2d  COPYING
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-watchdog/python-watchdog.mk b/package/python-watchdog/python-watchdog.mk
index 72d38e597f..7af9f36341 100644
--- a/package/python-watchdog/python-watchdog.mk
+++ b/package/python-watchdog/python-watchdog.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WATCHDOG_VERSION = 7.0.0
+PYTHON_WATCHDOG_VERSION = 7.1.0
 PYTHON_WATCHDOG_SOURCE = watchdog-$(PYTHON_WATCHDOG_VERSION).tar.gz
-PYTHON_WATCHDOG_SITE = https://files.pythonhosted.org/packages/92/68/6477c65315fd5b58ea5c7fbfe871c3ca6e5ec951be6c48c2f5fe8ee5e34d
+PYTHON_WATCHDOG_SITE = https://files.pythonhosted.org/packages/e2/55/087e45c2a3ed8223bc9f30d6b65f051de35513cfc30c989c2b1a14bf862e
 PYTHON_WATCHDOG_SETUP_TYPE = setuptools
 PYTHON_WATCHDOG_LICENSE = Apache-2.0
 PYTHON_WATCHDOG_LICENSE_FILES = LICENSE COPYING
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
