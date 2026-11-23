Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5549F606A31E
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 09:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Mor0F/Sl
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 226FA4067D;
	Mon, 23 Nov 2026 09:54:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Ekmm7Wzz48D; Mon, 23 Nov 2026 09:54:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 506FA40668
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795427642;
	b=T4Pu39WvGm+tBxjWssip1s7y98DM47R+ntQWmYI/wK2Ypb/RyRA/W/ARz1fDWkQfd30d
	 RqYbgUfEdUq+vRnn6DRm2vsM0hwaZgUjcRiyGIdCHTdEV9dzn8/LPa85rc3YKALqhqfzw
	 ebjdDYlkOpuiiMTT6IPwSUxAuKfHB2iUL7yYejH8tl0UrS705UARQGOLS5aRkajXquqE0
	 BYrOm4auxN9QZUvALXi1lmr+QHkEehJyMH5PzyXSOZFgexsG0/t1HCzX6j4ctTA6lnbpB
	 yjSYCnoIUW31W6/HdGLoU/YqZNOYpW0XJXDFSmw8zv9VNgyzj+q8yULbxGxs51Jeh1A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795427642;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=EVwM/crWHcvFEgexdeM9nxnSjBpHGNQWXfABY/8ooeo=;
	b=MbkVWztQFuLjiqtc1F9F14gn75nfIHTWN+FsktYdAcg9m6nNFhSoLCiCjezuwlo0vLV1
	 BWtz7ly/qf/2JLpCDI8bb8WX8ORbKZ55F5aVY/a9+s5mnAtRtfT+/1BYYb7jXZqfCQmb0
	 whbyeSCVr1HfUF2uyX2ushdd/MeR8RWfDeEkFdd3Q2exOfc7xG2lf1RrBU6677nTWwLEB
	 yQk1gx656f6kSF7hfHTST8uH0bSY6Kb1vd8YtR/4vKqHQSq15Jt4uPaWmJLzxiCfZGrhd
	 N/zhlUnI/zaKCEry0OyWodTtMpP43pCB5MIDrUNa4zLccB5+RJ5GwvfNkLbT3cnOXXw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795427642;
	bh=EVwM/crWHcvFEgexdeM9nxnSjBpHGNQWXfABY/8ooeo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mor0F/SlpmWFTrD+whXYtRYTatdxrEp0DTmH/1fvPp/r/Moq0tn5YBnrZo5cdjYij
	 80oRwVU9uxM2rgojdMOq6HXe6UxqLwdasy8IDq5oyirN7Xppkwt9hdTycokyPgo4Wg
	 h+Aw295eBcK0+q0jTiwTpi6ErKJ7/vW2gJKBUqi/kMmzQF0V+1enRH/RUw7Ho7radU
	 4yIMs3xBKWGtjXRogFS06KpLKrUxPZw9MnwDx3eoYawrXTa47pwPCnQuH2PxC9HQXa
	 luxb7bw6LlSJe2avAs7HHXXGfcvAAK2Wxu2irGbInFp+UCfd77m8AqkWzarDMJMsGN
	 rBpY7wZDiwnKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 506FA40668;
	Mon, 23 Nov 2026 09:54:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AFE21AB
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40CB660607
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PBxiyKY1WyZH for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 09:53:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2C104605E3
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=209.85.128.45
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.45;
 helo=mail-wm1-f45.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C104605E3
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:53:58 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4bb72b44a97so25147165e9.0
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 01:53:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795427637; x=1796032437;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=7WA/Z+SJp5DvvzgZIT8285KjGyppXqFwgMB7rRra4zw=;
 b=2IaQbQ9DL4YjzZ/jD/lnZDWGg1nF0DylI7AtDq+OWfOqwZIShwdAOR3aaNjTqU13qh
 Wfb7/c+4gFHMS0+S/T80mrDPhLk4g+j4Z/ua69rkTLdKZpatx/iMFL3sd7BR5eHFAL4h
 gEuLFbfaXbpdLN3kgDgUWbVQHQsNk+My+Fk7I2Xo25m7sUsJPrhHpUA+qPt9rgva8dy6
 rWaNVfH3vVoEci5Larryh5TkA3E4ZWliFJQ3CXXdmS7oZ4BanGpx0BShxYcyATSvtOf3
 NfiKVni0J8lItodIso0d6EjbAinJoR2qjMU7CGOjKfCzd09ykECSZDgK+HrH56N6V+2e
 CDAQ==
