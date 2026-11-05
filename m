Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D609606D832
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 13:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kcUz92nH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=U57DCzpl
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D42B2408C4;
	Thu,  5 Nov 2026 13:23:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1o6EqRzaq7lt; Thu,  5 Nov 2026 13:23:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 793CA408B5
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793884994;
	b=LxlXmAajWH0zGLlye+MVSz2bUEi+zmHFSsM1DRKDpeI2tkYbB6VZRDdSpCeyq+JSpYgg
	 RRrLcM4eJf9e9mpjM1wBeyUrRKQAWWH1A9HKDpsuKkz3lMb7XEmJtij5BQn+xQy9MS1K9
	 m8K4fmG2m/c3UUtXhVr5WC5/WjQ+ZOyHql8FmYHDrtc1Pkq5Ghy4NJ6v4RqCK6t1UhVOs
	 Rltijckqn4ShxlJsr1rDxJYjC+keLp7QF6AbW9lO0l/penuUFyeAQLVqWKgZcupq5c1Uq
	 2E+Fh4QmvHDupvtooDk4S8wMPdd4LCivJ4vfkmqIQX/uQ+W47pYDUxTNSq8mQDR1D9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793884994;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=weh+VQ/WsdyccfNTkgtXgOgax8w/ANsS3zJvmLdi8vs=;
	b=f44M0KcqxoZyn+CR+8ONmzjOh+/mr4HWeR4IEy3dinF9QwPkkeqGlEcKCP4cytAbjBeT
	 EG9gzm/CBl3qOtVyYUjl642QCDVNguMQ/qvrU1S314WWlslbXEDKBqlqOJWqZPTO5OXAc
	 7QtfdUeuWL6LV+zXekGetoksaLf/6B+j1D9ojKwDhzsLPu2JIczVCD3kvh9MlmNM+dErO
	 VsVg7n004ci6TaVy+KjQekBcgPMaPw1Q+Dm4VkzUhczgM5/Fx2xrzJJddBVr2iyuZpoPd
	 OQphSXxwRMz6+9iiJDyYbDnK1gTwXwFYsKLsOkCKprsmcoWbwR+Zg0piZ9e2rKNj+VA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793884994;
	bh=weh+VQ/WsdyccfNTkgtXgOgax8w/ANsS3zJvmLdi8vs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kcUz92nH3IDavfKRlyfoVGU8H69W+LK6vC4sj/CnfH6RSycZSIkRM7HxIibvZk5eV
	 R5CdBplvAy0dLYiFLS58dJDYAsIDGpgKE9+SXxQFKng6XjuiMHdKLdFYnzQBO/4yKA
	 QAMJ9bKshCbI7JLZo1PCSA40jdB4BIiSAgWSlxmSGqfI8MJ9eook5DAH6BOaJh6LXQ
	 6PAyWAbH21v0/JfltIirxN9k+qGoOggn4hkJvoL7gGHE9CJYIZOHlyedjfntbttUS4
	 FFJyFOXTNRqrzRCwj/1BcnS5BzCbWn50rPRuwCwnaFyTwZMb2rqc4b2icADWsYB+T3
	 LewBqxopKOuUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 793CA408B5;
	Thu,  5 Nov 2026 13:23:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CE4B280
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 13:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E92560808
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 13:23:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zSb38bb-b6qU for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 13:23:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DA74060728
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::634"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=U57DCzpl
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA74060728
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 13:23:04 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-c4ceaee6770so276318666b.0
 for <buildroot@buildroot.org>; Thu, 05 Nov 2026 05:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1793884982; x=1794489782; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9RwXwL0Y6JjhnNJL1txO6qJfeHt3dvJm6PxHz0OXcxc=;
 b=U57DCzploWZD3qYk+Ns1r0ED8EfkzXqObJxRDHzMLEiX+v13gmFXvk5XIUkvky/5+H
 KInUbAhTOMO3qkQ6rxLi267fJVHLkbveBDPlVE6YeXLNq70Cu16kZNoS+OuAS0vjkqMi
 yPC5arVWGG5XhSxRSIoO55EwpYdOLeRrtC8/mEKtkB/r7a6sP9Hp7Xl0KJR1H2q0NgtV
 WqArjW2QFk1U9sOOV43biCP4R0HMBpT09xN22hynz0iIonH5E6zYSrRRtbwyQwUaRZbG
 2pg5Zvlipha6eZhgjA0u/l5ccGPH+ZGCaaBpu1NxU/die/VoNfCNgF/clYX7244XzAlE
 2a2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793884982; x=1794489782;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9RwXwL0Y6JjhnNJL1txO6qJfeHt3dvJm6PxHz0OXcxc=;
 b=Id7j7rVxyy3TuMznGRteRtrR9vHHh3sDeoaobs8sriLA4Ixy9FrJduDU67ZNX6eiKf
 EWsMjd9NmJikeQdUAAiuyeNNPzEtpAVmyQY2hHVOiyLXd4q43KcUvl1uwI+xGgInF3DM
 0MshrsSOW5uFvcoglR5jqalcjlEKMC5UzE8jVicaJTLpSXkQzG6iyKKX6xAL0w49Vwfd
 hPEbtU4l8lR6M+d9NfhHLJpVfM2MXVHplqwndESTds1FI6+tcAEFkICr3SxNT9DFuBmU
 xLUgHDt5Sted+SRNIduyN4KuCc39HTp0m0UBAgJwEyEycYvtro3Xyq8Gl7zG6vuKvJa4
 IR5g==
