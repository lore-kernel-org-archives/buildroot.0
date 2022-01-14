Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF03C433EF
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 21:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CE20401DF;
	Fri, 14 Jan 2022 21:08:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RBGTOoZTVgiT; Fri, 14 Jan 2022 21:08:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F6584011C;
	Fri, 14 Jan 2022 21:08:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 18F9E1BF2BD
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 21:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 033C5401E1
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 21:08:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2SAiA0ouZHc0 for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 21:08:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E5E140118
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 21:08:27 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id v123so8391590wme.2
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 13:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=exk5Ysp7j0i+cHdVuWLKJf6k30SjZ3WiILWuejb2fiQ=;
 b=TEcNANM4jmjR6Epztk/4cP5nASX2kJS7sdAeVTZKEI2YR7rqpQrAp51iGXILckPg22
 3sUUrYOu/UzZBQWpnP2FG4B1rTtOxvo12Ygo4z042mlI+X92NeWPg0CS/2oYuEpZihsf
 0nMcPXSCdg29Bsk9Men7BrOglgtjUyUigZBjIXj9Ynwo21R+7hMDEallkIZ25fzdFM3q
 +whSSO2KVvCwAcyQE4hQ24g4wKC0lryhMAMM6RbzQRS4BUT6dMhbqeCzc8wBArBWZoeK
 pUEbpy1/PjFSJm2qO0MKUQyGDumCCG7cpwSwzFkgWBG1ozEJb+s8kKGSk9Tuq4Bt7pmI
 a0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=exk5Ysp7j0i+cHdVuWLKJf6k30SjZ3WiILWuejb2fiQ=;
 b=aylVy44W8a9V17RtjTCkThmfqKoWFn8xwSeZ06fCTFfjSHqhQ2s+CktT1NdxsgXqEK
 OHqWkkoXVCHR43ZfwzrgnfTwAztGbxeq3f7TxOijtMXnP/ZpnGAwxcP9OxiS/myOEI+5
 8XeQ3v3G7fnjLVAClVDLPs6keTAxEO3sVa1d48XTCIPuyJ+XM/AtKWIr+Um4O9bPKQHR
 ODc2uk9z2YyyuTWPgmBz92sLtQtIyb39C8Sul4ZePUfqmJA3Wut72xjPmROUnWWVHCbw
 tjCA+vrWnh510dDZXjR9A/JMKoepYGQVKl2hEcA/lPJPm2tw66WhmZrPPLd4xZelqVAk
 3i4Q==
X-Gm-Message-State: AOAM5322UM3vGzG8AdnhT0F76cwn4ot6ORzt1HGgPfcmW3slUiqswSSc
 3Q0AMU/K681oeMCMBn0hrvb9u3QEIq8=
X-Google-Smtp-Source: ABdhPJzyAfUdWx0FG2HAmN8mdzIoZL3anGnH7B+TJcsaRM9ggEEg2L0G/MJW322tjhjyPZgb+3F2gw==
X-Received: by 2002:adf:fbc5:: with SMTP id d5mr9400579wrs.83.1642194505377;
 Fri, 14 Jan 2022 13:08:25 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id p9sm7193670wmb.32.2022.01.14.13.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 13:08:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 22:06:52 +0100
Message-Id: <20220114210652.1057109-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220114210652.1057109-1-fontaine.fabrice@gmail.com>
References: <20220114210652.1057109-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/targetcli-fb: security bump to
 version 2.1.54
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
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2020-13867: Open-iSCSI targetcli-fb through 2.1.52 has weak
permissions for /etc/target (and for the backup directory and backup
files).

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/targetcli-fb/targetcli-fb.hash | 2 +-
 package/targetcli-fb/targetcli-fb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/targetcli-fb/targetcli-fb.hash b/package/targetcli-fb/targetcli-fb.hash
index 207c38e046..64f68a6675 100644
--- a/package/targetcli-fb/targetcli-fb.hash
+++ b/package/targetcli-fb/targetcli-fb.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  0f32ab6f3ecd234280d55be5e89ce2b3a02f9c82c8dccaae66e26464cff8901a  targetcli-fb-2.1.fb41.tar.gz
+sha256  7ae4120a54f24b13263b4b85c43952a03546f8b9fc9bd15fe87678f68245a33f  targetcli-fb-2.1.54.tar.gz
 sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  COPYING
diff --git a/package/targetcli-fb/targetcli-fb.mk b/package/targetcli-fb/targetcli-fb.mk
index 7425423b8f..c6ca776b27 100644
--- a/package/targetcli-fb/targetcli-fb.mk
+++ b/package/targetcli-fb/targetcli-fb.mk
@@ -6,7 +6,7 @@
 
 # When upgrading the version, be sure to also upgrade python-rtslib-fb
 # and python-configshell-fb at the same time.
-TARGETCLI_FB_VERSION = 2.1.fb41
+TARGETCLI_FB_VERSION = 2.1.54
 TARGETCLI_FB_SITE = $(call github,open-iscsi,targetcli-fb,v$(TARGETCLI_FB_VERSION))
 TARGETCLI_FB_LICENSE = Apache-2.0
 TARGETCLI_FB_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
