Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33EB1E748EA
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 22:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBA1183D4E;
	Sat, 30 Sep 2023 22:19:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBA1183D4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q34kJEYYzDfd; Sat, 30 Sep 2023 22:19:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 329ED83CE6;
	Sat, 30 Sep 2023 22:19:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 329ED83CE6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 916681BF5F5
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 22:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78E554168D
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 22:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78E554168D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MjJ3s2rgzrte for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 22:17:45 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B2E164168B
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 22:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2E164168B
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-31427ddd3fbso13952112f8f.0
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 15:17:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696112263; x=1696717063;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TW/PasOVD3I7cUPhHGwiBR6C4GhvGUS6n6l+ZRpOg2o=;
 b=ZpuDp2oGXr6NjfTY99GKZgcY9M36u1FS90beBF4wlaEcYjsnqWSQno3a992VkEeooc
 MIA/rkyDKDJ+x0c61gPuFeFwrxotPbyAs+EWD1iG5/jV8LmO0o2Kt9QfELtrgdyUWHz/
 bLk7efZybecWCJMImiX8aafWjov8nETwZ6D8Kgf/EMPYZzHP77eY/56J3nVzxVUr/ZqM
 wwJwCNyZ34opHJLpCZ3DjaBzEvkgEI8xjE7L4lC6PLNYMnPeeO3GHkBxSb8w9vW4kara
 DAVP3zq70NG+qm4vFtde4oNoda4uYX6ZHMrXH8QV403j9m6co1/8dBbDQbKlb1fEO7a0
 r0qw==
X-Gm-Message-State: AOJu0YxbEkacEUfGyLjrYcrD10Ty6EUq9mW6MmatZjC/8W669Z/AwoKG
 MnQDzLhjTi+TuO1RbEnQN5zBpU+h9M2Kb51mrCi1VA==
X-Google-Smtp-Source: AGHT+IEq19OSQorM3CoK/ltjLPOeSBFDYytjpPYwZRdNkV4/DZ8wgHcxhZb44aVKI5gGcWiE7FsW1A==
X-Received: by 2002:adf:f48f:0:b0:31f:ec06:204 with SMTP id
 l15-20020adff48f000000b0031fec060204mr6499690wro.52.1696112262794; 
 Sat, 30 Sep 2023 15:17:42 -0700 (PDT)
Received: from arnoutx1.home
 (2a01cb0404ad0b005ddb2bcd94e35264.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a5d4d0f000000b00324ae863ac1sm5681274wrt.35.2023.09.30.15.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 15:17:42 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 00:16:34 +0200
Message-ID: <20230930221727.1458825-11-arnout@mind.be>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230930221727.1458825-1-arnout@mind.be>
References: <20230930221727.1458825-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696112263; x=1696717063; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TW/PasOVD3I7cUPhHGwiBR6C4GhvGUS6n6l+ZRpOg2o=;
 b=Xyb/TrL5DuZyPmVgjCIS9s+12J47Wec5dA0M7eG8wOA+ddDNzxtN+bKArN0aLqmYbQ
 md1iwEv30wQVJcuuJsm3jY/j3sHLmmMy22oCN/cm6Tdz5YXws9FC/bjJogYxdnNlltB/
 NjTneMbnbW1Hy5EdiUKaiwUVdHB0J9qG8klDjcOZ49lWBtkcOFzD6/bDQO8HZov7iryl
 wmozTnPjFpiil3tJK5JD9fCL7sk3GbwJ9ak6uiMFnE5rz/PkEOaPXosP7QmAEeDdtChC
 r/y1gpV7WYRwB4f/Jesiv5n5CRD1bs/Gm3pbN2J/HcMCsxtSZ52eaJOKfYo+vxOwCnUD
 zqrw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Xyb/TrL5
Subject: [Buildroot] [PATCH 10/10] docs/manual: remove references to
 PKG_PYTHON_*_OPTS
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Signed-off-by : Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

These variables were removed. In addition, the text describing them
wasn't terribly useful. Just remove the sentences describing them.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 docs/manual/adding-packages-python.adoc | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/docs/manual/adding-packages-python.adoc b/docs/manual/adding-packages-python.adoc
index 500967f235..33dbfc30a5 100644
--- a/docs/manual/adding-packages-python.adoc
+++ b/docs/manual/adding-packages-python.adoc
@@ -135,25 +135,13 @@ therefore only use a few of them, or none.
   makes sense to use for distutils/setuptools based packages as
   flit/pep517 based packages do not pass these options to a +setup.py+
   script but instead pass them to +support/scripts/pyinstaller.py+.
-  For target distutils packages, the +PKG_PYTHON_DISTUTILS_BUILD_OPTS+
-  options are already passed automatically by the infrastructure.
 
 * +PYTHON_FOO_INSTALL_TARGET_OPTS+, +PYTHON_FOO_INSTALL_STAGING_OPTS+,
   +HOST_PYTHON_FOO_INSTALL_OPTS+ to specify additional options to pass
   to the Python +setup.py+ script (for distutils/setuptools packages)
   or +support/scripts/pyinstaller.py+ (for flit/pep517 packages) during
   the target installation step, the staging installation step or the
-  host installation, respectively. Note that the infrastructure is
-  automatically passing some options, defined in
-  +PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS+ or
-  +PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS+ (for target distutils
-  packages), +HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS+ (for host
-  distutils packages), +PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS+ or
-  +PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS+ (for target setuptools
-  packages), +HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS+ (for host
-  setuptools packages) and +PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS+ or
-  +PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS+ (for target flit/pep517
-  packages).
+  host installation, respectively.
 
 With the Python infrastructure, all the steps required to build and
 install the packages are already defined, and they generally work well
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
