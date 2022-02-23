Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DD9C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 07:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 870BB4154B;
	Wed, 23 Feb 2022 07:53:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 59BOEro1LLJg; Wed, 23 Feb 2022 07:53:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5C9140183;
	Wed, 23 Feb 2022 07:53:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A38D1BF85D
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 07:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0ACB240149
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 07:53:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DfBSXy-9Vfx2 for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 07:53:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F210640183
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 07:53:26 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id r13so27539187ejd.5
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 23:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x+SUwuzYRfVs89wyroamWNndIpidl735tC8vLRclSWI=;
 b=XoQJ8P4qIykOOVmxZYbOj92zN6BLTiJLIzXJfbeKtWbyb+6o4C2q1D5+SMi6z1BWxd
 8ButMtTGcabeyAgOeGt5KRPn/7dM9WlLiN7WjR/Ic9uXF5Y521taySI95ZqUDot9ACfv
 MjgKd9XMy42aUGOyGJiWaoFDJ4zNhZFJ4QNm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x+SUwuzYRfVs89wyroamWNndIpidl735tC8vLRclSWI=;
 b=vZmY7w2LZG9DWZSBMPpjC9ckVUBs2XzVq28UkReIcz3p6FlwrJAoQt/iTwx3+iXZ19
 xE5w3lu2Y+GDtGq17+s1q4CGUPB2155D9esCuS8cxaJ7kdWHZHoFaqG9iAUrMc3vKsRq
 rMT7qN5T2mxQ6S3tMmWGteXXh/v4/SyFkA0gV+MtdFdAW8GCR94io8KiGt4bgFpKUT94
 3wCWvmSXHmrTRh9cmS4ARCw/VXEZ7IwcM2YgUCwKyS+HMteiQjaOdFi6Ka9QE/+/e42D
 36eubm3Xupx44b19dpnCgFNUqSeJPkWIoEozjnCBzI6PjgWYcTUqYgglA3gBGMNP+O1f
 4ONg==
X-Gm-Message-State: AOAM531LElbRNnjZ514u2FkgfqT2Dk26adfWDxPfGLRM4agHRRppuhMb
 v4/akxHnxTlY+jNED5KwNRU4hafxYJQp0J5E
X-Google-Smtp-Source: ABdhPJw+FETYASkOrBsKc+4BIAVr7SG5RcZ5xTnRosCmbjddzMN1BfCG6KZT9zYfPrUDF+ZI9F7F3A==
X-Received: by 2002:a17:906:f2cc:b0:6ce:7164:ac9a with SMTP id
 gz12-20020a170906f2cc00b006ce7164ac9amr21629514ejb.629.1645602804734; 
 Tue, 22 Feb 2022 23:53:24 -0800 (PST)
Received: from localhost.localdomain (host185127038042.static.fidoka.tech.
 [185.127.38.42])
 by smtp.gmail.com with ESMTPSA id v5sm11232283edb.15.2022.02.22.23.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 23:53:24 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 23 Feb 2022 08:53:22 +0100
Message-Id: <20220223075322.3044754-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/mono: bump to version 6.12.0.122
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/mono/mono.hash | 2 +-
 package/mono/mono.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mono/mono.hash b/package/mono/mono.hash
index 2477e9231c..ad070bf102 100644
--- a/package/mono/mono.hash
+++ b/package/mono/mono.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256 51de5c02ad511333f93ff585bca54c8784de35af4ff27b759d16b46c4402cdac  mono-6.12.0.90.tar.xz
+sha256 29c277660fc5e7513107aee1cbf8c5057c9370a4cdfeda2fc781be6986d89d23  mono-6.12.0.122.tar.xz
 sha256 923c7053ad0d430cd9b0b69a0ccf3abb7170a1ce50ecbf01915b565a35823d10  LICENSE
 sha256 fc488f3ec9f36856bea8cce5cdde1449176341ef93a3962b691970f8981799f4  mcs/COPYING
 sha256 2c3c3ef532828bcd42bb3127349625a25291ff5ae7e6f8d42e0fe9b5be836a99  external/Newtonsoft.Json/Tools/7-zip/copying.txt
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 27f7886224..219effc5d3 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONO_VERSION = 6.12.0.90
+MONO_VERSION = 6.12.0.122
 MONO_SITE = http://download.mono-project.com/sources/mono
 MONO_SOURCE = mono-$(MONO_VERSION).tar.xz
 MONO_LICENSE = GPL-2.0 or MIT (compiler, tools), MIT (libs) or commercial
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
