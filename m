Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FBACAC595
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 18:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F79B60A48;
	Tue, 17 Sep 2024 18:49:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8V9P5m8KUgVp; Tue, 17 Sep 2024 18:49:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2335260E06
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2335260E06;
	Tue, 17 Sep 2024 18:49:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8FA931BF295
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C43941999
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:49:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dzHu2MbhnvPC for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 18:49:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5D02A402C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D02A402C4
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D02A402C4
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 18:49:43 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3a0981e63ecso18398825ab.2
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 11:49:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726598982; x=1727203782;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dM+YnozB4ndojKulWl0KKAMoQFq1QjU6ReLxM25B+Gw=;
 b=k6mqYH9aNEbSdFg5AJlEIWfP4hgQqBUEfFGvSfrim3YoUzUI4l6fZfDjxpWnC0p+fj
 aR8O2PjGNN6zxw2NhnHgzJVT1i9cCZCRSW6FXyvkOzn1ztEYhVDwYRTuBV0eXyeYcKoC
 YsC9qptun17uEYwg1kKiADkpbksa0oc/fWsbiivr9g+eKRxmvCQ2/j8NIOva9SGxub4y
 EMfCPMpjnFMtiAybPjy4gHMRSxOUMjBq1VK/fH9ixf8Z/GKhHXPniJ2ZMGlA0KUuGVZ2
 qrlXqOZyJZJynfjjQZL7elOjdZWhhMro4NyQzM47IeSGOrLUN+rkqUxs9wmVkDsGcOJA
 fiqA==
X-Gm-Message-State: AOJu0Yx6QXcxfKmFf0VLoyQrMqrDSr41GFgwzpWN4rthmbCsqqle/Rmk
 3sBaVi+R4Kej9+2EUkGkYCmNRRcUtjGUY3oZ1UPNyBXiaWi4M4lvvUrQig==
X-Google-Smtp-Source: AGHT+IEt4vXXX9JAat+6aWTDVLrFHyb7H5qAxPltG5yFA9zS6uh0EszGLY+bXSslZx82ctqd4uc3Bg==
X-Received: by 2002:a05:6e02:1a65:b0:39f:60d7:813b with SMTP id
 e9e14a558f8ab-3a08494cdbfmr194046595ab.22.1726598982032; 
 Tue, 17 Sep 2024 11:49:42 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e1b8b1sm23655965ab.41.2024.09.17.11.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 11:49:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 12:49:40 -0600
Message-Id: <20240917184940.3896829-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726598982; x=1727203782; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dM+YnozB4ndojKulWl0KKAMoQFq1QjU6ReLxM25B+Gw=;
 b=eZDGSISHfyBVKYQ+rfnbhCQ9UDNGDireiN4eJQ5RvbxAhRAGSX4U5TwSW4zel1pwYi
 19iQp9rvTVVhrbqO/6Ye2+iiv/ySVf6ciwX0KDT8TMPiPuLlSBLZ6iUCGJE8GF+h5cSo
 n+Uj782cUg+/ZGleF+apHsAW/4OOs+C+B/SJZugqUJ6qdxzWDeOnv63W/Ynrc1PRJARM
 OkE/F8ZbkKPaOZSWDOADu9hFsURf0HFrZ36/MypJ2Wzn023OnneCA1R2M7FJgynpe6no
 M64RSheH8y3i7N2PbOjnONU6u8g/779o5z9AVR6CAWD+dgaLsLWs2sIVkKZmFrd8xHGn
 gk5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eZDGSISH
Subject: [Buildroot] [PATCH 1/1] package/python-prompt-toolkit: bump to
 version 3.0.47
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-prompt-toolkit/python-prompt-toolkit.hash | 4 ++--
 package/python-prompt-toolkit/python-prompt-toolkit.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.hash b/package/python-prompt-toolkit/python-prompt-toolkit.hash
index 1821d4d65c..eb8655fd06 100644
--- a/package/python-prompt-toolkit/python-prompt-toolkit.hash
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/prompt-toolkit/json
-md5  f33c0f4ae8d11addababf6d90c98f8bc  prompt_toolkit-3.0.43.tar.gz
-sha256  3527b7af26106cbc65a040bcc84839a3566ec1b051bb0bfe953631e704b0ff7d  prompt_toolkit-3.0.43.tar.gz
+md5  68c7156bafee001d10e9931ce52805a9  prompt_toolkit-3.0.47.tar.gz
+sha256  1e1b29cb58080b1e69f207c893a1a7bf16d127a5c30c9d17a25a5d77792e5360  prompt_toolkit-3.0.47.tar.gz
 # Locally computed sha256 checksums
 sha256  303574d9bdd85c757d6025017942bf17baeedf2778f62bd7f425d07d880f4c4a  LICENSE
diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.mk b/package/python-prompt-toolkit/python-prompt-toolkit.mk
index 31c0d9783f..a4a07d04dd 100644
--- a/package/python-prompt-toolkit/python-prompt-toolkit.mk
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PROMPT_TOOLKIT_VERSION = 3.0.43
+PYTHON_PROMPT_TOOLKIT_VERSION = 3.0.47
 PYTHON_PROMPT_TOOLKIT_SOURCE = prompt_toolkit-$(PYTHON_PROMPT_TOOLKIT_VERSION).tar.gz
-PYTHON_PROMPT_TOOLKIT_SITE = https://files.pythonhosted.org/packages/cc/c6/25b6a3d5cd295304de1e32c9edbcf319a52e965b339629d37d42bb7126ca
+PYTHON_PROMPT_TOOLKIT_SITE = https://files.pythonhosted.org/packages/47/6d/0279b119dafc74c1220420028d490c4399b790fc1256998666e3a341879f
 PYTHON_PROMPT_TOOLKIT_SETUP_TYPE = setuptools
 PYTHON_PROMPT_TOOLKIT_LICENSE = BSD-3-Clause
 PYTHON_PROMPT_TOOLKIT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
