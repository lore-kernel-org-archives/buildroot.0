Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8268C433F5
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 22:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44407416F4;
	Thu,  3 Feb 2022 22:07:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RlJjvPggElSO; Thu,  3 Feb 2022 22:07:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30E9641705;
	Thu,  3 Feb 2022 22:07:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8BC251BF20B
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 22:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A07641705
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 22:07:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OIugGUgo-5MS for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 22:07:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E6F18416F4
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 22:07:11 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id v13so7665777wrv.10
 for <buildroot@buildroot.org>; Thu, 03 Feb 2022 14:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TpBxuUQtWbbK3YxzHx69gvXPEEDkxGn9KzbsQ1Q79TA=;
 b=gHkjC73Q96z0HtIS6DIHLymq8LzpnBZLNAEKHQ77H3gH+DI/Cw1SgOWoordwQ7m8mR
 PoV80/m1FxSeYkA8+ym+xjDz+hTDqNjjVUsyDwAtKcgkVrXIL0s03y1W6XqbbKPDQY7R
 W7xTdVUoWqo9Xw90j7uoavi1xGL2AagXb1PksiJukQ9kXX+xU9RSVet8+LGAwZJpV7JA
 A1edxSUJsO88TzT5WNhKiKZPXJ0R2hlw3Ouwjm5hY89a0/fJAAu9aY4FgSVlyJDU85JD
 W86ZP3yfUm8xb6cEvX21B5MqqKV6SVuwTdeOkHveqZZj/E+iST3P61U6klwIrE9caiw4
 OUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TpBxuUQtWbbK3YxzHx69gvXPEEDkxGn9KzbsQ1Q79TA=;
 b=rI4+DyxtbWvAd60aXvDUfA/gzqqi282CwuaudgYp4AenxFQVuvQqi3bTxwxqNN/BAb
 zYy/HGXBoPeqO+FUOT/h9hRoXVymJVLchWpDTKbOIYCAL2AMFGmNPXmJ8PTea6pGkYfu
 UX9fVQAGmzLfe7uebe6rilZDvpuOhkLb12xQn2M7v5geIKtvjOfiXhdTrxkyf2IiBUVz
 NPibuUaur/3JtEuQrEVYo2b7+Omg09zsFk9gDiBNDUU+i3AVPvv+9mGWmsms1PkHx9rr
 oFAMVRbndZoew8abgAL421CKU7glJ+/VINxFoVDw3WcYXPbTM7E26/AhPgtENhdUgzbR
 s4bQ==
X-Gm-Message-State: AOAM531LM76JQsj27B6VXqULifIpnvVKBh1CEdgXhIE/Q2DPl7Ka9yHg
 /ag1Ki0gu9K1D1rY+iOE7hO+KOzDm0g=
X-Google-Smtp-Source: ABdhPJxi/VPomgeGLcN7cCbv6D+RydQmNMhVv0fkdDz+q8r1yJVIn2K4XXSeg8stzPuLO3Ee1MdnfQ==
X-Received: by 2002:a5d:59a2:: with SMTP id p2mr787wrr.664.1643926029876;
 Thu, 03 Feb 2022 14:07:09 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id f5sm33834wrq.87.2022.02.03.14.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 14:07:09 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Feb 2022 23:05:04 +0100
Message-Id: <20220203220504.667447-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ddrescue: bump to version 1.26
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://lists.gnu.org/archive/html/info-gnu/2022-01/msg00013.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ddrescue/ddrescue.hash | 4 ++--
 package/ddrescue/ddrescue.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ddrescue/ddrescue.hash b/package/ddrescue/ddrescue.hash
index 6877b7008d..f7c82b086b 100644
--- a/package/ddrescue/ddrescue.hash
+++ b/package/ddrescue/ddrescue.hash
@@ -1,4 +1,4 @@
-# From https://lists.gnu.org/archive/html/info-gnu/2020-03/msg00002.html
-sha256  ce538ebd26a09f45da67d3ad3f7431932428231ceec7a2d255f716fa231a1063  ddrescue-1.25.tar.lz
+# From https://lists.gnu.org/archive/html/info-gnu/2022-01/msg00013.html
+sha256  e513cd3a90d9810dfdd91197d40aa40f6df01597bfb5ecfdfb205de1127c551f  ddrescue-1.26.tar.lz
 # Locally computed
 sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
diff --git a/package/ddrescue/ddrescue.mk b/package/ddrescue/ddrescue.mk
index f113681fa1..6d16d8701f 100644
--- a/package/ddrescue/ddrescue.mk
+++ b/package/ddrescue/ddrescue.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DDRESCUE_VERSION = 1.25
+DDRESCUE_VERSION = 1.26
 DDRESCUE_SOURCE = ddrescue-$(DDRESCUE_VERSION).tar.lz
 DDRESCUE_SITE = http://download.savannah.gnu.org/releases/ddrescue
 DDRESCUE_LICENSE = GPL-2.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
