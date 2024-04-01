Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918DCCD1288
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 13:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6100A404C4;
	Mon,  1 Apr 2024 13:12:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YoIrXPMQ4WEV; Mon,  1 Apr 2024 13:12:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E8FC404EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E8FC404EC;
	Mon,  1 Apr 2024 13:12:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 882B91BF232
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 13:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8196081C44
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 13:12:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u9y1ZqIMtatg for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 13:12:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1F01D81815
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F01D81815
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F01D81815
 for <buildroot@busybox.net>; Mon,  1 Apr 2024 13:12:49 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2d71765d3e1so37007081fa.0
 for <buildroot@busybox.net>; Mon, 01 Apr 2024 06:12:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711977168; x=1712581968;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UTKGby57RP1yOeVoT0lp0EZ3ukjKMUmneWo8F2GCWB0=;
 b=pWE5aGX/SE8yV/IAxbr+urSAtxjNjNQpC8+XVu+F4g6j0DmqUGr9l9XGyGN0sMChxO
 8i9PJgETHDZ/aBcguSjgY4g9qnc8I9MbdOFoeGa0plg+MvFga8J1yXOsQ4SlolInYals
 r9qKLIdtX4HtIEHHiU2OCRT/4aa9craE9NPYEgNV0oN0D4SefZvy5ZoHRCP9m9jXwEcf
 dN4hkT31RSunD3FQOdunT9cGfdaP4YSLWoSW76kFSFV+DqnehxBY4QkyGf5sygKdsn92
 EHiQqVCfcwfumjB2Z9c8BPp5I1TjgzWSxpXAe2HxX7enk2eULwH3Bs/iiU67k6KHGe9b
 Aj6A==
X-Gm-Message-State: AOJu0Yx54jE6ddXaQ3DPN2b62jNItk0XiVfK7a2J9NEFOzujeJwSVakg
 jSTxhzs5ZU6oCvjmsmjPaUW5BzylnRq9olGU3O7oSlEwF80XGhmQgFDauNBP
X-Google-Smtp-Source: AGHT+IEPZxEi6TpaHlLh8oJEDvsC2h4fbrd7D7edQ8sDObV0sC1cFAa0VZmZ1f8B7HNNYBNUzqqNsA==
X-Received: by 2002:a2e:a789:0:b0:2d6:c001:d87 with SMTP id
 c9-20020a2ea789000000b002d6c0010d87mr8066280ljf.8.1711977167349; 
 Mon, 01 Apr 2024 06:12:47 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 fd6-20020a056402388600b0056c53ea5affsm5224054edb.77.2024.04.01.06.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 06:12:47 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  1 Apr 2024 15:12:42 +0200
Message-Id: <20240401131242.511203-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711977168; x=1712581968; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UTKGby57RP1yOeVoT0lp0EZ3ukjKMUmneWo8F2GCWB0=;
 b=nkCbX6QQGuMxj93enDn9R6oG1Pn9sZ/MBNOUix6Dvm8YNmos8LHhAZ22qFepgK7Fgu
 6HhB5FEJAqqlzeZDe892G/02P1lNdB0unBJh4+CWr6iDHk1Vka3HxOQJZ1b/GPZIevgv
 usOAnUg+XPEPp2Nc+eiNQWIeT6u5Us8JJKnNsBYLWecL5zEKn0iqlp6s4g1uRF74HoKk
 FZykeQZzN9n53z+bKLjFXE/kr0QA9c7/qOCuvyw3crFCJ0i7IXqspMK9EPJ3Gdtf5yzp
 fbfd5zBnS7oR74lIrrmNpWdRzDZijTeNL5jnzD+Ex4WRryQ9LI8Sqd7z+wuF5RzEjuWS
 ucQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nkCbX6QQ
Subject: [Buildroot] [PATCH] package/fakeroot: bump to version 1.34
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/fakeroot/fakeroot.hash | 5 +++--
 package/fakeroot/fakeroot.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/fakeroot/fakeroot.hash b/package/fakeroot/fakeroot.hash
index 5e7b6af94..a148de676 100644
--- a/package/fakeroot/fakeroot.hash
+++ b/package/fakeroot/fakeroot.hash
@@ -1,4 +1,5 @@
-# From https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.32.1-1.dsc
-sha256  c072b0f65bafc4cc5b6112f7c61185f5170ce4cb0c410d1681c1af4a183e94e6  fakeroot_1.32.1.orig.tar.gz
+# From https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.34-1.dsc
+sha1  aaa6bf0158d886e0093effc0e9422717d5c60eee  fakeroot_1.34.orig.tar.gz
+sha256  5727f16d8903792588efa7a9f8ef8ce71f8756e746b62e45162e7735662e56bb  fakeroot_1.34.orig.tar.gz
 # License files, locally calculated
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 1a0ad70c1..1a0996ca1 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FAKEROOT_VERSION = 1.32.1
+FAKEROOT_VERSION = 1.34
 FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.gz
-FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20230724T160429Z/pool/main/f/fakeroot
+FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20240401T084438Z/pool/main/f/fakeroot
 
 HOST_FAKEROOT_DEPENDENCIES = host-acl
 # Force capabilities detection off
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
