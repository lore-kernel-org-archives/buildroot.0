Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC94C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 06:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48ACC4034B;
	Thu,  6 Jan 2022 06:24:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YjxCWOXscJJ1; Thu,  6 Jan 2022 06:24:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57C7540286;
	Thu,  6 Jan 2022 06:24:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 869DF1BF8C7
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 06:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D9CC428A6
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 06:24:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 84z7svOl0C2y for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 06:24:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9F724287F
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 06:24:11 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id l3so1899186iol.10
 for <buildroot@buildroot.org>; Wed, 05 Jan 2022 22:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=toTWCRjGKSzDbXfa+oXyDMP5PZ3oMaQEg3GVMO02WK0=;
 b=RAVxwm+pLim+8TXaeVRBDHPRiBDWHnIMwQVzndnipWcL6n8+jvyVqJsGT2iWnaNpW6
 nNT6TpoouksqXHzMHWISSyUKxyYJR31GeB4P7UbnHGK+JSOs8RqSYrFsTZOrerB17DJR
 R8WmS+fB1lXbeWxGuEGt+bqTliydYamGvcUwQeOYB5hOn9erqT8aFqRy0cCbPh51xaJ0
 AeBeLW+H9nCbFCsvVLFc3ae1HL7sIWwJg8mq23YL93vY7Z4w+H56ISW+FpOM/fdDPhBp
 micUsXU+5tN1Evp+atsppSSCPV+aINn7ZWqmA40g8hQWG8qzrGcFjncfcU8ag7rpaN4t
 04GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=toTWCRjGKSzDbXfa+oXyDMP5PZ3oMaQEg3GVMO02WK0=;
 b=atvv6WRRMI1rcjsN3yC7QYCbD/O8aDjxXo/Kvry2adEnPy6gdq2R2PeUA4xuZ5Mdyo
 YeWSizEQy2x+dWG8i0zg/XrHEOndfkt8+PHavim9UaVfJ+D7JYjyjqztC45icndAkpa5
 tTkXcfDa5E9aPcdC32tc/aMGAvRfYfIo3nVG4eTlZLMtotxf6EPm2KoxG5HgLNcWHXpg
 VA0BirHtKVWnjhkN/FOFvkE36MPJRBBpBmqh9kSBoIzOfvTJAArNut4VXHip//B+GwED
 OGWZfrQKFx7Ntqoy+UQLqd9P+Vs7X8rG5IdNexhlSIiJQVCMCC4+b7IHv5+9bXf/h+l5
 hupA==
X-Gm-Message-State: AOAM530LAPmmMYViSe+tIJ5ohGNZr3JgUFtEXzEmI1dySkfEXInPXFMJ
 oNvXDVINph79Wjn9JvE0vT6WkE92TvM=
X-Google-Smtp-Source: ABdhPJww4zzGoIhZoooZ9ijGcErJtw+zbRVn5lXvGGaaSuB+4HIaQLoGQkA+yj9xKa6mSluPhjPxJA==
X-Received: by 2002:a02:ca02:: with SMTP id i2mr27832431jak.42.1641450250630; 
 Wed, 05 Jan 2022 22:24:10 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id k19sm662095ilr.34.2022.01.05.22.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 22:24:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  5 Jan 2022 23:24:04 -0700
Message-Id: <20220106062407.3131530-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/4] Makefile: only check _FINAL_DEPENDENCIES
 are selected
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
Cc: Naumann Andreas <ANaumann@ultratronik.de>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>,
 =?UTF-8?q?Ga=C3=ABl=20Portay?= <gael.portay@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

_FINAL_ALL_DEPENDENCIES includes _FINAL_PATCH_DEPENDENCIES which may
not need to be selected in kconfig in cases where building is not
desired, so only check that _FINAL_DEPENDENCIES are selected.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ac98b84425..7a2da3b043 100644
--- a/Makefile
+++ b/Makefile
@@ -589,7 +589,7 @@ endif
 endef
 
 $(foreach pkg,$(call UPPERCASE,$(PACKAGES)),\
-	$(foreach dep,$(call UPPERCASE,$($(pkg)_FINAL_ALL_DEPENDENCIES)),\
+	$(foreach dep,$(call UPPERCASE,$($(pkg)_FINAL_DEPENDENCIES)),\
 		$(eval $(call CHECK_ONE_DEPENDENCY,$(pkg),$(dep))$(sep))))
 
 endif
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
