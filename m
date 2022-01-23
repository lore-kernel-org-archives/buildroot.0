Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04848C433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 11:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 974E181D7C;
	Sun, 23 Jan 2022 11:24:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kyvcPilx7Oof; Sun, 23 Jan 2022 11:24:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBAED81A50;
	Sun, 23 Jan 2022 11:23:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 269D61BF25F
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 11:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14DD881A39
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 11:23:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fQzlSKJJqEsw for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 11:23:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 17A58813E3
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 11:23:56 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 r2-20020a1c2b02000000b0034f7b261169so631532wmr.2
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 03:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qi8voUgJ2WTPkEZKJKgAr+u2UpVn3L6wXPUXkT3+SEQ=;
 b=HLjExysjI51rYcBLcYr777ZLjWIIXhR8P5XwbbNAXyaEfkJoku+fGUflXP8H3fl9Vj
 6+TfE6QtX8LlUmoxY3oVCxT57n+OYTUxaeGq7hq/EmgrakyVL477NjSX2EjuTr6lK6v9
 G7Q55cI5rgDF42UyygL/ZrITOXid5LRaqt2ZHjoLVucyj76QMZVi5EwGeJgOxEHKElw+
 rq+SBxb8ihkXvpg7W7nWfK0XOVynQ0/EZS9QcpbleJ7jBYr8rd20loWME0zxjRcmPbgf
 m5g3DxtJ0vLucmqWu0FAznQkiJDT8xf69G8Tfej/lJwQr6RQeq0x2Y3Ep2S519AOjVXN
 1aHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qi8voUgJ2WTPkEZKJKgAr+u2UpVn3L6wXPUXkT3+SEQ=;
 b=UOY25unzqx7QnCMx8r0JSnIr3NJIgM7b6LqcI410w7FE62WaixVVG2cuXZTTD5BGba
 o2kIRqDoYdJne9/DY0RHrbkrg8A+ogsayZZ6bJi76ZcaxiG/v5Y6zOZhm5kC857fG9zt
 O+IVLdGrVxUAtn3ugh9SaZqX7dt+lu47yrn4kn4YtMIJyOSu5OjfrO+xSOprHaRhzHyM
 o4ZbPc3Llju3TIYFBVKefxhz6iPC8fzdzve4vmh5PZvUS/HmDctSwzgJAQTMdngziaWI
 qu+SWG3P+58LLaIZgFN0ICZkQLoN8xfIZkrlW4cq8SDLGGVRgav/TkVBipSe2r9Fp8ww
 5bSQ==
X-Gm-Message-State: AOAM533Thc1d2Hu/+Xn0t8DHHltOexGE22Sl3pobHfAOFaBDR52ZGnzD
 S099A6dZjP2azQnuwRXi2bCFs5u9180=
X-Google-Smtp-Source: ABdhPJzioUXxqemx/8Sd5cxkaW2XvGA0f2MUst9HlHXzLJ0EvAxmqHzuUNlyO1EVq+nNPZKgJCfd2Q==
X-Received: by 2002:a7b:c118:: with SMTP id w24mr4699912wmi.74.1642937035241; 
 Sun, 23 Jan 2022 03:23:55 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id d6sm11187510wrs.85.2022.01.23.03.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 03:23:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 12:22:20 +0100
Message-Id: <20220123112220.578219-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lft: bump to version 3.91
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

lft 3.91 / WhoB 3.91
----------------------
- Fixed bugs.debian.org/cgi-bin/bugreport.cgi?bug=922430
- Updated date

lft 3.9 / WhoB 3.9
----------------------
- Fixed a bug that could indicate a target was closed when it was open
- Improved support for DLT_NULL interfaces on BSD-like operating systems
- Improved deprecated pcap device enumeration method
- Improved GraphViz output format appearance

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lft/lft.hash | 6 +++---
 package/lft/lft.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lft/lft.hash b/package/lft/lft.hash
index 91a1fb0659..9bcce843bc 100644
--- a/package/lft/lft.hash
+++ b/package/lft/lft.hash
@@ -1,5 +1,5 @@
 # From http://pwhois.org/lft/
-md5 31b15aabc619707427a73657512560f8  lft-3.8.tar.gz
+md5  73cb955546692cf0fb5d7931939c56de  lft-3.91.tar.gz
 # Locally calculated
-sha256 10f427e77b0f8207817329bd8ef0310078434612620073369264d15e6f97e990  lft-3.8.tar.gz
-sha256 e3b7634630e6800eccca6ecafb5d40153d4f8f7a20e2b2399bf3c0ea92f44614  COPYING
+sha256  aad13e671adcfc471ab99417161964882d147893a54664f3f465ec5c8398e6af  lft-3.91.tar.gz
+sha256  e3b7634630e6800eccca6ecafb5d40153d4f8f7a20e2b2399bf3c0ea92f44614  COPYING
diff --git a/package/lft/lft.mk b/package/lft/lft.mk
index 5154c83fef..37e6e77767 100644
--- a/package/lft/lft.mk
+++ b/package/lft/lft.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LFT_VERSION = 3.8
+LFT_VERSION = 3.91
 LFT_SITE = http://pwhois.org/get
 LFT_DEPENDENCIES = libpcap
 LFT_LICENSE = VOSTROM Public License for Open Source
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
