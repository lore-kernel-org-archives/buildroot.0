Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEED606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 23:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UjdyusPx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=qLzUJ3lx
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C64C40532;
	Mon, 26 Oct 2026 23:06:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tqpDoumeNmqy; Mon, 26 Oct 2026 23:06:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 24EF14052E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793055962;
	b=U1FzO2D01GATUdY8wmbd7sGDBMVIEi1c6lhAyiI7zNZmo4z6wYNfZOfWNE7T6nsYl9FU
	 5Fa+GFL/Bf5S7f45n0AtDNa3ioOYzpOdBxOYfUwDX1zcR8bKtU93XnBQKnEpH76Yvku+B
	 E5zD18fIPY57K3V9G49nVqERSqzlQjeyenb4j1IeFD8U4wOseZvcF9996P/U0L7W/a3Fg
	 Tt8FdnLzdYucNa1LUmz5TMIj75YLvC6iY1aQoghLc6KcYfyx6fQ629Esszxu4P+Q0e1pB
	 pJYTaJKYPVW0wJyyZDIWkJfjGxSSIFHTlNvAOYLjMqbiXzRw9Ro/C1yL8i+XDSsxKog==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793055962;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=OlduYOgeCsib9GEHMb4GMj4sqDRzc5x3FZ0/qPt5Ysw=;
	b=IHtKqJ0rlQUKZj730H3Hh/HpPiZvcc1lgz+Y6fevELBGKfmgxnWCAJrEb+VN6HKbhHms
	 iIpMkRSngH98M+6G6tqsb7gH370PrbZgL8ZLqfWuYUi90xpTBOb2xlRnl9dG5Mx8YLnLj
	 ggkEJrHXbczU0WQDomaIhx88twyeUVHu/lPccD6XJKKxOWySGKlGVoBv06YuoG3dBmkUK
	 6wBPXkTkc1WtJxZOzobtai9xbDW89pEIbWT7pRESDOzQMIJPGHwcaCd1NbtxXGiW6k/97
	 WMvQ2iUEm7a/1PMvH6UB56/RvQMY/PA6am1ghxRYpSEMEkLI+a5uFGmWxoHtIlDfkZw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793055962;
	bh=OlduYOgeCsib9GEHMb4GMj4sqDRzc5x3FZ0/qPt5Ysw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UjdyusPxG7MbLmS3nbvXNN5QcCa/9Cr7TOF8UFKkWt8TKXhUw3N6iJe1mP75moGWi
	 q9TbjshbTzH4EVliGyg0M2KkgbhLRPDwsFdK4ycr2C8TF38b9leadlexcGkeWpUlYg
	 nG/5d45tMe4G79TeGuHOArMl4xTVOD1rF1hmkDHMa17C4o7JDfdxN7LxaPU2XD6YtL
	 LFluameVdKt55KH9QfqRDNo/k9DElkWe4s9PIgF3sqXUh7NheU8HxTwTyNBGS3+PRK
	 6AKIM0TNlr/WguINb3kOS/cqrMefTDWZj8nk1IwA2NC+HoC9/XSDBjBInDhc9Ph4dT
	 3GAf7wR/wjJzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24EF14052E;
	Mon, 26 Oct 2026 23:06:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CA934120
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 23:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B07C5809CA
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 23:06:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dmpPHwT3pFsV for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 23:06:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 965B6809C4
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::535"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793055960;
 b=duaIZrC578e5yNQxHfp1DAGE22ezPHx42C+HxFgiNKp1V8Lp0VK34M2QsmjF6YbQIUoE
 N/NwamWXKa3NnD6ShvdzWnbrsTcFbzX24aWjEPhAgvRggYqvg9c7Gwk6ojg66Xn6Tcycb
 yNRLq9KyDrwN1jC5pi2dKB/XvxlSTFC7bnhSr2YBeQ1tE9mk4fvM/HZpAL54PcVH81OWk
 +Q/wxXC8q5zm2/0RObv7aI/ZlH4h0fQWoimashn6I7WoxUhhGswUAn/G349609WuSgJI3
 nfwFabp2aWtT3tnz561AeRENdoOYIaJNZiXEGyhKthEgwEYY/sC0iy6R2Ciyu7l5eLQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793055960;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=fg7LeqZkLE8IC7stenb+pn6V7bI7tzuNFN3fOH38caU=;
 b=PxIy7hwss7tUbo1uzZuU4KX7jZlan3P3a/Qk9wPGp2N5S2nbqQ1+KpwN+Eq4JbPQ1BB2
 lmUAHconrUf5mwnE+mt4K40cveRgbkfL7EKEZ3bfJNDCEmCM87wIMjQp3nBBVh+LyW0r+
 ZGPDkVnyAZUIkEx29UJas1xqDlB4KcVmMggx4w/kHfuSIIdthoQgtpSJ/DRxkQ5gQdBOR
 u/xgmUFnufyUiSX64iFWdBLKbBViyz57Qo4Ux2F0XloU8gZC1nt86VXb2BhLjZr3sVorz
 kgOZulCzsJ2fAmHhL7nK1LKxHbdOWyXmhRh6NsGZxepF4bi5WHbwjCy8njU2SwvpVkQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=qLzUJ3lx; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::535"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=qLzUJ3lx
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 965B6809C4
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 23:05:58 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6b1ec41d8e9so3704451a12.0
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 16:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1793055957; x=1793660757; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=fg7LeqZkLE8IC7stenb+pn6V7bI7tzuNFN3fOH38caU=;
 b=qLzUJ3lxG9SbT037ii5IRhVR0U5hTcVTGjRqpxzl7ymSSlOWgvfY1tlc93IQz5VBW7
 B7W3RJhrK6M1aLN3cA6DhfxfsEWxHNeEY0JrrabbO+3k4rqsGiQTsIagT4DX67TEy0ku
 8wqCQ0ur5e2BBVTQCYxOqJNJeRUxvD2hG2riVQiW7VTlR0yu+XD11JeFcS7VEGVOLoKL
 lS7B6tqfXWdtWhBd9fNeltfDRpvJZxQntdbTCVzNKxSWUFkHDWvUbosRIaPa+uN+/fFC
 pNSRaeS2ovDdRLJxKwvOKLplR+5MRirCSLoxJUjsFBOXtXsU1Uyj54jeRFD1r5OJeUBZ
 rjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793055957; x=1793660757;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fg7LeqZkLE8IC7stenb+pn6V7bI7tzuNFN3fOH38caU=;
 b=EOFZVwfbSuMjJ3dbrRcbMG/t0QsDNVJ3q4hJScmPvs8IKvfOF2/vzkn8f20axs0V1U
 7QVghrFWnV78ZnwHleaLgza5S6dF0TqlcY1sAfzUwfltv5g0eJBUxuFaJ3meMf1+K8SH
 2vLjd27pv6PWVIUr1D0kvfrn0Ffr2EfsLw8G2g0OPKqKDhegEaImF41zkfaBFooPtTwS
 7r0vL7ThRvfBbpYdNC5er2h8HZ9uyw7G57Q4mMRmfmB9Jl8wRdhF4dmoajXlKHuhXWPH
 XklgA52vNSp8P93pJMrF2I9NJOFscO+Z6s3XzaHiDk03DmXaS9HZECaop2DFwZLBIEhS
 c5Kg==
