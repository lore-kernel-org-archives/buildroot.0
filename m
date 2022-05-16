Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89F6C433F5
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 13:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A674F61065;
	Mon, 16 May 2022 13:17:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kXveGyWjUbvW; Mon, 16 May 2022 13:17:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98C106108C;
	Mon, 16 May 2022 13:17:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 682FA1BF37E
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56C1E61082
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:14:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nf51BORf45sI for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 13:14:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E22356106C
 for <buildroot@buildroot.org>; Mon, 16 May 2022 13:14:13 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t6so20490314wra.4
 for <buildroot@buildroot.org>; Mon, 16 May 2022 06:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6wuphUP5Z0lgINg7CiCdrWqaUBTSnVgNcMekIDOCIfk=;
 b=Kd+GC+IvCeFSjGr03SmAifTMYnjkJR9bRPotA3dHU0agAyde55IiJjsPVrgTPvssau
 4T3PcQYce7WRENkukvREPaY856k1s0g5f6kO9YbazJhRgDAvirfKRmhE18VgrksPSPKM
 W4uFPErsI5RGQeMvvIfMQzTOri6FyVh85EAd4LqnqkUh7DSWHqwqy3e7WM99ADLjGp67
 z9eXMYk05kwTuhxY7hATc+Th3i0eJH9RUFIBLZqViFNv1g5qk1WF10yHwfi8Mq8zn+4r
 TGz5F2tGbfrAedJ1JMYI+ALbBOrOlVMBAfmrKgHE3P7pa5UhT7pkV0yvO06nWdhYFN3D
 kIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6wuphUP5Z0lgINg7CiCdrWqaUBTSnVgNcMekIDOCIfk=;
 b=brU/3ddbMxKRm9KJMgBHXt0X4EgYDZtIPcev3Z7Kr5JezFxCXTD5yhqrex5BcwQkUO
 p2hHpsm6bsSEdi//JmbPLrZsfJbVt0PHDbKokA1nAux9/C745jNIyyvzTcZ0BBT+p+jn
 9hJK36R+moOnfPMzv34NTrE6Z5QIPbNIGS0lIFtjQ3oKxilYK8sKebMIHKgoEbpAVoEK
 2jWSabZqnLcKXFMdmlLdkUrGhxZlALa/Adlue1qQZ4anejO4s6i9y81VEDuF7JFoDQhm
 LIReEGMVVoLh/ch9wbCylEPZk6CbZKZAAKVOhlc3AXl/DF456eZ2savt+hal8x58QF4+
 Lc9g==
X-Gm-Message-State: AOAM533VortK63dG0F5M67HYLrq4SN+HevdfNZBK1hE4wGgXHSu2tA5N
 AXiot4Pqp8n8GJIiX+dRw49/dnGCUe8=
X-Google-Smtp-Source: ABdhPJxxhXf4prioYJjuRKP7nEXIbXseunEUGOP78ct6Zjc6JfTF+xOHihw93yb5pgQAgGPzNPSnBg==
X-Received: by 2002:a5d:67c3:0:b0:20d:a38:973a with SMTP id
 n3-20020a5d67c3000000b0020d0a38973amr3312639wrw.493.1652706853262; 
 Mon, 16 May 2022 06:14:13 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003942a244f51sm13023789wmb.42.2022.05.16.06.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 06:14:13 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 May 2022 15:13:32 +0200
Message-Id: <20220516131334.1910858-19-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220516131334.1910858-1-johan.oudinet@gmail.com>
References: <20220516131334.1910858-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 18/20] package/erlang-p1-sip: bump version to
 1.0.47
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The copyright year in the license file has been updated to 2022, hence
the new license hash.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-sip/erlang-p1-sip.hash | 4 ++--
 package/erlang-p1-sip/erlang-p1-sip.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-p1-sip/erlang-p1-sip.hash b/package/erlang-p1-sip/erlang-p1-sip.hash
index e52371e404..b20df00280 100644
--- a/package/erlang-p1-sip/erlang-p1-sip.hash
+++ b/package/erlang-p1-sip/erlang-p1-sip.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b46349a7077d8e5f36a216ada4a5c0b51ef3d66005606beb0ea3962069f215a7  erlang-p1-sip-1.0.38.tar.gz
-sha256  6cd4871db940d055cf272c12c10e0c08febdc94362e404390758fde34b4ce01a  LICENSE.txt
+sha256  1de406bc59c30e2697b8b29cc0ad0e370e6f5a5d777d37e022d195586b80643d  erlang-p1-sip-1.0.47.tar.gz
+sha256  c835791cd41a32f8ef40e2255d141ab7faec2f28fab68bbd685c6110fb83be4e  LICENSE.txt
diff --git a/package/erlang-p1-sip/erlang-p1-sip.mk b/package/erlang-p1-sip/erlang-p1-sip.mk
index 2d2f0110c3..f0e999ec54 100644
--- a/package/erlang-p1-sip/erlang-p1-sip.mk
+++ b/package/erlang-p1-sip/erlang-p1-sip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_SIP_VERSION = 1.0.38
+ERLANG_P1_SIP_VERSION = 1.0.47
 ERLANG_P1_SIP_SITE = $(call github,processone,esip,$(ERLANG_P1_SIP_VERSION))
 ERLANG_P1_SIP_LICENSE = Apache-2.0
 ERLANG_P1_SIP_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
