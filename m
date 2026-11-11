Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BDA606A321
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 14:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pts7DgaT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s3uyjAMI
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 930C860893;
	Wed, 11 Nov 2026 14:07:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1_gPQZe8YAiY; Wed, 11 Nov 2026 14:07:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 98AF6607CD
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794406067;
	b=N8HVZxXF085zxpl6p8P+cx9/CkEwsZYe5kJfUCIAq4L3q1CZAk4cYH9iOUH77M7pokHA
	 PC5pzJAWhADozTSjC//+4vdb4hm3/oJPsmHMtIRwPGQUBMgl4dcuOhSrGrh04pNxCKkCb
	 IVuRiRs8RvA0SUAldT6s3pEdVuIbJWXFRExF6CkZRgT+k3XJJh/z7SNrgE2SaM2m3kLRV
	 zzNysTQzoYj7pntHVhg85TVmex47SuwPpUHaQlXfJe5v88vSwV8aWerrTMX+fKo7Z5YZc
	 OJJ10XRrX4MW/Tml6GvU/8Ufj2BzslX4vgIufeCMqJtplEEQqKbQDGmtLwK+0tRmjqQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794406067;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=UNIakU/jGwpTVk085m38k43JYHTxzvs8PdJE/hLWXH0=;
	b=NKMZn7kAwNZ+euCDOCZtFoYJqfkeqr1pHgn2mDcLvO3+49qW5psdkIe84UitlBKW/09Z
	 FDXJl5iZ3t8GfeiIEi4t4A0fan7WINOYBjRg0RbWmGdOSdpdH2b3GN/DtYMC1+DiVbHc5
	 Sw5G1vZrLLjyDbY257tyJ03hjs44xHcwGTgpJKiXk4flf9B6zn7Eol80lVJsS9hn3gCnW
	 wTpUk/q6DAcCuiEFBc2zNwC073BMwnsrocQKxptaMGX9OJUnNwvNieo++M+e766kotPKm
	 PHG7jZ51cnafm2KBoIOn1qdfhXqt3aWm6Vme9NOqbjc9nBmqAxH4dmBrqCTdJTmZhow==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794406067;
	bh=UNIakU/jGwpTVk085m38k43JYHTxzvs8PdJE/hLWXH0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pts7DgaTlGE5GIY8im+Fh6PsgYgmYncLFrRAYBaYDG38+VA7tgYcdJIQSAWEPSEWf
	 wfNiLdoO2mZRGsGv2oJ2isHtNYnnGBd8OTKPqmFxpFe0q05jDVRHn8034LH0AbWTG8
	 czeiSpcSp916cIF/ZbHHEkJwFYmEeyimhzU5YItukReYWI4iwAKbFGCLzC3TlC0K9H
	 GUaFArJkmKIBdm16zXt1ZgG9DyAW5aWeuKMzNb+dKJEJ+MBQF3wKQiWxGYFMfC941Y
	 Vjkg0Cp0CxfY9esU8B2bSW8i3QHpMV+rrt/BZKr2whhuQ4Tp6ntCITc9GHEj2L2rvF
	 0Sd86EMubelaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98AF6607CD;
	Wed, 11 Nov 2026 14:07:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 76CBE2FE
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 14:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68855403A8
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 14:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0woiLTxR8jyS for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 14:07:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4B82D40060
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=s3uyjAMI
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B82D40060
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 14:07:44 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a35a60499eso24809665e9.0
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 06:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794406063; x=1795010863; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=wsHeSAXxTCGl+PiqwzfXMlHif+CPgtSdVsSa3VXnlnE=;
 b=s3uyjAMIIrv9Ltt6HPE68Gq32vZuKCWH2U79Nhhtal8xkps2acP2KsaeKaEJawvNZs
 eJxoE+tftzT/8vObc8m/+br+T5BSYlIQ81e1NprQSD8Uxbe8s6LmDRdeMwdQLhCAkFwV
 mV+4PJVOP30fvBtpmyqW0LoMeldDa7KDDXEUUatVUE1ZWIpJs3MGe8KhDvs8s1nEP4cL
 Nqj+34sRWdtZjQuV/hKCBYWqajGGGO0aNmPbUX521EVvlFIVMB3czFAO1wzkDD5dsZTA
 9YYjzsg3q9mvJU3ppaU4Qzcz+zghyHp53jxgO6iFPSIp3+3HBBbGb7QGdddtPFtAvwQk
 /9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794406063; x=1795010863;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wsHeSAXxTCGl+PiqwzfXMlHif+CPgtSdVsSa3VXnlnE=;
 b=XC2KhEX5JDX7PZ9GMZjI5XZWd58JSHRWv+8lfcHrYCWIPVUDuIcsGbzsb3rCAwAj3X
 8vnREg1o8h4aJAgEDMTTSlOUArcs1SSqf0QlhBfVGvLvRaAbkTFtrJip5iy0QZssz4WQ
 yHeFtt19ihW9gfRpfE/292jVpcYMfvJ1yL9B8ZYS6UjY228c1LgjHJGJ+MILJZkGFEbb
 pqJACXxE6C9TiaWsINkRc2/h79ctmz2ivBPLVQ77b7QQ+S3uvj1AJPQQtQN4Muc9m6ix
 8rK4qLM5J6YShFUpwndeZP33iAzjauu4jeAYkm4XXUb3uLMDy5xGOngwQ/hEyhweelgJ
 myCA==
