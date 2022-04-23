Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040F7C433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 20:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 727F760D50;
	Sat, 23 Apr 2022 20:27:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OSaqGSlLFoA2; Sat, 23 Apr 2022 20:27:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84EB760E00;
	Sat, 23 Apr 2022 20:27:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5373D1BF59E
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 20:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 418EC8301D
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 20:27:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m3UGg1G1FvTd for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 20:27:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C57982E14
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 20:27:24 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso10139631wma.0
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 13:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G7KW9YiKdwcey7ykAPkrdS4oWWUwKR3D6Arn39BiGiQ=;
 b=qRW2Aim3g97SQIl0zXoI+EL9GHowwwQ744sWeujWwpEcRLw9IEcncAZr9nkHBFPVYw
 FqH1rxz4aL64APr9Dlellob9mOivQTGe1BQje2bmThseZHmGdjNrmhSkL+ABd8C42+vn
 +c++YeVShEdAvuZGWX578og3Guzu2+vZeBSuFoIWsiL6Ds6ZtAXe8c2t/MQNiQ3Bf79a
 4U/eXzm6yYqD7RBy/umaTTtk2LQvWw9Qb7JMLxPmID3KM9q59KVv/iNk63fu3EvFBhxo
 1ktGQSzdLoW7Pu7oAKmGjYwP9giA2Vo70x888TE1duf9BTjQXGCBP/Ja046YI6/Wv5CE
 F/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G7KW9YiKdwcey7ykAPkrdS4oWWUwKR3D6Arn39BiGiQ=;
 b=UEPar9leMMJzelWU42NHPdZ29oj0LDjypxAuYn6wYqvvdylqlICbpFEIZy6sTbIARb
 l0zOJvRofgK2XrNZ3vc/g0z1FbrtwEo5/bFD31EiLVILUFICCova07hRUN9E0r2r9fjO
 jepBVDQlPw2NIZqV57hmhsdOFmh9pRYece4dx/3SYkzXQ4z0nU7QEypEbzpZKx2I3kGj
 lFUpb4EuyIOkDO3blkCkzmARLVIyTAbhlkbf+J7B0Cp3rEthCb9aBaY6aPaIWmaaQtO9
 473coymd4ahmAYAPbLoAcfwNS33xNHAZ/IGcv6sWNsqXgeFovHLg0gwTvfxlPu8lajNo
 /tTA==
X-Gm-Message-State: AOAM533B+aQCMeTIi/NTQdjUqBnuD1OKI5NoUBiqbRpsvUqncub/1ae4
 2Jdfhpyjn+ywRnbkfUFUcgrHyUyxNmc=
X-Google-Smtp-Source: ABdhPJwirZJll5DXxlBnzmnDafvh63R+vAIZMRXscpO8ISrh+fbk2dcNQUY1Wa7+hsoXU43Gs6RO9w==
X-Received: by 2002:a7b:ce15:0:b0:38e:b7b0:79be with SMTP id
 m21-20020a7bce15000000b0038eb7b079bemr9704210wmc.71.1650745642257; 
 Sat, 23 Apr 2022 13:27:22 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 204-20020a1c02d5000000b003928c42d02asm5817479wmc.23.2022.04.23.13.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 13:27:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 22:24:58 +0200
Message-Id: <20220423202458.299067-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220423202458.299067-1-fontaine.fabrice@gmail.com>
References: <20220423202458.299067-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/suricata: security bump to version
 6.0.5
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

Various security, performance, accuracy and stability issues have been
fixed.

https://forum.suricata.io/t/suricata-6-0-5-and-5-0-9-released/2415

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/suricata/suricata.hash | 2 +-
 package/suricata/suricata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/suricata/suricata.hash b/package/suricata/suricata.hash
index 098740e769..032546fd92 100644
--- a/package/suricata/suricata.hash
+++ b/package/suricata/suricata.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  a8f197e33d1678689ebbf7bc1abe84934c465d22c504c47c2c7e9b74aa042d0d  suricata-6.0.4.tar.gz
+sha256  0d4197047c84ba070dfc6b1d9f9ee92f52a71403bfac0e29b2554bb21fe00754  suricata-6.0.5.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index 86d8970178..36e641bf90 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SURICATA_VERSION = 6.0.4
+SURICATA_VERSION = 6.0.5
 SURICATA_SITE = https://www.openinfosecfoundation.org/download
 SURICATA_LICENSE = GPL-2.0
 SURICATA_LICENSE_FILES = COPYING LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
