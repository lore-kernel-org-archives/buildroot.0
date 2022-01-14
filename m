Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E91C433F5
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 21:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50BAD60AC3;
	Fri, 14 Jan 2022 21:08:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yge5Vwc3rcak; Fri, 14 Jan 2022 21:08:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A338360675;
	Fri, 14 Jan 2022 21:08:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 78D0B1BF2BD
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 21:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7505A60675
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 21:08:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LWs8i0C7A8LJ for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 21:08:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D0A6B60590
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 21:08:24 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 f141-20020a1c1f93000000b003497aec3f86so7937550wmf.3
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 13:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=to99YOfBMWASFcXTgesgnlWv9nFzHH+drqPmGxLDvlQ=;
 b=Xsyy3xy/ELUStlj+rZS2Zim6W4r3YJI5tvSfUO4k+xLO7C3jGjsYlkQJ6OVcVPH+hc
 VGybg5jIypPGNwDbTHoT8Cf+8JtIkUknUClv1YGVS7FBjVyOwm+mSDGYEkkbf8o6N6VF
 rDg4dJt4IIDeu5SP4YSrhedDvxLr+KF7FTGmAArp2AcO80OEngL7NfEI6QFOWCxwAa9c
 owdVh+lsDPdYjPOzWTx6lOLhSc2XrkPFgsoxebsPTYjpf5svjwmCRymMQ0c11vwWKj4K
 /CDKHyG0Ne218MuSJIODAkb5gIxS6XuzVdFjbalLRUILHrHWpdELyv6no95naCrJqKPo
 fyEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=to99YOfBMWASFcXTgesgnlWv9nFzHH+drqPmGxLDvlQ=;
 b=QzsH6I0Q74DhdX0esiP3oG52b5MzMkplZnzW/yd2HySWhPRrDAOJTQODDjYWbpmqHo
 mN6FF3iACP9pWydu53YIXbWbGItFYNKWwGRkufVdrpFzyxcYmD+Z1LNvAWli5qlD6AQu
 G6lMse0yW2yQadxShWLmVEFPwBcNvuQ5IIRO6N0QmSKq32GamgYPzXBmWy16Q7U4/myO
 kaE4wGjFttfftVDNpXqtkFGZSD/6IQpzR8b8Gpx7Y2J16jNDxilJkA1YaX6FfkgYhPfM
 b66Ki6edOqJppLvt4lv9wGZOtmG+3eltPCDnR0G0NBkHlcHVyhwpM2SEDht2hdz0gBz9
 QW0A==
X-Gm-Message-State: AOAM532mTDVRRcjOWCnuiys0B+0tQSAz8DjxMufmKR0/bXQztPYOxvEX
 EsRXVBx6iaSzmvkaqfzPQjk4uC3Uj1w=
X-Google-Smtp-Source: ABdhPJxuprqKIfqTBpRBFVffqkVrah4safnpdbRJJpRcRi0frvIDVa9PsizXgKQZdAh9kVJC5sGR2w==
X-Received: by 2002:a7b:c142:: with SMTP id z2mr9534891wmi.167.1642194502883; 
 Fri, 14 Jan 2022 13:08:22 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id p9sm7193670wmb.32.2022.01.14.13.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 13:08:22 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 22:06:51 +0100
Message-Id: <20220114210652.1057109-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220114210652.1057109-1-fontaine.fabrice@gmail.com>
References: <20220114210652.1057109-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/python-rtslib-fb: bump to version
 2.1.74
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
 package/python-rtslib-fb/python-rtslib-fb.hash | 2 +-
 package/python-rtslib-fb/python-rtslib-fb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-rtslib-fb/python-rtslib-fb.hash b/package/python-rtslib-fb/python-rtslib-fb.hash
index f67231d398..3c2e39fffd 100644
--- a/package/python-rtslib-fb/python-rtslib-fb.hash
+++ b/package/python-rtslib-fb/python-rtslib-fb.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  d5d81a78046b4c228d29ba88d9950e0f63858e5fcf601e3d0f8bf107fbaadc03  python-rtslib-fb-2.1.fb57.tar.gz
+sha256  9f581c4bcffebc60be236af8a6ebdeccdb66d0435eeb04ab1b743c170b95d046  python-rtslib-fb-2.1.74.tar.gz
 sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  COPYING
diff --git a/package/python-rtslib-fb/python-rtslib-fb.mk b/package/python-rtslib-fb/python-rtslib-fb.mk
index 421fbed0ae..09bde874f0 100644
--- a/package/python-rtslib-fb/python-rtslib-fb.mk
+++ b/package/python-rtslib-fb/python-rtslib-fb.mk
@@ -6,7 +6,7 @@
 
 # When upgrading the version, be sure to also upgrade
 # python-configshell-fb and targetcli-fb at the same time.
-PYTHON_RTSLIB_FB_VERSION = 2.1.fb57
+PYTHON_RTSLIB_FB_VERSION = 2.1.74
 # Do not switch site to PyPI: it does not contain the latest version.
 PYTHON_RTSLIB_FB_SITE = $(call github,open-iscsi,rtslib-fb,v$(PYTHON_RTSLIB_FB_VERSION))
 PYTHON_RTSLIB_FB_LICENSE = Apache-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
