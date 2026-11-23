Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E38606A31F
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 09:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MfOAFkYm
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFBE180E16;
	Mon, 23 Nov 2026 09:54:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oH04E9SvsgEG; Mon, 23 Nov 2026 09:54:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1359280DDA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795427657;
	b=GLPhymTJMK+YjpQ5fx+CbucCzEfyM+zxo70/uakEIBuqFyIs4+geYmEBVgovE+eJxiJT
	 sxcFKE4BmIYhcQxzbK3PsQHyLhRH/vJwlCgHt9TIjhCgYw6h1XGsinLhfgtD3Cjztx5G/
	 89hcawXstREppdEcjlDpN8YJ+70IOeP75V0v5Hph2UOxUgGS8rbuI5y/vw+8ZbS+t9WQK
	 j/gc5hBoQlxYPhM7f+wkkrYTDrjWANzp8ZCjJCJhZHkz2BH7dhzpTg+KrFha4yI0VHjK0
	 fMMUxwmIGydm6fmE5Nfg1ojkfIGBqrHCFfPxS60YYQuO6z8jTKVjzPed0XTt809jgxA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795427657;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=7iClxY7MivyUg5z0+e+9vsQZb84TRPeQ4clr6pZR3yM=;
	b=V2lBz+kVCOS5qYudWFDhoSQ7dCd2tPtFLUHRMg8iwvLi7cQRck14M6BO33U7Z3GaFNND
	 zRQxEzoe8kDcp/QjeprNqnPV4r3QFEjTkbunpcMvzgWCwl9CjMNibnmOTqnrGMOPikvxY
	 D8a5eulPfhMiSuVEan9yZrJjZ3rJpqnBA3x7C5Wda6vlSNLXziIEaLg9BoRdz+p7vLc7W
	 ggx6WnYvDobjEO0w41/l/y3wIFgKSV4XVfCAhoxe6AuLa1+ki/MLltWU9NTZXxp9iXddX
	 mY0/NyrTtxc1fmmwJWZ0shjQqoYybpo+UaBtUTpIuuYZGZVNnVX5UdOL2YGWg2OvF6A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795427657;
	bh=7iClxY7MivyUg5z0+e+9vsQZb84TRPeQ4clr6pZR3yM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MfOAFkYmkrqRFheEebTjhOv74aG1ZHeZnl1dNDPlsO7ZvvphPhPD38mAhiahW06oc
	 lRtTaCWKJpgA1Pf+iwMj1KYqYVZPmgLRbEqpssxLIZGDD3LjmQKSvhYmuYHTrJvn+w
	 F5cxf7ygVCHqO1ssVoaAeA008tDEpiWRb7rG09+ajw/SQqh5+EjLDtm3bDY4zcFYIy
	 exHTRne/IXJSQQ4YQCR2AOamb401DshC2eUvUMRSG9GD1jrvM1yjhJ6jXwSBkkG/mm
	 wTaxDJHo0pF2Z9pbr5Njqr1wCL6lFjWa/HP5roqYSFWS/VX18wCWmr7rlgzey5djj5
	 FDy1Tyygm/W+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1359280DDA;
	Mon, 23 Nov 2026 09:54:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CB681AB
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A49A605ED
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KUFjbp5e2mzy for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 09:54:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 35112605E3
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=209.85.128.44
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.44;
 helo=mail-wm1-f44.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 35112605E3
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:54:04 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4bb6adaf0f1so26346155e9.0
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 01:54:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795427643; x=1796032443;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=UbYjYVdxwuVMIkePeGXKXZZgJbae8oz1rn0mCbBOsQo=;
 b=S1qxxq8IRAKSF71kqoi1idKN+nA9sV6nLVXYO3w9iXgW+WKx61V8f5WV4tu1YM5QFH
 iSyV0LoyKQU6E+iUhgTjYEGKqCxls0Vp8rmTPv9PBOtNwojTqO7KU1a86Z/1qUuFz+lW
 FezCoHFyGJH4qEXywXMNyRoOuZ24d7OHlD96VPalPprwTouMEAXOQbnWD8RE/OgfjDSM
 OiwOWxfe3cKaO1MWZl94Q5K1yGShRlGxw6AJESfVRQ+OefmgENPdKe5fMXD+UqoSWnHY
 E4j3XfZwDDBLnJr3XGukrLkTYGGBWYj2doBdOEpiMWemr7l8xGvidPHuOwDu41clZAmA
 IgPA==
