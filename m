Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B008C433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 15:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AA6860BE4;
	Sat,  5 Feb 2022 15:01:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ChmvWp8uKjtM; Sat,  5 Feb 2022 15:01:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A0F860B73;
	Sat,  5 Feb 2022 15:01:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 32E151BF33C
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 15:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CC7560AD3
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 15:01:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hjvUA_k6oZFR for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 15:01:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6814360B73
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 15:01:39 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id h6so3703836wrb.9
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 07:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=54pIXy15l9xYYw+PSv6RYSHVzu9reqRRFte4cidIV10=;
 b=PDWA/3Nuf92pu2fcLaF4pJ1AmhRQZeooGV+saezeJ3fsDsTqmXOTtdbS0u02ZlQEaO
 72vGiSsdTqc2Ok+25aze+xFAY8jv6GtobipnPb28gNPtCE366eqIXCc2WYqdD7/5SrEy
 MKfpORB412gJwqdbP7afpxZtI51JMfHwvawSMUU3B1z84jymJnqlvPRzFGCOvER2gn6I
 56REbzU4Ucpz9qsfjL60K7V7JrWVnDTpATU9iL/3Bb47CFUNDWRrlOFAf7EQTnr5v8lQ
 l8y+7yhjtUDvTR7zb5ssvlziDPmoKRbgI4DyWwUHnEnxDlvRPhKPVb3Ab3uHO+3T1RjF
 mL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=54pIXy15l9xYYw+PSv6RYSHVzu9reqRRFte4cidIV10=;
 b=uLCQSNhbFfYq/2NYw/Iz0oHZ94J6FOAjnFMAnS8QNrClR/LrdBliG5ySvXREAb4P1e
 q6YCdzCzZnSAO8ydMy3QMlUGp9wfX82GfazRAf2w5TdUgQRxIwnwE6HA7tc+vvJ4ynhx
 7Ty3LH930geUhMqXQ09GS81FoED2VE/ikV4LcSoNJXVFG0YA8GJTxrku9ZZE6W/0gHKP
 QydL1MevZBa3vCfa/hsKQ9I38+rMDEge5vCbBV4gsrkTAlX41ZJVsiQhqtYEOm9Ig1pT
 NASas4ZN2vEfdixGJdUaHLA58ef61GCF2lkwXYTvG6rkbSP2LEcCKyBez6mH7H9Ctasw
 AALw==
X-Gm-Message-State: AOAM530VFw8VdXsXwVWIpQSInmgxs60qZppSS8TiAk6F0NIbXywlMC6J
 MUbYREWjlVWcHA9M99UFt/dla0d7A3c=
X-Google-Smtp-Source: ABdhPJydfdDLil/3zVZl5cwc4xfg86P7xqe8GNbbJThbRc9TOZ4MXk3fcgGi3gqxwKdU7biXmUk3HA==
X-Received: by 2002:a5d:47cf:: with SMTP id o15mr3280366wrc.577.1644073297528; 
 Sat, 05 Feb 2022 07:01:37 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id 11sm5671081wrb.30.2022.02.05.07.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 07:01:37 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  5 Feb 2022 15:59:30 +0100
Message-Id: <20220205145930.460304-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 1/1] package/vim: security bump to version 8.2.4301
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

Fix CVE-2022-0393: Out-of-bounds Read in GitHub repository vim/vim prior
to 8.2.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix tarball hash

 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 49056b31cd..fa3ca53cc8 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  8770c6308a6c0b0f8b93a4d7202451d195b4efad17787c0306f0be60947732c4  vim-8.2.4224.tar.gz
+sha256  b40b4e341de6b65cdeacd4c816dea8fe5e3b385ee5e17af73fc69c00bd7c440b  vim-8.2.4301.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 sha256  96970b67f9cb38b0e759946cff22562a3c4b11ce78f62f2117d5e7ecded9ab4d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 74ab1ec584..98a5f153a8 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 8.2.4224
+VIM_VERSION = 8.2.4301
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
