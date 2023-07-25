Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EC6C0015E
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 13:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3056681FCD;
	Tue, 25 Jul 2023 13:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3056681FCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0n9jlYGer-Zz; Tue, 25 Jul 2023 13:51:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3998481FC6;
	Tue, 25 Jul 2023 13:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3998481FC6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 711D81BF84C
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5517481FC6
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5517481FC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PywFEZKuZQXE for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 13:51:15 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C79081F06
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 13:51:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C79081F06
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fba8e2aa52so54947175e9.1
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 06:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690293073; x=1690897873;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0uD4/HQVRti48pA7sF++7kTPu4VD7hStEvyJexuGPgQ=;
 b=P2ktnB2dcouzqItmiq2EAmGupqs/HpscAwrIi+PnBrMCjxDMcwTLcNJRVPWTdaUGkf
 3umpPSPO4dMHZ1Xmk05EGtzzPdnNl/KAbPJbx2o3MJn2YePBGDFmwPy9WK/5wOAyw3+M
 djNNt/8xUMFW6Tdg7lPQGeOgPXKldBNBnlkfJILD1kOeuBDGwT7XqR55j+n5suXFhzcK
 MItN/4JSbezWfZAFm81NJniGcmN+/OzBzaJja9GhVyHGlXDLqWbH7EF+n0ABdEunwwMn
 wahb0hnjDiEKbzHSH5m49ut5MrkcEBvcVWNxT66HyHEENXgLNWBUQRRT7KC1DYaR8asC
 JmFA==
X-Gm-Message-State: ABy/qLaXbHteR9AjlNt7fs+oQTzUoeugsiBEOYWqBotvm4LlA0nrmNRl
 QSO2wUIO2DJI8Z3TrvwVoSEjZ0CvdYCsWkWYafY=
X-Google-Smtp-Source: APBJJlHe4lGZ+ZbPjUw1wf+nHJSWdMm5Zgk18DycCG597ivgCP5wZy1oy+fZM3mdR6IZnfJnAZIsaQ==
X-Received: by 2002:a05:600c:2814:b0:3fc:92:73d6 with SMTP id
 m20-20020a05600c281400b003fc009273d6mr10667816wmb.11.1690293073347; 
 Tue, 25 Jul 2023 06:51:13 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:5384:6b50:e537:2825:8aee:d1db])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a5d6150000000b00313e59cb371sm16604581wrt.12.2023.07.25.06.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 06:51:13 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 15:50:55 +0200
Message-Id: <20230725135105.536310-1-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1690293073; x=1690897873;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0uD4/HQVRti48pA7sF++7kTPu4VD7hStEvyJexuGPgQ=;
 b=Vb3LUgNRf3gWC5PTYq2rFJ7v7FQrrye1hff0MKgxLlz+w9RWG/l5lwmJVdli/j2ndz
 vJ+IGii8CJK4MHZOE64VfUAAjHksA5+DsWbc2FNpuUEG0Qck9CVzFyfbp1RNZ6Ddx/h4
 KWuMunEBwx8zDNqVJk71Mz0g2hCS5n3JnwRAHIGyok2BD5XDEFx+MfHQBSR14YJmgy7f
 l+L3RAS0AAf8SmO3GtWWnvhDu6obTGt3gR8JsPh0JolMCmHZafAaBl5TNnDo+K38LnfF
 fwvKOcTW0yw6rn9HvHZqMl2XRIRHfxrD1PutWqhqpL6PHlLqDuK+D9Ck92e5NhrZ93VE
 vShg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=Vb3LUgNR
Subject: [Buildroot] [PATCH 0/9] Add support for Rusticl in mesa3d
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

This series of patches adds everything necessary to be able to compile
Rusticl inside of mesa3d. It was successfully tested on a Khadas VIM3
board with a Mali-G52 GPU using mesa's Gallium panfrost driver. The
requirements can be found on its documentation website[1].

