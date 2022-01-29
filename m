Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570A5C433EF
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 14:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE5BE40357;
	Sat, 29 Jan 2022 14:24:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BpCko4bH5_sz; Sat, 29 Jan 2022 14:24:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3459840337;
	Sat, 29 Jan 2022 14:24:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A52521BF681
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 14:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93F9E60BC6
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 14:23:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Om4RpyjNIW3 for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 14:23:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC214600C5
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 14:23:58 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id a13so16410107wrh.9
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 06:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=egAokXQAMLn03mY5vulE2zGycz0xtKo7KqGS7sUzoUk=;
 b=ZlK1d+qArsqYoxUDJjMDexlcl/AK6ALGEd3E1zECvETMe3Q5pkaNlkZ7X0VbeDEGj0
 gU70UVKSicb6ZJSCdLlwecw3HmjlaxPTqd8zpWR04dZBwLw3JNuXtJxn9EOvvBYfwWn4
 K543LMxveB3LVs1JzbyRvGXzfkQxtBq2XiK2zPVZeA6UkPNBsg9fTuWQpoAV/mzfNJEt
 Zj9Z09zVnbdDCh3H9jPK1h08aUOwUFW2Hw94zU40mnSM8k3bjUENlHrT+xeqtS65nAzX
 bZO1jaXb4huBbJnrlcNbW0K+51HckI/chNTTeHYxsaXR+VeX9DrKW+WoieioGtJ2JOp3
 184Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=egAokXQAMLn03mY5vulE2zGycz0xtKo7KqGS7sUzoUk=;
 b=GCgBIXiY4lFtwtJJUCON72JOOi+YoH7b/1Zp5XyqKG7hw64MhCc36iuDqqCntknjbn
 qass201RrRRMa3CCMDkJv7j01QihF6d7gYRmqSjJwt9C6JhG+Wei06nkxlnGXook5K42
 qzJyP+3lfxhPl0TCdNj8Li42dexJGQxXROuab2VRJB4E/vAgK3nBtrkQt8u4XhHNml/M
 OCucOXzDETuUX/biy4gI9EmM+bJaf3CX/9jTWrBHbvbLh39kRFVN3m/vaptyVeYal+Rw
 B11UAn1ifzlJDixXeMVeD+36zs+urIHO+9FsnvFSl6XKvSgGhQlu/ruQld3TeDZ8/Ij1
 JI0g==
X-Gm-Message-State: AOAM530KII67M1MzeG9jNSwV0FJBm5fr2887LXwSwrdVI4BRCandk9yI
 /3EYNTDpfGk7+1c00PkuYNc5CNdrsHQ=
X-Google-Smtp-Source: ABdhPJzxaOHcICo5yvYeQ+pEOCGscSuxmYRCmBm0zx/+pbsOIfLdlOpwTufKEgaXhnjWyTaAsj8xyQ==
X-Received: by 2002:a5d:590b:: with SMTP id v11mr10560662wrd.74.1643466236885; 
 Sat, 29 Jan 2022 06:23:56 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id m11sm4101052wmi.16.2022.01.29.06.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 06:23:56 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Jan 2022 15:23:51 +0100
Message-Id: <20220129142352.1197168-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220129142352.1197168-1-romain.naour@gmail.com>
References: <20220129142352.1197168-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/poke: disable minimal-threading
 with thumb or thumb2
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable minimal-threading when thumb or thumb2 is enabled due to build and runtime issues.

After fixing the build issue "Error: invalid swi expression" with
upstream, poke fail to run with the following error:

 # poke
 ERROR: specialized instruction beghl/retR (opcode 25) is defective but has no replacement
 [...]

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/2030046871

Reported upstream [1].

[1] https://lists.gnu.org/archive/html/poke-devel/2022-01/msg00162.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/poke/poke.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/poke/poke.mk b/package/poke/poke.mk
index ddd03ae3b0..91518f5854 100644
--- a/package/poke/poke.mk
+++ b/package/poke/poke.mk
@@ -46,6 +46,15 @@ POKE_CONF_OPTS = \
 	--disable-libnbd \
 	--with-libreadline-prefix=$(STAGING_DIR)
 
+# Disable minimal-threading when thumb or thumb2 is enabled
+# due to runtime issue.
+# https://lists.gnu.org/archive/html/poke-devel/2022-01/msg00162.html
+ifeq ($(BR2_ARM_CPU_HAS_THUMB)$(BR2_ARM_CPU_HAS_THUMB2),y)
+POKE_CONF_OPTS += --disable-dispatch-minimal-threading
+else
+POKE_CONF_OPTS += --enable-dispatch-minimal-threading
+endif
+
 ifeq ($(BR2_PACKAGE_JSON_C),y)
 POKE_DEPENDENCIES += json-c
 POKE_CONF_OPTS += --enable-mi
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