X-Gm-Message-State: AFq9FYIFTRTk4J5j4xVKYeLMMmmtUFtXYjHY4W5EDo3eSaEqnutX9Y3P
 8oG2nr6/+SlrDYZVuYWSDoNTO8u75ggWcMkO4hjnYt2sNcWQJjCEWIW8UhfszQ==
X-Gm-Gg: AYBFou3FNwetedFgebTyEzW5iGljzehVxdtnHNBmOLtjovuLFeaEpcFR0Vgun5XGkBz
 34krIsX3lehyC6GKbFOh5kMRf/sj4U7yaUoZO84XUxcPqdSHDo4FIIKudLXaaD0hJutQxCoKm+A
 aarG8YQjYqBtko5zf+4XBzhMIXkWDa+Yr7OrN4IqTRo7J/dXEXT31Q07G9OGLDOJXnN8sYHKCgA
 /O5mRGXIwI8bv/JQzxlyVIMTmKgGYZePAv1Hc7J6a0WcYz5Fvuocg+Wv3Day021YbLnyqPq6y0X
 jZoSGt6zNUNDL8JdFQnaQ6QKvLS3BL7ahxB4vkAXzCSQiLYohacHnIlFxgOC8ackxRIpmLUL3aa
 ImqJ0QFdhQ4r7faxo5t12P/swZ4HZfeq0xzPeF4+977UZPqcffbeXmtgz3m0+kOYl7axJeZzF+M
 ano5yhCKY7M+cq0kFo+r9dc+bSAW/I+W+GH/1tOpvKVg7nIZ9VpBdGzEK/iQQeYWn+FxvcrdrVC
 sG9mQklXAwobN1XDYMO04urNlAMYWgMbcQ5L+TX2JX987YYC5HSziD0K8yOp7wJZTCSIBGy6E3A
 3Jw+OvHlUO70GysnRAxTOF0JlLAEQqp09r0=
