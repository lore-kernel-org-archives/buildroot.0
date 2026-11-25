Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BA8606A31E
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 11:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cqk7thpf
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AE1F60891;
	Wed, 25 Nov 2026 11:47:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Ut28wc523lk; Wed, 25 Nov 2026 11:47:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0A7F3606F0
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795607277;
	b=n7JdcZV2NFYeva+Ow6gGRKVnOY/txREDulUlb4NKO4X1S8NL0RRUMXdRtgzGiWYe6Vmq
	 hb6fbGwU217QypWpKlHr9yE9uJmudGfJdDDuqFDEklr2RlFt6Fy+MTLhMl792XH50fv1d
	 dNvApNi7idkUHkvgbrKMch8dNVBk/yx7w6o72/waFUhN0S4Q6eXJuJky5r8RdYJ3yPuT4
	 UkizGseVEhNeAxLoKc35LQpiv0+6ACPdxwvoA55lGIh7GhBDM/CbalQIoyaPfd4LABc4r
	 Ua/W/wpKmo60pTjbYu6WnyHBecfEEb+YzcGhMYOXEJYUnvAidUsQAd5eRP+dwmUtUCA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795607277;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=H8Gjg89XBJxV4LDCwmUAswPCV+mhtU6ww2Y0qCHJNCo=;
	b=ZJmfZ8hrf3lC4UTaob7Wr88wENrd1T2OIPYVI2i+g9xaP04GEy2/SB50yMYg+sHDj+4L
	 /1Fg7SBy3VR4FXxxQJigevWY/JRx3bsq8HfeiJLI6gtCrXuB8lnaO2AZ0VXKsQPPThUDP
	 HSi3fBO/t1CjgG7EkKVQ84qojGmFQNhgLAsaFUtbJm40ITQGAdKIewa6KWTOhKE07oEq9
	 DpzZSKMqUaVp7ZcmQlFd9eJw8OGt/mAlPpkzMcyWqynmfAcJlWIlVUc6VrkZ4dF47BG1x
	 fL6UOz5+Gym0SULAlFPBO0ud8BQx8Ui74YupOypqPgejzqZdsHdnuo0GxChizZh8W3g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795607277;
	bh=H8Gjg89XBJxV4LDCwmUAswPCV+mhtU6ww2Y0qCHJNCo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cqk7thpfJbe9luwMA8Tvf8inQfVOVqoj/Lyvw2I0RIhNEsvUN/6GCh7NVd5ODCOGI
	 DC4m6wzv3U2dwQ7mLXv5esOez46sf29lSI2AH3uyFdujJw1q2wp163ZjhospvPOe6g
	 cCKIUSBO7CQ0Bp7dLRGfRUimEEJAiE6o7d5dxsv2DS61/i6LrvpphCg90/Q6BTkYfI
	 HyHSTBff1+LEBAYrtXMGjLaLai/hslVdqiTwSgeNRo9q4wy9HHM+EfJH+/n2inWHT+
	 RaOXXOMrcCe2dZytt1rrFuzj4pPb+zpEQJG0gfyKRBUFEXcVkpRS32jwzVbC6leqhU
	 Hj6HfpnpfAQ3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A7F3606F0;
	Wed, 25 Nov 2026 11:47:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FFC7325
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 11:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1575C80CBA
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 11:47:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tu8_5EC_2zP8 for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 11:47:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0597F80D34
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0597F80D34
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 11:47:53 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-c516a1623d0so554534366b.2
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 03:47:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795607272; x=1796212072;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CsmO4wJZDQxniyCb6FhaEBzms1cjFu4Nr1vMbDVIxSE=;
 b=26po3ykvQfiynVwU2reU4MrV2ZMqnl5rHHA2Lb3qyQicH/wWJ0As5Ui+Fp7nsCATIq
 KUFGycGmajOMH/CwCmaRKopTeWJOlmF3X3fw0jjFGUbjZdCuJge5rt8RvIp+KgWRgReb
 VJ9afDfz7Qc7OHRfT3b4IUWfxlV2drs3Kxvyq1qIHVO7+GObOpwFrnSHy+lALxNhBO3B
 xFUj/5SmsHADJtuf7O8sc8+Yar7/sh6FGIGLwvuGiYsHePmgRbCXVq8EOv2ZTvuS5oC9
 gTxUBndXLXoQyNzaGd+pBsWYOaH4EQRQ6N/+jmwU9b9Cne8FuT8lkDbCENp/FA7cUsHx
 Imgw==
X-Gm-Message-State: APuU4Z/z51W5CwetKIeArkGTvJRyqlIYzRh79u8rHFP5J01cjfTo2I4r
 9vK51cNueOAtb/zM19iFlfUz9mXYu4Yo+nJ0XVH/ao2WqWbEsKaHOa6OKFYgcw==
