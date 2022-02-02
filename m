Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B1CC433EF
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 07:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10B5560615;
	Wed,  2 Feb 2022 07:54:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BtpNjGdBQu29; Wed,  2 Feb 2022 07:54:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0BA1606F2;
	Wed,  2 Feb 2022 07:54:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DFAFF1BF859
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 07:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB648400EA
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 07:54:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3dramw1NtUZ9 for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 07:54:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C223A400AB
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 07:54:34 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id u15so36683418wrt.3
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 23:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CMqlded7UpgJu+6XaKE0WdAzhQ+7D0j3w0lOsSm/PrE=;
 b=DwvqAnj4326hbeMpP1VyNsW0VphtNzLWvn2rZO5/xekLIaMUmdals8e7+Ob1A3yyEx
 lbgew3Yi+Ac5iNR+wt3FfEh/sg9ncmknIAZnM3NJ+1/Wu5VUYdc+/QrvZsi/srNakrRR
 YMU96mzavqjKK93qdGc7p1x2A1r4Jcvtd0zxogittHrPe6DL7qs9c/NzvA/YYkt8DIfI
 Mygj+t72w+7gMHlAslFqYupifJpw1CqOTpE7PPAjAn3TBrgfZxalSivYl98DoaOo3K5m
 IatKJSS6qHpv3eDhx7YFker8gpysumke/RMbu0rztS6eIv++YSnQ2sDESz7k+5R3t9TU
 Mn7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CMqlded7UpgJu+6XaKE0WdAzhQ+7D0j3w0lOsSm/PrE=;
 b=FbUE61wJqGgbVajXZC+21nuHMDZFjs5AB20H/2qUSLUoRuegWMCacYRsFKq2jY0ME+
 tKyyY5xmrn0+oIE2FS7GizFARbP2HNZiQCYJSLfzN7jQN49vw8rY0mExWRTvzgM0ufLE
 jQ8zLspnnyRVjpxrBPxS7hsKRSP7YcysvPIMH7kYCZc9aQSwbJg+70Ios/qiO7fN+S0G
 CvN/b+cFtAzgLF+nHvru/bTFgxPx/A8s8vEr3P5RxDPi3Z1OGst0Jzrcp4yBiepUbpAk
 92ezbTg3VBltp2SdkDRt9/gTBqUWkjwwzKOdndSb5anlqkRfL39uc7rKW8zZOLwuIjva
 3j0w==
X-Gm-Message-State: AOAM533zDN+EAZjDft84wGCnRrAU3+GgcYfT1J+CX7M2H+Ptbv3lxV+i
 gdsb7hGC4uwHiPmm6H6cSYsavewQwPs=
X-Google-Smtp-Source: ABdhPJyITtTb/cLfjQpjibH6wdNSZmmugXL5CvvUt2jMnQSxcfT7e3aI2nTd2SRewCaKBXoa+HNoTQ==
X-Received: by 2002:a05:6000:2c2:: with SMTP id
 o2mr20092593wry.30.1643788472455; 
 Tue, 01 Feb 2022 23:54:32 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id x4sm17045856wrp.13.2022.02.01.23.54.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 23:54:31 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Feb 2022 08:52:28 +0100
Message-Id: <20220202075228.1187021-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/domoticz: bump to version 2022.01
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

https://github.com/domoticz/domoticz/blob/2022.1/History.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/domoticz/domoticz.hash | 2 +-
 package/domoticz/domoticz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/domoticz/domoticz.hash b/package/domoticz/domoticz.hash
index dcd5bead1e..18bf57b7e0 100644
--- a/package/domoticz/domoticz.hash
+++ b/package/domoticz/domoticz.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d8e99e0f96873aa105b57f73656ef7a14c89e0acf2649b2d4ef1167b14bab4b2  domoticz-2021.1-br1.tar.gz
+sha256  b7faf959c4f1dbfec3b0c17ab495f29b3d1437bc2251579c5252be82247e7ff9  domoticz-2022.1-br1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  License.txt
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index f142791830..5edc10e8d8 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOMOTICZ_VERSION = 2021.1
+DOMOTICZ_VERSION = 2022.1
 DOMOTICZ_SITE = https://github.com/domoticz/domoticz
 DOMOTICZ_SITE_METHOD = git
 DOMOTICZ_GIT_SUBMODULES = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
