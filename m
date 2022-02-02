Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF71C433F5
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 07:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AE0E60B31;
	Wed,  2 Feb 2022 07:58:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bf4UM1AMG-th; Wed,  2 Feb 2022 07:58:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5912D607F2;
	Wed,  2 Feb 2022 07:58:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 893C11BF859
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 07:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73C8D4028B
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 07:58:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a9zlcJ6wbPGa for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 07:58:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C4D740284
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 07:58:50 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id m14so36446688wrg.12
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 23:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vFh8cFd/uyxXvP2ka9KxyUgg1kWAHMeAoU7NX8YgV5c=;
 b=AvKFiRDZS0TzCxhVm21yiA/WEADWw+RqYHauBOAoo/YqZZU3NbOB5N650lZEp6lWko
 JZj+vKNmlrhq5cU+euaMS+Hg81IaX4GL/MWhk5OxDj7mcRahpFIlOBpRm4hC7Jinw9sh
 Rq6jkxuGi7Lj1oix3ZSSfS+El7RxXsy414WyGaPn5/S9rjTEcWXeT0iSKB7SRAbffAZM
 XMtb9qoZm032D2UYB99s82xddeqIFtRCxaZ0JScI+AhpvVLH+8k/UauFK6+0etJaI62E
 82PYmqog+hzayKYbe+WzLunPwne1BB9W3t6hXpQmbu1R8aCfCCq6LM81xUGVRbOuwwbL
 L5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vFh8cFd/uyxXvP2ka9KxyUgg1kWAHMeAoU7NX8YgV5c=;
 b=B5UrMKS2Ag2krbWtYHVDzYAGn+r+sU9ybECO/Yn16UnBZ0PRSek0eoTzdgEEDlrRSb
 HPR+8ULgiV0NL/JN/XT9qJBx8I5TmXs8cSWsK/qhsdgNyR3mly7WsqfVRUmG1JtJQbr4
 /+hMeBBOt7oJFBjAsvCeLiLDdJpr+G74bDlFHGhk2QViJxLJU57E3iq6MKeG0/3Uc8Vg
 DYTxWwK3U4507v2kjqQlABWMrLZOSMAYwxGnz16n995c42RVn7Hp2sbZH86aJNb/5My2
 ilvakCtF2cFkU6jA3J+SKAL5h4AnI/pedlVsp7Lesrwsd3updWiNtkgRyr377qm3VRzE
 aU+Q==
X-Gm-Message-State: AOAM5308Xj8H4MbExOHNlTLxs414b9QNzw4RKehFr7zuLo86eXMIjhO2
 LtYun3q/0oE/nCrPtjFc9UPrxKu2z2c=
X-Google-Smtp-Source: ABdhPJw2n2Or5gfEy123tbqwlueeAoKMuoDs1M0xc4ClWHvNVeGNdiFaQo0fb+fo9l8QZRPg7/8kNA==
X-Received: by 2002:a05:6000:4:: with SMTP id
 h4mr23344146wrx.336.1643788728146; 
 Tue, 01 Feb 2022 23:58:48 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id r2sm19455348wrz.76.2022.02.01.23.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 23:58:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Feb 2022 08:56:51 +0100
Message-Id: <20220202075651.1205886-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/jasper: disable programs
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
Cc: Michael Vetter <jubalh@iodoru.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable demo programs through JAS_ENABLE_PROGRAMS option which is
available and enabled by default since version 2.0.14 and
https://github.com/jasper-software/jasper/commit/e02518ce7161cd37ded64af78ac520e0424a9b12

As a side-effect, this will avoid the following build failure raised
since bump to version 2.0.33 in commit
f791221c8616bfa6d338ce6c287353395cc2c61a:

[ 96%] Linking C executable imginfo
/home/buildroot/autobuild/instance-3/output-1/per-package/jasper/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/10.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: attempted static link of dynamic object `/home/buildroot/autobuild/instance-3/output-1/per-package/jasper/host/x86_64-buildroot-linux-uclibc/sysroot/lib/libc.so.1'

Fixes:
 - http://autobuild.buildroot.org/results/b106fdf32ffa9e0ef1254e0a29fdcdc821020e08

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jasper/jasper.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 05168db763..6b6bbcd6e6 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -11,7 +11,9 @@ JASPER_LICENSE = JasPer-2.0
 JASPER_LICENSE_FILES = LICENSE
 JASPER_CPE_ID_VENDOR = jasper_project
 JASPER_SUPPORTS_IN_SOURCE_BUILD = NO
-JASPER_CONF_OPTS = -DJAS_ENABLE_DOC=OFF
+JASPER_CONF_OPTS = \
+	-DJAS_ENABLE_DOC=OFF \
+	-DJAS_ENABLE_PROGRAMS=OFF
 
 ifeq ($(BR2_STATIC_LIBS),y)
 JASPER_CONF_OPTS += -DJAS_ENABLE_SHARED=OFF
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
