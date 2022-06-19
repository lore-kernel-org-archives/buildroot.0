Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6174C43334
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 16:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6357A40167;
	Sun, 19 Jun 2022 16:48:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6357A40167
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cLWGSlEiVJqW; Sun, 19 Jun 2022 16:48:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D6D5408EA;
	Sun, 19 Jun 2022 16:48:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D6D5408EA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 376191BF4E7
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1249D81C44
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:48:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1249D81C44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eFL4bK16nnxF for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 16:48:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F6A281C38
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F6A281C38
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 16:48:55 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 o37-20020a05600c512500b0039c4ba4c64dso6683003wms.2
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 09:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bS/kQIveoUQhvAyS09Dmw8g9NdyBHMXiTQTtsI1rwfo=;
 b=V+a8ztgxy3uafAOapzgon0qRTf5qplp/Rq4i+A7ohjIQoF47mWccRsIASrs0EkGYhk
 p6j2+ZW67fnFxnD1pYgKIYaIZy5URrowFcVrH6xeP2GRgymC6HglkvrZYT3AVZyZmJS4
 AMwD04cQR/2aRxjuyNt/6hR+mPDAcybww1Twj1LlKBw6fL/+Ir/zcPLz+iGKZqmzgXNG
 EsnXISgmXadIcibnggV6mu9mHhaG2aekAO5DZTLDo+CMi/vcsetEG6bsbHi9bYLfAt8s
 1d/s0b59R0jfrPG1OcN3e+RI57JyNCLrBIb297/g4m9PgGELU1EZDpTbK05VqDWGa42/
 Vhow==
X-Gm-Message-State: AJIora9kcMmCpTTYVtsJIySV86r0z8yhOVdlz8bcvPrp18lxgkSuh0Ez
 lU+0oCbAN5ejB47MjAr8zPnt6kXNXZI=
X-Google-Smtp-Source: AGRyM1vxBS5qw9lcAFth0XnXa2dDYIrELkRwLFnJL7i1LSpkOqat1zvil9vPOqLTeZq9DujtqSD/9w==
X-Received: by 2002:a05:600c:a184:b0:39e:ff7d:cee7 with SMTP id
 id4-20020a05600ca18400b0039eff7dcee7mr2553361wmb.119.1655657333389; 
 Sun, 19 Jun 2022 09:48:53 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 f123-20020a1c3881000000b003973ea7e725sm19815285wma.0.2022.06.19.09.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 09:48:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 18:46:07 +0200
Message-Id: <20220619164610.649145-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bS/kQIveoUQhvAyS09Dmw8g9NdyBHMXiTQTtsI1rwfo=;
 b=Fg3b7uH64k1dcLZiuWRPNT4JjYzh3wEmQdQ/FH9d0V1dqa8zwc442A78ICuR30yvrW
 8hR6WMg2C0aHG/SWqF8OY5NDvWm7H1IHc0Eu3Bx72CvbVPM0WZTRneJ4Oi/y+iqCc3aD
 kb0yIMaU+6BShApX4aBlYi4qTnv6nMUlxe4ZYUZkT5w2jMUrBmYzd9KGnBrQlSuJ1AsI
 AFtnTA0XvHzt1eUWFfBDmAqwQnQZNmKKvUFWXC0OJEsKsbvKtsNrNZ1246TdYKJQvR+l
 K2n9z/iwdHFlEWT2HT+kD7DMRWO+Dvw6qBeOYol3m/ZknGE7TMCRBkoKZK2AyfVplaio
 Ku+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Fg3b7uH6
Subject: [Buildroot] [PATCH 1/4] package/rsyslog: add czmq optional
 dependency
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rsyslog/rsyslog.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 7fdc7316b7..400fc6b99c 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -59,6 +59,13 @@ else
 RSYSLOG_CONF_OPTS += --disable-imhttp
 endif
 
+ifeq ($(BR2_PACKAGE_CZMQ),y)
+RSYSLOG_DEPENDENCIES += czmq
+RSYSLOG_CONF_OPTS += --enable-imczmq --enable-omczmq
+else
+RSYSLOG_CONF_OPTS += --disable-imczmq --disable-omczmq
+endif
+
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 RSYSLOG_DEPENDENCIES += gnutls
 RSYSLOG_CONF_OPTS += --enable-gnutls
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