X-Gm-Gg: AZFdTZci8v/drZpLR+h+DIaeGw20ECw1ZRsXz/3GnelZ08VFSkSwpwYrAYrMcF148Um
 wx0/wSUNNM16D4a9qu2gOIeNLArjuEwIDO1oEkXUFkb9t8yZ0lzvMZ4W3yNoYctt1EuM4USuAyt
 5LnQbjUyhc5x51i52+JI0G7zVu1XfciT4Pf/pAXGMZAuy366W9/HosIIModsPqNl56Ezqdrpanb
 fFu+pILsjZUCUydsyanvELAp4RlbvFaYnnvKnXt/4/MyfTmKrDb9lg1hBwb97w6dT7bwXTRdz4Y
 sJkTPzxNTHDRCRcV2OeorHBDIODg/1kGeUcFcSa4qx6Mc8NKJY0EF3VF/E7hEx83bTucRv1LW+y
 TWNtqH5qk44HqScP8VTIcEK40wO8Ttjyfei/cvO/B8Dwsb31gejHsJLeQ7eJYm0kc7LR1oLWFKW
 KpArzWaLSU+o9WpJj5jZw0O8CWoBCzpAK31aM0nKR55yzE+i4cr4c5wtGfjX2HsNwhvFDJLHQSD
 2CevPq14kYUNmvnH6kK9l5mm2YS9hBeVPcWcHZeJwMI4cGcTgXw3xZ3JFdB2zqO4+DgM6kpcedC
 yEF1p+FbP6k+tKazfwbuU4V9hPNQIKr74z5S/wKTZDBlep+3odfPnbR1D4oKsXLlCry07w7h25X
 57iuz+2/87Ry1cZFpZk/wcktcdzqCPQ==
X-Received: by 2002:aa7:cccf:0:b0:6b7:cc0c:945e with SMTP id
 4fb4d7f45d1cf-6ba37e84fbemr10564061a12.23.1795607271688; 
 Wed, 25 Nov 2026 03:47:51 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6ba37109b55sm7826646a12.32.2026.11.25.03.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 03:47:51 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 25 Nov 2026 12:47:50 +0100
Message-Id: <20261125114750.611805-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/chawan: fix build with uClibc-ng
 without fenv.h
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The bundled QuickJS includes <fenv.h>, which uClibc-ng only provides
with UCLIBC_HAS_FENV. Buildroot enables it for hard-float targets only,
so the build fails with soft-float uClibc-ng toolchains:

  lib/quickjs/quickjs.c:33:10: fatal error: fenv.h: No such file or directory

Nothing in quickjs.c uses fenv.h, so add a patch dropping the include.

This issue has been present since commit 9ec34dc363d7 ("package/chawan:
new package"), as chawan 0.4.4 already included fenv.h in its bundled
QuickJS. It therefore affects 2026.11-rc1 and later; no maintenance
branch is affected.

Fixes:
https://autobuild.buildroot.org/results/2d0823849c690c6471249c066f20b9dc8460f25b

Fixes: 9ec34dc363d7db8d5bc460d2607b1facf2103961 ("package/chawan: new package")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...1-quickjs-drop-unused-fenv.h-include.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/chawan/0001-quickjs-drop-unused-fenv.h-include.patch

diff --git a/package/chawan/0001-quickjs-drop-unused-fenv.h-include.patch b/package/chawan/0001-quickjs-drop-unused-fenv.h-include.patch
new file mode 100644
index 0000000000..3ab16577f0
--- /dev/null
+++ b/package/chawan/0001-quickjs-drop-unused-fenv.h-include.patch
@@ -0,0 +1,32 @@
+From 26761d1edd103f05e677471d9a1f02c825d7149a Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Wed, 25 Nov 2026 12:25:29 +0100
+Subject: [PATCH] quickjs: drop unused fenv.h include
+
+Nothing in quickjs.c uses <fenv.h>, but the include breaks the build
+with C libraries that don't provide it, like uClibc-ng built without
+UCLIBC_HAS_FENV (e.g. for soft-float targets):
+
+  lib/quickjs/quickjs.c:33:10: fatal error: fenv.h: No such file or directory
+
+Upstream: N/A, upstream rejects AI-assisted patches
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ lib/quickjs/quickjs.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/lib/quickjs/quickjs.c b/lib/quickjs/quickjs.c
+index 13854e90..80e9c78f 100644
+--- a/lib/quickjs/quickjs.c
++++ b/lib/quickjs/quickjs.c
+@@ -30,7 +30,6 @@
+ #include <assert.h>
+ #include <sys/time.h>
+ #include <time.h>
+-#include <fenv.h>
+ #include <math.h>
+ #if defined(__APPLE__)
+ #include <malloc/malloc.h>
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
