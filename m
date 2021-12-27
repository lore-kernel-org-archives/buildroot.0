Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6D6C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 09:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A125409A4;
	Mon, 27 Dec 2021 09:51:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id umLqOiTElP68; Mon, 27 Dec 2021 09:51:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F103409A5;
	Mon, 27 Dec 2021 09:51:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 194C41BF3FD
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 09:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16C28813DA
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 09:51:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GKIsboIG1VF8 for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 09:51:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 225D2813CF
 for <buildroot@busybox.net>; Mon, 27 Dec 2021 09:51:10 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id z29so59683362edl.7
 for <buildroot@busybox.net>; Mon, 27 Dec 2021 01:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+UbbSESMT4ivTnpK+8fvKgxY52JDe0KJ4in6Yb0VoP0=;
 b=USpOrckKMqZIz+lUG/914se+DM3joLNRCjfs4BcHRCF8ZPhj6Xp4/yPtjtO8e3EcpS
 VYOsaOFYkFByt2uEKiIduNDMt4OESrv4Rz5YRwqeccZvJm6Y63EUXFc2LWBCjkfQghZr
 PahAf6C9zw215kXta6RBt7Jn9xbJQFjOWCueuTxOPfhRvYypbXo3lFcAnkvLt3IFLuth
 a83z1FKXtIHOS2e3LGVicPWSawi8IKixsRGPchjW4oesgPFgBXRpbweQMdf/JI5RHh7G
 N4ps+tJ5APERd9nS8LllO83L9D7+JO/myGQ3tPl6LiWL2XCGOPc0uTMr/V3tCD5EJ2X9
 bwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+UbbSESMT4ivTnpK+8fvKgxY52JDe0KJ4in6Yb0VoP0=;
 b=kDbx+5/pQ7mbsXBKnh7hdyPdrqwhkrxxsZZQk6WmkCd/nXivs69cP6IVzGSFTNVbDj
 3gaiOk2uaj55wP10Yi+y80kDuXL8jNe1sDWauxw7kiFwrligUfQYVdrmP8PlQJddFGvp
 3wxFUwYPLjoB/TkZ7atiRYP7J5Ojd1+MH2FeATLafq5HDYoiyplOzu9XbUNPORsVu2jv
 TRXu4zEQoDHqlDCh721osRpcEYvYh5ax2lBpdI/jfP5WbvgxsNJyj2HwvdY7gItN5OYA
 izkMoxS9/yCiXD8VC7TUPcl3jVq9i1iL4QbCRVZLtLOfsBWNygtHr9NYr0hAoMHrvNg7
 VNKA==
X-Gm-Message-State: AOAM5301RCQQk8RcfKoFlye/bWp8CAj6xBltsGy1kbonXWM3jkyW8EeA
 MjubdsvdTH8Pstg5FNLhPRy2ZjByLio=
X-Google-Smtp-Source: ABdhPJzEn5j4JOvkIcft6Bdh3WRO9JP0g/OFrAT/x7nOH17wdPUpVbFmyUTyIZm34/iDVEYnFZaJAA==
X-Received: by 2002:a05:6402:483:: with SMTP id
 k3mr15469080edv.323.1640598668497; 
 Mon, 27 Dec 2021 01:51:08 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id w11sm2845851edd.21.2021.12.27.01.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 01:51:08 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 27 Dec 2021 10:51:02 +0100
Message-Id: <20211227095102.1051565-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/sqlite: bump to version 3.37.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index bd736fa64..94f0127d1 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bd90c3eb96bee996206b83be7065c9ce19aef38c3f4fb53073ada0d0b69bbce3  sqlite-autoconf-3360000.tar.gz
+sha256  731a4651d4d4b36fc7d21db586b2de4dd00af31fd54fb5a9a4b7f492057479f7  sqlite-autoconf-3370000.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 3f716b14b..be060c311 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.36.0
-SQLITE_TAR_VERSION = 3360000
+SQLITE_VERSION = 3.37.0
+SQLITE_TAR_VERSION = 3370000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2021
 SQLITE_LICENSE = Public domain
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
