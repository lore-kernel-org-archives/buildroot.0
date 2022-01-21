Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BD7C433F5
	for <buildroot@archiver.kernel.org>; Fri, 21 Jan 2022 18:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B85A80F44;
	Fri, 21 Jan 2022 18:58:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ezTCsaQNWhqB; Fri, 21 Jan 2022 18:58:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B964C8133F;
	Fri, 21 Jan 2022 18:58:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A463F1BF2FF
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 18:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 933588133F
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 18:58:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BKGv0g8u07OE for <buildroot@lists.busybox.net>;
 Fri, 21 Jan 2022 18:58:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7022881330
 for <buildroot@busybox.net>; Fri, 21 Jan 2022 18:58:51 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 j5-20020a05600c1c0500b0034d2e956aadso23317002wms.4
 for <buildroot@busybox.net>; Fri, 21 Jan 2022 10:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vZi5XgQ+1WOUFpektY5TytvTHR/2oKXXg/hYhfoQLf0=;
 b=fBPdHhBuNPfi3vVe369Sd8TuqXDsk9NoNa+noBesDgDEkrvM0xhnX+VfPH8eEHim7M
 olcgqE827egfji6aEXHjOwre0+yV71pD0aWLl42gGXbT0oATxDPbSNIOIpYqJenhh6BU
 Fi4JQ/5bJzFR8lws3VLw8SZ8oBFITR/vZZIJlYgerMExJC09+fyLoVPuTRBng037R7KV
 by45GGs+1Jqe8wmOY28P8KNXk98K4P9uRUSXxCaq8y5fkQ8WB52UDe0KLlGMKeOZxk4h
 g3syQHqOUFVN/W1DdsctMUU6wagR9Mx/MvEC+9bZ7MN8bN28ech2oRfqpIy0oJ/QXnpB
 +FJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vZi5XgQ+1WOUFpektY5TytvTHR/2oKXXg/hYhfoQLf0=;
 b=VtEgYYbMVtj7VeiNKFS5YCg3Ye7TX9xk1u+WmX/lldCPlJuJLhfmh+jHKaZ9k8MtEi
 YiXitImhhDlGELaiDFHo5NtThXT2hYU6yk9uEk7ADlZNhS8RSV8V1A5S40gIkI+5Tj/U
 MgjmJmhfRkUnORtMqrDHntW+7yeWZUlLdRW+cZG9kfcdRZjFNw7Rprc/ohZe88bz0SIJ
 CPdFx1VYybjzKvI8nMnfUZPwM4sH+yKjXT6M24mlBB8TCdFjDyc64cdOoq1X3jfM2tZ1
 gYQ/mlzoSKi49JgRpGWw6lBGJwccYvBChHhOb5PdcxiX62wzFGPKsDlud+hEL2yrnFi1
 MbcA==
X-Gm-Message-State: AOAM530ohCkbCEd3JTmAq+wDU0M0f0UW9tsSeqkhupdgPWi34FS7DIQU
 vDgDULIPKnAsMDTVBHS3rQxKyvchN/g=
X-Google-Smtp-Source: ABdhPJxYSqmHH2BdSse9E2W+OT6re//ygLxKtr17mhZAF4XMWz1D2vDn7mym/S3wb56XmRttxazqMg==
X-Received: by 2002:a05:600c:3b29:: with SMTP id
 m41mr1883519wms.7.1642791529502; 
 Fri, 21 Jan 2022 10:58:49 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id d2sm6165681wru.40.2022.01.21.10.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 10:58:48 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 21 Jan 2022 13:38:52 +0100
Message-Id: <20220121123859.754653-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/8] package/perl-date-manip: bump to version
 6.86
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
 package/perl-date-manip/perl-date-manip.hash | 4 ++--
 package/perl-date-manip/perl-date-manip.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-date-manip/perl-date-manip.hash b/package/perl-date-manip/perl-date-manip.hash
index d40aa087b..dc267f525 100644
--- a/package/perl-date-manip/perl-date-manip.hash
+++ b/package/perl-date-manip/perl-date-manip.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  ce3447409d83d16e6dd7bea0a18f24b4  Date-Manip-6.85.tar.gz
-sha256  1662393943b7c588478ea9d975200d825f500d26fe9996f2bf7f829cfaa5ccdc  Date-Manip-6.85.tar.gz
+md5  77123a4cc874f72d7188f859626bdd84  Date-Manip-6.86.tar.gz
+sha256  b5203782d03c79aa5822cf33d1828aaa3b4db93a275d4a428c89f56f4713361f  Date-Manip-6.86.tar.gz
 
 # computed by scancpan
 sha256  8ba2a138654f8b59b7e1e3ad0d4c81918b9148ff95078b172ccbb45fa241431d  LICENSE
diff --git a/package/perl-date-manip/perl-date-manip.mk b/package/perl-date-manip/perl-date-manip.mk
index 4ee81d340..35bce456e 100644
--- a/package/perl-date-manip/perl-date-manip.mk
+++ b/package/perl-date-manip/perl-date-manip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DATE_MANIP_VERSION = 6.85
+PERL_DATE_MANIP_VERSION = 6.86
 PERL_DATE_MANIP_SOURCE = Date-Manip-$(PERL_DATE_MANIP_VERSION).tar.gz
 PERL_DATE_MANIP_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SB/SBECK
 PERL_DATE_MANIP_LICENSE = Artistic or GPL-1.0+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
