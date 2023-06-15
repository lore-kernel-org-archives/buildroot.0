Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A21AEB64D9
	for <buildroot@archiver.kernel.org>; Thu, 15 Jun 2023 13:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E9EC40B8A;
	Thu, 15 Jun 2023 13:45:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E9EC40B8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FNvEHVZhuf9n; Thu, 15 Jun 2023 13:45:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FD6A4059E;
	Thu, 15 Jun 2023 13:45:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FD6A4059E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EFBB41BF30B
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 13:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9C4C60A47
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 13:43:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9C4C60A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hkNPfDO6pm7U for <buildroot@lists.busybox.net>;
 Thu, 15 Jun 2023 13:43:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D238607C7
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D238607C7
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 13:43:52 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-30fcde6a73cso2512633f8f.2
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 06:43:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686836630; x=1689428630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qa3LgdE4JPqEG3p7GMjC3H2C0Ax9UD165HHsMRqfPAA=;
 b=huQ1jiL+DQObyk1nU52TosvR0qJXIQa5NWEijziDA/9HXR57/HakJnOgI/GX/6zw9H
 WOtig92Pv2cP1C7iGZ70pPgNMVEoX6YhrdodzqUK/U+dbd++ofl2TY8HauoYxeuUSZWC
 avUWOUA9bmCwTKiAbltIWhxAXq4ba9F9M0nrMpqQ04Lrvtv8o73XPtu9VBy/fk7NpinD
 LMmQcBELOXG+SS8qRzlDjvZDmb28aTKBkhoPTKUydZ/pizT9L/XYwLdvPVCr4X1UUaOD
 jXMWqAZ+UwbJu43C+QgP5e2DzbQeUxp0SCABiI99JnC0luviKmBtr9JybaJ2BModL148
 9ceA==
X-Gm-Message-State: AC+VfDzr1jzHiHTzvBLK7fozm2iEf5XaMBUiZuSlht+20aphTpdysYEl
 Zqw51yfVMszs1761COjpB3o871mYcpZDYqEafo8=
X-Google-Smtp-Source: ACHHUZ5tByHJ4KSlF4iNIjwjBsw2nuLNjvS5YyoIgdg8rFcYMQltbFqUoW+PNtT4f+34ZTA9W1R4DA==
X-Received: by 2002:adf:f1c3:0:b0:30a:d7a7:3db4 with SMTP id
 z3-20020adff1c3000000b0030ad7a73db4mr9188883wro.12.1686836630473; 
 Thu, 15 Jun 2023 06:43:50 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:5384:6b50:31f3:6562:63d2:17f])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a5d6a0b000000b0030b5d203e7esm21129602wru.97.2023.06.15.06.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 06:43:50 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 15 Jun 2023 15:43:10 +0200
Message-Id: <20230615134315.494330-7-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230615134315.494330-1-sebastian.weyer@smile.fr>
References: <20230615134315.494330-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1686836630; x=1689428630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qa3LgdE4JPqEG3p7GMjC3H2C0Ax9UD165HHsMRqfPAA=;
 b=ETFNuD2VppthkX/efWlZgfze83v37A4BQTB5EQ6t1LxTUG5YrOdjAOIzUGZ48UTyn6
 RTrwacsQ5b0eECeXmVDPdgFhwOMzhuKuSZ3bZKYBDGYk3WYc3ka9Snzg+rm6rWGIIW80
 YfUrYqdM3dB0EY+xJnbe33G7WusuZqMkVCqYsWzYZxi+A7zvv6Gw3qUrhn06RhbMG4G1
 1aldh9rZDMBHev3XIIEtd0mCh6w2q5Tgy3gwalhTs0YM9beUL+ZeZLWdhCz3MlLjRIjC
 7FauGXQIBgZDqKqJvtRc6PzulddYOsxZv1IlAl4GWqze3O5ujWLBzvSYe2x/ugRph+rN
 pgLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=ETFNuD2V
Subject: [Buildroot] [PATCH v4 06/10] package/libclc: move to llvm-project
 subfolder
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
Cc: Lang Daniel <d.lang@abatec.at>, Romain Naour <romain.naour@smile.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Sebastian Weyer <sebastian.weyer@smile.fr>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Lang Daniel <d.lang@abatec.at>