We need opencl-icd-loader as an additional package since the Rusticl
library will be installed as libRusticlOpenCL.so. The opencl-icd-loader
package will provide a libOpenCL.so file that can capture the OpenCL API
calls and forward them to the correct implementation. The available
OpenCL providers can be configured by creating a file in
/etc/OpenCL/vendors/[2]. In order to build this package we also need the
C language OpenCL headers which are not yet included in Buildroot since
for now we only have the C++ headers (opencl-clhpp).

The package opencl-icd-loader is included as a dependency in mesa3d as
it needs to be present in the sysroot before packages depending on
libopencl are built.

We need to make the Rust compiler known to the meson infrastructure
since it will abort the build of a Rust package if it isn't found. We
also need to add support for cross compilation in the
cross-compilation.conf.in template file and add a regex so that the
compiler and linker are properly inserted.

[1] https://docs.mesa3d.org/rusticl.html
[2] https://github.com/KhronosGroup/OpenCL-ICD-Loader#registering-icds

Romain Naour (7):
  package/rust-bindgen: new host package
  package/llvm-project/llvm: add llvm dump support
  package/pkg-meson.mk: add rust cross-compiler support
  package/spirv-headers: new package
  package/spirv-tools: new package
  package/spirv-llvm-translator: add target variant to provide
    LLVMSPIRVLib
  package/mesa3d: add experimental RustiCL support

Sebastian Weyer (2):
  package/opencl-headers: new package
  package/opencl-icd-loader: new package

 DEVELOPERS                                    |  5 +++
 package/Config.in                             |  5 +++
 package/llvm-project/llvm/Config.in           |  6 +++
 package/llvm-project/llvm/llvm.mk             |  7 ++++
 package/mesa3d/Config.in                      | 19 ++++++++-
 package/mesa3d/mesa3d.mk                      | 20 ++++++++-
 package/opencl-headers/Config.in              |  7 ++++
 package/opencl-headers/opencl-headers.hash    |  3 ++
 package/opencl-headers/opencl-headers.mk      | 42 +++++++++++++++++++
 package/opencl-icd-loader/Config.in           | 12 ++++++
 .../opencl-icd-loader/opencl-icd-loader.hash  |  3 ++
 .../opencl-icd-loader/opencl-icd-loader.mk    | 19 +++++++++
 package/pkg-meson.mk                          | 13 ++++++
 package/rust-bindgen/rust-bindgen.hash        |  3 ++
 package/rust-bindgen/rust-bindgen.mk          | 17 ++++++++
 package/spirv-headers/Config.in               |  6 +++
 package/spirv-headers/spirv-headers.hash      |  2 +
 package/spirv-headers/spirv-headers.mk        | 15 +++++++
 package/spirv-llvm-translator/Config.in       | 22 ++++++++++
 .../spirv-llvm-translator.mk                  | 13 +++++-
 package/spirv-tools/Config.in                 | 12 ++++++
 package/spirv-tools/spirv-tools.hash          |  2 +
 package/spirv-tools/spirv-tools.mk            | 22 ++++++++++
 support/misc/cross-compilation.conf.in        |  2 +
 24 files changed, 274 insertions(+), 3 deletions(-)
 create mode 100644 package/opencl-headers/Config.in
 create mode 100644 package/opencl-headers/opencl-headers.hash
 create mode 100644 package/opencl-headers/opencl-headers.mk
 create mode 100644 package/opencl-icd-loader/Config.in
 create mode 100644 package/opencl-icd-loader/opencl-icd-loader.hash
 create mode 100644 package/opencl-icd-loader/opencl-icd-loader.mk
 create mode 100644 package/rust-bindgen/rust-bindgen.hash
 create mode 100644 package/rust-bindgen/rust-bindgen.mk
 create mode 100644 package/spirv-headers/Config.in
 create mode 100644 package/spirv-headers/spirv-headers.hash
 create mode 100644 package/spirv-headers/spirv-headers.mk
 create mode 100644 package/spirv-llvm-translator/Config.in
 create mode 100644 package/spirv-tools/Config.in
 create mode 100644 package/spirv-tools/spirv-tools.hash
 create mode 100644 package/spirv-tools/spirv-tools.mk

--
2.34.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
