Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C495CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 21:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5270E409F8;
	Sun, 27 Mar 2022 21:16:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I4DkGlRXaDMC; Sun, 27 Mar 2022 21:16:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E54F409E4;
	Sun, 27 Mar 2022 21:16:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A47A91BF375
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 21:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F75A84143
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 21:16:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WnY042EqB65A for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 21:16:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8218F82538
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 21:16:32 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id t11so17753414wrm.5
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 14:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=65ZbuO31s0GNE022dMjojvj0Ac5X0FTYbzOd0LaArUc=;
 b=NFfEa65TVgnAMiPFNqwnCGUqjoePUtR9RIJZNHiayf55cQDVqD0svjCNP0iL94LgyY
 r3ZIPt63AC9dRmUQ6K8hat+pS/ZxfZN7vX1SYXajDNWe5PDnM1kMQSqrKfnSXi/KvlnN
 Ur4X+kezcrZ2KZomzHYr8nxPhf8hDhU6PxBL8bENQJwfaZxwm4rJv6joydgr3b0nKhkN
 ywRh14S+rnfgjZOwUEfTUc+OlO0GEDdkV7B3bBWWVqf9IH2u9vkV/3BhCBze4cja3BbL
 2vb8/hflB/ug0ETlEYCy+W7anP0glO25SxapMBeh0BKiZJBAZbHvkWj1+BZ4yCccIDTa
 BbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=65ZbuO31s0GNE022dMjojvj0Ac5X0FTYbzOd0LaArUc=;
 b=L100lzv6AZOcBGPM5QT/FcvuroQhu3JMyeqoFi4HWdS7H5FT8tvLs8wiZLzZzm9/kb
 0tRP8aFNFGRdMWtZ602gKCqUkShnTfb3u7BN24zOKvJZdEhL5yM5xKxAB3IkwXXbXwmN
 Vg8OUGIslC/cTjMXjLqdnzwvnDYpI0240+GLVFrCeHWvijHtdarAnUjWeOHa7Osa+i6z
 CtBtbJHjAcz6/plBjaztwibG3UkibV/IbGkEnatfRz+Oob4/iysYIZfXLipvEj6mDTs6
 /HT9/J+xslTx305ScG2vTBXN2G5pQ1xj/l1ABtB9EzqOMD6Xac4NIxkh+UviCQ+xtrid
 tHAA==
X-Gm-Message-State: AOAM531wwxGdNyEoeaGo1LKI7o5Yi5FqneH62KxVqehMe/w24NWuj4oX
 95xXfHa+onnpaDteRf8jJn54Hcl0NHQ=
X-Google-Smtp-Source: ABdhPJzdAWgZCCibYtC9oAPDuM4zBtMfS7oK7PxlHakiqSUVJnQRo6GgGOAD0fSiDy2aB+8E4GYE5Q==
X-Received: by 2002:a05:6000:1862:b0:204:e417:9cf8 with SMTP id
 d2-20020a056000186200b00204e4179cf8mr19502350wri.593.1648415790446; 
 Sun, 27 Mar 2022 14:16:30 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-431-100.w2-10.abo.wanadoo.fr.
 [2.10.255.100]) by smtp.gmail.com with ESMTPSA id
 v13-20020adfe28d000000b0020375f27a5asm10803530wri.4.2022.03.27.14.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 14:16:30 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 23:15:05 +0200
Message-Id: <20220327211505.1621268-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/netatalk: security bump to version
 3.1.13
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

- Fixes CVE-2021-31439, CVE-2022-23121, CVE-2022-23123, CVE-2022-23122,
  CVE-2022-23125, CVE-2022-23124 and CVE-2022-0194
- Drop second patch (already in version)
- Add tarball sha256
- Update indentation in hash file (two spaces)

https://sourceforge.net/projects/netatalk/files/netatalk/3.1.13

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...iple-def-of-invalid_dircache_entries.patch | 25 -------------------
 package/netatalk/netatalk.hash                |  7 +++---
 package/netatalk/netatalk.mk                  |  2 +-
 3 files changed, 5 insertions(+), 29 deletions(-)
 delete mode 100644 package/netatalk/0002-fix-ftbs-multiple-def-of-invalid_dircache_entries.patch

diff --git a/package/netatalk/0002-fix-ftbs-multiple-def-of-invalid_dircache_entries.patch b/package/netatalk/0002-fix-ftbs-multiple-def-of-invalid_dircache_entries.patch
deleted file mode 100644
index e7ccc52553..0000000000
--- a/package/netatalk/0002-fix-ftbs-multiple-def-of-invalid_dircache_entries.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 32df6e155ccfc83216321925273c3e75e631ebe6 Mon Sep 17 00:00:00 2001
-From: Andrew Bauer <zonexpertconsulting@outlook.com>
-Date: Wed, 22 Jan 2020 09:59:47 -0600
-Subject: [PATCH] fix ftbs multiple def of invalid_dircache_entries
-
-[Retrieved from:
-https://github.com/Netatalk/Netatalk/pull/125/commits/32df6e155ccfc83216321925273c3e75e631ebe6]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- etc/afpd/directory.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/etc/afpd/directory.h b/etc/afpd/directory.h
-index eb89c606..81bfa9cb 100644
---- a/etc/afpd/directory.h
-+++ b/etc/afpd/directory.h
-@@ -91,7 +91,7 @@ struct maccess {
- #define	AR_UWRITE	(1<<2)
- #define	AR_UOWN		(1<<7)
- 
--q_t *invalid_dircache_entries;
-+extern q_t *invalid_dircache_entries;
- 
- typedef int (*dir_loop)(struct dirent *, char *, void *);
- 
diff --git a/package/netatalk/netatalk.hash b/package/netatalk/netatalk.hash
index 6c3250a005..6dead5457c 100644
--- a/package/netatalk/netatalk.hash
+++ b/package/netatalk/netatalk.hash
@@ -1,6 +1,7 @@
-# From http://sourceforge.net/projects/netatalk/files/netatalk/3.1.12/
-md5 021d2330cb7f7cd2977aec46299dcc1b  netatalk-3.1.12.tar.bz2
-sha1 cc1fe1ebdbdb4da9cf82835c440e82ba28a832c5  netatalk-3.1.12.tar.bz2
+# From http://sourceforge.net/projects/netatalk/files/netatalk/3.1.13/
+md5  697421623c32ee0ab9c8076191766e5f  netatalk-3.1.13.tar.bz2
+sha1  16dd7fa84962a44b36b795b8c44393e728785947  netatalk-3.1.13.tar.bz2
 # Locally computed
+sha256  89ada6bcfe1b39ad94f58c236654d1d944f2645c3e7de98b3374e0bd37d5e05d  netatalk-3.1.13.tar.bz2
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
 sha256  7599ae145e53be03a08f8b558b2f2e0c828e1630f1843cc04f41981b8cefcd65  COPYRIGHT
diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 0c219a2316..7cc950beb6 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETATALK_VERSION = 3.1.12
+NETATALK_VERSION = 3.1.13
 NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk/$(NETATALK_VERSION)
 NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2
 # For 0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
