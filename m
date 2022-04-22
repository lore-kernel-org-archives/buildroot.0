Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D349C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 22:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5AF661403;
	Fri, 22 Apr 2022 22:06:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N-Y9vcShI0MW; Fri, 22 Apr 2022 22:06:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECA3561082;
	Fri, 22 Apr 2022 22:06:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 515071BF2BE
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 22:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E4D061079
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 22:06:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6VYXKweemAzn for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 22:06:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 451A3613FC
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 22:06:09 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id v12so6045547wrv.10
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 15:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yixa8r4r6NCi47x/ea8bmwoexBnaSn56OeeyZ316Rh4=;
 b=j3QxRIcP7SVa5NngJzKDQLv7nLk/5Lz7hF+i0zXgt6NU6A2da3Lwq1ZHwLV+FB/aCo
 plLUzCD3YQ+ifXAAAqKYg/7mxaxZZCnKNWfxVVPPLukrIOSkHd6GPsfYm1EF8ZJ2J7Yc
 QKqyHVYY1ujI9jIzxbluPzCa509FkJuW1DtzZrmYZxUpbp/x59L9nQfGsfDRZtpJL5Ju
 2OsyDDmWATBhx7gCmh/R/Ie1yC+ZkUofDprbYN2Xao7XhF9M5zBurQ1LBXz4vxY3f6mq
 STdvrGI8f2X1d2P1PwrrM8no9A5NrMzkwHHuoQTpmG1M/SROcPKh5AE3ECWSqmumd814
 tHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yixa8r4r6NCi47x/ea8bmwoexBnaSn56OeeyZ316Rh4=;
 b=T21870ydqBZJlXhECUCX+c3VbPMXr5XtxwunfWz1yffxdb17OWVuOCnIoZs2JsncO+
 FLYxy76DluOOFEUzrnkhGpfG7WP6+lObngtJLmQ8mRMtp5bs2VLoTYttcaJjIiT/HY3B
 bZRIwlofp4xYQUoK7DJXeGR4dw9I9waCutjWUcc+GvqMJTgPcHzG1vMNzaUBlamhaRY/
 mQQuxGkMOBvP5u3LW3QhiQvVAjS2oPJYxVGvj2l0GiPuX9tcIQcy+KmoZHQWPRR3r4FX
 dy4w8/R1ZGvtYMyl+uGr+/C8un9WvYxGGZH354MiEHS7iiyeVNFPc79pop9dwP2Vjiyp
 nVsw==
X-Gm-Message-State: AOAM532qcdeaDnOEcdKoQ1GvSsPu9xbzaGG9bl2AqjlxqjDzxdPpiK3b
 3pnjvaKPVbOYxaus987LZ0NxdS/pnCk=
X-Google-Smtp-Source: ABdhPJzT2OaZOu6Op2XNnBHUlXdpAowyB4gsMhv3nj9BBf4ULfK0ulGFyWHf8WZ6pTnXodky6NYEoQ==
X-Received: by 2002:adf:e346:0:b0:205:97d0:50db with SMTP id
 n6-20020adfe346000000b0020597d050dbmr5351757wrj.257.1650665167292; 
 Fri, 22 Apr 2022 15:06:07 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c190e00b00392910b276csm7174453wmq.27.2022.04.22.15.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 15:06:06 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 00:04:08 +0200
Message-Id: <20220422220408.3173274-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/imagemagick: SVG support needs host
 gcc >= 4.9
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

SVG support needs host gcc >= 4.9 since bump of harfbuzz to version
3.1.2 in commit 6861933d22006fbe8c961a41506beac826881f33:

In file included from ../src/hb.hh:473:0,
                 from ../src/hb-buffer-serialize.cc:27:
../src/hb-vector.hh:206:20: error: 'is_trivially_copy_assignable' is not a member of 'std'
      hb_enable_if (std::is_trivially_copy_assignable<T>::value)>
                    ^

Fixes:
 - http://autobuild.buildroot.org/results/7b2430c5ae4eed51685ec12bf778c07a0a8b1701

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/imagemagick/Config.in.host | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/imagemagick/Config.in.host b/package/imagemagick/Config.in.host
index 671b0995dc..5055101e23 100644
--- a/package/imagemagick/Config.in.host
+++ b/package/imagemagick/Config.in.host
@@ -17,6 +17,7 @@ if BR2_PACKAGE_HOST_IMAGEMAGICK
 config BR2_PACKAGE_HOST_IMAGEMAGICK_SVG
 	bool "SVG support"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # host-librsvg
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-pango -> host-harfbuzz
 	help
 	  Say 'y' here is you need ImageMagick tools (like convert)
 	  to support SVG.
@@ -24,4 +25,8 @@ config BR2_PACKAGE_HOST_IMAGEMAGICK_SVG
 	  This is not enabled by default, as it brings quite a few
 	  extra dependencies, and thus extra build time.
 
+comment "SVG support needs host gcc >= 4.9"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
+	depends on !BR2_HOST_GCC_AT_LEAST_4_9
+
 endif
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
