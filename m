Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB05C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 21:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DF09813D3;
	Sun, 13 Feb 2022 21:05:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2dxhOKy98vN2; Sun, 13 Feb 2022 21:05:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DF58813CC;
	Sun, 13 Feb 2022 21:05:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 36D621BF475
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 21:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2348B40193
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 21:05:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fh_DVLFnJZEw for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 21:05:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8BF414018A
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 21:05:14 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id i19so7129027wmq.5
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 13:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UNo2hfQycg73Z3jKPBoVUijLc+sAJ0Zn3WQlFAnT99Q=;
 b=FUohJgCPuyhPFc51t8Kgd4Am5li4FkBh2GSuC/1yxlUBsbk1ENY4R3jfKKatdfadAa
 vqxMfNPOPr4URYKiqVXkkQivIIJOmmzbFIfPRuvX3+kTElJXQBXsn9dWdkkTuW/ALkGs
 oCC+3XlPnwhmN5l5Mdg7sijKEz0JQ1uCPl8+PWyc8BO0xUeB89sDpZep6NDnHhLP0bBq
 yJ41OSxPTvFqPErZ90e1EwfFU6S/5OuylSfVoN72gFWvV3eCGH4VQehJ/sb9IwYCLrDr
 NErGZ90oHWR1tkdl2V6Aj2doRaqj29H4mHxUC4dFY5jYb/HIiARMdd88/HvIx+4SKET1
 80IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UNo2hfQycg73Z3jKPBoVUijLc+sAJ0Zn3WQlFAnT99Q=;
 b=EEsCqCZ/eHw3issfe/N9ltxIVWc5ude8+Zk1ahPZP+e3Ynxg5/X/dP+TdJNojX2PfE
 WKSoBNSmczk0okqN040IDWo+rMOXJdbJLIQ78zy+xnihmIrNwBe326FEIevrR5wgiBmJ
 Dl07OCD/MI3RE1BAquJCGAjaZijCPQMnktMrFBXiflQG93Xo6qcmZGaYl0PdUZT7sIex
 6bNIU9v8JMZQZ1TwG+31JrwpESJG34kJcIi7s6+l4RnPdI2/4RlO6ZB3SYCdcqsvRg8E
 2OSpfO8oFFPrDuCzp+2O08JJyL4DqVPwhzdiL2Lvx0BSlxMUeVBTVHa/Gx41AkZBV1rB
 zJXA==
X-Gm-Message-State: AOAM533wCc1Ib70sSXIA2cIBcLJNN8/8oMNJCIeFeAbTm6CjT7vs0R/F
 tw5j4q4UaAf4fyFkkmKNbMyDPrzfMaI=
X-Google-Smtp-Source: ABdhPJz8sfDJ42YK7FxcOzU+xXYYP1xkWoA1QxHMcfpbCHurHr0C0YruTUVGmB6dE5kVzyrmQHDbzw==
X-Received: by 2002:a05:600c:4fcf:: with SMTP id
 o15mr8595326wmq.145.1644786312559; 
 Sun, 13 Feb 2022 13:05:12 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id 1sm254222wrz.75.2022.02.13.13.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 13:05:12 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 22:05:04 +0100
Message-Id: <20220213210504.1416861-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cryptsetup: set
 CRYPTSETUP_AUTORECONF
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 683e8387d05cb506c30592ab43a3e7534d7cf56e forgot to set
CRYPTSETUP_AUTORECONF resulting in the following build failure:

configure: error: You need the gcrypt library.

Fixes:
 - http://autobuild.buildroot.org/results/f6cead0cf1089bbbe52457d379764a0aa9add408

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cryptsetup/cryptsetup.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 2e06047c56..55cc70576c 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -17,6 +17,8 @@ CRYPTSETUP_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
 CRYPTSETUP_LICENSE_FILES = COPYING COPYING.LGPL
 CRYPTSETUP_CPE_ID_VENDOR = cryptsetup_project
 CRYPTSETUP_INSTALL_STAGING = YES
+# We're patching configure.ac
+CRYPTSETUP_AUTORECONF = YES
 CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
 CRYPTSETUP_CONF_OPTS += --enable-blkid --enable-libargon2
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
