Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACCDC433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 19:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1831C417D6;
	Wed, 13 Apr 2022 19:34:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jmgzpeeU5phh; Wed, 13 Apr 2022 19:34:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87DD3417CE;
	Wed, 13 Apr 2022 19:34:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A0D0A1BF405
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 19:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F31160AB3
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 19:34:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GsU1wGINDhTL for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 19:34:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A755560AA8
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 19:34:11 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso1801393wmz.4
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 12:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dgH3Lznlq9u4DoiJyQso6KKHTxfk4hQYrrMUuwW63ew=;
 b=THGz0Elc8nSkmUgC0i0Oh3hpQnOVRvjTL5xpARa2QZ8TC2hSRbux/vzeEJRy2QsaXh
 z+jQPtsVFkV0htOja4FuOkQvvcWlFvPyeHtY9YwFKZkKXffQznW1UOmSOZvurkaTNCEL
 iujyPqoHv4HEw1z5ba+wCBQJ2NPoWkgPFmZWNGBqB53z/J4YkU+iPM6VzVz2wJykEo+G
 cHhEzy1wSvS3RLAltrs4+7F9Ja8Poz6pZw70LL88HINu+XvxTkYD3DDoOZqAhX/8Md76
 1LMo5vJbGiSv5f3byEiA8s8b8H86K9gb8iHbJcJcoRBeOwlovIALjVgRI5/4Wiomaue2
 Ftfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dgH3Lznlq9u4DoiJyQso6KKHTxfk4hQYrrMUuwW63ew=;
 b=18q/a4aSlHJmcXaxMERRwvReQag9EQ31uG1Vb/mU++Nm1IVmTyPvC+Edvv226iYkUb
 dIqHb6CT0NWVQiib0GHYZAIrNY5x0kUbM+VEGUazzDdEyjepHvjFI9YR+M46q03/qDh/
 p+0y90+3fR2uxW+ZU4QYlxppxyKrtRfLuEQQtbcxL19S/Vtg8TI18hK0mXqjgy/Cankz
 +gmNoHIRuIYjXDRz3KZWwn+pyJDOe7xacJLyJg5rOvEGZ+0Q4i0J6EgSjTPeDEMQ1+cT
 kpL0cgIFfloRpEI1hVbUw0dAexdBA5KzY0j3XBk31y0CdP1wR49bAaJ29Hx54DezoIkl
 +f8w==
X-Gm-Message-State: AOAM531sszjTqBCESvMsROoZXmui89Z8DnAR32/yf2BVSxQiHZVK8cHF
 QHPGhzw6Fgmaj9QDBu9B15gHzT2s0/U=
X-Google-Smtp-Source: ABdhPJwcNXmm9u3sHcVtTfZO7VhcWbHq9II/i1Dq2ho8rZkxUAtW9ZJFPf44QT2Njqr/79oC+pqqVw==
X-Received: by 2002:a1c:43c6:0:b0:38e:bb4c:6e1a with SMTP id
 q189-20020a1c43c6000000b0038ebb4c6e1amr219524wma.111.1649878449611; 
 Wed, 13 Apr 2022 12:34:09 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 w17-20020a5d6091000000b00207a89b952asm7654265wrt.77.2022.04.13.12.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 12:34:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 13 Apr 2022 21:32:16 +0200
Message-Id: <20220413193216.891178-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dhcp: disable on riscv
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

riscv is not supported since switch to internal bind resulting in the
following build failure since commit
0c8dd6ebd656e06cf99a63eb93343715f4853503:

Invalid configuration `riscv64-buildroot-linux-musl': machine `riscv64-buildroot' not recognized

Fixes:
 - http://autobuild.buildroot.org/results/d25b76e628ffe5293c6bc1fd467a6b8966cb1bc2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dhcp/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dhcp/Config.in b/package/dhcp/Config.in
index e0706efafb..aef031e05b 100644
--- a/package/dhcp/Config.in
+++ b/package/dhcp/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DHCP
 	bool "dhcp (ISC)"
+	depends on !BR2_riscv
 	# fork()
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
