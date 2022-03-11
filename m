Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF034C433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 04:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50C5140BD0;
	Fri, 11 Mar 2022 04:18:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HaUcXVQG75tI; Fri, 11 Mar 2022 04:18:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39B54405A2;
	Fri, 11 Mar 2022 04:18:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 82C731BF3A7
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 04:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F89C402C9
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 04:18:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1JPQZgP0eqg3 for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 04:18:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CBFCA4026B
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 04:18:24 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id g1so6925505pfv.1
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 20:18:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b7MsELyawcgPVnliKHkjjXcJ9oDyyhV90kl3vXA9vdI=;
 b=DtDWxtY2HDNdsVc+FFSB03BGZNTJZqdaLwmbDMkXgE283ahHUwkheQPCv/LcxPAv7G
 T70JoXQGGvFjShS6k3vHBPk92bF9I34U7UnyZ1y0pyUjRazoCdtSlS3dYDgge07+oclq
 1622uwKovL3PiL+uicgtO9pQ8lYBrzLo13n7S2poE9gaGXOUE4s4pdF7oJl2IxrULlrU
 ZbKBHl7u1NYv+moP3xIKXhso7F2RExtbaALpHpFV5K5FfbaONKsXMeb7kuf/F+XJE4n7
 lZ1vDe6wUuu2Usoaw6U/yP6FaE/T82dIvdhvCssQeVZwe7q2jU0IMJM3iPXMyA5ibVq5
 tX5w==
X-Gm-Message-State: AOAM532xG35VsXuo4KnIM56YtekT8KCXoG4U4FumVMyaj9WysyJnoTMZ
 6owy7HQxt2J7R3ruKJopqwDHKK+uTu0=
X-Google-Smtp-Source: ABdhPJyp76d26TXlWl+Q0B8sdmz7kawsniMLD/MmnOyJ7svRjUq/U2Km2a1KgHFv1h5IKs7LGis4Sw==
X-Received: by 2002:a63:4f48:0:b0:378:a293:11f3 with SMTP id
 p8-20020a634f48000000b00378a29311f3mr6843312pgl.99.1646972303745; 
 Thu, 10 Mar 2022 20:18:23 -0800 (PST)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 124-20020a621682000000b004f6a2e59a4dsm8075626pfw.121.2022.03.10.20.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 20:18:23 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 20:18:21 -0800
Message-Id: <20220311041821.3078930-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/moby-buildkit: bump to version
 0.10.0
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/moby/buildkit/releases/tag/v0.10.0

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/moby-buildkit/moby-buildkit.hash | 4 ++--
 package/moby-buildkit/moby-buildkit.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/moby-buildkit/moby-buildkit.hash b/package/moby-buildkit/moby-buildkit.hash
index 3015e479f6..e22e97cb3a 100644
--- a/package/moby-buildkit/moby-buildkit.hash
+++ b/package/moby-buildkit/moby-buildkit.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0cc31aa4b6dcdead63b07d75e0b89495ecffcc183f4f62695d8bb507433fc8ff  moby-buildkit-0.8.1.tar.gz
-sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
+sha256  5877faf02cbddfb6c988f44b5b373739fed87f4aeb8802c6777fe7be2f772506  moby-buildkit-0.10.0.tar.gz
+sha256	7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/moby-buildkit/moby-buildkit.mk b/package/moby-buildkit/moby-buildkit.mk
index 3f0df351ef..d34ff96252 100644
--- a/package/moby-buildkit/moby-buildkit.mk
+++ b/package/moby-buildkit/moby-buildkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOBY_BUILDKIT_VERSION = 0.8.1
+MOBY_BUILDKIT_VERSION = 0.10.0
 MOBY_BUILDKIT_SITE = $(call github,moby,buildkit,v$(MOBY_BUILDKIT_VERSION))
 MOBY_BUILDKIT_LICENSE = Apache-2.0
 MOBY_BUILDKIT_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
