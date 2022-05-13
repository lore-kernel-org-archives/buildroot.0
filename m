Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199AAC433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 07:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AB35415E5;
	Fri, 13 May 2022 07:11:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LCHR12jN-rUT; Fri, 13 May 2022 07:11:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3348B410C6;
	Fri, 13 May 2022 07:11:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 67F421BF357
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 07:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AC7660B25
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 07:11:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7MMQvdOVlq02 for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 07:11:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E7A9C60AEE
 for <buildroot@buildroot.org>; Fri, 13 May 2022 07:11:00 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id g23so8812949edy.13
 for <buildroot@buildroot.org>; Fri, 13 May 2022 00:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GATxOZR62BreRfPamyT918xv5pgayOsMVzDdx9n5rxo=;
 b=NNu1FpapOFop7lcx0RG1C1crwdyZBZYZ6e4lcZp2cXWn/kdUL8n0a6k/BLj/eUYE6v
 3Ty6hZLWUTi6wq+oKE5RGxkc6G1QR2FjCp/4RpzIUDNfVBW3j9DmklB+mzjkbQLxqFaK
 JexrLgKGAnRx4D14F6DbvCbnEsoA51W8MbsOJORyFHI4GU4fSAmvZhcaxLItgEHMNMI1
 KjHt4fMqtBx2vns98OrZmjT7WAoHoTZ8MNPGqGwHFEjYqd0BjYNb7r9y9xQ41xbjvp+n
 cP1rSdjpbh9VNzboOBHcxLMlDKkiysjLST36ZBVboCJkq1JDG+jPfG68rcZpVu0xneZK
 Cm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GATxOZR62BreRfPamyT918xv5pgayOsMVzDdx9n5rxo=;
 b=pykBrVbxYuMz4a5i7Of7vkBgY+cxDdh9/cX86COAu5bFotQoFHYtt83GNwlmhZBFt4
 WkT2T2PE4FLEcNuGfwYHysdS4+wQ6GpGdwYbydiJCcts1N6cqoUyjoV+rtk2gr37hl7p
 Jf1Glfd0y2Ns+pvipT13wqJLKLtTTtJGjUxNeUy1B5dDcPxgL6NdwdVdbcVGRUOUI0cZ
 nShwOS7LgW9pVeW60+jpMB7Kk4sTeQRWFNgn4C8f4ByM7iJU1HFOugd0767GvPAHN0JI
 rSz1jJW7AW/C9He+zUKlEMScgCGbCeZEdQFtZc7O3xFN/PizZvVYnl8BNFkMQFTtf1cM
 M97w==
X-Gm-Message-State: AOAM531biMlRaq1e9p7M6C/63xJaCBfgcNFXb9QiCqQSC+OHOZRcoLHc
 MJsVg90irGbyGOlSfG1bgx6O9EVlGXu1cg==
X-Google-Smtp-Source: ABdhPJx5z06yOO/dVvqBTmqIyNPPf7EHlaNNrtUHsSLv53vz0fzfRn7C41nwXMIDK/kl4gnfbCnXmA==
X-Received: by 2002:a05:6402:1544:b0:428:b439:9a01 with SMTP id
 p4-20020a056402154400b00428b4399a01mr19513246edx.201.1652425857813; 
 Fri, 13 May 2022 00:10:57 -0700 (PDT)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 ml13-20020a170906cc0d00b006f3ef214e63sm443183ejb.201.2022.05.13.00.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 00:10:57 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 09:10:43 +0200
Message-Id: <20220513071046.18618-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/4] Bump netopeer2 and dependencies to actual
 upstream version
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

netopeer2 has the depedency to the other packages and expects to also have
these updated.

Heiko Thiery (4):
  package/libyang: bump verstion to 2.0.164
  package/sysrepo: bump version to 2.1.42
  package/libnetconf2: bump version to 2.1.7
  package/netopeer2: bump version to 2.1.16

 ...IX-netopeer2-build-fails-when-buildi.patch | 34 ---------------
 package/libnetconf2/libnetconf2.hash          |  2 +-
 package/libnetconf2/libnetconf2.mk            |  2 +-
 package/libyang/libyang.hash                  |  2 +-
 package/libyang/libyang.mk                    |  2 +-
 package/netopeer2/netopeer2.hash              |  2 +-
 package/netopeer2/netopeer2.mk                |  6 ++-
 ...uild-with-musl-libc-fails-due-to-unk.patch | 42 -------------------
 package/sysrepo/sysrepo.hash                  |  2 +-
 package/sysrepo/sysrepo.mk                    |  6 ++-
 10 files changed, 16 insertions(+), 84 deletions(-)
 delete mode 100644 package/libnetconf2/0001-libnetconf2-BUGFIX-netopeer2-build-fails-when-buildi.patch
 delete mode 100644 package/sysrepo/0001-sysrepo-BUGFIX-build-with-musl-libc-fails-due-to-unk.patch

-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