X-Gm-Message-State: APuU4Z+ix1MOSYH5INdx6yjOsmH+ecqOdvqcfaXru9itoNGJWkeu5Cr5
 MU4U8nDvy6DWNkmaYCEzYNqK5b8n9Z6Sd+ZpvTo0R/ZBPSECLbQLCJbsrNgwt41x
X-Gm-Gg: AZFdTZfqCDiIt+6er/RGmhhHsgiK6Y6K1wlpRDQsZHH9fJlsHIO0s82rLfNPwG6qCQO
 TUyGvUIyt3fQGWKfeW1w90q1KKu87VlAGBwjsFB7YWlZculSLEjqR+LMsLwtS/Ar8FTv3djl5se
 oO/J/S/nMTdmyxKJWSeVRyeV6js09dpcFZVbrs8+1W/WN6tih/hrlH3dtEjdQH5neWDzCAq2apZ
 HH0KSlt8ljSqfFVJhat1qrfISHBv2sNkEDV22eVg9/YjR22CEWi3tyOxP1YoWyhI12UQ49KOita
 nWRpdALiOy2jtEcS7pmKRHrpXBV73+Gal6C0i/xGd8Os2fOanu5hIZ9otNDLSiy2/U+Nr9DXfGr
 Ymiyp8cRosaj7ZlFYbKs42sZQIwgEXaDEctvLq/wrSP3lfLO9PsyewtETQ4WbNbw97O3btxKCdG
 kdtZJMxSeL7yddRZGKZ9r8syMu+KMF4m2XitiHjXfyDTHCHzrqiaQY6sJNEHY4H5TqzRA7NtHeP
 B05dh+qgPoCGd2nZoujQptDOPwNvq+Fl3Kr+LlR9mE2dfXdIVT51JmUExvS4sXP7xMvD68pLzWH
 flkpkvTAUbEirjtM0/y2FljfPX5RxnvMLNHMCvUghHu8l0YOkQaLi3BKt3031g3QfvMAnTOoGll
 +NCIwAefHemMcA4obpTI+jJOe/UcTShk/zQ6eLvRGq6X46ioZifVKjMt88w0qhhu4AuzGJaksrR
 YM8WKZCC9V2N/yFkWQ90W4CDXAJPEkVJo=
X-Received: by 2002:a05:600c:46d3:b0:4bb:5c92:ce12 with SMTP id
 5b1f17b1804b1-4bb88812200mr240688995e9.17.1795427643012; 
 Mon, 23 Nov 2026 01:54:03 -0800 (PST)
Received: from KORLIN44614.barco.com (d528f5fde.static.telenet.be.
 [82.143.95.222]) by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4bb9067846esm186202105e9.4.2026.11.23.01.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 01:54:02 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Chris Packham <judge.packham@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Nov 2026 10:53:38 +0100
Message-ID: <20261123095339.1566394-10-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123095339.1566394-1-thomas@devoogdt.com>
References: <20261123095339.1566394-1-thomas@devoogdt.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 10/11] package/wayland-protocols: bump to
 version 1.50
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Release:
https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.50

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/wayland-protocols/wayland-protocols.hash | 5 ++---
 package/wayland-protocols/wayland-protocols.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index 2b29785dde7..df44e499771 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,4 +1,3 @@
-# From https://lore.freedesktop.org/wayland-devel/ac0NAPBFafhcgzE3@gmail.com/
-sha256  398036ac0eb6484982ddbde7ff86848d753231f9cdeeae983f06b52946625aa1  wayland-protocols-1.48.tar.xz
-sha512  24950c6181f576f8926e2631a3f017986f809cd4fe8efe6fc8e4d872e98aacabb9eb79877371fb5def1fc78027c8e1e1e25bb98d455c22624a810707be0b2c24  wayland-protocols-1.48.tar.xz
+# From https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.50/downloads/wayland-protocols-1.50.tar.xz.sha256sum
+sha256  4460c20cfcf68b994a5ee206ed15fc19ad312f16c96075186e83b0e3f4aa48a5  wayland-protocols-1.50.tar.xz
 sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index 5ef89900660..ee7b3fff57e 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.48
+WAYLAND_PROTOCOLS_VERSION = 1.50
 WAYLAND_PROTOCOLS_SITE = https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/$(WAYLAND_PROTOCOLS_VERSION)/downloads
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
