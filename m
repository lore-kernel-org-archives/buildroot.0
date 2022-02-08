Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770FCC433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 12:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C299E404F5;
	Tue,  8 Feb 2022 12:20:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RqtspgmT9AqL; Tue,  8 Feb 2022 12:20:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C578B40435;
	Tue,  8 Feb 2022 12:20:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F1D4B1BF3A9
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 12:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBF04813AB
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 12:20:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9EoXirLqNCLS for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 12:20:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99A478137A
 for <buildroot@busybox.net>; Tue,  8 Feb 2022 12:20:15 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id v129so8482387wme.2
 for <buildroot@busybox.net>; Tue, 08 Feb 2022 04:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bYmRbjDLGVajNNVW1h7AaKm2+iLboNZg4yUwzeRqC/E=;
 b=eQRs3Lh9rcAhYRa+9EnpFhPqC4drR8+VZVGeakGMJzXjYlKGgTpmV8HgnxY2EewiGP
 +KAA2ukAa+RruZy+MSZx1zVMPx1pm5fydzVew6xjy9Ka/wukY/59t8PKLuk32IdSViXx
 rtTyOoEYXgS2FSrwdMa7/wMIN8hZwufdhj9ves5E2giMH65S/Y3CpZYCR+0ktuJTyrVM
 uj1Q26AU6WH/5lkyQQJWPYpGUGESRfZxidGbL66gXvjcyp9nSKrTsh12kHwtZwIwkWNP
 3aC7b6wL1cGoPSoNrAV3vBSR7Pi8yEK+3Vfo81PfvcL/lIUIVOXY1Ui1uPFicziwoNIj
 VYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bYmRbjDLGVajNNVW1h7AaKm2+iLboNZg4yUwzeRqC/E=;
 b=GgOtEqqeZskE8x+x6te2MFn3C69rqL54NP65cmq5B0oBRWmGR0ZOd3IlYTnIHj/rVH
 Vgs/4q/zzEWH+AMN+/DMGx+EUVZuXUOuqV1rTeHlWd/Rj3DU4l2UA6lrqYd91vw2mAkU
 JAB3BoIluzuT+4usGIEWBajkxvS1d9qly/A+3RK5fqGurt6RLNSJ6UuCkEuFUYfBPdbQ
 M4JMW4zgk88VA4PZmom+ZcYkqkoA55CG7uXGHgrgbhweSXKpkv+CfvEz3RYy+RMCI+Mh
 wycfccTG80e6NHchtv5sCMlfpHZ3t2u/sO8TxT2KjPNCnz5fIy6v3TdjGsMrYB7hupT7
 oIAg==
X-Gm-Message-State: AOAM532YKDU2mG2rBvc0zGa8gJaSNAlfV5/qsQxXu+EsGWYH/I/dAUfm
 ldyNfdpe2W3x7UhWdpW282dLpiC/l38=
X-Google-Smtp-Source: ABdhPJzGReXMwSBjb0vXsgvxEYKCuIMjXcCtNvKOP+VZ/qKPCm/yMfKLYFwNmT+fasbz71LXCRLFUw==
X-Received: by 2002:a05:600c:3046:: with SMTP id
 n6mr933821wmh.32.1644322813395; 
 Tue, 08 Feb 2022 04:20:13 -0800 (PST)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id u11sm7285658wrt.108.2022.02.08.04.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 04:20:13 -0800 (PST)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Tue,  8 Feb 2022 13:19:28 +0100
Message-Id: <20220208121928.28519-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/liquid-dsp: bump version to 1.4.0
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
Cc: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/liquid-dsp/liquid-dsp.hash | 4 ++--
 package/liquid-dsp/liquid-dsp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/liquid-dsp/liquid-dsp.hash b/package/liquid-dsp/liquid-dsp.hash
index 31bcd68767..7e5de6b259 100644
--- a/package/liquid-dsp/liquid-dsp.hash
+++ b/package/liquid-dsp/liquid-dsp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 85093624ef9cb90ead64c836d2f42690197edace1a86257d6524c4e4dc870483  liquid-dsp-1.3.2.tar.gz
-sha256 4df7126196efba1283deb99e3269418dde4ab0ad1fde80a55051153451eb4df2  LICENSE
+sha256  66f38d509aa8f6207d2035bae5ee081a3d9df0f2cab516bc2118b5b1c6ce3333  liquid-dsp-1.4.0.tar.gz
+sha256  4df7126196efba1283deb99e3269418dde4ab0ad1fde80a55051153451eb4df2  LICENSE
diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
index 9745893b7c..fcdf572532 100644
--- a/package/liquid-dsp/liquid-dsp.mk
+++ b/package/liquid-dsp/liquid-dsp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIQUID_DSP_VERSION = 1.3.2
+LIQUID_DSP_VERSION = 1.4.0
 LIQUID_DSP_SITE = $(call github,jgaeddert,liquid-dsp,v$(LIQUID_DSP_VERSION))
 LIQUID_DSP_LICENSE = MIT
 LIQUID_DSP_LICENSE_FILES = LICENSE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
