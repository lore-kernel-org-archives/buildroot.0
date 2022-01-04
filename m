Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8F0C43219
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 22:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69B044098D;
	Tue,  4 Jan 2022 22:04:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PkEGvBxtVs0G; Tue,  4 Jan 2022 22:04:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1169B405E7;
	Tue,  4 Jan 2022 22:04:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B7A81BF855
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 22:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82EB04093B
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 22:03:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JImedQAQSSQz for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 22:03:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C4A5405E7
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 22:03:50 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id e5so78894458wrc.5
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 14:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yH3thwqTA5V04rxWsdk9FYFBQPgbKffyrYU3cIXwWtE=;
 b=SONJel82YNivgcvMsulJtXCPy3+ErerkNO8xkZjcZto3nQQEd2NI4wtiOgS3loHbez
 W2SbKZigFzw2bj/uGn1++eiYUyNkwbnjWTyEXFGZBxX+i/7wsNWMzlhHnYn04Nb/nApK
 k23uGecj6XU58cJijE6DdXr3nxebUisFQhOrhSvkvtBlHFBp3lVHTr758DsoOZ7J/Z4W
 MAuSH/EWBQcY3N+3kTUr8lSDKaSxZSuzM2Tn+lMThXkB/BCYiuGuzqkcYczibU3vgFwK
 IdTvbuHzsZSNCe2bjbeKGuCV8qCrvbU/skztZHOMUHPTUm1PSTKAynDrt4uE+YaB6cwv
 w5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yH3thwqTA5V04rxWsdk9FYFBQPgbKffyrYU3cIXwWtE=;
 b=G59QuaiPeUCcaBzUxiXp/n0ll6uGUNyI6qj8/Df17FA7ocdJRm79grFPyskcxNX+VZ
 dTXSkD6rQhDyR1XiGv+QsbB5v7Iro9vz4sTNWlLFWuwo9KhET+dRoCPzXXLPpij1nBSU
 RHTfJUp1QPykYud+zJZPa1n8o7xyLCSP2OSPhGNbC+vGQ8sYptA2myqrdDEEh+Gd6M3e
 njB/M7NPozVLVSvzYUvQkOMOWfZ14CkBWlp8coDU+KeB+N36zpb4TzAR4tips8ZjyhZp
 eOJ6LsAM3O0Ntnt973fjKCMGoXQHQPNRHwPnsk4RMmI1ZXY5SxXPR5DgWwg6fdw+v1Gh
 DtAQ==
X-Gm-Message-State: AOAM531t4ZA2cP5GHLO4cAjjGSlNQhYlojRwp7zhgDivAVdx//zGnlFs
 A2fAnO8yZsUETIwNpgcVtK+3QsY1SaM=
X-Google-Smtp-Source: ABdhPJwS3r44ajMKEMp+jXI+tT7Iy+d9PscG05IVhXHeexflA1TmNpONsuARZ/g3UHci9N/bhWtozA==
X-Received: by 2002:a5d:6088:: with SMTP id w8mr44968670wrt.85.1641333828214; 
 Tue, 04 Jan 2022 14:03:48 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id m5sm647543wml.14.2022.01.04.14.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 14:03:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Jan 2022 23:02:41 +0100
Message-Id: <20220104220245.3706221-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220104220245.3706221-1-fontaine.fabrice@gmail.com>
References: <20220104220245.3706221-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/6] package/libselinux: bump to version 3.3
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
Cc: Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Clayton Shotwell <clayton.shotwell@collins.com>,
 Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop third patch (already in version)
- Update indentation in hash file (two spaces)

https://github.com/SELinuxProject/selinux/releases/tag/3.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...s-getseuser.c-fix-build-with-gcc-4.8.patch | 47 -------------------
 package/libselinux/libselinux.hash            |  4 +-
 package/libselinux/libselinux.mk              |  2 +-
 3 files changed, 3 insertions(+), 50 deletions(-)
 delete mode 100644 package/libselinux/0003-libselinux-utils-getseuser.c-fix-build-with-gcc-4.8.patch

diff --git a/package/libselinux/0003-libselinux-utils-getseuser.c-fix-build-with-gcc-4.8.patch b/package/libselinux/0003-libselinux-utils-getseuser.c-fix-build-with-gcc-4.8.patch
deleted file mode 100644
index 645e84b236..0000000000
--- a/package/libselinux/0003-libselinux-utils-getseuser.c-fix-build-with-gcc-4.8.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 5c4ddfc88f0a7f10a5e9edddbdbe8e8ef1f9945e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 10 Jun 2021 07:38:02 +0200
-Subject: [PATCH] libselinux/utils/getseuser.c: fix build with gcc 4.8
-
-Fix the following build failure with gcc 4.8 which is raised since
-version 3.2 and
-https://github.com/SELinuxProject/selinux/commit/156dd0de5cad31e7d437c64e11a8aef027f0a691
-
-getseuser.c:53:2: error: 'for' loop initial declarations are only allowed in C99 mode
-  for (int i = 0; i < n; i++)
-  ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/37eb0952a763256fbf6ef3c668f6c95fbdf2dd35
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/SELinuxProject/selinux/pull/289]
----
- libselinux/utils/getseuser.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/utils/getseuser.c b/utils/getseuser.c
-index ce1b7b27..34f2e887 100644
---- a/utils/getseuser.c
-+++ b/utils/getseuser.c
-@@ -9,7 +9,7 @@ int main(int argc, char **argv)
- {
- 	char *seuser = NULL, *level = NULL;
- 	char **contextlist;
--	int rc, n;
-+	int rc, n, i;
- 
- 	if (argc != 3) {
- 		fprintf(stderr, "usage:  %s linuxuser fromcon\n", argv[0]);
-@@ -50,7 +50,7 @@ int main(int argc, char **argv)
- 	if (n == 0)
- 		printf("no valid context found\n");
- 
--	for (int i = 0; i < n; i++)
-+	for (i = 0; i < n; i++)
- 		printf("Context %d\t%s\n", i, contextlist[i]);
- 
- 	freeconary(contextlist);
--- 
-2.30.2
-
diff --git a/package/libselinux/libselinux.hash b/package/libselinux/libselinux.hash
index 797b978ee1..a2e0083f7b 100644
--- a/package/libselinux/libselinux.hash
+++ b/package/libselinux/libselinux.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 df758ef1d9d4811051dd901ea6b029ae334ffd7c671c128beb16bce1e25ac161 libselinux-3.2.tar.gz
+sha256  acfdee27633d2496508c28727c3d41d3748076f66d42fccde2e6b9f3463a7057  libselinux-3.3.tar.gz
 
 # Hash for license file
-sha256 86657b4c0fe868d7cbd977cb04c63b6c667e08fa51595a7bc846ad4bed8fc364 LICENSE
+sha256  86657b4c0fe868d7cbd977cb04c63b6c667e08fa51595a7bc846ad4bed8fc364  LICENSE
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 0f36db1cfd..c1e90130d2 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSELINUX_VERSION = 3.2
+LIBSELINUX_VERSION = 3.3
 LIBSELINUX_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSELINUX_VERSION)
 LIBSELINUX_LICENSE = Public Domain
 LIBSELINUX_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
