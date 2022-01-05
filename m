Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1177C433EF
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 18:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87FFC82F8B;
	Wed,  5 Jan 2022 18:08:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R7HYIieuZdsc; Wed,  5 Jan 2022 18:08:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1D1182F11;
	Wed,  5 Jan 2022 18:08:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B5061BF47E
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 18:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48ADD40908
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 18:08:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id liR8yvWQ0Hdv for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 18:08:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15B6640347
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 18:08:51 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id q8so4136811wra.12
 for <buildroot@buildroot.org>; Wed, 05 Jan 2022 10:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mgwPYf3yfQPXuT0XvpEdVYKSf0+zmVGzS3xRcdgioBQ=;
 b=I6l6tiRP3CxyMDWyHNEkkidNeCG+75dUJikMdpnf+6zS+B3BBfJR8utNEtU7RnVskk
 hz2BUdMi6tCQX6uFzSITvFMtvOSi9kZgk7C8zzkvTTfra+MQwPLiC6AU9qA5vQsJrl3H
 rS7Fo9FeJpHIoWibKj/OqGWQIcdWuMW262q/qhjbXX+2g01j3kCgpQYuWdwjxAVidqQp
 p3MuYJmY/GCEOkHOND5CLTnjmD0xZddkQXIsn/PLn8E4R103wK3dECRwI41Qtn9fX2i0
 j9a1w8ws3glOMgm9obxqotU7WGXR+SZ8JuFp7GpQE2wC920dFpbcaA2bSk94hk3glwiv
 Lcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mgwPYf3yfQPXuT0XvpEdVYKSf0+zmVGzS3xRcdgioBQ=;
 b=hNN3fTWJZvJsJIR8BzIRNTS9C45LQw/Ix3EtrHGeiZyws/ZBwFGnKd57Yg+xljX+cS
 FUocW50JZyka1BWxqruOOJsyLEMOCRI71RUmZVd7j0rdrKRysQKTzrQvrok5Z6TU4jFu
 pH+tqozG77GyDUngmuCCRaiQCdbC7Law6126kpM5L71cJcaO2EXefnkajIxnTz8euU/Y
 Lj2g4SBdltOJ2TMne/19zZgVPgOysqJ/rQp+9glVI94atQuShI+AbkCPbWn6QAEtzmEj
 UCtRd6ewOhRzNrsz4Lppsi+YC5HYCwu6qSEuhUEiTcXMyLgAQhXdWZN5pj/5fZ2FGWPa
 FqGw==
X-Gm-Message-State: AOAM531/hhneh9Z7+++ewpj9euMcFgKX+TbDuNc2DbzX9xASnqf6TZ73
 CJfdG98W/HMQ4BeXhJgbbHjjHO04Vv0=
X-Google-Smtp-Source: ABdhPJyLgrPDSbyULUNnrfvZ9C076onAN7VxT46xFADR3z5H/YXEvkxvKTm4aB8VFJi7joVkfJ159w==
X-Received: by 2002:a05:6000:1449:: with SMTP id
 v9mr47718102wrx.49.1641406129322; 
 Wed, 05 Jan 2022 10:08:49 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id o38sm3381529wms.11.2022.01.05.10.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 10:08:49 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  5 Jan 2022 19:07:51 +0100
Message-Id: <20220105180751.388943-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/xxhash: fix uclibc build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following uclibc build failure raised since bump to version
0.8.1 in commit 5dbdb2535c649ee617595b8c4ae3cbba0ee37b97:

/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-uclibc/10.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: xxhash.o: in function `XXH3_hashLong_128b_internal.constprop.0':
(.text+0xcbc): undefined reference to `static_assert'

Fixes:
 - http://autobuild.buildroot.org/results/559/5595b21a711b482b84e582fc9f56e5468c9eb6d6/build-end.log

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...nd-on-assert-h-for-XXH_STATIC_ASSERT.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/xxhash/0003-do-no-longer-depend-on-assert-h-for-XXH_STATIC_ASSERT.patch

diff --git a/package/xxhash/0003-do-no-longer-depend-on-assert-h-for-XXH_STATIC_ASSERT.patch b/package/xxhash/0003-do-no-longer-depend-on-assert-h-for-XXH_STATIC_ASSERT.patch
new file mode 100644
index 0000000000..3b65ae1d6c
--- /dev/null
+++ b/package/xxhash/0003-do-no-longer-depend-on-assert-h-for-XXH_STATIC_ASSERT.patch
@@ -0,0 +1,29 @@
+From 6189ecd3d44a693460f86280ccf49d33cb4b18e1 Mon Sep 17 00:00:00 2001
+From: Yann Collet <cyan@fb.com>
+Date: Sun, 26 Dec 2021 15:15:26 -0800
+Subject: [PATCH] do no longer depend on `<assert.h>` for XXH_STATIC_ASSERT
+
+since some versions are buggy.
+
+Use `_Static_assert` instead, which is part of the C11 language.
+[Retrieved from:
+https://github.com/Cyan4973/xxHash/commit/6189ecd3d44a693460f86280ccf49d33cb4b18e1]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ xxhash.h | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/xxhash.h b/xxhash.h
+index 311a69c7..5dfd5c45 100644
+--- a/xxhash.h
++++ b/xxhash.h
+@@ -1749,8 +1749,7 @@ static void* XXH_memcpy(void* dest, const void* src, size_t size)
+ /* note: use after variable declarations */
+ #ifndef XXH_STATIC_ASSERT
+ #  if defined(__STDC_VERSION__) && (__STDC_VERSION__ >= 201112L)    /* C11 */
+-#    include <assert.h>
+-#    define XXH_STATIC_ASSERT_WITH_MESSAGE(c,m) do { static_assert((c),m); } while(0)
++#    define XXH_STATIC_ASSERT_WITH_MESSAGE(c,m) do { _Static_assert((c),m); } while(0)
+ #  elif defined(__cplusplus) && (__cplusplus >= 201103L)            /* C++11 */
+ #    define XXH_STATIC_ASSERT_WITH_MESSAGE(c,m) do { static_assert((c),m); } while(0)
+ #  else
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
