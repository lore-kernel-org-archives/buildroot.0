Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35221C433FE
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 11:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCB8C40B17;
	Thu, 10 Mar 2022 11:42:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z44Bpc_otzor; Thu, 10 Mar 2022 11:42:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B24B94015D;
	Thu, 10 Mar 2022 11:42:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 193811BF868
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 11:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0593F8471E
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 11:42:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NTkrnnqV1TgQ for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 11:42:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2721C84390
 for <buildroot@busybox.net>; Thu, 10 Mar 2022 11:42:00 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id u10so7483459wra.9
 for <buildroot@busybox.net>; Thu, 10 Mar 2022 03:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WKdJeb1PBUq38Gmfn/nt57yfCsw+6jPWJ/9b1KA33OM=;
 b=GuYDQnu6ZJKnuVNLAQisX9qizjthLjNxi32X3QXtyMIjwGRgKdFLctqZ6748R14CzC
 1caIL3tGuUA7Lh3qRjH1cLbikhaL0rFDrHoYKNTYbDS5CbEUfXzZfxdYx7HMYuy/mt7s
 bPNxj8PViKDQql/7v86Cg9P350+nvPQ9vbQsVcWpOqxQa8LwlWyBeUo1SnjWXcPYTNxU
 zM9QmeiNik6PIDkacV0Plg2xkOZd9rAMMuhV+GP8ixdU0n7mHJmt8vR7PFa9UBT7H0hV
 sorfnJuhXLlSu3pPNTfrLbQSrywU7v4KUZgAlNKz4NnAwsq/e/ceEVzJAtnGYwblOpNz
 mswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WKdJeb1PBUq38Gmfn/nt57yfCsw+6jPWJ/9b1KA33OM=;
 b=Ux8xRBZ4f7DXQkl6EVKjq49GZi6Y0qhvgoSoMxiLmFUPvPIeSFJmmqAW5EGsp7cmE1
 VKCScMLANewUkLgtqZPsOWLSVMP8QTrkwER0tT7EisE33cD80fMDeUk++7g3wRw2Ht0o
 qYOIx72ZbMh53oy+LNZ6amhG1zIspsgiz/hd7apxj5ykriRf9vLzwqljQ5kbWwdQTlVh
 qHttct9GaGjcdVc7mhW0eGhs8L0eaamTwdQzVqonZui19snH03OnzOk0OvCw5GthBKBj
 5Qy/rhZIuMssIPvJLdtun9cqmvTu/gpOTQl2Q3W8C/CyByh8mboihtYnz5JWbshXnGum
 4iFQ==
X-Gm-Message-State: AOAM533SGVubxzO5eNlRNtLuiz1cO6+rKXYoTZp+aMpgZP04V5L283OZ
 vy0FmWiuAgNl1tKggxPctsrw924oszE=
X-Google-Smtp-Source: ABdhPJxYVnh0DhFJEqCROW2tiNlrPfbxO+Nj2lqrVC22G4jnNy72+qxJLxuyl/uauUcBAZOWnpIMYQ==
X-Received: by 2002:a05:6000:1a89:b0:203:7089:ea88 with SMTP id
 f9-20020a0560001a8900b002037089ea88mr3205445wry.651.1646912518423; 
 Thu, 10 Mar 2022 03:41:58 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a5d554b000000b001f0326a23ddsm3914830wrw.70.2022.03.10.03.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:41:58 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Thu, 10 Mar 2022 12:41:53 +0100
Message-Id: <20220310114153.919891-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/moarvm: bump to version 2022.02
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
 package/moarvm/moarvm.hash | 2 +-
 package/moarvm/moarvm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
index 01e3ee4ae..58e3ce8ac 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7f3487a70e8b77be0e4e2f12b14c49f6a01d0378e0940c86958c9016c495ad75  MoarVM-2021.10.tar.gz
+sha256  4f93cdce6b8a565a32282bb38cc971cefeb71f5d022c850c338ee8145574ee96  MoarVM-2022.02.tar.gz
 sha256  c53c6b96081b0a5b9b2fb4d0133d55c20e5e00e4c127ade62f03434ee7b3d2de  Artistic2.txt
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index 99e26c73c..db336bfe4 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2021.10
+MOARVM_VERSION = 2022.02
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
