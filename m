Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0166BC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 11:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92A8B60B37;
	Sun,  9 Jan 2022 11:06:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hSLW9Quoqidf; Sun,  9 Jan 2022 11:06:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C666560B34;
	Sun,  9 Jan 2022 11:06:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 68CA11BF370
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6550D402D8
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:06:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QTIG0xW61Q0F for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 11:06:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D17E402D2
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 11:06:02 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id o3so21104061wrh.10
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 03:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=am6IBal4TUD0ojO9deeKSe/cerxpwrYrRDvNAzDBfts=;
 b=BkLVFLIDoU7arIPVYHZ8Q5TPE95TltWHeqXgmSbUfHUL3FKTD6mZr4Zkd6jkWAv4sK
 EZHFcHJscxREHVOEmIlKTg2Uv9YC2rcUeNV0ao4SxoV0D9y7YnxCQzH+qHrIF764dEZ0
 rxFoEYwY9+H60xg3F2nMYRAnwM2nCdGxxu9O303GMy9303WUaMk7LW02CBDA15p3aGuL
 wpOH+DPkxgJ5M/lT0bL7JTYAs/K4+E7qd6RbcW2Ca3b4RG1cQnh0xkhhczqNjsUT1AdH
 Q8xy8SrhquF9DpOE+SvKndxabAqCeNeMn0ySJCmn0oBX2lOleUVhfLIvrx2Cg7+nWlGU
 AMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=am6IBal4TUD0ojO9deeKSe/cerxpwrYrRDvNAzDBfts=;
 b=Gj6G9FX5mPu0wSjklYcNdpBxF0s9nZpjKkjWuXGS5nGvDiXEAcRxnk2jZKpGJhQK6B
 L2hyqhnLSo6HcIb1d3t8NsN151AoebAXF878JRHPSJKlDHUPuDE/vj/5oVNUwr5COwpl
 xnhpohbYjxcdW3IkOWtvQWvqmQqJeQ8zamcTsbE6U9KTOVdqARncxIAPx0NOAzst9E28
 /grze+woXNo8VHvOGDvUrDg1Dl4UUjkUZKH4HjsdB+c0eeAxDCaHiAAT/jZwkf98yHfM
 lnkKSFPpPnLeYFWFhYejhsNp5hPJo0W0prqIzSY1Fvu2A8WkyvjFbCarfDZpLLRPbe7N
 EHaw==
X-Gm-Message-State: AOAM533v+cJzoga/NNMWxDr3gKJfmKvAB+qUUMd6fAzOnw/vX8l1ed/y
 CrL53dLV2YpzTk2v88unFcppgcSk0tE=
X-Google-Smtp-Source: ABdhPJzU4VH2p8UqCD4TYUXwNtwUNVtAMNFbIX0EJnjTnUml8dXMgNhvboao+ZWxJDI4sjJrsj97ZA==
X-Received: by 2002:a5d:6d0a:: with SMTP id e10mr60968667wrq.65.1641726361321; 
 Sun, 09 Jan 2022 03:06:01 -0800 (PST)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id m13sm3804760wrn.57.2022.01.09.03.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 03:06:01 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 12:05:55 +0100
Message-Id: <20220109110555.3789-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/openrc: add patch to create
 /run/lock/subsys
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
Cc: Norbert Lange <nolange79@gmail.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Together with changes to sysv/busybox init, this directory
will already exist on all init systems before any service
scripts are run.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
v1->v2:
*   refresh patch
---
 ...lso-create-run-lock-subsys-directory.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/openrc/0006-Also-create-run-lock-subsys-directory.patch

diff --git a/package/openrc/0006-Also-create-run-lock-subsys-directory.patch b/package/openrc/0006-Also-create-run-lock-subsys-directory.patch
new file mode 100644
index 0000000000..cf592a88b0
--- /dev/null
+++ b/package/openrc/0006-Also-create-run-lock-subsys-directory.patch
@@ -0,0 +1,29 @@
+From 49e5929b468f604d80a0c04a6ce78eb96ca36090 Mon Sep 17 00:00:00 2001
+From: Norbert Lange <nolange79@gmail.com>
+Date: Sun, 9 Jan 2022 00:22:40 +0100
+Subject: [PATCH] Also create /run/lock/subsys directory
+
+Buildroot service scripts regularly use this directory, so
+create it in the most appropriate spot.
+
+Signed-off-by: Norbert Lange <nolange79@gmail.com>
+---
+ sh/init.sh.Linux.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sh/init.sh.Linux.in b/sh/init.sh.Linux.in
+index e8afc1fb..662ab223 100644
+--- a/sh/init.sh.Linux.in
++++ b/sh/init.sh.Linux.in
+@@ -82,7 +82,7 @@ elif ! mountinfo -q /run; then
+ fi
+ 
+ checkpath -d "$RC_SVCDIR"
+-checkpath -d -m 0775 -o root:daemon /run/lock
++checkpath -d -m 0775 -o root:daemon /run/lock /run/lock/subsys
+ 
+ # Try to mount xenfs as early as possible, otherwise rc_sys() will always
+ # return RC_SYS_XENU and will think that we are in a domU while it's not.
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
