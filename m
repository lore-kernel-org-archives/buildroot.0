Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F72C433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 20:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7135D4187B;
	Mon, 30 May 2022 20:49:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hNRR8fg8EX5P; Mon, 30 May 2022 20:49:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32C8D41701;
	Mon, 30 May 2022 20:49:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A9D2C1BF31A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9568583F39
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:49:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VamwtmfPxNEU for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 20:49:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5408483F35
 for <buildroot@buildroot.org>; Mon, 30 May 2022 20:49:52 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id s24so8771002wrb.10
 for <buildroot@buildroot.org>; Mon, 30 May 2022 13:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6GZGU+gW4/1iKcEw0mS/cuG3E9guBP6KbbHcMIVkyXo=;
 b=ezXdb1il3Wia2FFLr0CJfg2/nMqqt24WxhKEXnXN1ycrgYrr1bnAJVmkfzWyhqoNGz
 RKUA8k0oF4dDVA3nDcLwH2B6iuE2xWm4iV54cIWI3D5gaQaTV634f9Tt+DyL/+YLNOvs
 xR/LMFOiAv2k/MhpDwAGvmSlK8tAs53Q/f6DXXXZiPayeaSq+4z5/UYT81Q6Lq/K7rrI
 qgLOSwSNUGql+/raEWl6sUXhiv+wnhAeruNsMprXyVgynf2/RHS6k3svU/XRFh9ZaT+6
 PYc/YKIWAtwf1dLpEuqCQBQp1v6ncunBT33KNcL6JzhQ83kon3kHs7/N1SmOC5xpTnKq
 /JPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6GZGU+gW4/1iKcEw0mS/cuG3E9guBP6KbbHcMIVkyXo=;
 b=oOy80uXvtiy1Uxy9BsT6xtYHU9iKQ63UwVmOfEZqAdHNvWzvO+j+ejfzTYbXOH98x8
 YYnPSVwqAh3551Jp/EW+d1spjrO5Nly4XnCVBtLO1Bur/WWDDyE1+VakVcB2zeMeU2mT
 /XG28ZGzEF73yhSetrAfLmH29UlqGHku9ruQgWC7Lr/RbRNaKKGheV1szfOwysnmxHhb
 j7rysQrwg0ers0np3xG1no3dFkpfhYW6EbmnkjmBctHV40Uc0vCYeshp2oSTsiBcYWYN
 zaa8OpFbwXdD5eOX+IHE9/cYFkEsOwS3rCxoZgMkpKBENECFHsDe7/W9WK/qXjbp2DGQ
 OY/w==
X-Gm-Message-State: AOAM533P/dvwXQ3D+D1YiPyZF9NqaUbTfalj6rbHFQ+DtyCfoRiPexP3
 wmNCc1hGLYmMwf/rcq/djxFCtt8V5to=
X-Google-Smtp-Source: ABdhPJxZ3JgfajEzinC2K7zJda6UlFzNITgmfh8Q4N8uWkE77AvbsKDiXXLGdZ/8XffdrDZZdgL4+A==
X-Received: by 2002:a5d:4d05:0:b0:20e:6457:f2b1 with SMTP id
 z5-20020a5d4d05000000b0020e6457f2b1mr46144807wrt.653.1653943790216; 
 Mon, 30 May 2022 13:49:50 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 x10-20020adfdcca000000b002102baa2370sm6052404wrm.100.2022.05.30.13.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 13:49:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 22:47:15 +0200
Message-Id: <20220530204716.3054785-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/gtest: gmock needs host gcc >= 4.9
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
Cc: Stephan Hoffmann <sho@relinux.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

gtest unconditionally uses is_trivially_copy_constructible since
version 1.11.0 and
https://github.com/google/googletest/commit/c13c27a513ecd1cbf5700a45fe590e85e8ae6770

So add a dependency on host gcc >= 4.9 for gmock to avoid the following
build failure since commit 9dfbbbb4105c47602da048c9bb9499fb8862e768:

In file included from /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/build/host-gtest-1.11.0/googletest/include/gtest/internal/gtest-death-test-internal.h:39:0,
                 from /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/build/host-gtest-1.11.0/googletest/include/gtest/gtest-death-test.h:41,
                 from /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/build/host-gtest-1.11.0/googletest/include/gtest/gtest.h:64,
                 from /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/build/host-gtest-1.11.0/googletest/src/gtest-all.cc:38:
/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/build/host-gtest-1.11.0/googletest/include/gtest/gtest-matchers.h: In static member function 'static constexpr bool testing::internal::MatcherBase<T>::IsInlined()':
/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/build/host-gtest-1.11.0/googletest/include/gtest/gtest-matchers.h:414:12: error: 'is_trivially_copy_constructible' is not a member of 'std'
            std::is_trivially_copy_constructible<M>::value &&
            ^

Fixes:
 - http://autobuild.buildroot.org/results/9d19a47deb80824eaa718d80f14b0afd5f9eb054

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gtest/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gtest/Config.in b/package/gtest/Config.in
index d8bcf6343f..35fc9fea7b 100644
--- a/package/gtest/Config.in
+++ b/package/gtest/Config.in
@@ -26,6 +26,7 @@ if BR2_PACKAGE_GTEST
 
 config BR2_PACKAGE_GTEST_GMOCK
 	bool "gmock"
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-gtest
 	help
 	  Inspired by jMock, EasyMock, and Hamcrest, and designed with
 	  C++'s specifics in mind, Google C++ Mocking Framework (or
@@ -47,6 +48,9 @@ config BR2_PACKAGE_GTEST_GMOCK
 	  libraries required to link/run them. The host package installs
 	  gmock_gen, a Python script used to generate code mocks.
 
+comment "gmock needs host gcc >= 4.9"
+	depends on !BR2_HOST_GCC_AT_LEAST_4_9
+
 endif # BR2_PACKAGE_GTEST
 
 comment "gtest needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
