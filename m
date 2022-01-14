Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157E7C433EF
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 21:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85C1D82741;
	Fri, 14 Jan 2022 21:08:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s-FVHk-3gBEz; Fri, 14 Jan 2022 21:08:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDDA6825DC;
	Fri, 14 Jan 2022 21:08:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 07A631BF2BD
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 21:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA04A825DC
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 21:08:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EoSYBjusyUoy for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 21:08:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E97D82443
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 21:08:19 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 ay4-20020a05600c1e0400b0034a81a94607so7017865wmb.1
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 13:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1kPzWF1gJpxrzd+pjM4Rk6d90X80y34JVd9ex5HFhYg=;
 b=TwV2aVcqRlfxRSgi7PKbPk9Y7i7OxITqUwMxBxQFZWc+4JzFMkktZFNzRm4xp00dvo
 K/CUUaTwjwOaN0CsoxQdzw1xlw9KlqQIPxH1/vBUefhmirOGqi2uRZs5ka/VwhbgavK2
 kordUXAL6De8ich+n//wsm0IQj5TN4ojzjBQb8CwGIalq7XFwUafb2RBQFG+/o6eerib
 8OpldyRd++ge4aOaTOtOXAAB48PfQ9ZWBMAYmqh2y82u02jli66U9eQVZRshLrHMXuza
 mrQIFIP2fOfIP9c3nQf+8TObIr2I6LSNVyl6AEYv5HYD2wnQmRJM2yeG3eIQdqOKCGpa
 w+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1kPzWF1gJpxrzd+pjM4Rk6d90X80y34JVd9ex5HFhYg=;
 b=Q9VVrGpchkQt7m6X+SZo9eLN/ylg5x3F/AF/kcQ1EMC0jnRbg9WtAyzVTgW9Gn2D5I
 DDXIiWMrkLM5Rfv24WheLGigyh8H3EPM6NtQTar/EfFxu8pXcg7aNgnWzC91totdx9Xs
 ppONDr6VOPJXcg0ZepOrLj5ugOWxqPVBv2fYCjCiYppHWvv+uxfx+83+Byz5OQ8XUAKE
 lY4GojPnI9a5Ilw+6XPQGOMdLDhtNbrngAXJLTCNIOkdt875wZC3LXTbqGx9amPbws+u
 DRuBxiCd2B3tq9VhRkf8wogVRl+XW4EHfgmHp2d1yTgRHctmUmkb2HPvWMIAXZtO5Al7
 xV1Q==
X-Gm-Message-State: AOAM5330tt9Xw+1EV7SDmenL8Gz9RfReHhEt6zvW8C2kJadUQKmx/jib
 qhgWuG1Aylc8lPdMvTIYBP29w+3DZ6c=
X-Google-Smtp-Source: ABdhPJyx8Vpu3ihOx9p9BxNtM5m9F34rO38BDFVWpcgk6SSSo/PnXoXSYE8mLTCOJvu0xIy3Bjiraw==
X-Received: by 2002:adf:d0c2:: with SMTP id z2mr9894842wrh.335.1642194497425; 
 Fri, 14 Jan 2022 13:08:17 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id p9sm7193670wmb.32.2022.01.14.13.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 13:08:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 22:06:50 +0100
Message-Id: <20220114210652.1057109-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/python-configshell-fb: bump to
 version 1.1.29
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

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-configshell-fb/python-configshell-fb.hash | 2 +-
 package/python-configshell-fb/python-configshell-fb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-configshell-fb/python-configshell-fb.hash b/package/python-configshell-fb/python-configshell-fb.hash
index 0903e284aa..8fc38f61a6 100644
--- a/package/python-configshell-fb/python-configshell-fb.hash
+++ b/package/python-configshell-fb/python-configshell-fb.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  3685446d6ee02881930bb2fdc5fdd254938da66ce9843a5b3676c4246b058e4b  python-configshell-fb-1.1.fb18.tar.gz
+sha256  24b47284b463dcfb9ee0c1558827e13442127e62fa279b6e0253f136cf49058c  python-configshell-fb-1.1.29.tar.gz
 sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  COPYING
diff --git a/package/python-configshell-fb/python-configshell-fb.mk b/package/python-configshell-fb/python-configshell-fb.mk
index 94b6fed5ab..d0dd421e8d 100644
--- a/package/python-configshell-fb/python-configshell-fb.mk
+++ b/package/python-configshell-fb/python-configshell-fb.mk
@@ -6,7 +6,7 @@
 
 # When upgrading the version, be sure to also upgrade python-rtslib-fb
 # and targetcli-fb at the same time.
-PYTHON_CONFIGSHELL_FB_VERSION = 1.1.fb18
+PYTHON_CONFIGSHELL_FB_VERSION = 1.1.29
 PYTHON_CONFIGSHELL_FB_SITE = $(call github,open-iscsi,configshell-fb,v$(PYTHON_CONFIGSHELL_FB_VERSION))
 PYTHON_CONFIGSHELL_FB_LICENSE = Apache-2.0
 PYTHON_CONFIGSHELL_FB_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
