Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55891C54E5D
	for <buildroot@archiver.kernel.org>; Tue, 12 Mar 2024 19:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDB2B605CB;
	Tue, 12 Mar 2024 19:35:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gSLP9_u9EWWd; Tue, 12 Mar 2024 19:35:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1810C60748
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1810C60748;
	Tue, 12 Mar 2024 19:35:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7DFCB1BF32D
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 19:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A4B640654
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 19:35:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id idCOd61IA6uc for <buildroot@lists.busybox.net>;
 Tue, 12 Mar 2024 19:35:42 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=jeremy@jeremypeper.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6F7D140562
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F7D140562
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F7D140562
 for <buildroot@buildroot.org>; Tue, 12 Mar 2024 19:35:42 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3663080b6a4so24435915ab.0
 for <buildroot@buildroot.org>; Tue, 12 Mar 2024 12:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710272141; x=1710876941;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WXmv57iFH/u143pvGIvo7Bx5TFunxm9/2QHjzCb7nZg=;
 b=Fbu0kmOsWYvx1ix3c3hj0sk5NnFBv4NJr5Z2CUGh8taCF22R/DvGHi7O4J/SACCywQ
 MCNEYaIFbjBmi3A5c84zpli/3tHT7ixALKhIdlm2Tcy6VGeIBX44v/W8gxXlS/yMWIJv
 VIATPTdy9F8W2bPLYJ8Mrg+kTE6bHety+qjuvmjSo+C08DIRt7ZfVxq/TGdjkPRL2yUs
 3ZTM+JnJ9jKrIWqZA+CJMAJKSJtberZqmaawWvYZTYgEb/81hx6eRNgHLTWGsqsCzkhB
 qoTsFBG10zOp66Q/bFm9g+xtU9acVMAO/ot+mbo3JglHRaw7Q5C7C6nta/WAcAK2KW3s
 UJdw==
X-Gm-Message-State: AOJu0YzMremepnoztmXA+gvPuB/ZtJPz9MRyDXj1hj0awu5RrZZUehFl
 KuknlUW5BdB39EFaHWY35wKdBkPo37d3dzQaGW61LEd6W1dl8f3K4K6SsqDuDeirK6IGVnlnccS
 RdA==
X-Google-Smtp-Source: AGHT+IF0RBlkLFG6GxImnWKk8eA5HOJGLz7c41v4gJcHX/XXhfTCnlsyg15nOik8t5A0lptnlxPxqg==
X-Received: by 2002:a05:6e02:1a8c:b0:365:21f4:701f with SMTP id
 k12-20020a056e021a8c00b0036521f4701fmr13673847ilv.21.1710272140879; 
 Tue, 12 Mar 2024 12:35:40 -0700 (PDT)
Received: from earth (97-127-36-49.mpls.qwest.net. [97.127.36.49])
 by smtp.gmail.com with ESMTPSA id
 dj6-20020a0566384b8600b00474eb87162dsm2356862jab.39.2024.03.12.12.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 12:35:40 -0700 (PDT)
Received: by earth (Postfix, from userid 1000)
 id C7EEA1060DED; Tue, 12 Mar 2024 14:35:39 -0500 (CDT)
From: "Jeremy J. Peper" <jeremy@jeremypeper.com>
To: buildroot@buildroot.org
Date: Tue, 12 Mar 2024 14:35:25 -0500
Message-Id: <20240312193528.664465-1-jeremy@jeremypeper.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jeremypeper-com.20230601.gappssmtp.com; s=20230601; t=1710272141;
 x=1710876941; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WXmv57iFH/u143pvGIvo7Bx5TFunxm9/2QHjzCb7nZg=;
 b=kdJe4h1ZGHNKnRIkLX5bSTVywNEfIVRzL2DJxFp860FBmVodNaOY0TeQmipUgibWwm
 ynTHuKJti2hsdVYUgKSA/VTZ11WnemiNWzxaIfz47ofRF2HQpVhJzOsrh4kNMp0lZzHj
 njhcv9GfdfgRxp3d6iJjdsYn3QI8LKPyuogoMbdr5ql51pDKf0KHdqSIZwgG6IXicilr
 Z70WZ/IyA8vuVkmv9cpp2HAHRLwl38Y7WPuZXwUTsqZIcHMH44n7O8jV/YEqYW+NDeYF
 2AH8p3R60XFQZlh6btWLU0y9/JTuBbBTfcikSm7MQOgBuadfG6XN4WEFEVM5EpucE020
 SxYA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jeremypeper.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=jeremypeper-com.20230601.gappssmtp.com
 header.i=@jeremypeper-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=kdJe4h1Z
Subject: [Buildroot] [PATCH v2 1/3] package/targetcli-fb: bump version to
 2.1.58
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
Cc: "Jeremy J. Peper" <jeremy@jeremypeper.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bump to latest version because previous version did not work with python 3.11
corrected version mismatch with my first submission

Signed-off-by: Jeremy J. Peper <jeremy@jeremypeper.com>
---
 package/targetcli-fb/targetcli-fb.hash | 2 +-
 package/targetcli-fb/targetcli-fb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/targetcli-fb/targetcli-fb.hash b/package/targetcli-fb/targetcli-fb.hash
index 64f68a66..1732fa99 100644
--- a/package/targetcli-fb/targetcli-fb.hash
+++ b/package/targetcli-fb/targetcli-fb.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  7ae4120a54f24b13263b4b85c43952a03546f8b9fc9bd15fe87678f68245a33f  targetcli-fb-2.1.54.tar.gz
+sha256  605f4e4e4e7189d6a03f11a4f55e7ddb4671002d542c2f684f87dd68391dcdc2  targetcli-fb-2.1.58.tar.gz
 sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  COPYING
diff --git a/package/targetcli-fb/targetcli-fb.mk b/package/targetcli-fb/targetcli-fb.mk
index 2d375417..8cdcc6f6 100644
--- a/package/targetcli-fb/targetcli-fb.mk
+++ b/package/targetcli-fb/targetcli-fb.mk
@@ -6,7 +6,7 @@
 
 # When upgrading the version, be sure to also upgrade python-rtslib-fb
 # and python-configshell-fb at the same time.
-TARGETCLI_FB_VERSION = 2.1.54
+TARGETCLI_FB_VERSION = 2.1.58
 TARGETCLI_FB_SITE = $(call github,open-iscsi,targetcli-fb,v$(TARGETCLI_FB_VERSION))
 TARGETCLI_FB_LICENSE = Apache-2.0
 TARGETCLI_FB_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
