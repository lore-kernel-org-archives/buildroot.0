Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF06C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Apr 2022 11:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF14D41DEE;
	Mon, 18 Apr 2022 11:36:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vxxBtJDet1wt; Mon, 18 Apr 2022 11:36:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B426B408A4;
	Mon, 18 Apr 2022 11:36:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E8CE1BF38B
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 11:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AB4182FC9
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 11:36:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cpa-U05eQGsW for <buildroot@lists.busybox.net>;
 Mon, 18 Apr 2022 11:36:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2606B82FB1
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 11:36:49 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id g18so18241543wrb.10
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 04:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ML+63VEtvoXv+OlIBaL6LQL8t90ybzjho2LdLG+bqUM=;
 b=VVaaLibqSyq2RMZnn1LIhi8w6JStRAePITE+/oVCOJMjAMJ29ID2jCZ1y5RwNf9lfi
 5c0sdVVni0SxMkIVA/6S9rxidu4WD4otLHJwhwZkY0ddg+oGcNwvMVpQ8GhBDUXH5uoc
 uSCeD/JhcGGBpIL/uS1QI/bgAr1QAMC54j8NQ+s8UK6R6nWKnGmnpgl84XkKLY7veUP/
 HWX/MHSQAbsKaiCrT3RPdBXD6QQ31bW3UpFHZ0gFBg9U85OntTJkvTBdWr/CohftFQgp
 XwgzN1RYVdGNnipNzZTL2gdgtzeAnt545AePljnFzAh8wvbkB0Vng7hOi+QsuVYuhq4/
 xIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ML+63VEtvoXv+OlIBaL6LQL8t90ybzjho2LdLG+bqUM=;
 b=1OepYQN0gMdtfP6hccINCWxISuU2JdYrNXqUtiDbigVB9lKRIwPZ1JJKZust+Ym5rM
 NQzsOT24yus6EjD7ahuPMIWqSQLCIb+CA+8B688T4n2ZW4Tgciv5u5GP+kLgXPD0DfSR
 zm5NrdhbxwaPoYkRei1dAIHIKhZaY+sBHiCi7aRiIwsgWSpFFpILEMkkK2OIG2oLRvtO
 ELCJojk5XxG9nWjAPRosCRaYXSewMcSrN1KmQnaJi+kZVebeRo2KxNZg30On73wTxDnh
 Ix6Ei7SPtUZVPx6fA3a2yUVULQk49h4rUArUqXe4Cj7wZmrQTTwq7BAGiNsWe6NB7FgB
 4qfQ==
X-Gm-Message-State: AOAM530AxGos/+GdZ33cFsEqdoeOVqh79H4yLggjnX7/3CmZ7kwREVmV
 /aJOBCdZWHWjjuc9nvUvtBwvI0mVM+8=
X-Google-Smtp-Source: ABdhPJyglRRCJoqpWlyrnl4B49cUWniw5N/5y8OZpG4TiskHmP4NAOlqvyDGQ56yqG23Ynk8+u/KRQ==
X-Received: by 2002:a5d:434f:0:b0:205:f514:8955 with SMTP id
 u15-20020a5d434f000000b00205f5148955mr8149028wrr.73.1650281807811; 
 Mon, 18 Apr 2022 04:36:47 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 2-20020a1c1902000000b00380d3873d6asm12926693wmz.43.2022.04.18.04.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 04:36:47 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 18 Apr 2022 13:32:48 +0200
Message-Id: <20220418113248.275783-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pybind: needs C++
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python-pybind needs C++ since its addition in commit
f42f2a63b3c5733dc56a58b18d6ba417a59d8342:

-- Check for working CXX compiler: /usr/bin/c++ - broken
CMake Error at /nvmedata/autobuild/instance-24/output-1/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
  The C++ compiler

    "/usr/bin/c++"

  is not able to compile a simple test program.

Fixes:
 - http://autobuild.buildroot.org/results/90364b752bef3f7b4b1fd9181e21030349e0e529

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pybind/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-pybind/Config.in b/package/python-pybind/Config.in
index 604cb9ee67..6e03cc62fc 100644
--- a/package/python-pybind/Config.in
+++ b/package/python-pybind/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_PYTHON_PYBIND
 	bool "python-pybind"
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  PyBind is a lightweight header-only library that exposes C++
 	  types in Python and vice versa, mainly to create Python
 	  bindings of existing C++ code.
 
 	  http://pybind11.readthedocs.org/en/master
+
+comment "python-pybind needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
