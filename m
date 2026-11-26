Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488BB606A321
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 07:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bzdPIO+8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZJKjF96B
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20C65608AE;
	Thu, 26 Nov 2026 07:17:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LxYN7HiF7Roa; Thu, 26 Nov 2026 07:17:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 28A03608B0
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795677423;
	b=QzTTZUMZvRpTZK4arby98k+EE6Q2J0gGJRz5ij48uKpVO5hXHOXPKkndXsKzDf60eDff
	 uXKWGJkQu6jKZLadMJ54EXXF7zBXJogPmYwAQkxPNyH28Gt+qLNcmYd7QbyqiNg0LTmv/
	 S096NYy/KFm/fJwwTcLQZ2L15yVph42h9LjEuU+ssFkxqqg74GMYp0VFQFoIVShVErlsd
	 BeMhwLoRCCncoUCpVS73mkeHd5FQwhnkKD3UQmuqxofPwABNAV64ajm16JbLrbCEv4Q7R
	 uOqmHBqzvq2eMNOzL0mer6XJKXMhgCIh3Jo5ctq7CCel3Q5IXSLMfYBDBpr/EsnRiug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795677423;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=P6Z+zMVMjEDQAyNQRHgIu/Og890Dvg//L1z0jZs+ITM=;
	b=b64jJNWZ1bbpgkIH2HoB6ywCNEuWNo8rzoalSLkqMZGrto6ct+agRhDHloq8+3aXkbTa
	 2t6uacmBLhsNcHMXNmbJeFm/LPOPjnGpDbjF+hAV2XDlR0AW5sEMvS5GagB/lT9FHlAl5
	 bxH0P6BJwD7OaL1iwx1b0QGcXfS2CKQvJC99+xBwoK9upv5cU2+wGEddwj0QNcmKGerLp
	 XaATQ3B04AGxGOXeB3NJuqrnSVWpljpmH6It73d1QrTzF2kG1EmJ+BH5zgIlXpQ9Yx2da
	 R5xknlqOS6E58hOWnn+ZxRUJsDKt27KZaivJhK+MFoq9Kk3S2/Xx4qZR5kO7+RbMruA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZJKjF96B;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795677423;
	bh=P6Z+zMVMjEDQAyNQRHgIu/Og890Dvg//L1z0jZs+ITM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bzdPIO+8i6YcLRlhGtDyl194nrq+fbLoINNR5NuZCGskZ14oFGZ8HukWf83irI4AJ
	 GucrGXbwTdwStSTlxPxft0xyZfij/4VDMauyKTmU300x2oKrFwCxGZxHi7F81RLQOH
	 fLqBS7ZMPukLB9EuUdz1lvhkNdzBjvM91vrF++qqi8/rg1UG5XI77zBgW/pPVHFFXG
	 jblqYC2PumAuYoopy2kntuZl7jMfJ3wUPMhGxgz7rOWmVryzK/NqR4L1i+huGpr0+g
	 0kLMeogsgiPa//ULCrnFWmTNbO8t/H3mA7phLHIqm+YI3o6ke8l3A6ECoupqZjxPNz
	 /CIHsTq8ofRPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28A03608B0;
	Thu, 26 Nov 2026 07:17:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 89720260
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 07:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F6A2608B0
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 07:17:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CryKl2iAsqa6 for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 07:17:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 94290608AB
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1231"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1231; helo=mail-dl1-x1231.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=ZJKjF96B
Received: from mail-dl1-x1231.google.com (mail-dl1-x1231.google.com
 [IPv6:2607:f8b0:4864:20::1231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94290608AB
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 07:16:59 +0000 (UTC)
Received: by mail-dl1-x1231.google.com with SMTP id
 a92af1059eb24-14394530ec6so128966c88.1
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 23:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795677419; x=1796282219; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=5/VnM3WybgtR2x+CKB9ncXTw1VwxmO0xZGdL8TrJtCo=;
 b=ZJKjF96BraJPYk6GBq2os7E4SailpJg7UbeZ62+YF1KF4k8bnm6ESiqn+C9BuGxWdg
 Ql3IY5fo3G2BYx8NtPxvZe65GbqkZBckozG8SnrPMNSi21jPiFa/ttJVnwWxiSmGebXU
 1hxevD+EKwqZtaK8kyvQAqNVEuOl53u4ia1LvX17zU/QmWk31nVL5D0SZ4gc7AMmFUz3
 iNuCJI2aF3TLUAn+9D+wgfi5XsQBJTf8DFszdlZYOkif+IwDH2mE0vkkvzr2gn69JT2g
 sC6Jv2J288VGyuMb8mDdOKJloJFmQVhZcVra3O8Oz7irmuEB0QOVYVgwXit8/53YOJZ6
 LWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795677419; x=1796282219;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5/VnM3WybgtR2x+CKB9ncXTw1VwxmO0xZGdL8TrJtCo=;
 b=pUE+T4TkLBXiS1UDV9gkxkFWKWNL5q7OfyrXbZf8tLfjR7YhfCUkl3ldJ6x4/Fmrfh
 c3pvlHpEpBS+Hay03ZBY1yI9OcWuuO3PrgXCDhxIqSyL20pO9GuMEXK643zpXGhhgHNl
 XoRAqd2XxOtMobb6sabdZiMWqF3kWYh3RH2hqRwdtv/VTjrh3/FyHTcaWVBzoqNw9hlV
 Mf5Vj1yR8qbrmJNqsS81PgHwHxPkwDw5v9d8Z248TSltzdUNr5N99pbiHeuFkxYDDid0
 IBRccgEm+mpFBzQ8Saz6B6ytyg4Pmb98PnY6JHhsJuV+5Zu9BADv9WBnn360YXuPm2bf
 bmtQ==
X-Gm-Message-State: APuU4Z/qskp91FC3r1T3WTImkko/H5nvuhZCi2ZGgsb9TNDz0z70Cj0F
 rabgNEPaMwoPZTJZw5/HZWXEcsaVAggdv96lxSmGT73Nev0vMcqIvPYGMYge+A==
X-Gm-Gg: AZFdTZd4jFl3GO0NnsSoQ8wOhYuHmWReA+FEAe+q5SoNXSK5Vzfsh10XF43c/i2hy8N
 hL/K373hPBlgLUXlLbOcH47L7Yi8DgeePFt0W6u5FtlsUrItt0Bw7ZKQFuE9xva91LBo71RPE+q
 nPWepzmOCjNQTBFa9p9A+ZtJSk5MY9VoZVkFqmay/qM/yxp5Vf5cXU8b7t9JwB7ACfxyy7kaaUe
 Ds29hTBENHIA8Ed9UUk1FQN5SJMMrUuK2UbgPwVX51LgCD6RXb0GxFSmENOQ371NBLAzzR7DXzt
 kL2RioVAsO0WOUv27SvYUiqDt4S6OfAZDhvTo4cuT8GyzZXh2H7W26EGFA3OWpwx7aXzr4vu2KP
 L9yqXzYKaUPWaaAR/al1iAXD/5kv3GORpyrqru31a5FGtaZzmvNrf3P1zLAd66m6PlPePRwef6L
 xivE1qd2ZrrpKZM+qs46Z8k8wetrhpg3lft0TMSLYZDnPp4VB1GiZtjpRvULK3u1qUqj4o9zwiw
 JdW3IboYeFptA8zN1QkjjodMXpQyafqXfA5z//1Nk2a2rz62qP3MK2pgwnPdFOHL/Gd4bNZvFgZ
 PDOqOkzMdckMZ9rWYHVDoI4Pv4LmEcd2gE0Ihbk2wFJE6mbE41eicE6m2CxoSUmd
X-Received: by 2002:a05:701b:230b:b0:1b2:4da6:bccd with SMTP id
 a92af1059eb24-1b5568feaadmr16985197c88.34.1795677418930; 
 Wed, 25 Nov 2026 23:16:58 -0800 (PST)
Received: from fedora.taildae27b.ts.net
 ([2409:40e4:2045:e80e:4a6e:5538:6cfb:9bf5])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b5567ffa8csm55727510c88.7.2026.11.25.23.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 23:16:58 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Thu, 26 Nov 2026 12:46:52 +0530
Message-ID: <20261126071654.153422-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/htop: bump to version 3.5.3
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

For changelog, see:
https://github.com/htop-dev/htop/blob/3.5.3/ChangeLog

Tested using:
 utils/test-pkg -p htop
 (Result: 6 builds, 2 skipped, 0 build failed)

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/htop/htop.hash | 4 ++--
 package/htop/htop.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index 3d015c6a9d..56c9fde5b5 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,5 +1,5 @@
-# From https://github.com/htop-dev/htop/releases/download/3.5.1/htop-3.5.1.tar.xz.sha256
-sha256  526cecd62870aa8d14d2a79a35ea197e4e2b5317d275b567cee0574b2ddb2e9a  htop-3.5.1.tar.xz
+# From https://github.com/htop-dev/htop/releases/download/3.5.3/htop-3.5.3.tar.xz.sha256
+sha256  a8b164386494cb85bb255a415a3f5f80afe7a0c4491da5d113b3a0f951087e65  htop-3.5.3.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 313518d8b5..30d805a310 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTOP_VERSION = 3.5.1
+HTOP_VERSION = 3.5.3
 HTOP_SOURCE = htop-$(HTOP_VERSION).tar.xz
 HTOP_SITE = https://github.com/htop-dev/htop/releases/download/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
