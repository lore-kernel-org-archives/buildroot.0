Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7934EC433EF
	for <buildroot@archiver.kernel.org>; Thu, 26 May 2022 22:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C56C61562;
	Thu, 26 May 2022 22:19:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vuhHQtf3nqnH; Thu, 26 May 2022 22:19:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 152F26155B;
	Thu, 26 May 2022 22:19:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 261831BF33D
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 22:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14C166155B
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 22:19:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aKspRGUNrnWw for <buildroot@lists.busybox.net>;
 Thu, 26 May 2022 22:19:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 32DD061511
 for <buildroot@buildroot.org>; Thu, 26 May 2022 22:19:46 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id e28so3691874wra.10
 for <buildroot@buildroot.org>; Thu, 26 May 2022 15:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZiJWwjA3IpGMaiHkt6xylgtmcJ/l+LuVjBw+wdK353c=;
 b=P1cl+KOAfa9b4KcW6DwngIuLUf9qMTts2A8dtjZXG7zDkJXfLowasueEjI98FXdCpL
 6ca0zoDMfTmSZEX8hwOhNVt9EI8DqoI1JMxUzGxhR5WgB8uM7NKuWoAcAslciZrUz+ZV
 4U7ExneG8POYHCMT4/+IBMBUGSjPq0L45yg5HMgRCtBN5e9hBy/N6YnCFfv1tmVJ4Tzi
 qfq9da5Nr3t8xbXImoXZOAVIrd6jTcFtYYSKmChHqc6aS0Nmd0hOX9pcx1VdPbLIxmcl
 PeZPjjeYSU9CeT5hKjdPr1IdzK+WMvn3zwzvFE5XRtYKo7vVDrsSvuBw+FczZfgO0bro
 X6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZiJWwjA3IpGMaiHkt6xylgtmcJ/l+LuVjBw+wdK353c=;
 b=0BUQdfmv+ZKvrJeFRb5SM2mjddbEc1eswYq61OZpXu+WFk5RkZOgUHfr0vovw2sxLi
 U2zrwXSkqz14Rp0VvJ1IksV1i+MNclz1fDiHSZ5j4UkHJC7EdPPZV5kBzOruuMIQBeSe
 CFmRdmmm8US5UU+zZVVh2M6zeY0z1W9Q8dKZhjRETGB8CVoE369mkoUAregZ9EXi1ZwX
 0SuYY8iAPZICFDnCy3RcV6XQtIslctCe1nj6kx+5G6WGEyeGOYIptgmVY/m7NNkpnB1c
 DBiQyLGOnrDohn5n8356ktVD9n93IPzU+ctCqXNbh5FghRznSnNmFiJnuM1B6vLO/R1b
 4qsQ==
X-Gm-Message-State: AOAM532BAoT/pbuKv8fKztuJm3/RHBD/gYZjv0Cpp1P9/PuQvZH/Yg2S
 OiMnH8V1iZLQrT4W+8Ilyf4ovLQIBys=
X-Google-Smtp-Source: ABdhPJzp9aTec4UTFkX2JaxixByrIQ2aghD61QDIQYE5nTTs6YNegcaXVRPq/mAgI7AeFxD/88790A==
X-Received: by 2002:a5d:4a43:0:b0:20f:c53d:6796 with SMTP id
 v3-20020a5d4a43000000b0020fc53d6796mr18126479wrs.15.1653603584857; 
 Thu, 26 May 2022 15:19:44 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m23-20020a05600c3b1700b003976525c38bsm472488wms.3.2022.05.26.15.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 15:19:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 00:17:10 +0200
Message-Id: <20220526221711.731246-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/fbv: renumber patches
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 9863553fe8fa16a4d19f652b409a44bb58ef5567 forgot to renumber
patches

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fbv/{0002-cross.patch => 0001-cross.patch}                | 0
 ...ig-endian.patch => 0002-fix-24bpp-support-on-big-endian.patch} | 0
 package/fbv/{0004-fix-bgr555.patch => 0003-fix-bgr555.patch}      | 0
 package/fbv/{0005-giflib.patch => 0004-giflib.patch}              | 0
 package/fbv/{0006-include.patch => 0005-include.patch}            | 0
 package/fbv/{0007-libpng15.patch => 0006-libpng15.patch}          | 0
 6 files changed, 0 insertions(+), 0 deletions(-)
 rename package/fbv/{0002-cross.patch => 0001-cross.patch} (100%)
 rename package/fbv/{0003-fix-24bpp-support-on-big-endian.patch => 0002-fix-24bpp-support-on-big-endian.patch} (100%)
 rename package/fbv/{0004-fix-bgr555.patch => 0003-fix-bgr555.patch} (100%)
 rename package/fbv/{0005-giflib.patch => 0004-giflib.patch} (100%)
 rename package/fbv/{0006-include.patch => 0005-include.patch} (100%)
 rename package/fbv/{0007-libpng15.patch => 0006-libpng15.patch} (100%)

diff --git a/package/fbv/0002-cross.patch b/package/fbv/0001-cross.patch
similarity index 100%
rename from package/fbv/0002-cross.patch
rename to package/fbv/0001-cross.patch
diff --git a/package/fbv/0003-fix-24bpp-support-on-big-endian.patch b/package/fbv/0002-fix-24bpp-support-on-big-endian.patch
similarity index 100%
rename from package/fbv/0003-fix-24bpp-support-on-big-endian.patch
rename to package/fbv/0002-fix-24bpp-support-on-big-endian.patch
diff --git a/package/fbv/0004-fix-bgr555.patch b/package/fbv/0003-fix-bgr555.patch
similarity index 100%
rename from package/fbv/0004-fix-bgr555.patch
rename to package/fbv/0003-fix-bgr555.patch
diff --git a/package/fbv/0005-giflib.patch b/package/fbv/0004-giflib.patch
similarity index 100%
rename from package/fbv/0005-giflib.patch
rename to package/fbv/0004-giflib.patch
diff --git a/package/fbv/0006-include.patch b/package/fbv/0005-include.patch
similarity index 100%
rename from package/fbv/0006-include.patch
rename to package/fbv/0005-include.patch
diff --git a/package/fbv/0007-libpng15.patch b/package/fbv/0006-libpng15.patch
similarity index 100%
rename from package/fbv/0007-libpng15.patch
rename to package/fbv/0006-libpng15.patch
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
