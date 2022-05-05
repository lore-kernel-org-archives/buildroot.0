Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5DBC433EF
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 20:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD2CE404A0;
	Thu,  5 May 2022 20:24:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RRnCSRezdpkh; Thu,  5 May 2022 20:24:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4DF6404BF;
	Thu,  5 May 2022 20:24:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A7A901BF342
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 864324196C
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:24:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nfnKjM4vG06j for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 20:24:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F57D4196B
 for <buildroot@buildroot.org>; Thu,  5 May 2022 20:24:39 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-ed9a75c453so5323989fac.11
 for <buildroot@buildroot.org>; Thu, 05 May 2022 13:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yTlePSY8PuT1/VbvWTTWiJ0wj0zfIBFEgGfNuRT27yo=;
 b=oaIp7gMwv6K2U63D6cJKT01DaDIrifSywTnUjV6bwHuz8n4NUkFQrJjoF/U5OXnA7U
 fI3mWQ5aqA++RgW4tLHSRk3Pr7tYejXHAda43dhizbYXfwjU6/PFzxcwOF71R+ZmAAMd
 i2pFpN8uXeIlAq/bHw+9Tscx6pRs+1YXzeySbqjkIaUk6rb4znPkw4mT+vj/DbOZoLgc
 bK8fjJnAvfv9DDyEsFZ5EGSXk9ySvnnszbxhMtpE1LovS7kV9XoQDBjEId76BNVLfgSP
 xDJ8fHOog5z8rp/AIwH9hnjBeWgBNnhC9j4dn0zz6CO+C3E7lft9asllFvd4QnZOZyOO
 xF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yTlePSY8PuT1/VbvWTTWiJ0wj0zfIBFEgGfNuRT27yo=;
 b=sH7k4k9fqXKq0O1N6dRBr0cd7dW4qb8LHfpxZNFhmkDt9/LLx+dNkzTcdbWkfsCRFk
 nAFJ3TTcVMz2NAITQdDm/xmwWBXGDuKwkgRZHfD/NE+sSS4N7dQZZFbJOn1d/xrUhqNA
 mFJg3awETzI5rjGNOusM5kJrdJU+HOFA3VsAGduPOz50hSO647wWNn7xXyQuBGekgkeL
 QGl98y/0/bEqaYPQ8LzEUw8jCbEP6zdmK21Jg2/1GJBJyUnqqhlS5GJxonc2H69Q2GRQ
 8ZIubarjra6j/iWVJ9qSsojJ0v+CEAZH0mCF7986628G1KzvAFDKFscUHptLTulK2zYh
 l7sQ==
X-Gm-Message-State: AOAM533kFOYt1UGeV9z1miqln98dowPsfaZpc2k1O3ZB0XSEpC1tQGz+
 eXaEGZSJoj0SdzmDKvZh7P/6/FPB/w0=
X-Google-Smtp-Source: ABdhPJw2j+OaOLal0THBN3cVD8a0TGkTpl0kAC65BmoVYNAa8pCPRG3R5zNU3xTMNJn4zRj2nRR/VQ==
X-Received: by 2002:a05:6870:886:b0:ee:1abe:9a32 with SMTP id
 fx6-20020a056870088600b000ee1abe9a32mr1333760oab.112.1651782278168; 
 Thu, 05 May 2022 13:24:38 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 u7-20020a9d7207000000b0060603221268sm972736otj.56.2022.05.05.13.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 13:24:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  5 May 2022 14:24:36 -0600
Message-Id: <20220505202436.1058027-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/zchunk: fix symbol conflict
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport a patch to fix a symbol conflict issue.

Fixes:
 - http://autobuild.buildroot.net/results/225/22590a7038a40da3700d56c1f82f7dc74225702a

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...002-zck-declare-write_data-as-static.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/zchunk/0002-zck-declare-write_data-as-static.patch

diff --git a/package/zchunk/0002-zck-declare-write_data-as-static.patch b/package/zchunk/0002-zck-declare-write_data-as-static.patch
new file mode 100644
index 0000000000..3c48ab3d50
--- /dev/null
+++ b/package/zchunk/0002-zck-declare-write_data-as-static.patch
@@ -0,0 +1,34 @@
+From 477c4e891bd4d9e41fcbaa07cd1a37c0975df5cc Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Wed, 4 May 2022 16:32:48 -0600
+Subject: [PATCH] zck: declare write_data as static
+
+This needs to be declared static to avoid a symbol conflict:
+io.c:(.text+0xe8): multiple definition of `write_data'; src/zck.p/zck.c.o:zck.c:(.text+0x1f4): first defined here
+
+Fixes:
+ - http://autobuild.buildroot.net/results/225/22590a7038a40da3700d56c1f82f7dc74225702a
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+477c4e891bd4d9e41fcbaa07cd1a37c0975df5cc]
+---
+ src/zck.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/zck.c b/src/zck.c
+index 7727479..83b2630 100644
+--- a/src/zck.c
++++ b/src/zck.c
+@@ -159,7 +159,7 @@ static error_t parse_opt (int key, char *arg, struct argp_state *state) {
+ 
+ static struct argp argp = {options, parse_opt, args_doc, doc};
+ 
+-void write_data(zckCtx *zck, char *data, ssize_t in_size) {
++static void write_data(zckCtx *zck, char *data, ssize_t in_size) {
+     if(zck_write(zck, data, in_size) < 0) {
+         LOG_ERROR("%s", zck_get_error(zck));
+         exit(1);
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
