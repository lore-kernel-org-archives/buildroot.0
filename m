Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E61BC77B7F
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 20:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0514B84252;
	Tue, 16 May 2023 20:57:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0514B84252
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IkX2I5OIN-Za; Tue, 16 May 2023 20:57:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48DED8424E;
	Tue, 16 May 2023 20:57:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48DED8424E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D5F891BF426
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 20:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD97742110
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 20:57:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD97742110
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zyngTZqbk84D for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 20:57:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 932024210B
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 932024210B
 for <buildroot@buildroot.org>; Tue, 16 May 2023 20:57:53 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-24e16918323so91919a91.2
 for <buildroot@buildroot.org>; Tue, 16 May 2023 13:57:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684270673; x=1686862673;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UIGBla2qCQLzsmLHdrXa0Kplt8xW2qUThtTvP8m9grM=;
 b=Gueq2OJDL5fvtvFsZYO9lxGs9dA5kEupu8rh/r3l7Zyd3puQssjSRJ1nfQWDFtol2Y
 7ZtFmh3FYTd42B6ACXSv9krrTRgNRTw0/U65y2O/8YTPNWAWOKphHIgOn4SjeO2aXODo
 CKHNSEQy7eAulsK41TDSMOjdMdcriptyIAmq7yP+Pr/uqWHKiQlele3ix4egomJrl9FF
 S2+rt4BP9GNs9kYizwYMRQ/Qe7AtBgFrv2H0iN42Xx256GRCtQF4KDwdIYcJY2+MZ3Wb
 jUrs76VjHb++4qkJfNkgCXKpdTRoXhFrMMb1eiQ3Ig3ObSJ+5HPMKpeiWo96HQrc1aG6
 rDJw==
X-Gm-Message-State: AC+VfDyuPyx1LZ9tsw+bn7W8jA0HfR2NRdf2menhHcSGQf/6y8QF+8DA
 F9Rn66BsQ8EgSZX0Kpcqf0BCUUgAF0ODvAwGedAipOA6
X-Google-Smtp-Source: ACHHUZ6zjQ++V0mm6YzGlm5xGscWMN6ALkof0OrNWcJ8GP0b0yBWt4sNWjDOWxZE4jFrrZ7DVWCQvg==
X-Received: by 2002:a17:90a:8a8d:b0:24e:69e:71f with SMTP id
 x13-20020a17090a8a8d00b0024e069e071fmr36877277pjn.7.1684270672843; 
 Tue, 16 May 2023 13:57:52 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 j22-20020a17090a589600b00250334d97dasm14976pji.31.2023.05.16.13.57.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 13:57:52 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 16 May 2023 13:57:50 -0700
Message-Id: <20230516205750.867334-1-christian@aperture.us>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1684270673; x=1686862673;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UIGBla2qCQLzsmLHdrXa0Kplt8xW2qUThtTvP8m9grM=;
 b=cz8P62RQHUyt+KR8JKT/qMyo5qRHYWMiJRkeEsD9TBTDJQ4AnjF+fNRWEoXJQgEE+P
 FDomoZwev8BvEJQtEC4rLgpPi5OLYjymzt/JnKwZGqvJOIPGe2E7S9oJnCEpdZo0uoSa
 5VwKyvuvvtuP0feFIrc1lWEpDMtsWW4Oat+z1PD9Qw9MmT+d9HAgIBOKvJd2GSreDV+B
 ZAv84SjkOtXTkcCezvNeEzV4RVIgq+dG8E7cwdonu1bjWPpVNdHBcf2ZFKTzYWLvqh2N
 dbPbT+Tze5W7AFfd5+lfzny2LRqL1AVE7a0ji5vy2dRcAqVG4WavtzNrgB7nI0oc8M4E
 DoUw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=cz8P62RQ
Subject: [Buildroot] [PATCH v1 1/1] package/containerd: bump version to
 v1.6.21
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/containerd/containerd/releases/tag/v1.6.21

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 65a87f25fa..345a7b16ff 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  819086ccdca44cfc5f108e226c7a9294d8fad3eb32031a621623da80dedbfb11  containerd-1.6.20.tar.gz
+sha256  9452e95455d03a00d78ae0587595d0c18555bae7912068269efa25a724efe713  containerd-1.6.21.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index bc1dd58611..83489a3abf 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.6.20
+CONTAINERD_VERSION = 1.6.21
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
