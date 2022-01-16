Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68B1C433EF
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 21:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5098A60B59;
	Sun, 16 Jan 2022 21:51:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wZGi3EH4kkMy; Sun, 16 Jan 2022 21:51:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F51C60A74;
	Sun, 16 Jan 2022 21:51:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E03B51BF476
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 21:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD4608125E
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 21:51:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LXoTZ9NnaNV5 for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 21:51:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9581B81240
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 21:51:36 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso19367702wmj.0
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 13:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fAlGL6MuGLGCqPHO+4ok88ykD1fRCxIEzgrf5vQjEKI=;
 b=k7gWo3FkeNCX6fTQHE/7//50Hu/2Ak9q9rrhhDcuqV/t5GFN/smKV36as4/7oIEutj
 jhXlaCmh15NK/HpO+fbaAVCqKU9ye0Uz50XMnMXs35NSiymeMTs1LDk7FbnWJnpw7+QD
 kthJdqjl8bkL5ibqSW5yfIaQ4yS7NbaQ+YmQBzMf+nONQ2GweIR/dkXkaQjM48pWx1Fl
 MNJ3jHdEEy8KOX0MtR2J/CZUhCniFX0ctGyN+Ox4v1ekEZ0Nw4SFvLWi7oLPyJgPvJK9
 JKUAL4hrs9UFN+OK4NLXx2OiM/uNCoLyDyB4KZyWB05HJfatE4hym068unO82l2/jaJr
 Hi3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fAlGL6MuGLGCqPHO+4ok88ykD1fRCxIEzgrf5vQjEKI=;
 b=eSDYmWZJhk5SG6UpUn+iGeerJeU3vcAX9CfSUfgThxhjIeJTvr9b7magqykay5eUUo
 ikPDZ80BY6wJgkTMJAPAvIEl9AVAYKtEzjwPHg3wlBSg6vF0k0HlhvEbs16uRJ9zKsWm
 q03WtCIAsQpF1rE/6N0hU42BtymHiILj1YtMMn6Qh2cN7e0LIRpAkBVp1BsynN5KJr0B
 p9FEOSB7IMAP403PKDJuZcpUSy1GM1XrUIANTjWpIyeq4edDnW8bEFpx+zJaF36pYZZ/
 LGZU+l694Qxyj+p2tGH+4LQZzuAGp4YOnTAGc7XFvLbjh3DYV1daohxBIWTfHgExW52j
 0qVA==
X-Gm-Message-State: AOAM531YCeKM82aJFW46cayGVrTpn7ef9bfFzIgVkC5/Imi11I0JljYy
 s9cvFKvKbdUUH40njGjgu+ZBbPDNF84=
X-Google-Smtp-Source: ABdhPJy6D1NPHVX3YFK9s4UcvPXWJZCjy5fJL/i6ujnC1vWaEbeXHiGxXp3r+OLjactB+6MrSCKV/w==
X-Received: by 2002:a5d:64aa:: with SMTP id m10mr5941402wrp.295.1642369894743; 
 Sun, 16 Jan 2022 13:51:34 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id g15sm12062164wrm.2.2022.01.16.13.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 13:51:34 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jan 2022 22:49:54 +0100
Message-Id: <20220116214955.3231899-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220116214955.3231899-1-fontaine.fabrice@gmail.com>
References: <20220116214955.3231899-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/qt5/qt5webkit: fix build without
 opengl
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?Ga=C3=ABl=20Portay?= <gael.portay@collabora.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without opengl raised since bump to
version 5.212.0-alpha4 in commit
df0b0fe6919c0d0f3750f439a3cfa765232bd569:

CMake Error at Source/cmake/OptionsQt.cmake:592 (message):
  Qt with OpenGL support is required for ENABLE_OPENGL

WebKit2 unconditionally depends on TextureMapperGL.h and tools builds
QtTestBrowser which unconditionally depends on QtOpenGL

Fixes:
 - http://autobuild.buildroot.org/results/5604555279f99ba0221dd8d0baf9ab4d7cca3aed

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qt5/qt5webkit/qt5webkit.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 3af1918a46..de3c428fbe 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -20,6 +20,16 @@ QT5WEBKIT_LICENSE = LGPL-2.1+, BSD-3-Clause, BSD-2-Clause
 # in the archive.
 QT5WEBKIT_LICENSE_FILES += LICENSE.LGPLv21
 
+ifeq ($(BR2_PACKAGE_QT5BASE_OPENGL),y)
+QT5WEBKIT_CONF_OPTS += \
+	-DENABLE_OPENGL=ON \
+	-DENABLE_WEBKIT2=ON
+else
+QT5WEBKIT_CONF_OPTS += \
+	-DENABLE_OPENGL=OFF \
+	-DENABLE_WEBKIT2=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
 QT5WEBKIT_DEPENDENCIES += xlib_libXcomposite xlib_libXext xlib_libXrender
 endif
@@ -29,6 +39,7 @@ QT5WEBKIT_DEPENDENCIES += qt5declarative
 endif
 
 QT5WEBKIT_CONF_OPTS += \
+	-DENABLE_TOOLS=OFF \
 	-DPORT=Qt \
 	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3 \
 	-DUSE_LIBHYPHEN=OFF
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
