Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CCBC79F99
	for <buildroot@archiver.kernel.org>; Tue,  8 Sep 2026 14:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C371160726;
	Tue,  8 Sep 2026 14:13:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8hPPZUjnJh8D; Tue,  8 Sep 2026 14:13:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D63E360710
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788876792;
	b=WP5jCqkJxXyEWoBWno21pq03smGCEOmS2LUu3zzA5DU5+QtVUs79QuTxjPA9iI5wL1DP
	 3HMYTn9qjV1+mDDRIGeHszW2AyOQ+MUBkjWn6bxOfbvGNgWAhvn/STTytrAWVreEhPb/V
	 ieND/dpG3vIVGEnKIgT+49Pe2Rw88sXLgdkSmzyZ4cxgNpMyuon+TXTlglE7AlMp6fqA0
	 t5TbJyBnMgV4EW5BPnYSwG3ISTX8Neuqw7Scp4a3YuAaQQu2NWKXUVhaCfBTmiFVX5eyU
	 ngdHmDVVMBWPoTSDiHkK9K5ACVyyiWH5wz/kQYnh0Pj7DJJRCs24CQ+hcA0FUhbnpJQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788876792;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=i82L7GFagjAPqri5r1XEW9Yfw1/A12f2omd69FCl0mw=;
	b=lwzHAyMzHwnUwsr3dirElNL2Z4fKiOmXnnc6EqpI8sRLP5f5XvcO+tjpwljQsiLBIcc9
	 MfkEfU/Ug/9Q3mo4zelKFOOD7pd4ThjG4RVGJQKdbSeGx86ee7DfXSv6xvxOWyMgo3GT3
	 rSqj75oNyfTYk585Up82S9utrRRt8UlXYj/SmJP22Un7Fx0cIXVDqhorovydw90pK7Syk
	 sdSnrL/6N9lPlKZfI/Mwt2uWljoYkMLrfGQkkDaoWZga/ZZ6OKzcjsXao0d5jTOSL461P
	 mjQp8WwmjVmT5w3jjSWU0PDyLBFNF6t6maKYzBhsuFS7WvXuKEOPFeelRdv2SSaVKOg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788876791;
	bh=i82L7GFagjAPqri5r1XEW9Yfw1/A12f2omd69FCl0mw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=MAhvgJdE9eNiU47ucYRX1G9GE7d1p05C14RiPVEX50CgCxXaHScxtKPLUd0mU/zXt
	 Y9+dUvaCvxlYCZ5hrWlg11eEkidqU6wsuwcoqdnnGDghBHnCfSFh71EAs9JnfDawRn
	 s7vIn3fCbIa9WTmxCplSauA+BVh7IR/uMMfJpPINjc+aOB4f2PioVkj5FVfX+IFcNi
	 bn4axvs3RIsc2M2ASvFY9dbG1OlfG7HImrYp0d8X15Ks7/ZqGCBHwDytUG/QJKMHhV
	 eWD+SbtbiHK5P0adYKQLhN+EBTbzUmleWLBC5jNg8FgJncN5B12Y/aiX5jwTfXz+KL
	 KIZ/ArTrz48ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D63E360710;
	Tue,  8 Sep 2026 14:13:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BB38DD5F
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 14:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD71840160
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 14:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P63OQQxLXm4K for <buildroot@buildroot.org>;
 Tue,  8 Sep 2026 14:13:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 594B340079
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788876787;
 b=sgagcU8ZZdJ27JAAuCxROqog81OmkZlehK8bKKadR5kkBVeqVnfXPFNX3Jmt7qSRm31r
 ArqWkn2nkbjNTaZJrpu7/xVzP1AcovXw8LnC7Pb95+hTsxtf+0C7Y6lXBh6rqiZs+FyYv
 sSrqtplh6IbSyiitBTGU/nwrqgVvlOD08K38lpFD8kBC0s3WOVZkFeA3xuNB9QnL1RTK8
 P/CKZFrpHW4E+YrGoz2DLueOfVJzau5Si6Xs5D+hRKEU+TVZPGtH3Kb4bad9a/CslSgZK
 KdUpv9WWCGvJI2M0aL4tXiO2Goh+eKAezVDZ6l3bfEqEAG6DrRevpImcmV8oHMW0qEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788876787;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=wuDS1U7gD7fg3EAd/bcFWY5y4xB2ShynphntbU8Hs4U=;
 b=AawFah1/YQxZC3rvUGnwEZ85f0tmm/qBgUMcvTcIU/EHOYVsfEwGt54tmEtmwqiPMZNK
 QG6ELHrKqmGcJQfMCPALVBOhkKfvNhwf385dUQsgUFM2VI/edzmhPQhSs2XQYvcTAgvXT
 ive7Ft7pJVmGNT5Mn/8aPCx7X3fsJa6tuG4fml1kuXBg6mIJhIbLmlTc0ZUZ1wtATxDt5
 l/uzPUv4IACinyhvFl8JbOTgfID7ngAbmlgwc8MgHdQJhg6uOqN+CADNEJOSJDwkCFGZx
 4W3Ij/kRqpvfMxKdp8ObujAHOJi/fGlKxKgnvyflMed1cYVfxyx5Yfvmlg8FCeiSSMA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=amarulasolutions.com; 
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=OfY4vAFY; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=OfY4vAFY
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 594B340079
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 14:13:03 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-49557167508so55876655e9.1
 for <buildroot@buildroot.org>; Tue, 08 Sep 2026 07:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1788876781; x=1789481581;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=wuDS1U7gD7fg3EAd/bcFWY5y4xB2ShynphntbU8Hs4U=;
 b=OfY4vAFYQd478dcVNBatV6sI5U8UCNohicWdkVHoduU7Luy3pvuL63jphNVD3ey22+
 mrY0e2YjoW47gmesZW4fm0QCh7/+TSqoJ23UdAg0yCiA90XTIUp2rk9fs3nLQnXkoiDh
 M55U3zGqqpOReXmj52vWXWMJUY/jGyx33l1KQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788876781; x=1789481581;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wuDS1U7gD7fg3EAd/bcFWY5y4xB2ShynphntbU8Hs4U=;
 b=O37qBOkVLlQ1DansvU83VEko5PuRAg8eNjxfpkH9oEZH81cy/VpXZguMELYr95GU9Z
 xaM3LRt3+OZitRFglWSSxJ2RFA9W5FEIdv8HiMJ9q9FnpG79Q7XwpXKfrKk2kbKfRubE
 3WqucZxB3rxhN8QJMqi8c2r6Pwy3I/3D4ovsxVMGNQCZlwYFk6tgi7TnKxYH28TFEl2J
 UdjQlfytSlbgcSFkqX+QWSrDBAu83ZJj0P4MPLh/NnWp7GapQFbClTO9yv9NOLiHP7jv
 Mg+95Mwont/diyD7oInXWX0G9CV9XIWF3LYSt1a0elrAqwB4S9ah6jpOdK9W+3s9MZGT
 +d0w==
