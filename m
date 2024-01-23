Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CFCC47258
	for <buildroot@archiver.kernel.org>; Tue, 23 Jan 2024 15:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C35641B56;
	Tue, 23 Jan 2024 15:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C35641B56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g1hpPKI0OY_z; Tue, 23 Jan 2024 15:59:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6932B41ADF;
	Tue, 23 Jan 2024 15:59:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6932B41ADF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 30FA61BF360
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 15:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A03A8408C6
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 15:58:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A03A8408C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fdwtYhbX3oP4 for <buildroot@lists.busybox.net>;
 Tue, 23 Jan 2024 15:58:39 +0000 (UTC)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DE67B408BE
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 15:58:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE67B408BE
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-559f92bf7b6so8057329a12.0
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 07:58:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706025517; x=1706630317;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CV0QGfrRRie9KuSaYYr0WrKMOW1HtYjmCrRl8O+ZmVc=;
 b=I/OU6E8sMqMv8QSgJlTFOEfXfjq2l1/ZOpEFXXxjT/s1j+2nsSG5v/QA4QriOLiFE6
 Kx1b0hGMEXgsgqARwM0qjgj1AvylGUZ95TEcWDPfUGsko9XvGwZfHeZd7W15eFxDMpmX
 EbVuBCR7acXeJGFLT47MTjbLDfMVi90GOihQRtbTaORKLjM4uahck3OIn3EmZzfBU4Qo
 hTCFjgKerq45o3tK1EEzmC7Qg66fsdbkoRFdtEvIt05HEY9DbojAMVaJDQBmRvDP06yK
 tsdDv68bXnIlpfZtVUoaxqumYyshTJaUhtbluyj3PNUypggB9qyEgT0KVQR+JfQqWXUG
 JAgA==
X-Gm-Message-State: AOJu0Yz+qHZWGQqZhh+oFAf0IjmvThEbG5F8J+f4NjG10ntitf5js5/m
 +Jw1AM8yTEWEHmBkegXLJZ/CQVvza+/F+Bdi1PuR2Ec2vCVm3Gv/
X-Google-Smtp-Source: AGHT+IFiBXSywTH+EeQaCYlssIhQiN8xVuXbVEidZ/vizMGA63k2OK+zT4UkQvx2LQPjea58iIrNOQ==
X-Received: by 2002:aa7:d790:0:b0:558:b5d0:e77a with SMTP id
 s16-20020aa7d790000000b00558b5d0e77amr2123972edq.36.1706025516276; 
 Tue, 23 Jan 2024 07:58:36 -0800 (PST)
Received: from wslxew193.fritz.box
 (p200300c7873a53007b4b21e28831d34d.dip0.t-ipconnect.de.
 [2003:c7:873a:5300:7b4b:21e2:8831:d34d])
 by smtp.gmail.com with ESMTPSA id
 x9-20020aa7cd89000000b00558e0481b2fsm14122671edv.47.2024.01.23.07.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 07:58:35 -0800 (PST)
From: Boerge Struempfel <boerge.struempfel@gmail.com>
X-Google-Original-From: Boerge Struempfel <bstruempfel@ultratronik.de>
To: 
Date: Tue, 23 Jan 2024 16:58:25 +0100
Message-ID: <20240123155829.387063-3-bstruempfel@ultratronik.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123155829.387063-1-bstruempfel@ultratronik.de>
References: <20240123155829.387063-1-bstruempfel@ultratronik.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706025517; x=1706630317; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CV0QGfrRRie9KuSaYYr0WrKMOW1HtYjmCrRl8O+ZmVc=;
 b=OzXHIGw4ulKDXCKuSuxQhnL3F/MXzACrqoVfJW72Eyc7TtzA+3mgeut8HgD5uDCaIQ
 3IfNGGA2Dzfh187eWZNY8U8aTfmrUMG0E6TRw5CTKCVhMQ1uepyOw7HWmqxcgRgm92gB
 hdwxjxen0+HS43I4oj1hm8KjDJPqpzSaFUOOYmfETi2RlZfNzNUA3TLYcQYAO3Tpm8q+
 zI+JBvdlNP9RUlGYBoZrWO+S8XbzXcWQ2oX9PVqJYRAcpbeplQtMnIKD2gKgSMzbsERA
 O2mWL9HR8R+jKPKva/iBeR4czJYaw+UWJkaF2vg0fFpuQ7ennMCj8sWknSvFIu03f+Wt
 vALw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OzXHIGw4
Subject: [Buildroot] [PATCH v4 2/2] package/swupdate: Add compatibility to
 libgpiod2
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
Cc: vfazio@xes-inc.com, bonet@grenoble.cnrs.fr, bstruempfel@ultratronik.de,
 buildroot@buildroot.org, boerge.struempfel@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Boerge Struempfel <boerge.struempfel@gmail.com>

Signed-off-by: Boerge Struempfel <bstruempfel@ultratronik.de>
---
 package/swupdate/Config.in   | 4 ++--
 package/swupdate/swupdate.mk | 5 ++++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index ba3f6a0c0f..3708df0881 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -37,8 +37,8 @@ config BR2_PACKAGE_SWUPDATE
 	    remote handler.
 	  * Select BR2_PACKAGE_LIBRSYNC to add support for using
 	    rdiff handler.
-	  * Select BR2_PACKAGE_LIBGPIOD to add support for
-	    microcontroller firmware update.
+	  * Select BR2_PACKAGE_LIBGPIOD or BR2_PACKAGE_LIBGPIOD2 to add
+	    support for microcontroller firmware update.
 	  * Select BR2_PACKAGE_EFIBOOTMGR to add support for EFI Boot
 	    Guard.
 	  * Select BR2_PACKAGE_LIBCURL, BR2_PACKAGE_LIBWEBSOCKETS,
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index ca8c140886..a2b0995227 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -72,7 +72,10 @@ else
 SWUPDATE_MAKE_ENV += HAVE_LIBFDISK=n
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGPIOD),y)
+ifeq ($(BR2_PACKAGE_LIBGPIOD2),y)
+SWUPDATE_DEPENDENCIES += libgpiod2
+SWUPDATE_MAKE_ENV += HAVE_LIBGPIOD=y
+else ifeq ($(BR2_PACKAGE_LIBGPIOD),y)
 SWUPDATE_DEPENDENCIES += libgpiod
 SWUPDATE_MAKE_ENV += HAVE_LIBGPIOD=y
 else
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
