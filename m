Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3715DEB64D9
	for <buildroot@archiver.kernel.org>; Thu, 15 Jun 2023 13:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 940464052E;
	Thu, 15 Jun 2023 13:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 940464052E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zs7edN6ZM6iY; Thu, 15 Jun 2023 13:43:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 730DC404A5;
	Thu, 15 Jun 2023 13:43:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 730DC404A5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A58FC1BF30B
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 13:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B09C40422
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 13:43:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B09C40422
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HPDGwZCcHnlJ for <buildroot@lists.busybox.net>;
 Thu, 15 Jun 2023 13:43:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B7AC403CC
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B7AC403CC
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 13:43:38 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-30fc42fcbc7so3640362f8f.1
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 06:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686836615; x=1689428615;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aiW26eigwAlOV+cwlCM8cQtvAxndOGmvSqypTrP1Vdw=;
 b=lTJGlhY5Ew71EM6wkbOuFfPJGunxQPUfBg6LcqyTn+Yt+XU+xqbNTFRABy/w0AEFuN
 wt5DYqlnckkYmZytcaurbNJCCOWMoUumKyLPYQ7tQTPV7hy5xfVOm3sGmECIFJ3ovCJw
 6HiRLu5Lli9Nnv4hn9pve+mAJNy0ue8AWLtePvfU8V7NKlBvLrO/Gql2Dg2tDb7dtB5l
 oBE9NuFAjvkHIY8gYes0hp26EGS9Uu3YTCQXnDww1Yo/JTUeyQAHW+LAYgw56zgcUtkJ
 CLk/7+7mO0duVxNbu4DxKiL4JwksAtWVjgj1SmnzFSAmrYEgytFGrF70550i5g6jU4wM
 MLUw==
X-Gm-Message-State: AC+VfDzgSxbttuHpjsIgAmWIDVAsWapCaTqp61Cp6yRfkJ3DojhI6WOf
 nVFMxIl37qsxXE8hSC7lBfEqyoPJ09vsf09DAHo=
X-Google-Smtp-Source: ACHHUZ7Mz4JdZEUsST+J+v/ZHXPo15EEK3ZLtzK1dctSgIlaMDhGUSleA2UAWpzDnoMFyf574fFeOA==
X-Received: by 2002:a05:6000:110e:b0:309:5068:9ebe with SMTP id
 z14-20020a056000110e00b0030950689ebemr9995694wrw.50.1686836615419; 
 Thu, 15 Jun 2023 06:43:35 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:5384:6b50:31f3:6562:63d2:17f])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a5d6a0b000000b0030b5d203e7esm21129602wru.97.2023.06.15.06.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 06:43:34 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 15 Jun 2023 15:43:04 +0200
Message-Id: <20230615134315.494330-1-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1686836615; x=1689428615;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aiW26eigwAlOV+cwlCM8cQtvAxndOGmvSqypTrP1Vdw=;
 b=vnLP/Q/eLKNhQxA7q4YrI+mReRLfzLzf46by78pMbSaI8bKsDLHxu5ois2gl0QSx+w
 C22QMD5db+f5suF5Erg2Vh4Ndq6yKgRzZN+A6s3smL0cPkoK1XancSBGvGunEkQitezv
 kuHixDbSamlP0DiuvULl4gB/E+x1H4riykk3WtfbYZ2JCXy8pGeNzZWYQGKwPlXWobjo
 nbS5sHkWq0C0OYLXqlRNZU00NR92X4oMnq+HIbzIH/GsjLxGwaa1f5Z2KAD6QWRFk2aP
 U0W0T+mvtOKK5jjEV2p9+MwN+EyYvJTmvWrkmm9rRFeNBInoQmYkiGzgylAA0RP5W7J9
 AXUQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=vnLP/Q/e
Subject: [Buildroot] [PATCH v4 00/10] group llvm projects and bump to
 version 15.0.3
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series attempts two things:
- Move the different llvm subprojects into one folder
and share version and site information.

- Bump the version to the latest 15.0.3

Starting with version 12 different subprojects added
dependencies or sources that would be available when
building from the "monorepo". These have been added
as new host packages.

This update is needed in order to be able to use some packages in the
future as for example mesa3d's RustiCL.

v4:
- change some inaccurate commit messages
- bump spirv-llvm-translator version at the same time as other llvm
  packages
- remove package/llvm/0002-Add-missing-cstdint-header-to-Signals.h.patch
  as it has been integrated in the newer version

v3:
- move libclc before llvm 15.0.3 version bump commit
- force llvm-cmake and llvm-libunwind version to 15.0.3 since
  LLVM_PROJECT_VERSION is still at 11.1.0
- Keep cp as install command since there is no CMakefiles.txt
- llvm, clang, lld: keep LLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN since
  this option is still used to check C++17 compiler support:
  llvm/cmake/modules/CheckCompilerVersion.cmake


