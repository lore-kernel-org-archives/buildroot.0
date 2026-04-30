Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2C2FF8875
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 05:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 953F761B73;
	Thu, 30 Apr 2026 05:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rdCULRQB8PP5; Thu, 30 Apr 2026 05:40:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDE0861B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777527657;
	bh=boaPRJLLBsKzYrNb9GgMnl32yjDMP+UbiIo1yFXe1zc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O4tstWeRJYtP/IFPIvg6DAtTZ4oATuJYUsFmPWfuhkP9oG2hlGo7U5TtmEQG42/AF
	 x3mF29REMLMmQFVAk72WdU13jndOpg5WbudCOKu54w+zM1RkRNQtR9HH5r0fQ+u9XP
	 71XVRsGnM+7fqUUM4b59ZAbMqMG/58SePTsnZQoMLackqNh24yrvAeJCFi/d6BhSAr
	 6R+F2tJ0V/C/dsSar9lf3g5PJaVZ0c8VXbcxlDbzJ65yWt7IvtP+fqeTGtOv+vVyZq
	 ZpBTStfCYpeVJoOknoLY3iKjz5okDovvFy0Nu9S6ElDO3qtQzQCJ271n5pY1HPkP4P
	 6ILFHNS5usl7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDE0861B70;
	Thu, 30 Apr 2026 05:40:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BFDB18F
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 05:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5ADD4235F
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 05:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K3mXwjf0KdBU for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 05:40:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8C2FD4208F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C2FD4208F
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C2FD4208F
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 05:40:55 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2b788a98557so4231965ad.2
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 22:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777527654; x=1778132454;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ARcpwadYno0RUv1/55OtTPOZ7/OiXp22bEgE97rZVQc=;
 b=pb6f/N8SeZtPV8M6uVngEDpW+4kpCNzhE83fK7YNevR6j6qdP7kjmS33OBv487OzLd
 C7PlAZPKUm4ZNq2YUV0yLD/dVEwvXg3SRLHel8kxP9DfJzSx+21Uj9xlvwG5m/oUk0NO
 QwbsuWZb5LOFiFkZQXCCYxk9oNcuGk80AKlFdsu0GYzTihd+dmnyQKZOi70jiGGBNYIl
 ir0ffV+i+auXA+zZmRJTD1w8JLYz4sh6CctQyvSjtio7MJAcPElOxfapz9HO3PspX3yy
 ItPZ050dEnFSAUnJOjnZb97pQBg26vIDp9fGENM480B0DPdPt07y91oiUG9DaNp2/Aub
 PQzQ==
X-Gm-Message-State: AOJu0Ywfczzpsnh4LbAObXDQgccLIjXCwylGi5y9UrTIM+4idIAMseub
 CsyANeNiNR/1TDFkrhQqm+ldsGoCDg8n44CoNq96WvUTBXdqzhma1SULoM7ODKCu
X-Gm-Gg: AeBDieuV6gatPJY3NivOjkX6IknhSKf0VJloj8ate4nUBSf6BnYYBGpoTyCEuj6mcE1
 AoUXNUxyhVG49+gnfuv/nzVfYfSAiD0GqtUyB2Czbbdjj8IgoUcUbXVI//AskMBb3in1qhrLI53
 AA0mG23ZLTmDVQMov3+smyIfcJLO99FpqfJ/p/ZfCWzFuQljw47N5Mcw3/NQXhTKC7FVAFc5HCS
 0fPXjlRPBdnvJYz14SXiY+r4I823MJxt07RgsdECTby9VuhQc0dTENVa3ayks6uT7hm4lhO4ACR
 p0Z8roSZdugGgE0CJZ6RQa/eqLn1t/VL68SGdDgGYRESTfAluQHk8Y0DEb5jD7scb+MPmBz5aj0
 RejMx29/zPHwZb7BvOI0IHbGaOsX8Kg4sxqBUULoNEClI3t3fIaP2J4MEkjcA7zsaX1V+YVJxIc
 TPnTE6DG8/pH19VRjDwJrsZpf7qxMzLiH3rTlGVXdP5RNt
X-Received: by 2002:a17:903:1111:b0:2b4:5c20:ec7 with SMTP id
 d9443c01a7336-2b9a2877c96mr14599225ad.41.1777527653943; 
 Wed, 29 Apr 2026 22:40:53 -0700 (PDT)
Received: from fedora ([2409:40e5:1178:1c37:1cfb:6a83:ee5f:eeda])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b98893f5bcsm39532125ad.54.2026.04.29.22.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 22:40:53 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Thu, 30 Apr 2026 11:10:32 +0530
Message-ID: <20260430054033.8599-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429170808.1144652-1-chakrabortyshubham66@gmail.com>
References: <20260429170808.1144652-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777527654; x=1778132454; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ARcpwadYno0RUv1/55OtTPOZ7/OiXp22bEgE97rZVQc=;
 b=F9xj3F5t4MO2hz4NMyTyxgMxse792G2U2uAg2/bgI4dW8yMzMrO3D347AL0A0wPcqR
 AurRjNhZK84OVHIh/nfqp7KAMfU8q1lSpYsrBreks6zVbAK/QJVjK9ym2RgbHLeVFoOn
 rtG4KzojoNqs6UyoG+AkzgML2g4x7+J4bMrL3HOPKuzKorV0zrRljqWDBXpHQ7JNVmOb
 NH7wZjG22qzt4VLaTCICMO3RbQhUs/7LQK4nSxSrwyfxbngN/ahCgmdUIL0o1yXpyQQk
 8/lqVOjH+UMW3868dwKZaZEo15V9ig802OYBvRlrZcEg1ehj/sIRoICJ3F7cbuoXbQ5Q
 4YEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=F9xj3F5t
Subject: [Buildroot] [PATCH v2] package/nginx: security bump to version
 1.28.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:
- CVE-2026-27654: Buffer overflow in ngx_http_dav_module when using the
  alias directive with WebDAV COPY or MOVE requests.
- CVE-2026-27784 & CVE-2026-32647: Buffer overflows in ngx_http_mp4_module
  when processing specially crafted MP4 files.
- CVE-2026-27651: NULL pointer dereference in the mail proxy module
  during CRAM-MD5 or APOP authentication retries.
- CVE-2026-28753: DNS PTR record manipulation in auth_http or SMTP proxy.
- CVE-2026-28755: OCSP certificate check bypass in the stream module.

For a full list of changes, see:
https://nginx.org/en/CHANGES-1.28

---
v1 -> v2:
  - Bump to 1.28.3 (stable) instead of 1.29.7 (mainline) as requested
    by Marcus Hoffmann.
  - Highlight security fixes in the commit message.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/nginx/nginx.hash | 2 +-
 package/nginx/nginx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 7b79036b20..1d11937987 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  40e7a0916d121e8905ef50f2a738b675599e42b2224a582dd938603fed15788e  nginx-1.28.1.tar.gz
+sha256  2c96a946bfb0882a21744ed429770a2123ae1828c7c48665092993ddee91a918  nginx-1.28.3.tar.gz
 # License files, locally calculated
 sha256  77c01620abf36ed747b7eca4bd271e49023fe3a8e2b3525bcf4b09c8e3aa28e4  LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 41490caee2..a8b7ee7319 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.28.1
+NGINX_VERSION = 1.28.3
 NGINX_SITE = https://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