X-Gm-Message-State: AFuF++kHac36vI12luNtlbrUyKDPXF4r2wC/ShETpbWrlMmN0IC3leQS
 Rb/Bty+DDBeIp0mQOegqz/J8xlTAyGZQkKL6F6hzEzDM+xPHyNVeFbk72orG9lJQq1WavLqLleS
 JCY3nDmw=
X-Gm-Gg: AYBFou1BOGvRVG1yYY/UEAspEKVt0RRQy57NjzxT8h59Lqqx2q+NTkoeSAQdI4lt+wI
 CSgd8hP0n6PdWkD0gATK9OSA0/8u6waM9km1yIVNpFdBpre0kF/KZ71TMTB4IC874nCnl1x3W6G
 umI5lIxpQ/NL5SX+LKjv246mPmPxqdTKhlI6N8oifVyrMA4n926tmxbb+7ta4C6x9D6qNB06A0P
 2WzzngFvtLLGHWAPtqa/zrcnZ7O725LCGeQDHDCZobPot9PltqzqiuwmyGlRUElGGzBzlDAS9L7
 2dr5NlAZX1gw+eS78i9wkNQ+YEFKKAlKI2B7/BB4lyyQgpekLfTTl04/U0tyg1ym9kDvvi3tOW4
 Vdx8YJ7HYbbqlhAj98Zb3CeFRCUzC5jazLTlQUFmuu3z5Enerji0d7ym28AR57d17UW+1Hn0qPu
 S1UEKQawsePhLif3J4x7UxWVSLWkfUnbfpdU3TIAFlBwGKUCTNWqHhv6/Fs1GV4ArcpCI8of+5W
 dYNlqKHPqRm0pglQaWQfk4R9Zd/JiEE+OrvIvQBcJA/KzYfHpclQkam