Changes v1 -> v2:
- Rebased onto current master
- Bump to 15.0.3 instead of 15.0.1
- llvm: use CMAKE_HOST_C_COMPILER instead of HOSTCC
- libclc: Add missing change to package/Config.in

Lang Daniel (10):
  package/llvm-project: new group for llvm packages
  package/llvm: move to llvm-project folder
  package/lld: move to llvm-project subfolder
  package/clang: move to llvm-project subfolder
  package/compiler-rt: move to llvm-project subfolder
  package/libclc: move to llvm-project subfolder
  package/llvm-project/llvm-cmake: new package
  package/llvm-project/llvm-libunwind: new package
  package/llvm-project: bump to version 15.0.3
  DEVELOPERS: add Daniel Lang for llvm-project

 DEVELOPERS                                    | 19 ++++++-----
 package/Config.in                             |  8 ++---
 package/Config.in.host                        |  2 +-
 ...hains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch |  0
 package/{ => llvm-project}/clang/Config.in    | 10 +++---
 package/{ => llvm-project}/clang/clang.hash   |  2 +-
 package/{ => llvm-project}/clang/clang.mk     | 15 +++-----
 .../{ => llvm-project}/compiler-rt/Config.in  |  6 ++--
 .../compiler-rt/compiler-rt.hash              |  2 +-
 .../compiler-rt/compiler-rt.mk                |  9 +++--
 .../0001-support-out-of-tree-build.patch      |  0
 package/{ => llvm-project}/libclc/Config.in   |  6 ++--
 package/{ => llvm-project}/libclc/libclc.hash |  2 +-
 package/{ => llvm-project}/libclc/libclc.mk   |  4 +--
 package/{ => llvm-project}/lld/Config.in.host |  6 ++--
 package/{ => llvm-project}/lld/lld.hash       |  2 +-
 package/{ => llvm-project}/lld/lld.mk         | 13 ++-----
 .../llvm-project/llvm-cmake/llvm-cmake.hash   |  2 ++
 package/llvm-project/llvm-cmake/llvm-cmake.mk | 17 ++++++++++
 .../llvm-libunwind/llvm-libunwind.hash        |  3 ++
 .../llvm-libunwind/llvm-libunwind.mk          | 18 ++++++++++
 package/llvm-project/llvm-project.mk          | 11 ++++++
 package/{ => llvm-project}/llvm/Config.in     | 10 +++---
 package/{ => llvm-project}/llvm/llvm.hash     |  2 +-
 package/{ => llvm-project}/llvm/llvm.mk       | 27 ++++++++-------
 .../llvm/0001-nfc-Fix-missing-include.patch   | 24 -------------
 ...-missing-cstdint-header-to-Signals.h.patch | 34 -------------------
 package/mesa3d/Config.in                      | 10 +++---
 .../spirv-llvm-translator.hash                |  2 +-
 .../spirv-llvm-translator.mk                  |  4 +--
 30 files changed, 126 insertions(+), 144 deletions(-)
 rename package/{ => llvm-project}/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch (100%)
 rename package/{ => llvm-project}/clang/Config.in (82%)
 rename package/{ => llvm-project}/clang/clang.hash (52%)
 rename package/{ => llvm-project}/clang/clang.mk (89%)
 rename package/{ => llvm-project}/compiler-rt/Config.in (87%)
 rename package/{ => llvm-project}/compiler-rt/compiler-rt.hash (50%)
 rename package/{ => llvm-project}/compiler-rt/compiler-rt.mk (82%)
 rename package/{ => llvm-project}/libclc/0001-support-out-of-tree-build.patch (100%)
 rename package/{ => llvm-project}/libclc/Config.in (73%)
 rename package/{ => llvm-project}/libclc/libclc.hash (51%)
 rename package/{ => llvm-project}/libclc/libclc.mk (92%)
 rename package/{ => llvm-project}/lld/Config.in.host (74%)
 rename package/{ => llvm-project}/lld/lld.hash (52%)
 rename package/{ => llvm-project}/lld/lld.mk (61%)
 create mode 100644 package/llvm-project/llvm-cmake/llvm-cmake.hash
 create mode 100644 package/llvm-project/llvm-cmake/llvm-cmake.mk
 create mode 100644 package/llvm-project/llvm-libunwind/llvm-libunwind.hash
 create mode 100644 package/llvm-project/llvm-libunwind/llvm-libunwind.mk
 create mode 100644 package/llvm-project/llvm-project.mk
 rename package/{ => llvm-project}/llvm/Config.in (88%)
 rename package/{ => llvm-project}/llvm/llvm.hash (52%)
 rename package/{ => llvm-project}/llvm/llvm.mk (94%)
 delete mode 100644 package/llvm/0001-nfc-Fix-missing-include.patch
 delete mode 100644 package/llvm/0002-Add-missing-cstdint-header-to-Signals.h.patch

--
2.34.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
