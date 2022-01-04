Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358BBC433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 22:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE2FC4152D;
	Tue,  4 Jan 2022 22:04:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8kOskkLQyWln; Tue,  4 Jan 2022 22:04:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 433BD41528;
	Tue,  4 Jan 2022 22:04:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9568F1BF855
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 22:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92EBD41524
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 22:03:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I2JFPGPyIPFb for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 22:03:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4EF3A410AC
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 22:03:51 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id k18so42179703wrg.11
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 14:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cgQFN5C16bX1BKPB7yFfRb1YOOpS8Z8aTWqdIxfUSUE=;
 b=BMZ7SXDjrjEPwBfVcPr20xDDRUn4IthB0vVbq1MHmB4fRuKjx9/z+Ha5JVrQb6Rq/X
 HHJo+Z84s2RdUPA4h1rXXCMKOOFTzn+pyHfIXDAITrXnopG2k9vLNnnJTj2rb9y5d0v+
 wpdh9zdS8i4Gaefc0PvPJpkPhQrimxuKT8F27HSnOsVZxub7kBwVwHOonTUDHKSoHnMJ
 GNPzNu34zwwg3Q7BMB5/25Omlr2ALuRMZhQD2EvQe7aG63LnoouReRCEiQtCtiEZfRfS
 SxfCl1rmlDd8nx+ie7+TdwhPwHk598zoELjqv0qxxI9Xb5EDIlm5HLdu86l6USKpaXO/
 kHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cgQFN5C16bX1BKPB7yFfRb1YOOpS8Z8aTWqdIxfUSUE=;
 b=slyDT0ECRdyJYukAV7+tqnjiugWA1zH6RGnHoVvNqFY56QMEslsaOIDx6fEgLf7A0d
 fwDCR5byAEzYic4B3imClj0/GbpEwOvam2dNUrirnnW3WI2Y6MnqeMG3FOVI64DnQhVF
 YQDM4I9hAJc+MuKRfHP/qshTB58QSp9K50VmXieLStMNb4blOfpfwfV54CKszf+a60+S
 GF4i/TGDXrGCRTzlKarkgODjqUUkxA4+ZVySEazLgEDffA/h0Buwl0JELsNMjLyxjFUY
 oUwHA7hUK+qVr50wner9FxGwu0imRwGlebqvYfwrDE/UKDyvnYZmKjtxO9GR70EFUf3q
 rBBA==
X-Gm-Message-State: AOAM530KqUN4KaVKLj+AUOlEpTWFFBQXKc+MGxmn17/Fugq/id5GYP6q
 QZoDF4gDNAe00yUl7U5baX8vq7wVX0Q=
X-Google-Smtp-Source: ABdhPJxZBowrB4Tu4y3rq9PNPkNpOnZvnbcCOHnxQQeU/O5du0Pwde4S/mpsTtBmR75zytEHT0+CbA==
X-Received: by 2002:a5d:588c:: with SMTP id n12mr44667204wrf.56.1641333829485; 
 Tue, 04 Jan 2022 14:03:49 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id m5sm647543wml.14.2022.01.04.14.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 14:03:49 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Jan 2022 23:02:42 +0100
Message-Id: <20220104220245.3706221-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220104220245.3706221-1-fontaine.fabrice@gmail.com>
References: <20220104220245.3706221-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/6] package/libsemanage: bump to version 3.3
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
Cc: Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Clayton Shotwell <clayton.shotwell@collins.com>,
 Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash file (two spaces)

https://github.com/SELinuxProject/selinux/releases/tag/3.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libsemanage/libsemanage.hash | 4 ++--
 package/libsemanage/libsemanage.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsemanage/libsemanage.hash b/package/libsemanage/libsemanage.hash
index 117fd40d6a..1f333aac30 100644
--- a/package/libsemanage/libsemanage.hash
+++ b/package/libsemanage/libsemanage.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 d722a55ca4fe2d4e2b30527720db657e6238b28079e69e2e4affeb8e733ee511 libsemanage-3.2.tar.gz
+sha256  84d0ec5afa34bbbb471f602d8c1bf317d12443d07852a34b60741d428d597ce8  libsemanage-3.3.tar.gz
 
 # Hash for license file
-sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 COPYING
+sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index bbe976a2c9..db9f16bb6a 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSEMANAGE_VERSION = 3.2
+LIBSEMANAGE_VERSION = 3.3
 LIBSEMANAGE_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSEMANAGE_VERSION)
 LIBSEMANAGE_LICENSE = LGPL-2.1+
 LIBSEMANAGE_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
