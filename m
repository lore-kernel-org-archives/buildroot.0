Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509EDC433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 23:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4DBF813D4;
	Mon,  3 Jan 2022 23:03:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f2DEd6_Z67bm; Mon,  3 Jan 2022 23:03:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B58481916;
	Mon,  3 Jan 2022 23:03:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8B8601BF983
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 23:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA45B408B1
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 23:03:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mi2yxV-1Mrgb for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 23:03:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F5CC408AB
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 23:03:00 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 v13-20020a17090a088d00b001b0e3a74cf7so633021pjc.1
 for <buildroot@buildroot.org>; Mon, 03 Jan 2022 15:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ga0+9JYc4xm29j5bA2EbGDHcmdEbahze/wwm5QLsPzs=;
 b=CjefNqXNzIQ4j8B8K49lNNfn29Sc4pZ1BZ9G70gXej58e5b6bT1dYjtt4JbZZQjDvS
 fQ9xSrmHtRwQijtux9ifc/1bIuZLKHO/i6zkuTET7ifnWInI0QyU9I1XxXxZaBFZa8ym
 7EnDtoAY6V3DVgXDJ1rjkFUFAeEkHJlEM3K63AMsgJS/Cbz23fUhQrPbPCLahV/VqewD
 dVEhjEDIKEDBT6nNoxDjtURio7HloXqANbByR02ieYKhhzNuQDxW+l7gZRDWAvyZYCuh
 0ASEiMochEvptfgTLVM7O2rc5t3S+LTIdAh50CI5zAaMUwewUsjky2VH9aoWi62dHVP7
 UWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ga0+9JYc4xm29j5bA2EbGDHcmdEbahze/wwm5QLsPzs=;
 b=s4+lNRuo/sJV6oSmws0SWTVBhDH93so0+sEdBXQCFBD6pUiVRFKReaP8UpHNqvp9Yd
 MLLQHdwnoFVJqzdpWNXpy08Z7wtD7ZbrJu1KHt+mKv1gIjYF4AJXns0+gf+p/fD++PYx
 ldc+tgZSdbdj9/Zb/KKIzdHK4U2/QEtU9AJiZ1xesTLIZao9sw2GcDGbqUawbsn7+Ynr
 XCPL6yVfKDQmN88WR5M4PhEpLemD65bB534cXaTwyOqUfKZXYV7OGdD20zdi/N6b26fE
 p2oxHBM8D+f5/egqEty77vYsXm6C9btZcEtopqFqvGIC7kRYkJsf6xb0PFQhSme7t1LS
 ANAg==
X-Gm-Message-State: AOAM533LhmbkTM74KtmeyVUlPczm57axa8xLRryOH86gTldSywgGhhxm
 ZU7iKqi5XDsJ5xlTuXvoI9g9owj1ANk=
X-Google-Smtp-Source: ABdhPJwSVJD0t9fYuxg5ePOkNzBaruJlpvPrI6FjJqh65LP2xuJbljQS4AaoX4fldUuNdI11sttayw==
X-Received: by 2002:a17:90b:3891:: with SMTP id
 mu17mr58325051pjb.242.1641250980032; 
 Mon, 03 Jan 2022 15:03:00 -0800 (PST)
Received: from localhost.localdomain ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id o7sm38954864pfu.108.2022.01.03.15.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 15:02:59 -0800 (PST)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jan 2022 15:02:47 -0800
Message-Id: <20220103230249.310062-2-aduskett@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220103230249.310062-1-aduskett@gmail.com>
References: <20220103230249.310062-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/pkg-generic.mk: fix absolute paths
 in .pc files for per-package builds
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
Cc: Adam Duskett <aduskett@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naumann Andreas <ANaumann@ultratronik.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some packages (notably qmake packages) generate .pc files with absolute paths.
Unfortunately, doing so breaks per-package builds because the paths in the .pc
file point outside the per-package sysroot.

Add the new pre-configure-hook "FIXUP_PC_FILES_ABSOLUTE_PATHS" in
package/pkg-generic.mk which searches for all .pc files in a per-package
staging directory and removes the $(STAGING_DIR)/ prefix in them.
This simple fix allows non-qt5base qt5 packages to build with per-package
enabled.

Based off of Louis-Paul's earlier work found here:
https://lore.kernel.org/buildroot/a339f273-33f3-f232-eac4-6e50427abf6d@cordier.org/

And Yann Morin's feedback found here:
https://patchwork.ozlabs.org/project/buildroot/patch/20200217212350.29750-21-anaumann@ultratronik.de/

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/pkg-generic.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 5626af1d87..94104cbfa9 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -103,6 +103,17 @@ define fixup-libtool-files
 endef
 endif
 
+# When per-package is enabled, packages may generate .pc files with absolute
+# paths for the prefix field. Remove the absolute paths from the generated .pc
+# files to keep per-package isolation with the build sysroot.
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+define FIXUP_PC_FILES_ABSOLUTE_PATHS
+	$(Q)find $(STAGING_DIR)/ -name "*.pc" | xargs --no-run-if-empty \
+		$(SED) "s:$(STAGING_DIR)::g"
+endef
+$(2)_PRE_CONFIGURE_HOOKS += FIXUP_PC_ABSOLUTE_PATHS
+endif
+
 # Make sure python _sysconfigdata*.py files only reference the current
 # per-package directory.
 #
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
