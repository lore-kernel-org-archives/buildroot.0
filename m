Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FAD1F43683
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 08:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDD8B60D8C;
	Fri, 17 Apr 2026 08:59:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 77J4684Md4Ai; Fri, 17 Apr 2026 08:59:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2BAE60D79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776416389;
	bh=bQ4aYDo2QJ39cDcYvkkCEjRNce7ZwfiPujEQvY1Jbuo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PqAn7mczSc5QLEoKf0RHxeQjHb46eQw0L9SLhzt2qv4SxbRso7F2h53wVFok3BW63
	 G/ylhrkUJ46Q4extspRY6rOK5U+eXXsH0bnw8Gz4ge1yBz+u8ScuQJX3s8RiZnJY1C
	 /qXrIhC5ZlkOyPMf18SVOLXpslDX0QC9dsp9TDiFhjOHhGkNSL7h+ghYxeMqeorMx0
	 1pnoU8pwp+TahOzILgbe33XYzvLEpJcYvuykBWXj14ddK8Va5JsCIoCIS5+UOGCaxx
	 4dls/mUmCAJhu6aIGqHTxeJXwFnh5m2E8U7NhhIPtL7EnSzxtCjm19zbJCiIXKZwtY
	 lkriDpaoLX/5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2BAE60D79;
	Fri, 17 Apr 2026 08:59:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 69DE0259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CC5640CBE
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pBDuxowWDbXF for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 08:59:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 84DCD40CBD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84DCD40CBD
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84DCD40CBD
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:44 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-488b8bc6bc9so2852175e9.3
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 01:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776416382; x=1777021182;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DUe8igv6pXtyPw6SbB7b8+BPtrUkNZlGi17aHaHqXXA=;
 b=im2q9mPAXU0+pB1K6Z+AE11MES2Rp7IZowR003pqnF9SRolqx9MgHS1GGF3imgC2A2
 FtrZ6FNcOpwIFvQVtOMrDmbGwdqBvHBPV49OzA4VvCtkj4zkdfhlJUw399wnDWkV/2WB
 lPam7Vs6FnskFlI18ptKMwtmz5Iuf4Df07ncaA0M5Ozncp+UYQQX0CV37DF5H9WWK+cE
 E70D84SPCWHGnxxk05s85DZcpAYNfyXtJYBlLFS0OGGqsI5A0R4iaS0patn2ZDq/tIKA
 ifqLapAQC/ltDodhn2IagGRGWxCiEE+dDCwLEsj39b02AjP69OV4shvSm3iv17KGOWpW
 WZ+Q==
X-Gm-Message-State: AOJu0YyBdy0d8/VzVY8nc8q7rBzkyxiDg3uLCKj1CoQNbjhqgn8X0P2O
 BNf+PyDKN94ujuMXHfeH0e6TkU0HQboP8OoeZTrqsrBVYEOtY3cC4mBLCGBoSQNCmLo9fNC7YD4
 +A/6f3A0=
X-Gm-Gg: AeBDieu4yDkSkkzk5Dd5TFu3M+BQED/cJA7K/++1Zdl9UFplRu0ZNuwerB/zjmWy4q1
 kRZl9JcjUzN6Y/KC6BBfpmhGl7XSwqjy/7TQuRUYeQjPFVlj+f+xVE+7YQlOthVAkc2LcjPwDHy
 idwS0gK1bqq3Un5TE+HsRHubhARATYz1+9lcCdkwEB8IRy89GZT5zmfF/dzyPzB0xYhXPpkU8qK
 AII5S1BCg7erZ0qaftsSdbSB+uZvTEt7AJ0W0zRk1JV5st6BT+vo3et7+ZXyl+4FNfOBfcfLSch
 MQ7li8+E3PuoT8StyuY7sOgPBytysnHCfJKKO4rgQth9fitUCveF/DRdhWkmA8DdJE3tlRHeWaG
 iZlz872/o0sZsJ8gR7j7YiP9IdMONiSlaJfVQEWQVIV12GFhzxEqi4djDjZJYxn7BPLRNwFqNNs
 sk7q4ZOg/Rq0aNhlbZS9OlwO11GbC3CFCQhguRL3KWrnP5utnpyQWwjqbtOVKkwD6kJgH42ZYlS
 EKIGav5v0IbMyU2N2C9cV0ocuvnpCo=
X-Received: by 2002:a05:600c:c084:b0:485:39d1:b4dd with SMTP id
 5b1f17b1804b1-488fb74a495mr19050875e9.10.1776416382219; 
 Fri, 17 Apr 2026 01:59:42 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7a0745sm15077795e9.9.2026.04.17.01.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 01:59:41 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Fri, 17 Apr 2026 10:59:18 +0200
Message-ID: <20260417085936.200528-4-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417085936.200528-1-dowan.gullient@smile.fr>
References: <20260417085936.200528-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1776416382; x=1777021182; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DUe8igv6pXtyPw6SbB7b8+BPtrUkNZlGi17aHaHqXXA=;
 b=fAgupQXL0ELKxrKoWR2+EjuwBRMUd8APzPhNpezHze22kAQp2h+OBWNlsckLQ4sg1G
 tk6cY8bI7y3fj6kfjqOBy8Lt8xxs7pSE0E+8SR1P0jgVrKYC9mfjAhKyhVgt915FMGkl
 sjgwto/ZClAUNk4pmSBQGgWoIPsK1uEBDjHnc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=fAgupQXL
Subject: [Buildroot] [PATCH v1 03/21] support/testing:
 test_file_capabilities : Kernel version bump LTS (6.18)
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
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 support/testing/tests/core/test_file_capabilities.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/core/test_file_capabilities.py b/support/testing/tests/core/test_file_capabilities.py
index e2600ae794..ede7b48555 100644
--- a/support/testing/tests/core/test_file_capabilities.py
+++ b/support/testing/tests/core/test_file_capabilities.py
@@ -13,7 +13,7 @@ class TestFileCapabilities(infra.basetest.BRTest):
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.310"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
         BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
         BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
