Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7ECFC433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 09:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 491AD60BC1;
	Sun,  3 Apr 2022 09:22:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4j86XHIgL6Lw; Sun,  3 Apr 2022 09:22:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BC2560B97;
	Sun,  3 Apr 2022 09:22:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A96B71BF599
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 09:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96B9540377
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 09:22:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GlYTFKFsYhHX for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 09:22:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1A3C40145
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 09:22:47 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id h4so10134222wrc.13
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 02:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+TryFBEjdkTczAW6smrLNbcDYF9XB9tQx2EbWSLIIo4=;
 b=o7KbNloTdzsst87JtNmse9QPUOIk5u1KXSeSlY+NpmODl+BiU7C+BTiEz8FWhVIKcF
 VLojKIbTwFeDf3xeata9QXVbXGa/pz2ZIFWeJq2wVR2yUgZxDulaGbKG+WD2rzTkwYFM
 rprX9JorklypLDMIlXMlzZSWqefJUiWB02QbxkIRT4cXU+yiC7o9XIqw+5ytBNMlMAwC
 Y/PV51KIW0KWb8WHSL8hFqgbSVwe1VlkYOoPbeOAI5rhDOiXl8VuriogvU17HHLkfViu
 1qclOn/n+8x8z221pUs8YgGRG5PaY1Srijt2vW1IAI/RLKllQlrORTfPZyOyQkmehbzc
 q76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+TryFBEjdkTczAW6smrLNbcDYF9XB9tQx2EbWSLIIo4=;
 b=P0MnFjGP2X4ii3NFWou038+AkhFZxvd41/266ukQPUqWYJHFDRg3ZEezi+0b2pziCc
 rwC8e3UbeOLojrwdNmAlBTvJt7f9JfOrzsQWwu6ku4tceP2KFgy7/PywWPjkjdR6e10d
 vX3szDPz1r1stfKGQ3ZJsYy67FmVXogRA5PJOSv1zw0vFdWpTXwGtTpovr2ebl5iQQMM
 jJ8MZZhvW9kiekcPS7WUo1gG+PukBcOu+PJqBMeOLNR10jclNCjDCes9OzpPtBsvPToH
 FE5J1hfTuvy1xzRxnpZrit8pRRC9hfbMK0QZoTAngf51SG6J8d2kPt3Kv5W3M6oD+IMr
 CsGA==
X-Gm-Message-State: AOAM533P+eSGNu1kdGoD2BEAuLRGJUKdI44C9zqbKKtkq3d8jpRoCblv
 9c8P/QfLR7qSOy3j3NhrRz6Y9XEJNbs=
X-Google-Smtp-Source: ABdhPJyT51vlCchX7/jQhoIdYq67vd9J/MREM436iBlVq95eUz35vXrIYiVFfi3iQI6DSoma8n3l2A==
X-Received: by 2002:adf:8122:0:b0:1e7:b111:3b92 with SMTP id
 31-20020adf8122000000b001e7b1113b92mr13600757wrm.695.1648977765273; 
 Sun, 03 Apr 2022 02:22:45 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a1ca102000000b0038c78fdd59asm14384882wme.39.2022.04.03.02.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 02:22:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Apr 2022 11:20:58 +0200
Message-Id: <20220403092059.2320843-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-brotli: add missing C++
 comment
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python-brotli needs C++ since its addition in commit
2f176b837bbd2eb5ab4d23b7ba0528e548287aa7 so add a comment about it

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-brotli/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/python-brotli/Config.in b/package/python-brotli/Config.in
index 1c09c26866..c31315392b 100644
--- a/package/python-brotli/Config.in
+++ b/package/python-brotli/Config.in
@@ -5,3 +5,6 @@ config BR2_PACKAGE_PYTHON_BROTLI
 	  Python bindings for the Brotli compression library.
 
 	  https://github.com/google/brotli
+
+comment "python-brotli needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
