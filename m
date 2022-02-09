Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFA2C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 19:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42AB760B98;
	Wed,  9 Feb 2022 19:44:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nyoCSc9YwthF; Wed,  9 Feb 2022 19:44:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8044B60B4E;
	Wed,  9 Feb 2022 19:44:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB1BA1BF422
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 19:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E766F814AB
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 19:44:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dkwQ_NqrchOc for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 19:44:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C34C48149E
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 19:44:27 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id m14so5800604wrg.12
 for <buildroot@buildroot.org>; Wed, 09 Feb 2022 11:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0qJJ/Q4hLEocuK9hf4PqHjARDty0O0fih+HzD4bI0Is=;
 b=G8OuBpVKUQ83ykbsJCrBTK2PtTaDDolqnKcp7aaohDggZboQH//ptZOBxKfGv34a5x
 dOAExKrm/5CH1vXNePSb1evQouxcMO9oy7y6jjGllLZ6PSKDCrW/n+vU0Ey6MA/4/kxh
 twkXrq9YQKyrONKE33Kp9MHSzY0IoFoH3hQDaDjp29eNAtexTM6tv59eeKZWaxuL49CD
 iuksNoeH3/cHV6dkungRSOGZOCFEw16hFg+cugIINNZntekz4WnlFObWHfmb7Ti3l0ci
 E3NixSdxcnHss7Ww8o5BP8UEAirIqEvM2S0tKIWpzZCUgG0bOtEmTi+1/DqGf4BUBWmx
 3FDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0qJJ/Q4hLEocuK9hf4PqHjARDty0O0fih+HzD4bI0Is=;
 b=phW5bQkdOBc43VVQo65DaK3wcerICulpjiryGVEYK4H5TDhh+4Wl6EnvMWcR/2nZxC
 sYueqAvUm0awnfROc6hzWBOdWq1udnZuITr2UC4q9F0+mW19h/eD0WojPIjgmb3NaUXc
 4s+7mYegfsih7+9gQP3m3RDfrYah24+h9i5eMphTTWHNqtG9WO38s/AUW8uonXnneJMJ
 ydysU02RB2o81oIAdm9WAHi2uA0eQ101DyqWt6ni3Q+sDk3TTiJxvJrfkwyaETWA7+bc
 s/aHRT0hExnCCmfpnNXUoPwU2QA1pyz65Z96RLvmfflB9wl+ceqnYmqaWIxso/tURV+c
 xKdQ==
X-Gm-Message-State: AOAM532xLP08XSmieinE1iiCcUa/m+RLjDte+Oh5QEQthDmiCZU573KT
 tYlpIld5SEVe5f4YrZl6Vf683BMbwOs=
X-Google-Smtp-Source: ABdhPJyB95NSk4Fw99gjTbJ/g5KBbwlP5rvIv6lShuh2oQ9sCLmswbpXLDB4q89QCaW0FyDWUE8Arw==
X-Received: by 2002:a5d:564a:: with SMTP id j10mr3233796wrw.473.1644435865784; 
 Wed, 09 Feb 2022 11:44:25 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id p8sm10504722wro.106.2022.02.09.11.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 11:44:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 20:44:54 +0100
Message-Id: <20220209194454.344276-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/audit: bump to version 3.0.7
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
Cc: Clayton Shotwell <clayton.shotwell@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/linux-audit/audit-userspace/releases/tag/v3.0.7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/audit/audit.hash | 2 +-
 package/audit/audit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/audit/audit.hash b/package/audit/audit.hash
index 9e16a339d6..6260f158d8 100644
--- a/package/audit/audit.hash
+++ b/package/audit/audit.hash
@@ -1,4 +1,4 @@
 #Locally computed
-sha256  c3e44d77513a42401d417dd0ceb203cf23886cb89402dea7b9494faa3f4fcc5e  audit-3.0.6.tar.gz
+sha256  8b4c78632a9301a1c7f859b0e38fc0b9c260b8214d6b7c771bf28b3d73a62597  audit-3.0.7.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
 sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  COPYING.LIB
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 7f364ab010..cbb174b980 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUDIT_VERSION = 3.0.6
+AUDIT_VERSION = 3.0.7
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 AUDIT_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
