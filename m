Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9A2C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Dec 2021 15:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 244F560B61;
	Sun, 19 Dec 2021 15:30:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DgW4ioU16HSZ; Sun, 19 Dec 2021 15:30:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8808760B5F;
	Sun, 19 Dec 2021 15:30:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F1711BF475
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 15:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DAE960B5F
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 15:30:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ChHbb3vcoYf8 for <buildroot@lists.busybox.net>;
 Sun, 19 Dec 2021 15:30:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C43B060B5C
 for <buildroot@buildroot.org>; Sun, 19 Dec 2021 15:30:30 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id v11so14839462wrw.10
 for <buildroot@buildroot.org>; Sun, 19 Dec 2021 07:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ptb/6jIo64m9qbG4aZa48EXK0ZRhbXnd/tDOBEsi+gc=;
 b=UPE28TYTuagraJy+8p3t7Vn6gVoZ7lJDqvx2a5L2hl8KO3eN5koBiWwJAJPURbcLD0
 1JhQKUwCmm+RTsLm3Kyp/Nc74KiPqPH61Ki5ietuTa0ONHl8aohxXLuK3QTvyBfduz+0
 LxJcH76EXLhRT1PAVW0ugXJc9x+GoqEs7EzFlts2ESShELMpNveXQrf3Teo20TPwduzk
 pPMC/gJh0j14BSW3xJ3xj0acjcpEUAvTtjWGvFKLpz6CnoYyilUhdz4Z2/jBsHQJtZYX
 l9km7q7y4UXdHibebgCiNqUJNnZS3Pb81pqEhE/g1ix47TqJK8BV/1Z0E78CppTOdk90
 yifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ptb/6jIo64m9qbG4aZa48EXK0ZRhbXnd/tDOBEsi+gc=;
 b=YEvyWueGUYYhbPQv7fPhjhswcwNeTu+ogiPD/Kr0C21yDmxxajlUtoM3eFz+27yagj
 448Fjoy7SGkWloAET+9psXEnPA3EaVHrFYHOd/4k6CgWuvC5JjsEMVZtZ1OTY/GfxfPu
 nlHh361FinKNr0WlQdm16z96kFFztmvrVZQFWTcHxVwn9MPt0rqv22BTMEKTwWR7mQJp
 Q1cdmlYIUE+2NMuzVpcY2FTxpkxfn1v0bjNaElg5hrbhTKQKB1bpUaH5erADFqiNiWnl
 GAg8xukRFxKs0q6n1YnuoPz0mzkYQ6zcu/bD4N8ycd1wG3IeVw7KpsLvDPvmXERToYoz
 d0RQ==
X-Gm-Message-State: AOAM532vxZOiWzCsFacpicHoIIRocYA3M5ffyosyjohJJslfL3f4J7u9
 cum0O8ZU6wd2cw5Rtd1nyfSc/eqwJnG1QA==
X-Google-Smtp-Source: ABdhPJwFrCU9f4QspJVsf2iHtMoUCWPucU7kXTETA0w45wN1pmKlFppbl+CU5zdFoPwA5NgprkaHnQ==
X-Received: by 2002:a05:6000:23a:: with SMTP id
 l26mr9479561wrz.666.1639927828866; 
 Sun, 19 Dec 2021 07:30:28 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id b16sm5313461wmq.41.2021.12.19.07.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Dec 2021 07:30:28 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Dec 2021 16:29:53 +0100
Message-Id: <20211219152953.1084462-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/guile: drop unrecognized option
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

Commit d8bee3950aa851620d6a954aebad1f984caa105a forgot to drop
--with-libltdl-prefix

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/guile/guile.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index c74325252f..0f245fca76 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -64,7 +64,6 @@ GUILE_CONF_ENV += GUILE_FOR_BUILD=$(HOST_DIR)/bin/guile \
 	CFLAGS="$(TARGET_CFLAGS) $(GUILE_CFLAGS)"
 
 GUILE_CONF_OPTS += \
-	--with-libltdl-prefix=$(STAGING_DIR)/usr/lib \
 	--with-libgmp-prefix=$(STAGING_DIR)/usr/lib \
 	--with-libunistring-prefix=$(STAGING_DIR)/usr/lib
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