X-Received: by 2002:a05:600c:8b6d:b0:499:a277:e8b5 with SMTP id
 5b1f17b1804b1-49cf7fdd67emr576365415e9.3.1788876780947; 
 Tue, 08 Sep 2026 07:13:00 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:c371:d703:6c9d:b3d2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883a9b49sm30923335f8f.17.2026.09.08.07.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2026 07:12:59 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  8 Sep 2026 16:12:47 +0200
Message-ID: <20260908141253.1556634-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 0/6] Support qmake for Qt6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, richard.genoud@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Qt6 is built with cmake, but qmake is still installed and supported as
a build tool for applications [1]. This series revives an older patch
exporting qmake for Qt6, extends pkg-qmake to support Qt6 and uses qwt
and cutekeyboard as test cases.

[1] https://doc.qt.io/qt-6/qt6-buildsystem.html

Changes in v5:
- rebase on master (qt6 6.11.1, cutekeyboard 1.6.0)
- drop the RFC tag
- pkg-qmake no longer hardcodes the Qt versions.
- package/pkg-qmake: document in the manual which Qt base package is
  added to the dependencies
- package/qt6: set ArchData, LibraryExecutables, Plugins and QmlImports
  in qt.conf.in. The host qmake defaults are relative to the host build
  layout, so qmake packages installed their plugins and QML modules in
  /usr/plugins and /usr/qml instead of /usr/lib/qt6/{plugins,qml}, where
  the target Qt6 looks for them
- package/qt6:
  - quote QT_QMAKE_DEVICE_OPTIONS, it is a cmake list and the unquoted
    ';' were split by the shell
  - Replace QT6BASE_CXX_FLAGS with TARGET_CFLAGS/TARGET_CXXFLAGS
    directly, as suggested by Thomas
  - drop the redundant mkdir
- new patch adding QT6_QT_CONF_FIXUP for the per-package directories
  case, as Qt5 does.
- package/qwt: OpenGL option depends on BR2_PACKAGE_QT6_GL_SUPPORTS,
  which is what BR2_PACKAGE_QT6BASE_OPENGL requires
- add Tested-by of Richard Genoud on patch 1

Dario Binacchi (5):
  package/qt6: add QT6_QT_CONF_FIXUP hook
  package/qwt: bump to version 6.3.0
  package/pkg-qmake: support Qt6
  package/qwt: enable build with Qt6
  package/cutekeyboard: enable build with Qt6

Jesse Van Gavere (1):
  package/qt6: Add qmake functionality

 docs/manual/adding-packages-qmake.adoc |  4 +++
 package/cutekeyboard/Config.in         | 13 ++++++----
 package/cutekeyboard/cutekeyboard.mk   |  6 ++++-
 package/pkg-qmake.mk                   | 18 ++++++++++----
 package/qt6/qt6.mk                     | 18 ++++++++++++++
 package/qt6/qt6base/qmake.conf         | 34 ++++++++++++++++++++++++++
 package/qt6/qt6base/qplatformdefs.h    |  1 +
 package/qt6/qt6base/qt.conf.in         | 11 +++++++++
 package/qt6/qt6base/qt6base.mk         | 14 +++++++++++
 package/qwt/Config.in                  | 22 +++++++++++------
 package/qwt/qwt.hash                   |  8 +++---
 package/qwt/qwt.mk                     |  6 ++++-
 12 files changed, 131 insertions(+), 24 deletions(-)
 create mode 100644 package/qt6/qt6base/qmake.conf
 create mode 100644 package/qt6/qt6base/qplatformdefs.h
 create mode 100644 package/qt6/qt6base/qt.conf.in

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
