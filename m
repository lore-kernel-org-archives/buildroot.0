Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529FAC43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 00:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6D5983EF7;
	Mon, 25 Jul 2022 00:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6D5983EF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 45sfc2ICmn4b; Mon, 25 Jul 2022 00:17:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8B0B83ECE;
	Mon, 25 Jul 2022 00:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8B0B83ECE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 186341BF96B
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 00:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E532583ECE
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 00:17:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E532583ECE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EgycBrhW8OD5 for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 00:17:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3493A83EBD
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3493A83EBD
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 00:17:40 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id s206so8939283pgs.3
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 17:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MHQga0KdUKL0ltuo3WYWaoEkcyw+xYHQfgwMeouxcuw=;
 b=EGWLRribJLsYPP5wL6/KNBleOZjaRYeYfe274iT6gtfNiWi6xXJ7jVRaMiZ2EI4l9Z
 2qifS0QKsuk5GMsa+IK8uVcbj9RNHyGAwdM1OzoI+SUFkgSRgYsukDaHlyFqAMXbALrC
 9OLAM4X641Y6p2pNTjT2Hm+Xjfsf2DcUbPmNo9DHi73MhHQcX6vZKURrVDlSSNibYnOo
 VF9Rg2j0a5NPI0cxqyHP7AWeftliJTHKUnBdiSFj98fSeaV91NDwQSjnPPGbNYknFbM1
 WRbxW8DGO6I6zrDr9XXSFJDbetQOfhRR1MMlimTZH6RGyZNPcNSYP1jO+dYt61q6HyGZ
 +2Yw==
X-Gm-Message-State: AJIora9h0A8kioIZRjD7lceauHngZ3rbzrMUXL2IIUt4yIcuMPfJC7rX
 TrhxZS1mCXoRkULccbh+BZ4AwQ0hAEsd4g==
X-Google-Smtp-Source: AGRyM1tXzfTXmnee/nA915KS/czzYpiinL5Jv6BRXsyXNxOXyfqP8h20R8TsswZZ2EXM89+HkVBsvQ==
X-Received: by 2002:a63:9041:0:b0:415:c0e8:c588 with SMTP id
 a62-20020a639041000000b00415c0e8c588mr8715634pge.282.1658708259048; 
 Sun, 24 Jul 2022 17:17:39 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 f25-20020a635559000000b0041983a8d8c2sm7035419pgm.39.2022.07.24.17.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 17:17:38 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 17:17:36 -0700
Message-Id: <20220725001736.695275-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/runc: fix typo: OCP to OCI
 specification
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

The Config.in has a typo: "OCP specification"

It should be OCI for Open Container Initiative.

https://opencontainers.org/

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/runc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/runc/Config.in b/package/runc/Config.in
index 66203896a8..fe527b1954 100644
--- a/package/runc/Config.in
+++ b/package/runc/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_RUNC
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
 	help
 	  runC is a CLI tool for spawning and running containers
-	  according to the OCP specification.
+	  according to the OCI specification.
 
 	  https://github.com/opencontainers/runc
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
