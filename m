Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04E2606A321
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 09:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ni+xpDsd
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA53E40695;
	Mon, 23 Nov 2026 09:54:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hy-GKlWw0MyB; Mon, 23 Nov 2026 09:54:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BB6944066D
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795427655;
	b=Q+cGedvP+3L7KHAjo66SrsNU0eiunOIS1f6cenbf5VseOJz+/fp5qXeboyvhObjcBliW
	 /diQcLJT7hGA3FiHyQmMu929Jt6Af1RnroHPNdCDyLBUtUNDx3LgYe48qI4MWdYcazaSx
	 G2Bei3AC3pSnPMq6j4hNTWRHEMDHwJhbduju/R+pdE8bLkdwy3NBMid6zwE8gQrrC2Jxd
	 NXHQBsLsGxSS0TuYlsZ3faXPJnj2dd8UoOM88hIsBwyJIUmeZzOyhEPrn28fa66E9mDYX
	 7JcWXC+5NdzAiFVCDbH9FQKq7xOs7En3AvhRpSadkn+/RJ7ey7aY77uLiHDzZbJlfag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795427655;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=dQGg0RLItBnqfCr59Ms/5qyYbhy0y1XiZiyGe3hw14A=;
	b=ZB+jXQg7l07VwLkZ14c0FElL3eORXXgodtbBxCQJcaI0779F1YtivMTFWkQlNaKL+yco
	 TzN/nxfznagoC62dwO+HI89OjiCgWy54zXL159COYuCF9uonLO4h4juICkRuouUYI0QlF
	 kN+v97/magHSh8b7Ql4zuykxX3jo+pQK8nC04dQU1be14BOkdQuDFVhqFpStQfRrQFv+g
	 /eADnBA3dqq24pb+f1t91GNJJlMymZtc5N+z84ckmAJPD6d4U1oXQMUFrGJYjSPZ8ZQW4
	 af6M9uH6KKbTbwsLEH7MC3zUzClBNet5DoZ41d38gMq7sXkbItV0/GGMz4JwBd0vmyg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795427655;
	bh=dQGg0RLItBnqfCr59Ms/5qyYbhy0y1XiZiyGe3hw14A=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ni+xpDsdV9msQcZcWoKeXWoyv/ou2jb43jngLYSWPrmROa9nLirkC450LptIW/+Jr
	 mTa8SHWWuxf1tYKKz35bB+Ri9C0+AjvGUYpIB0eVxCeIv5zY2yAsIte6GQcaTni9fQ
	 OwztpAx9qkzq8DZjDTWFHr/mJiJVekIuJ9zX1kRkklO+7tqkpTyGloKygMfjNJOgzB
	 b8WBQdB8VMTg36c5BWjiq9g3xdrF0V2bWbtwcO/JtdHohlQnNbq5AlNVSfQ0iKChu0
	 KIlVO6S2CnODiXwiTmwKMltjek9NuT8AJ400wX9XEe3o6SwuDIYS5SZpFNHgGGFGBS
	 3ugH95Llut33g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB6944066D;
	Mon, 23 Nov 2026 09:54:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B82A1499
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E31F80DDC
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v6p9fMg7scjR for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 09:54:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6DBAE80C7E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=209.85.128.41
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.41;
 helo=mail-wm1-f41.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6DBAE80C7E
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:54:04 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a214c5c4c0so27807165e9.3
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 01:54:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795427642; x=1796032442;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=c2J8uwfjbLsXAgzwUmG2AfgOLbW30N3PY9x8i4QWZmU=;
 b=L6SYd/fDbpcuwufNHec7xNCrqUsSxpVHOOwEtJjRPktgq5iwMzPIy0sJLiOlDKbeNV
 m26Pa13zVD9kcLXv6YGwxc+V3STquDhsT46Zup6Ga9tX6jyGZj1eB7PTnKv9ey80uXuu
 p2fkfBiDOyPPsdrvp1Woda4Ig1cdLGmKGeqtsA7um/Yby+oV4ipaantKZT2g827inOnF
 jQZn6oT3yf9adRep3Ry3EZsdjN9t/X/rl3wyYHwLSJUCyZ9TEx1LhmlhfwAvQSylCB06
 mPwCMDgo55YETtvvUU4f6gaaBTTMq5Mk6RhGPIm9PN3u34eAoJzeE0YzwVskvE/sBlt+
 LZWg==
X-Gm-Message-State: APuU4Z8BXadzCI4Gfd2RP52WFov1PDUKyUF1m0g9hwBni/TNNFtTfvUy
 NG3y3C2Q6B7OGB+8s0yQXN5/0dLYSkxx0dC3N542fgdU1sooAyILYz2ENiUuigq7
