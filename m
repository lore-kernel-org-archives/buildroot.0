Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3000DC47DDB
	for <buildroot@archiver.kernel.org>; Tue, 23 Jan 2024 15:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3F3A408E0;
	Tue, 23 Jan 2024 15:58:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3F3A408E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xgeDJBSuF3_P; Tue, 23 Jan 2024 15:58:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22F6B408CC;
	Tue, 23 Jan 2024 15:58:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22F6B408CC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ECAFF1BF360
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 15:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2DB1408CC
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 15:58:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2DB1408CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BCs1nJhJHRpd for <buildroot@lists.busybox.net>;
 Tue, 23 Jan 2024 15:58:37 +0000 (UTC)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A12EF408BE
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 15:58:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A12EF408BE
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-55c2cf644f3so2537678a12.1
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 07:58:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706025514; x=1706630314;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0mrT8MY+bLe/JX7LOyJBhcGctznMjWd4llmwT0XJlwc=;
 b=I1MW7ACWjapKI4rKvlYZOCacHYXSlMy6ztPQC2hWbrRL5ejAhu69anGJZYhndC10oW
 Fatb6m/D/4voLYYiT+cNR44v0JnNZxQb9nhXl8elwpF8AVuMdlkHcXYHUYXQwgEzIlAi
 RZ2ZbAliWz/wWQkqG8QwpH9eoxp+pEg80IFs6b16Q9i0P9XJssnCw+TDTL961ng61weQ
 iJqZP9VHTGjbjYf5+Ydg+BW40Pqai+lMwgz7u6n2kF7anCR7hycJ32wnZ5VJCUdSL4Z3
 CNrMFNePKTmVOXC89finF64SC4txvfR0MBIHRuX0/+gtvruqY8vuV283o6/FF6GirxFd
 Ls4g==
X-Gm-Message-State: AOJu0YzMh9j2UMekzgIfztBNZxdvLOrp1PRxyARfeNXwL3kxVDSBIEWX
 F6GGvz2KJ1q2uitj5ThFcHwrRJqfa3lMzGp3+9zQBEgP2wxlXVsc
X-Google-Smtp-Source: AGHT+IGnDSwaXIAb/0dA0MBx9IIuclXrzRTaC3EXfZ3lqdh3imcQZ7WaxFS1ZD+s2GvKTz67teat9A==
X-Received: by 2002:a05:6402:795:b0:55a:47f7:4634 with SMTP id
 d21-20020a056402079500b0055a47f74634mr1053914edy.26.1706025514360; 
 Tue, 23 Jan 2024 07:58:34 -0800 (PST)
Received: from wslxew193.fritz.box
 (p200300c7873a53007b4b21e28831d34d.dip0.t-ipconnect.de.
 [2003:c7:873a:5300:7b4b:21e2:8831:d34d])
 by smtp.gmail.com with ESMTPSA id
 x9-20020aa7cd89000000b00558e0481b2fsm14122671edv.47.2024.01.23.07.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 07:58:33 -0800 (PST)
From: Boerge Struempfel <boerge.struempfel@gmail.com>
X-Google-Original-From: Boerge Struempfel <bstruempfel@ultratronik.de>
To: 
Date: Tue, 23 Jan 2024 16:58:23 +0100
Message-ID: <20240123155829.387063-1-bstruempfel@ultratronik.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706025514; x=1706630314; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0mrT8MY+bLe/JX7LOyJBhcGctznMjWd4llmwT0XJlwc=;
 b=gHWdDB1sH98mrjqyhHin7MjoHnzYFVoz4ii7Bv+ril4OzowJTivgUAy8GoE9QWkyvK
 /efEVwAH6NE+JNPlE7cz3mfuT2mcRae87Ge5/9Ja9fz2SIj2LfvA8kemQeioNOM/Uzrp
 sQtFHN7tRSTIT4S5D+F8sppczg9CWHNjHwLqB3V0oH+MP4n8QX2atalTguHCtiCqPXOY
 e2cjPSlEeqSr2oUe33yIVLyXpOOyTP7GjFXFfYmWBitCLbiABWY+7U0DBsv6kLB7nUb/
 4L+W040Dv861LxTMg49BfCxU2DRRzj+dDukBH0O1+dQlUBBfdLPf06LoGXe8JcYi7nZv
 sSrQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gHWdDB1s
Subject: [Buildroot] [PATCH v4 0/2] Adding support for gpiod v2.0 and higher
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

Since libgpiod v2.0 breaks its api, and leads to
compilation issues with multiple other packages,
we introduce libgpiod v2.0 as a new package libgpiod2.
Furthermore swupdate is updated to support both the
old libpgiod and the new libgpiod2 package.

---
v3: https://lists.buildroot.org/pipermail/buildroot/2023-November/680147.html
v2: https://lists.buildroot.org/pipermail/buildroot/2023-November/679812.html
v1: https://lists.buildroot.org/pipermail/buildroot/2023-November/679675.html

Changes from v3:
  - Dropped patches, which are now obsolete, due to the recent swupdate version bump to 12.2023

Changes from v2:
  - Removed unnecessary Autoreconf, since the corresponding patch has been applied to the source.

Changes from v1:
  - Added myself to DEVELOPERS for the new libgpiod2 package
  - Removed the dependency on the linux headers
  - Updated from version 2.0.2 to 2.1
  - Added comment in the commit message to swap the dependency in the future
  - Added a note in the commit message, that the libgpiod2 does not correspond to the libgpiod2 debian package
  - Updated the help text to explain the difference between libgpiod and libgpiod2

Boerge Struempfel (2):
  package/libgpiod2: new package
  package/swupdate: Add compatibility to libgpiod2

 DEVELOPERS                       |  3 +++
 package/Config.in                |  1 +
 package/libgpiod2/Config.in      | 27 +++++++++++++++++++++
 package/libgpiod2/libgpiod2.hash |  4 ++++
 package/libgpiod2/libgpiod2.mk   | 41 ++++++++++++++++++++++++++++++++
 package/swupdate/Config.in       |  4 ++--
 package/swupdate/swupdate.mk     |  5 +++-
 7 files changed, 82 insertions(+), 3 deletions(-)
 create mode 100644 package/libgpiod2/Config.in
 create mode 100644 package/libgpiod2/libgpiod2.hash
 create mode 100644 package/libgpiod2/libgpiod2.mk

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