X-Gm-Message-State: APuU4Z8Md5fqzswtFnzuH8bnjjWZHrQfSmE/kKHYYXfJdl9SDd+DHk86
 /5BDqM9moavOIcJN2E7189cKcYBGDVI/yZQ4p0jhzMUOzb1pyMrrNmLqA8dG6g==
X-Gm-Gg: AYBFou3pj6sALOS3kwxJoME4G9kJYeeGbFWv/j+7qYF+Bff5u0U7ER9J77QRtq2+dS3
 7PmhTbXrxh0CdtlVF9TDKvO0IY/DXHlLQP0xgJ2WNf5dR+zKjjPZKP8R/+Bi9HRH7nCwGA2mlpp
 B2KVFOEfK1usLA2gB7MUvVs+6MUshADzvebhyEIk9HM+I+eXorC/86s8mQSE0kixm9do9nuAY/A
 P+SVFqicYRCrFmsBOh4N3PPf/2KRBKTdv+mA49wFAkb1NUvXtQ0zQDMHrShoCEmrkg1y7jB2Qim
 bIe0XUVcJvPaLEhbzr4Dc1BMciPemfzW1/59NrVFm3QtMqbCkleLRvDCoXDHVzxBCFmkAHai1PV
 Uugh8N3rhx3PbIJkg6vdVAT0Vj3sYauv151Y2Oj2uvr1XAty4ho3h6nlIJ4LFkCQcBUSI0zqFbR
 61Mye6PxYFYV6yxYOyVARLyzGVmRDiAcAyH/3uH+6g4dPRrUaBXZrlfCNubOElXhzc/sS+NCEax
 HRJDTzS55kyeE+Hg++d30SIGHZOqjf0/4QywGscFI2wAqnS18ycpucCkrfEEFvzm8c4xagA+4JN
 06rhF05VkXc+BBIxrEwFdZumjRK5s7feli7Uh+fly5imEu2bXDNGUi0QEDw1qJWn9rbKz86VV8z
 bMDxvmhRa
X-Received: by 2002:a17:907:3f88:b0:c48:1977:e1c3 with SMTP id
 a640c23a62f3a-c4ca7a4e638mr1911281966b.21.1793884982313; 
 Thu, 05 Nov 2026 05:23:02 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d0e424fa2sm172522366b.30.2026.11.05.05.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 05:23:01 -0800 (PST)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Thu,  5 Nov 2026 14:22:57 +0100
Message-Id: <20261105132258.1868556-5-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105132258.1868556-1-yegorslists@googlemail.com>
References: <20261105132258.1868556-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/5] package/dvblast: download from
 download.videolan.org
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Julian Scheel <julian@jusst.de>, Bernd Kuhls <bernd@kuhls.net>,
 Simon Dawson <spdawson@gmail.com>
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

get.videolan.org does not serve files itself but redirects each request
to a random mirror. One of them, mirror2.evolution-host.com, has been
unreachable for months, so downloads fail whenever it is picked and no
backup site is configured, as on the autobuilders:

  Location: https://mirror2.evolution-host.com/vlc/... [following]
  Connecting to mirror2.evolution-host.com (mirror2.evolution-host.com)|167.114.8.249|:443... failed: Connection timed out.

Download from download.videolan.org instead, which serves the files
directly and is already used by most other VideoLAN packages. The
tarball is identical, so the hashes do not change; also update the
URLs in the hash file comments.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/dvblast/dvblast.hash | 4 ++--
 package/dvblast/dvblast.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dvblast/dvblast.hash b/package/dvblast/dvblast.hash
index 3776cef525..30865f41d7 100644
--- a/package/dvblast/dvblast.hash
+++ b/package/dvblast/dvblast.hash
@@ -1,6 +1,6 @@
-# From https://get.videolan.org/dvblast/3.5/dvblast-3.5.tar.bz2.md5
+# From https://download.videolan.org/pub/videolan/dvblast/3.5/dvblast-3.5.tar.bz2.md5
 md5  d244aadb0b202a0838449235fc5f27dd  dvblast-3.5.tar.bz2
-# From https://get.videolan.org/dvblast/3.5/dvblast-3.5.tar.bz2.sha256
+# From https://download.videolan.org/pub/videolan/dvblast/3.5/dvblast-3.5.tar.bz2.sha256
 sha256  baa5a9aa1726b97240e16fef8856395cd42440aee410bf479479249f9cce6076  dvblast-3.5.tar.bz2
 # Locally computed
 sha256  94f68aec169fb6c9937eade757251714d38a56812be5dbfc3973914a71ad8d2d  COPYING
diff --git a/package/dvblast/dvblast.mk b/package/dvblast/dvblast.mk
index c3e19f3e3f..614aa6ee2b 100644
--- a/package/dvblast/dvblast.mk
+++ b/package/dvblast/dvblast.mk
@@ -6,7 +6,7 @@
 
 DVBLAST_VERSION = 3.5
 DVBLAST_SOURCE = dvblast-$(DVBLAST_VERSION).tar.bz2
-DVBLAST_SITE = https://get.videolan.org/dvblast/$(DVBLAST_VERSION)
+DVBLAST_SITE = https://download.videolan.org/pub/videolan/dvblast/$(DVBLAST_VERSION)
 DVBLAST_LICENSE = GPL-2.0+, WTFPL
 DVBLAST_LICENSE_FILES = COPYING COPYING.WTFPL
 DVBLAST_DEPENDENCIES = bitstream libev
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
