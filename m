Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8D3C433F5
	for <buildroot@archiver.kernel.org>; Sat, 21 May 2022 12:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAAA440B07;
	Sat, 21 May 2022 12:39:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AqDL8xg21cIX; Sat, 21 May 2022 12:39:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D136240B20;
	Sat, 21 May 2022 12:39:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 41FF51BF2C0
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 12:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30ED261026
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 12:39:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vq2J-XM9fMpw for <buildroot@lists.busybox.net>;
 Sat, 21 May 2022 12:39:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83EC061001
 for <buildroot@buildroot.org>; Sat, 21 May 2022 12:39:08 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id i40so13633543eda.7
 for <buildroot@buildroot.org>; Sat, 21 May 2022 05:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CM0h7+GgTT+cJCODjx9gz3f9t5Sg5NqtFCV3wg273V4=;
 b=T0CUsPWLDz9zv/ykieeja2JhHPzXoW8JZsp52yaMex+msoCQ2TwYpGyokIXVqaxZTn
 w6gnWTyS3oYnXFFBsmPkROpkY0i1bUz7Nx4XgnjIX48dgKmOg8EGY4pQ+Dc71vKUyT8n
 /YGCCwkPmMYszU5M579DlCIDwpwdNNt60YDH2Q4190fE/ztdoHr0aBYx2eAlW2gIcFeb
 +YrI66oMEJH0GPRD8uHaILI+lYYyZziusZU9ZdKz/s+qk7oMDoBuvEXMBb0xC3b/dAbQ
 lCAUD2cs6mpov333e5NLwG58AW1TV95EOjS3Vqv5yff4l8rhK1iSgOfptHoxuC/TQjE4
 kt2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CM0h7+GgTT+cJCODjx9gz3f9t5Sg5NqtFCV3wg273V4=;
 b=Q6UHld8yX38j2iWnNQ0IQ2Br6AH5Sr4BcZnAYzDzISHMvrBagzpZHZTW72lznwnqLF
 I5R4L7V/tF9mwzPa17SHP3yeI4oVcyXlHklJSZFu4lcWLn+gO0aht2yMJiY/9XB/c4n3
 TP9z2cQoF8qtuwJG1PpLkzqdsXyNbqV3aAmK4w+d1wHQbnw0RTzAQkU/I3ImFGSV8xl/
 Idt4KQ5XZbgRFRoRQnj2XN6I+PN16rVUz2B3bFdKcBDrZV52Gpf6XvsfL73VIlkeX73o
 EtAGAKlFsZQWWNhrq0lcCdduIGZUHpgYdzZWsgFv1iHshSC0PBzsaOroMSOlC7r7+KO2
 VVmg==
X-Gm-Message-State: AOAM533UyNl7KUkLtMIlBIxfg6VCWW2+yNnN7pI8PKMkfXEMiY44Srm5
 TyASsl+jX37s0ssli5y9Hq93q7HLnZM=
X-Google-Smtp-Source: ABdhPJzfhU9HvLLWK6xYclXv3TSVx0rmWijMJM++llE+7LUiP7iGg+OBISCNMl/44OwjSW83Wj8gwA==
X-Received: by 2002:a05:6402:4001:b0:42b:212:57c3 with SMTP id
 d1-20020a056402400100b0042b021257c3mr12937535eda.109.1653136746242; 
 Sat, 21 May 2022 05:39:06 -0700 (PDT)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 jx4-20020a170907760400b006f3ef214da3sm4110479ejc.9.2022.05.21.05.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 05:39:05 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 May 2022 14:38:40 +0200
Message-Id: <20220521123838.2881-3-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220521123838.2881-1-heiko.thiery@gmail.com>
References: <20220521123838.2881-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/4] package/libtasn1: add build support for host
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/libtasn1/libtasn1.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index ba86081df9..11ab223962 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -29,3 +29,4 @@ endef
 LIBTASN1_POST_INSTALL_TARGET_HOOKS += LIBTASN1_REMOVE_PROGS
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
