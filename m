Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD0EC433F5
	for <buildroot@archiver.kernel.org>; Sun,  2 Jan 2022 17:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3D04813C2;
	Sun,  2 Jan 2022 17:43:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P3xF8YQPaqfc; Sun,  2 Jan 2022 17:43:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A1BC812CB;
	Sun,  2 Jan 2022 17:43:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2152B1BF3FF
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 17:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FEA760AEA
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 17:43:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jTOk1q9VeJyE for <buildroot@lists.busybox.net>;
 Sun,  2 Jan 2022 17:43:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 306BB60594
 for <buildroot@buildroot.org>; Sun,  2 Jan 2022 17:43:20 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id s1so65831865wra.6
 for <buildroot@buildroot.org>; Sun, 02 Jan 2022 09:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P3yTJY4Um9x9v+eJcM0Dji0L/JZtemUbJ6mU98hz13Q=;
 b=mzsSiwoRXBZ3agkkr3W1iPGM8C4TZbkErCj+gTsOelPcOkJnPr2/YS48u3BSsQCk4M
 1EbsRFJ56m+113tKZn7/2ATq+sO0d/Z1hXzeXGfS1s7uPjMaMHudUPc7I97QIENA1WbH
 1gR/iHOoTVcxQQz8G0GYXUFj+rYOiSMFdHA6E78tPpzeSgom59swvXJ1yZALSKsO5Vxi
 4DfMOimZTAO+j6VYAX3rwSNc7+NhhdTEVAJeJJMLjIgxsMJpt0rSm2Fw2Y+hW9c/RAlr
 W6aCOJ5mKJqMkksrxKarBsu0aRl6OasJ8hX+2rovxaBq1aU9yIAM1vRS/kNS6jbX09KC
 MGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P3yTJY4Um9x9v+eJcM0Dji0L/JZtemUbJ6mU98hz13Q=;
 b=SVzGwhVCPEqJdJTMhtl5qWDQWq+S0a9HOn7bxr9dDsQGZYWIYKqOhFfu5wbumMwqyz
 uP2C6R6TDi8DlT8NXl23rG83dZMMoyf9yR+tx0fSjfByz59IdSj3H4k5FNRMZKetXW18
 3FR5a2fOh9NRpH5ZHhExpFnls0y7i3rc3Qzl/kC2U6WfBGA62QsdEYj9AzMve/krHvnF
 WVbSfVShHY7zL+9Jbp9Q8LZo08A8f0uLyCrWgJor7Xdkf5gxFFkW/KpFrJ2wq7o/odh4
 5HcH3r93djLTPuu+FuNbte3Hag1s4btTkZ4NhQRx7cAn5LeFKkaZ4hgpd4og1RSjmFiA
 TcfQ==
X-Gm-Message-State: AOAM532UowjihdL34oZkP1QowmzgWwtrpxmYX+NtGRucztJosEmcGaT3
 D7LglvkY29i0K+BiJH8qxk8HMFtI4Uk=
X-Google-Smtp-Source: ABdhPJwgHQ4ncSarLGxSpFy+iCo7k2OjAueUxa+bYQMYDDJgoSVACfpLp7531Wzvc+orjdf/empqBA==
X-Received: by 2002:adf:fc83:: with SMTP id g3mr35595805wrr.405.1641145398160; 
 Sun, 02 Jan 2022 09:43:18 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id az15sm30326854wmb.47.2022.01.02.09.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jan 2022 09:43:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Jan 2022 18:42:26 +0100
Message-Id: <20220102174226.2823845-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/zchunk: needs MMU
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of the package
in commit c618da772df32679fdd338b99f44133655c9113f:

/home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: src/zck_gen_zdict.p/zck_gen_zdict.c.o: in function `main':
zck_gen_zdict.c:(.text.startup+0x254): undefined reference to `fork'

Fixes:
 - http://autobuild.buildroot.org/results/582b994372435b8c35a56345c15bd0ffc722af79

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zchunk/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zchunk/Config.in b/package/zchunk/Config.in
index 2c8db434ce..2d2a78a210 100644
--- a/package/zchunk/Config.in
+++ b/package/zchunk/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ZCHUNK
 	bool "zchunk"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_LIBCURL
 	help
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
