Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A57C433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 14:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B589182531;
	Sat,  5 Feb 2022 14:52:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ffsBwkjFT9qK; Sat,  5 Feb 2022 14:52:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DCEA82505;
	Sat,  5 Feb 2022 14:52:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 64F611BF33C
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 14:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 528F882505
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 14:52:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0JRJbf8oMRiR for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 14:52:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52816824C1
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 14:52:53 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id m27so2773841wrb.2
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 06:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tn+km0nOPpLZT09N63UbSJ85cjCc9/wZXdVfR9w8u5E=;
 b=qPO4XLqLFZVsRGYdZBiZUWI3DEZRa2910mYg2hBHF6DTj5/GnX48wQImCVD7O7Y/VI
 TN3ItRXTqJ0aZOKdn/sARwKZezLEf0whtXs5491sqI0RI8wf0tJvyNlxprFh2ycOn/xM
 mVGdBwK4O7gTAuwXHo+5yN0G0WqnDxBk3CbIrJYliwQPW8db5mCn+6zfJPBeymvh08Qz
 1yO77B99gdzQbk9Vqks27Fq9Sl6UQz/3DNdb3b/4CEyzpUk3DxQwxJ41eMLq+ybYCUHX
 tLrPF4Nkv1GnTRYBO1fE1uTnTZGl7Wf3yEc8CpOofi8o1VknwmvUHyEO6x7wzMzWAMoL
 syPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tn+km0nOPpLZT09N63UbSJ85cjCc9/wZXdVfR9w8u5E=;
 b=aMQVB8hkQvWgrKMQMZltju7L/E1c75poc/Y10/O2mosOTtVCn+tfQQxu3b5yp1lIV+
 wPMnIQEIsU0UOx9aWZKI9MrnSfI/Ls3dMsad4oL3UAhPsF0YS2tVp4ep77pAGPsKQ4SN
 1UhmrIy3Ssd6Nu+uYihstkt5Qdwtwbpe9V2e3LpsYjip2mC8Mx2kuQRz3JRTS1udgRmq
 5ZYClUi/kJHwsoNNieY7OkR8VCQtdtnYzcEQHhMP9C9Ze4dhP25rEW/LTs/ozQ8rkwA4
 dgI6eneBEUiANj0oY/Xj7ZTupsm2IP3OaEHS7J1VcLJwVF6qBtTieGVKWKLFhFMO6U+k
 p6tw==
X-Gm-Message-State: AOAM531dc3yghI4vVcBcSk6KrAzHovLxG7ir9YwaYdbbh8SU+YFKbwEO
 CBh+uF+myElbzqa05LWu8zDGDghWXUg=
X-Google-Smtp-Source: ABdhPJx5E+G0eZKmde4A8lqtNAkNzpGVTQ1TvAtyMBkNkR48+mg/L6hlic/5SV1ettHfQ0ZTn95EYQ==
X-Received: by 2002:adf:d0d1:: with SMTP id z17mr3325539wrh.301.1644072771314; 
 Sat, 05 Feb 2022 06:52:51 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id f2sm5146892wri.49.2022.02.05.06.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 06:52:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  5 Feb 2022 15:50:39 +0100
Message-Id: <20220205145039.439160-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mpdecimal: fix build without threads
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 2.5.1 in
commit 995c093d6a3e8042110d6a8d96fdc7ad65a557c4:

/home/peko/autobuild/instance-0/output-1/per-package/mpdecimal/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: cannot find -lpthread

Fixes:
 - http://autobuild.buildroot.org/results/b20c090f2ac5ea6d1c761820763037b87bde137a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpdecimal/mpdecimal.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mpdecimal/mpdecimal.mk b/package/mpdecimal/mpdecimal.mk
index 25c12c08b1..aa322df340 100644
--- a/package/mpdecimal/mpdecimal.mk
+++ b/package/mpdecimal/mpdecimal.mk
@@ -11,6 +11,9 @@ MPDECIMAL_LICENSE = BSD-2-Clause
 MPDECIMAL_LICENSE_FILES = LICENSE.txt
 MPDECIMAL_CONF_OPTS = LD="$(TARGET_CC)"
 
+# threads are only needed for tests
+MPDECIMAL_MAKE_OPTS = MPD_PTHREAD=
+
 # On i386, by default, mpdecimal tries to uses <fenv.h> which is not
 # available in musl/uclibc. So in this case, we tell mpdecimal to use
 # the generic 32 bits code, which is anyway the one used on ARM,
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