X-Gm-Gg: AZFdTZf1alml6rBQbNoDYeJJQhhniYw7r2XjuImFtjN7deGF8w6NRsZMlMMDEMcGrYf
 HnVu1amUaJ8jx7rrx90twOZwt8ePk3BhgHVPUnfVQwRgXGOCYUY6yhsBbLv01DiCFi3j9k0NMdG
 AGMlUy1ak3rzDkuSqaQmf92z8l2arEBbC2JYkBIm1GHtlSTBI7AYCdFeG6yOtbIB7IvmdmHu+pQ
 jiNDQvh1veG5VInyZ7b3UCvYJZ01bJLs22TZXqWWvwQ3D4P3SMbhHWdKf1fCaqldZh4yIuG2ZwJ
 NdyxRoqN/BZGjZFN/awL0Z3kSn7d1pC5RuyZd+ycF/g3dulPmsN+1vCmgbW4yTyJ0bWOI5Og6la
 GlBH13PiUk3/zoj16NrJ/nnoatJrcs7WPh1iDknvPuFg76k6mEngjOOjwVS/waeJ6lK6whOClTU
 huR1gCWxHwQexu3MV/QPpqN5YWRAExOf6Kaxv3DYgfTX/QDBS7QJShn+/HwbRLYuifPkZ+QCIdz
 BtdeXZhjiQw89GTMrRpkAl9J4J4qeq78XVKr5ydb1JrY+zomVyuR4xO8DO6mZthpDKWf2rsmezR
 wVIYiFOpUTD2aZgi/yMXVNFWgzRcSLyev0X/vATpGOPhARmFZz0C5D+OMUtgo93JgvpqhfJi0lO
 VTzX2rIUvlF/uhEFx1s/9euA3/FdZPgCLE1iF1SHtBjmDxwjL2gklUXuG1ctI4KCTtT+JhQ9TAX
 4665c6mSRqNw==
X-Received: by 2002:a05:600c:3ba9:b0:4a2:1050:aff with SMTP id
 5b1f17b1804b1-4bb8881c741mr264048405e9.6.1795427642290; 
 Mon, 23 Nov 2026 01:54:02 -0800 (PST)
Received: from KORLIN44614.barco.com (d528f5fde.static.telenet.be.
 [82.143.95.222]) by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4bb9067846esm186202105e9.4.2026.11.23.01.54.01
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
Date: Mon, 23 Nov 2026 10:53:37 +0100
Message-ID: <20261123095339.1566394-9-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123095339.1566394-1-thomas@devoogdt.com>
References: <20261123095339.1566394-1-thomas@devoogdt.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 09/11] package/wayland: bump to version 1.26.0
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
https://gitlab.freedesktop.org/wayland/wayland/-/releases/1.26.0

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/wayland/wayland.hash | 5 ++---
 package/wayland/wayland.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/wayland/wayland.hash b/package/wayland/wayland.hash
index 8da9dbe745f..98754b2db4d 100644
--- a/package/wayland/wayland.hash
+++ b/package/wayland/wayland.hash
@@ -1,6 +1,5 @@
-# From https://lore.freedesktop.org/wayland-devel/plU5smxin5VXbiedTGtL7CNHe0t2mHtgQlQ3-xwREmSSNYaClAcZpEBV8L7JvMT8JHwdD_a_uSFkDUaP45CAWyL545iZh5gInAdToX6hgt4=@emersion.fr/T/#u
-sha256  82892487a01ad67b334eca83b54317a7c86a03a89cfadacfef5211f11a5d0536  wayland-1.24.0.tar.xz
-sha512  60216602cffd1473ae15381f9e9a6f3829e742cac83843ca65360ba78bcff8d9442f15eb6a6d5d29c8f74dd920762ca1605f51658d22a1d3c18e338505b9f974  wayland-1.24.0.tar.xz
+# From https://gitlab.freedesktop.org/wayland/wayland/-/releases/1.26.0/downloads/wayland-1.26.0.tar.xz.sha256sum
+sha256  64176eaa46e4969903e286f8e5ef8331affc17fdf03ac9b58381d2b23162b7a3  wayland-1.26.0.tar.xz
 
 # Locally calculated
 sha256  6eefcb023622a463168a5c20add95fd24a38c7482622a9254a23b99b7c153061  COPYING
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index 7dd88bbef5c..310e60ed766 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_VERSION = 1.24.0
+WAYLAND_VERSION = 1.26.0
 WAYLAND_SITE = https://gitlab.freedesktop.org/wayland/wayland/-/releases/$(WAYLAND_VERSION)/downloads
 WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
 WAYLAND_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
