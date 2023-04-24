Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA403C7618E
	for <buildroot@archiver.kernel.org>; Mon, 24 Apr 2023 20:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58DCD414E0;
	Mon, 24 Apr 2023 20:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58DCD414E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y4jKbWmbbvjC; Mon, 24 Apr 2023 20:26:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18E1B4148D;
	Mon, 24 Apr 2023 20:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18E1B4148D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C40811BF476
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 20:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D5D960C0F
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 20:25:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D5D960C0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6rQt5KmrpPzi for <buildroot@lists.busybox.net>;
 Mon, 24 Apr 2023 20:25:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB33E60AA5
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB33E60AA5
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 20:25:22 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-63b5465fc13so4071659b3a.3
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 13:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682367922; x=1684959922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gSQzr3X8N9/KFqHqNn/Tms//MgX92Y0z+zWYj+4M66Q=;
 b=Cq4DupIkC5mWvNAbuGKqYMN5OudcTLmBiD47WGI9YRJ1KlaHAXuSkepDRgEhT+2Gdt
 75GY43HVCzTdCoxfpdPNio9Ce/y6bDgvWqnMUvznT8jlmozT3Ni8p9RW0GQmxzhJ57yN
 LVPzlkalEcDbTlaA9JFfiMH+2+rTHny7CwGkFhE/LNR8GEotZ2j7nXPQafdOkixpatUU
 B6Nb8mhY7X7QopoLy8MCph9usoK5IuqhhbnI51T15cd8bbQ3EnB+M6RlAH2aZoCF12Lk
 vemvvMM774Exd9a/K+0hU89VjesK790ebISj6KU2/W5d5IsdfbNGjF0ke3jr+MBsNwPD
 PZ/A==
X-Gm-Message-State: AAQBX9ehD/sD846nH0r0V5IExfWRtoXDVJKhbrR6643+VxGe98Yj0dlq
 Kyl7qbRWfrHzh4bWHZwwatOvVixy52tcyQ==
X-Google-Smtp-Source: AKy350b6y1VVoKuIWJTPB3XDWnX0QFaF1cmVhgSELSPd0qSuE0G77nHck9if4YyBYKOshmVH8FrfDw==
X-Received: by 2002:a05:6a21:33a7:b0:f2:1577:2ea0 with SMTP id
 yy39-20020a056a2133a700b000f215772ea0mr17166633pzb.44.1682367921681; 
 Mon, 24 Apr 2023 13:25:21 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:603:2180:ebe0::e18])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a656806000000b0051b71e8f633sm6819592pgt.92.2023.04.24.13.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 13:25:21 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Apr 2023 13:25:05 -0700
Message-Id: <20230424202514.1546092-5-aduskett@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230424202514.1546092-1-aduskett@gmail.com>
References: <20230424202514.1546092-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682367922; x=1684959922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gSQzr3X8N9/KFqHqNn/Tms//MgX92Y0z+zWYj+4M66Q=;
 b=iBVm1c9s4KB2edoRndcElSjmZYeAKY+FK/HeiLIM+rHMaYVpjW/0f22/k+y4+XZlgn
 VkCtujhL9HfyWbRnPS9zH1bgEfqOVClsVgGbifzwkYtXnfQzwLSVmr/G7Vz9W/4WT+8G
 eWyOCYMMsCEtc+c8R1SfXIEti0lU5WIIEXtdofnPxykf74Saqan4SOx/u7/UsSZPRjen
 G5QhJgP9pk1aT1qSO822czBGuas0fYYOiKcsfe53fx9mtYpHt0cL0JIVJedSujDiFq11
 rpNVi65gYbaW4gaNGlf/XPLF7VHyDPLu2A2eSG//6SfpfVQYAniw3OP4kgjUATR0E3ql
 2iMQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=iBVm1c9s
Subject: [Buildroot] [PATCH 04/13] package/libsemanage: bump to version 3.5
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change the license file to LICENSE. The hash remains the same.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libsemanage/libsemanage.hash | 4 ++--
 package/libsemanage/libsemanage.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libsemanage/libsemanage.hash b/package/libsemanage/libsemanage.hash
index 1f333aac30..73df34bde9 100644
--- a/package/libsemanage/libsemanage.hash
+++ b/package/libsemanage/libsemanage.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  84d0ec5afa34bbbb471f602d8c1bf317d12443d07852a34b60741d428d597ce8  libsemanage-3.3.tar.gz
+sha256  f53534e50247538280ed0d76c6ce81d8fb3939bd64cadb89da10dba42e40dd9c  libsemanage-3.5.tar.gz
 
 # Hash for license file
-sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
+sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  LICENSE
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index db9f16bb6a..0fbdc5ae8d 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBSEMANAGE_VERSION = 3.3
+LIBSEMANAGE_VERSION = 3.5
 LIBSEMANAGE_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSEMANAGE_VERSION)
 LIBSEMANAGE_LICENSE = LGPL-2.1+
-LIBSEMANAGE_LICENSE_FILES = COPYING
+LIBSEMANAGE_LICENSE_FILES = LICENSE
 LIBSEMANAGE_DEPENDENCIES = host-bison host-flex audit libselinux bzip2
 LIBSEMANAGE_CPE_ID_VENDOR = selinuxproject
 LIBSEMANAGE_INSTALL_STAGING = YES
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