To make version bumping easier, move libclc to a new llvm-project subfolder
and specify site for the project. Since the version of libclc is more
recent than the version specified in LLVM_PROJECT_VERSION, don't change
it for now until a later update.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
v4: change inaccuracies in commit message
    - move llvm -> move libclc
    - libclc version is not specified through LLVM_PROJECT_VERSION since
      it is already at version 13.0.1 as opposed to version 11.1.0

v3: move libclc before llvm 15.0.3 version bump commit
    move libclc entry in package/Config.in
---
 DEVELOPERS                                                    | 4 ++--
 package/Config.in                                             | 2 +-
 .../libclc/0001-support-out-of-tree-build.patch               | 0
 package/{ => llvm-project}/libclc/Config.in                   | 0
 package/{ => llvm-project}/libclc/libclc.hash                 | 0
 package/{ => llvm-project}/libclc/libclc.mk                   | 2 +-
 6 files changed, 4 insertions(+), 4 deletions(-)
 rename package/{ => llvm-project}/libclc/0001-support-out-of-tree-build.patch (100%)
 rename package/{ => llvm-project}/libclc/Config.in (100%)
 rename package/{ => llvm-project}/libclc/libclc.hash (100%)
 rename package/{ => llvm-project}/libclc/libclc.mk (93%)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1fb8295a7a..48907a5cd8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2532,12 +2532,12 @@ F:	package/irrlicht/
 F:	package/liblinear/
 F:	package/lensfun/
 F:	package/libbpf/
-F:	package/libclc/
 F:	package/libgta/
 F:	package/libiec61850/
 F:	package/libspatialindex/
 F:	package/linux-syscall-support/
 F:	package/llvm-project/clang/
+F:	package/llvm-project/libclc/
 F:	package/llvm-project/llvm/
 F:	package/lugaru/
 F:	package/mcelog/
@@ -2947,8 +2947,8 @@ F:	package/tinyssh/
 
 N:	Valentin Korenblit <valentinkorenblit@gmail.com>
 F:	package/clinfo/
-F:	package/libclc/
 F:	package/llvm-project/clang/
+F:	package/llvm-project/libclc/
 F:	package/llvm-project/llvm/
 
 N:	Vanya Sergeev <vsergeev@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 17343a8e86..42cf0b170e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2065,7 +2065,6 @@ menu "Other"
 	source "package/libcap/Config.in"
 	source "package/libcap-ng/Config.in"
 	source "package/libcgroup/Config.in"
-	source "package/libclc/Config.in"
 	source "package/libcofi/Config.in"
 	source "package/libcorrect/Config.in"
 	source "package/libcrossguid/Config.in"
@@ -2128,6 +2127,7 @@ endif
 	source "package/liquid-dsp/Config.in"
 	source "package/llvm-project/clang/Config.in"
 	source "package/llvm-project/compiler-rt/Config.in"
+	source "package/llvm-project/libclc/Config.in"
 	source "package/llvm-project/llvm/Config.in"
 	source "package/lttng-libust/Config.in"
 	source "package/matio/Config.in"
diff --git a/package/libclc/0001-support-out-of-tree-build.patch b/package/llvm-project/libclc/0001-support-out-of-tree-build.patch
similarity index 100%
rename from package/libclc/0001-support-out-of-tree-build.patch
rename to package/llvm-project/libclc/0001-support-out-of-tree-build.patch
diff --git a/package/libclc/Config.in b/package/llvm-project/libclc/Config.in
similarity index 100%
rename from package/libclc/Config.in
rename to package/llvm-project/libclc/Config.in
diff --git a/package/libclc/libclc.hash b/package/llvm-project/libclc/libclc.hash
similarity index 100%
rename from package/libclc/libclc.hash
rename to package/llvm-project/libclc/libclc.hash
diff --git a/package/libclc/libclc.mk b/package/llvm-project/libclc/libclc.mk
similarity index 93%
rename from package/libclc/libclc.mk
rename to package/llvm-project/libclc/libclc.mk
index 5d246cf4f8..406adfdb53 100644
--- a/package/libclc/libclc.mk
+++ b/package/llvm-project/libclc/libclc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCLC_VERSION = 13.0.1
-LIBCLC_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LIBCLC_VERSION)
+LIBCLC_SITE = $(LLVM_PROJECT_SITE)
 LIBCLC_SOURCE = libclc-$(LIBCLC_VERSION).src.tar.xz
 LIBCLC_LICENSE = Apache-2.0 with exceptions or MIT
 LIBCLC_LICENSE_FILES = LICENSE.TXT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