X-Gm-Message-State: APuU4Z9lBc51epQy+nlreiuHZOU0ELa1xO6iMN6On521tHT5gC5eu10v
 dljnAMrDrh72aFndkax6gQ/yzNhOFx9D/iwW/VJUUjAWkfQCJz93YtVirEm15NZI
X-Gm-Gg: AZFdTZc2kieISN9K/PReW7tCbzDTF0MmgY1JnOsBZNeiP546DdO//DcUQKDbxvM63hB
 Mb3Fn1ko08cEIpwZwazFM2Dp+mGaIVyndmMn4/Qge1efCb7cZdMQxyvysbip2ta56AWeA1qVV2d
 pAIMV8I+bWZa3dab//vOAH7gpxath30LeWhQH5w7l++w7GRYzO+DW00X9grjewoL5wSJ7/8oRqg
 M5n1DZWYEAvnj0OMTCOlfSv3AL9xUbv1KtdZXbVC40hf7ToY5PP7Zg/+bc1yoLDmtOwQpR67DD7
 YX3moLFEpGZtz4ZR2zf5tu7igyF7LdB862xpUfjeCelP3ER3i9bdsnWjJZeESlhxmB/dxymx8sT
 geoNRRiB76yduyBAmRh0MJJ8nY3YhL4PPjHuk1lJuuXJ6l/7NNv2dtKpez1tiIHRgn8WiD0SR5V
 MLG5s0tRilLrZJMHQlnVLznl8WIgIxexISdFa0nNRSQ06+eXSs3LOf1//6F/l03kjEgzHsX8KJT
 C1DKLNRYWHKQ+XnnvjKQQNUGzhHKM+ZP6zvcnFTZhL57ak0m4AiyXcuNI0nL027F9ZByRq0QuyU
 nNeZtie8ZGE/rvCLy1PGFGwlL9x4NhKgKifwe02r6EtckCHd3y9HI9tvqKro6PwZiJQAn4H8qC9
 jhx0Y9c2MMHTqCxou+aY4pSdqGv7HiGepoCgezlhqqAfi4kCS988fYdAGYmN1lHcVg+kCPB2qpG
 iZxLLrNBy+TA==
X-Received: by 2002:a05:600c:4f4b:b0:49f:fd2d:23c7 with SMTP id
 5b1f17b1804b1-4bb888226c0mr265016435e9.27.1795427636737; 
 Mon, 23 Nov 2026 01:53:56 -0800 (PST)
Received: from KORLIN44614.barco.com (d528f5fde.static.telenet.be.
 [82.143.95.222]) by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4bb9067846esm186202105e9.4.2026.11.23.01.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 01:53:56 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Chris Packham <judge.packham@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Nov 2026 10:53:30 +0100
Message-ID: <20261123095339.1566394-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123095339.1566394-1-thomas@devoogdt.com>
References: <20261123095339.1566394-1-thomas@devoogdt.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 02/11] package/cairo: bump to version 1.18.6
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Release archive:
https://www.cairographics.org/releases/cairo-1.18.6.tar.xz

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/cairo/cairo.hash | 4 ++--
 package/cairo/cairo.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cairo/cairo.hash b/package/cairo/cairo.hash
index 3c66c63f6da..58291c2336b 100644
--- a/package/cairo/cairo.hash
+++ b/package/cairo/cairo.hash
@@ -1,5 +1,5 @@
-# From https://www.cairographics.org/releases/cairo-1.18.4.tar.xz.sha256sum
-sha256  445ed8208a6e4823de1226a74ca319d3600e83f6369f99b14265006599c32ccb  cairo-1.18.4.tar.xz
+# From https://www.cairographics.org/releases/cairo-1.18.6.tar.xz.sha256sum
+sha256  1c767308174337a74694da0f3ec069c271452163a1ef4540964c50c301f157d4  cairo-1.18.6.tar.xz
 
 # Hash for license files:
 sha256  67228a9f7c5f9b67c58f556f1be178f62da4d9e2e6285318d8c74d567255abdf  COPYING
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 26c2555f9dd..e6bea32c6a2 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAIRO_VERSION = 1.18.4
+CAIRO_VERSION = 1.18.6
 CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.xz
 CAIRO_LICENSE = LGPL-2.1 or MPL-1.1 (library)
 CAIRO_LICENSE_FILES = COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
