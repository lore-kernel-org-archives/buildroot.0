Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64745C433F5
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 01:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17D21606BA;
	Thu,  2 Dec 2021 01:39:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ErbiqA5-xYVS; Thu,  2 Dec 2021 01:39:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7250A605EF;
	Thu,  2 Dec 2021 01:39:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 233261BF5DB
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 01:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2056C60602
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 01:39:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KZQBPQ1OHgCP for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 01:39:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C97E605E3
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 01:39:11 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id bi37so67568447lfb.5
 for <buildroot@buildroot.org>; Wed, 01 Dec 2021 17:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KW2EvWofimgfUP6nLHLvpuPKY7SoefwkD6ifUqwRuTk=;
 b=aGkq+JNnc9a5aRPbRV46JO1Pv+7lNj1r2GPZhQCVhCo8X3AfjWVIPvx4YYr3tdiqRY
 qmPj3ObXizStx8mZUZLc6H+ICJ/LC3LmT6XrXvDN6Sgi3lHs9tcyHhtyQsoLGdOznA3B
 4pghAFFLhPlgEF7oSQ1EBWF2QuEBG1f51OXD7wMWyDIt7vfNdPOTJvI8kaYBPtxmJuut
 jyHL1ZHhNBrA89A3xB1DaU2sBqFsCS8+H5cgArm85eHEv81gt2fBsXnnIP7tcQg4OCpU
 8WUPOvzz/4jmysB0MccmMnz1VKBLkaQcYpgaSdzh9bYy9J2VaoiGgetuYskEDZSuHTPE
 IWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KW2EvWofimgfUP6nLHLvpuPKY7SoefwkD6ifUqwRuTk=;
 b=A+EKA3uvRfGOdUxi/HR3xDwYpTV0Vs4zDjoADEFQfgdFsQKfTRz5LXPeF1TQIHkjHf
 0L+OhY4HAXtrLO3G/GMj2Rn9gAzBBmrbL3PvFD2YpQywxA9r+M8PUTQJ8y8lzhRlXTCa
 kiKSFTk/oxdkThQCGJu7YlgVRZCrTTMP4XgoMmk6Tz9i45+Tl1+2iHoludWhYwp9PyhH
 iMB+oQ2QgvJ3CvgJC5c8ddxeTvaYxUGqQ5lxoFRY8Zm3DR0ABjOEcBqm0cHl0kq1o+62
 u+anq0ps7EzEeYJIbdQ5Jet+7O6DKTU1STdVdswi3lkxnjs0CDnc0qJvqyi2FA2DrXhF
 XtHQ==
X-Gm-Message-State: AOAM532L6cRJAB2kVA2Cjr1CLE0HNniJ7W0zdWF/6EkYf2C3yw5tDM3U
 u2foAmFabcggk9xWXLFoOWhCTv+EjFg=
X-Google-Smtp-Source: ABdhPJy//7lWQ+n5WWzAFqPPcIMWzNVit5MQRzeJVh4tvOzFp8Fl4qGI5URutN4Di/vpSwUSzV4M0g==
X-Received: by 2002:a19:750f:: with SMTP id y15mr9521220lfe.258.1638409148908; 
 Wed, 01 Dec 2021 17:39:08 -0800 (PST)
Received: from localhost.localdomain ([176.10.248.198])
 by smtp.gmail.com with ESMTPSA id b13sm176939lfv.200.2021.12.01.17.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 17:39:08 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  2 Dec 2021 02:39:02 +0100
Message-Id: <20211202013902.1593562-3-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211202013902.1593562-1-troglobit@gmail.com>
References: <20211202013902.1593562-1-troglobit@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH next 2/2] package/libite: bump to version 2.5.1
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump is mainly to fix the header file nameclash problem with LiTE,
in package/lite.  See the libite project's README for how to adapt to
this change, and the ChangeLog for details.  In short, libite now use
the /usr/include/libite/*.h prefix.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/libite/libite.hash | 2 +-
 package/libite/libite.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libite/libite.hash b/package/libite/libite.hash
index 6f461f9b76..1dec65bd6b 100644
--- a/package/libite/libite.hash
+++ b/package/libite/libite.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  8fad6b8a1e7e0d6b546863104dfe25dfe0bb2d2a9b98ec8e155d23392ef58514  libite-2.4.1.tar.xz
+sha256  5278fa0ca933727c78f4e05082cea58256d9302afac30bad0c3760cf2a18ef8f  libite-2.5.1.tar.xz
 
 # Locally calculated
 sha256  20db0601195f708d68ff7907907b3cd3b25808efa8332e064b11f00c839a5d2f  LICENSE
diff --git a/package/libite/libite.mk b/package/libite/libite.mk
index 7ccf642e50..185ffe77de 100644
--- a/package/libite/libite.mk
+++ b/package/libite/libite.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-LIBITE_VERSION = 2.4.1
+LIBITE_VERSION = 2.5.1
 LIBITE_SOURCE = libite-$(LIBITE_VERSION).tar.xz
 LIBITE_SITE = https://github.com/troglobit/libite/releases/download/v$(LIBITE_VERSION)
 LIBITE_LICENSE = MIT, X11, ISC, BSD-2-Clause
 LIBITE_LICENSE_FILES = LICENSE src/chomp.c src/pidfile.c
 LIBITE_INSTALL_STAGING = YES
+LIBITE_CONF_OPTS = --without-symlink
 
 $(eval $(autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