X-Received: by 2002:a05:6402:510:b0:6b3:baae:fd29 with SMTP id
 4fb4d7f45d1cf-6b442ff1cf6mr6476727a12.23.1793055956669; 
 Mon, 26 Oct 2026 16:05:56 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b47b29dfc3sm432789a12.32.2026.10.26.16.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2026 16:05:55 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 00:05:55 +0100
Message-Id: <20261026230555.3488077-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/xxhash: fix rebuild without MOREFLAGS
 on install
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since version 0.8.4, xxhash builds its objects through
build/make/multiconf.make, which stores them in a
cachedObjs/<hash>/ directory whose name is a hash of the build flags.
The install targets (install_xxhsum, install_libxxhash, ...) depend on
the build targets, but our install commands do not pass
MOREFLAGS=-DXXH_NO_INLINE_HINTS. The flags hash therefore differs,
and everything is rebuilt during the install step, this time without
XXH_NO_INLINE_HINTS. With BR2_OPTIMIZE_G, this brings back the build
failure that XXH_NO_INLINE_HINTS was added for:

CC cachedObjs/e3e28741522760388e82966410d67005/xxhash.o
In file included from xxhash.c:42:
xxhash.h:4970:1: error: inlining failed in call to 'always_inline' 'XXH3_accumulate_scalar': function not considered for inlining

Fix this by passing the same make options (PREFIX and MOREFLAGS) to
the build and install steps, so the install step reuses the objects
built earlier instead of rebuilding them.

This issue has been present since commit 4b9c0915bf29 ("package/xxhash:
bump version to 0.8.4"), as 0.8.4 is the first version to use
multiconf.make. With 0.8.3, xxhash.o was a plain target that was
already up to date at install time. No release is affected yet, and
the maintenance branches still have 0.8.3.

Fixes:
https://autobuild.buildroot.org/results/2174b7fa4ea6587666acdfd940ef4a9cd1cb311d

Fixes: 4b9c0915bf293d96bc469986e83d911b9b8c9087 ("package/xxhash: bump version to 0.8.4")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/xxhash/xxhash.mk | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index 80bb81dbf7..2d991d48b9 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -29,19 +29,24 @@ XXHASH_TARGETS += libxxhash
 XXHASH_INSTALL_TARGETS += install_libxxhash
 endif
 
+# The install targets depend on the build targets, and objects are
+# cached in a directory named after the build flags, so the same flags
+# must be passed at install time to avoid a rebuild.
+XXHASH_MAKE_OPTS = PREFIX=/usr MOREFLAGS=-DXXH_NO_INLINE_HINTS
+
 define XXHASH_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		PREFIX=/usr MOREFLAGS=-DXXH_NO_INLINE_HINTS $(XXHASH_TARGETS)
+		$(XXHASH_MAKE_OPTS) $(XXHASH_TARGETS)
 endef
 
 define XXHASH_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		PREFIX=/usr DESTDIR=$(STAGING_DIR) $(XXHASH_INSTALL_TARGETS)
+		$(XXHASH_MAKE_OPTS) DESTDIR=$(STAGING_DIR) $(XXHASH_INSTALL_TARGETS)
 endef
 
 define XXHASH_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		PREFIX=/usr DESTDIR=$(TARGET_DIR) $(XXHASH_INSTALL_TARGETS)
+		$(XXHASH_MAKE_OPTS) DESTDIR=$(TARGET_DIR) $(XXHASH_INSTALL_TARGETS)
 endef
 
 # we are a ccache dependency, so we can't use ccache
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
