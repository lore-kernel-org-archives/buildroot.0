Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3F9CD4F30
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 21:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B50B80D24;
	Wed,  4 Sep 2024 21:11:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i8unTBG3D_mk; Wed,  4 Sep 2024 21:11:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BB5581249
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BB5581249;
	Wed,  4 Sep 2024 21:11:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C4481BF423
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 21:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6741280D24
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 21:11:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kay5HKbkJtMa for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 21:11:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4A94D80D3A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A94D80D3A
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A94D80D3A
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 21:11:00 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2f3f0a31ab2so706131fa.0
 for <buildroot@buildroot.org>; Wed, 04 Sep 2024 14:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725484258; x=1726089058;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B/Xewvthii261E89vnjOmicis9wMPd5Cg+MK8VXsCRY=;
 b=Am15SSezvSJafEnbPNcFsPo8QZz+NDxo7SR12zY9AuzrNrvOdrKrFTnIoOUn5nX/X7
 +qBfNxPS73EcSSztdnolxAnL1gjLWrtCHFW+8h5/kcQGasjCv0CS+ZSkOjkPmQStSg5a
 rG/+B5tARontHfCbDUg6NEBe5vosohJbTFF3hFowqtj4Uqh5/fX+sKALg4govoqLmImd
 /fAaPbRHnfu6mK89iuzdsSko8oWfKOY6xkLOUpjxqBm42aBk3sPWRL0kM070VXtI/Moh
 2SOpxT8rUPX+NEu7y3OPzxPebas9WK8c/DakSbCNlQfxsKrVe2CkUxPI2AoGGrK3dF3w
 2LMA==
X-Gm-Message-State: AOJu0Yw7a+0neNQ6ETAx7u+rA7rC7n8vUhL1OTF9GhdNswzH3Oapiavy
 DWnCxEn2ZKNwYxUmze4xMq//3+OAkQqfzpHUVXSMruo+c2xQ+2M3qo/VaQ==
X-Google-Smtp-Source: AGHT+IH0SxS4ZqRc8KnDfIQd6TFEWEZV5tg76HZGMS4qff7+gna9Upo+cDxYKg+fvXulWCl8DzD3ZA==
X-Received: by 2002:a2e:be8d:0:b0:2f4:84f3:120d with SMTP id
 38308e7fff4ca-2f61038c67emr167905341fa.8.1725484257742; 
 Wed, 04 Sep 2024 14:10:57 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f614ed1565sm26308861fa.6.2024.09.04.14.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 14:10:57 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Sep 2024 23:10:45 +0200
Message-ID: <20240904211049.866640-2-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904211049.866640-1-roykollensvendsen@gmail.com>
References: <20240904211049.866640-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725484258; x=1726089058; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B/Xewvthii261E89vnjOmicis9wMPd5Cg+MK8VXsCRY=;
 b=BfSI0CYBSjbxKGGW69IlGQ05o/kaNWKstbFqtI5dpJ9lMbRVmVh9R4vx1qAMIabntU
 FsLHdUgnh5Rdt0K/+rejsv3PXZYuCJWMYq5LelDgCg7qtwHniysU8Lm1L0BJOUD2D806
 6CLJMS10yUYAOvOwq43ZqiUPA27qsjJbQ6E+t6mgxaK33+HQ6hkm2B5ReMCJv7oCWf2s
 Vrvs8TI7CO0+1dr2kVkh9i7sw6RSxokW19GvKw1JM1YruyHpTWZPQ3wtAC2+KPifvKd4
 E0wuO5j1FdLe6xAy74UgScNEXpfF+Ozuqy77hIymr0VNJ6nLfYfFIMVfJJx+DNrAwY2p
 bKlA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BfSI0CYB
Subject: [Buildroot] [PATCH v2 2/3] package/qt6/qt6tools: separate host and
 target options
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add Config.in.host to allow separating options affecting host and target
builds.

Move/copy parts of Config.in into Config.in.host.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
In response to:
https://patchwork.ozlabs.org/project/buildroot/patch/20240904122040.738362-1-roykollensvendsen@gmail.com/

Changes v1 -> v2:
  - this patch was added to the series as a preliminary step to move the host
  linguist tools option (see patch 3/3) into Config.in.host

 package/qt6/Config.in.host          |  1 +
 package/qt6/qt6tools/Config.in      |  8 ++------
 package/qt6/qt6tools/Config.in.host | 15 +++++++++++++++
 3 files changed, 18 insertions(+), 6 deletions(-)
 create mode 100644 package/qt6/qt6tools/Config.in.host

diff --git a/package/qt6/Config.in.host b/package/qt6/Config.in.host
index dfe7865c57..fa5c39cce1 100644
--- a/package/qt6/Config.in.host
+++ b/package/qt6/Config.in.host
@@ -1,5 +1,6 @@
 if BR2_PACKAGE_QT6
 
 source "package/qt6/qt6base/Config.in.host"
+source "package/qt6/qt6tools/Config.in.host"
 
 endif
diff --git a/package/qt6/qt6tools/Config.in b/package/qt6/qt6tools/Config.in
index 5f52c5644f..1828e5f043 100644
--- a/package/qt6/qt6tools/Config.in
+++ b/package/qt6/qt6tools/Config.in
@@ -1,12 +1,8 @@
 config BR2_PACKAGE_QT6TOOLS
 	bool "qt6tools"
+	# The Qt Network module is required
 	select BR2_PACKAGE_QT6BASE_NETWORK
-	# qt6tools needs host-qt6tools, and host-qt6tools needs
-	# network support in qt6base. In addition, we also need
-	# host-qt6base with Sql support to build the qhelpgenerator
-	# tool, if target support for Sql is present
-	select BR2_PACKAGE_HOST_QT6BASE_NETWORK
-	select BR2_PACKAGE_HOST_QT6BASE_SQL if BR2_PACKAGE_QT6BASE_SQL
+	select BR2_PACKAGE_HOST_QT6TOOLS
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/qt6/qt6tools/Config.in.host b/package/qt6/qt6tools/Config.in.host
new file mode 100644
index 0000000000..4fd28172b9
--- /dev/null
+++ b/package/qt6/qt6tools/Config.in.host
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_HOST_QT6TOOLS
+	bool "host qt6tools"
+	# The Qt Qt Network module is required
+	select BR2_PACKAGE_HOST_QT6BASE_NETWORK
+	# Requires the Qt Sql module to build the qhelpgenerator
+	# tool, if target support for Sql is present
+	select BR2_PACKAGE_HOST_QT6BASE_SQL if BR2_PACKAGE_QT6BASE_SQL
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  Qt Tools provides tools facilitate the development
+	  and design of applications.
+
+	  https://github.com/qt/qttools
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