X-Gm-Message-State: APuU4Z/zB5DZC/9KXPbmG7O/e+vlV7z5ZOvJ4LcytoPWJGLTUa8WvshY
 GcKlKswHEUnNyrfWhKvNoEjA8aP+vpAJey9iZQlo0VeWwBj7C/qi79FAtluI
X-Gm-Gg: AYBFou0zdLVIeHEXHRvkrlL7YD5dTK/+rNHgiIwTKE2ZZ0UYb6cWIYHbjYAGEa1tB3s
 DuF8ot9W6Jxn7KAoi/0GsYBaMxeRVY8ynUI6fssxpuqXIYY3gBtjfyWsOKbd9XZBUT169G3yHIu
 rGvScffDgx8HpfKU3MbPm3U6p2i8pyu1WQZYZ4L+nLHMWYXe0DTEN3mPXcXaYUgDUb7ihIhvxg8
 tDOp7+2wK6QQDjRDr6FbXMf90IMhqhEAtXZ1Xz1PrSbTN+vwogG7o7kwJvzu6S+3MUGD+cnf+0f
 SYkVp8jo3exOm7kiiIcfBjcc+/92AYdYnwoQ0xmy5Iw1T9Ks32dD3r88moiAhNXvTbzwlBBETUo
 bRXFy+qdPQT/+/ejk/4mL40G+UAx7s6hRtcEum4Hzg9zCIK1Pag35WS/UYbnK/XPACyWNJABfur
 IjnC0rbBWnHcpNjwmhGW4p0DDikczfgw0+WJUFy+WXiyi01zGYMXvKnSeGF89+EdujNT6g2AEqc
 HW8QUYX4CEyDM7w8OdokDfRnfu21xI1X+HpfzEJuRoxR8ytDJMwuwyiUYLQpkqFqjtLnnZNEnFQ
 QYuUyjcgMwb/trBVP9mfNxQ+Nrxz5UiqIYPL8ZyVnSHAzw38M4c=
X-Received: by 2002:a05:600c:46c5:b0:4a1:825a:56fd with SMTP id
 5b1f17b1804b1-4ba093ab88emr46285945e9.32.1794406062582; 
 Wed, 11 Nov 2026 06:07:42 -0800 (PST)
Received: from devhost1 (77-236-0-65.static.play.pl. [77.236.0.65])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba0951bf2asm43522365e9.4.2026.11.11.06.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 06:07:41 -0800 (PST)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Wed, 11 Nov 2026 15:07:16 +0100
Message-ID: <20261111140736.426101-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/zellij: bump to version 0.46.0
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Changelog: https://github.com/zellij-org/zellij/blob/v0.46.0/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 package/zellij/zellij.hash | 2 +-
 package/zellij/zellij.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zellij/zellij.hash b/package/zellij/zellij.hash
index 4520d6ff8a..e4dd845709 100644
--- a/package/zellij/zellij.hash
+++ b/package/zellij/zellij.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  e9e67742687f3e1447df546bd2828b01edae39762bc6fb0795a686030c00674a  zellij-0.45.1-cargo6.tar.gz
+sha256  6a6f3d554ef87a91801ffcdd5a8b6f0e6497faa29b9fb95984de6e66d5dd4b65  zellij-0.46.0-cargo6.tar.gz
 sha256  9aa6c363b18a48eeecbffe13ff390c76ede2c90eb37ba17dfbbaffc42892d87d  LICENSE.md
diff --git a/package/zellij/zellij.mk b/package/zellij/zellij.mk
index 956a99aafe..18403a003b 100644
--- a/package/zellij/zellij.mk
+++ b/package/zellij/zellij.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZELLIJ_VERSION = 0.45.1
+ZELLIJ_VERSION = 0.46.0
 ZELLIJ_SITE = $(call github,zellij-org,zellij,v$(ZELLIJ_VERSION))
 ZELLIJ_LICENSE = MIT
 ZELLIJ_LICENSE_FILES = LICENSE.md
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
