Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AF3C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 19:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA55560BF1;
	Sun, 13 Feb 2022 19:33:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cjCSQvmmFUfs; Sun, 13 Feb 2022 19:33:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36B6E605D5;
	Sun, 13 Feb 2022 19:33:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7655E1BF29A
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 19:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70B9240114
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 19:33:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 428dC_uB5bDe for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 19:33:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55A23400AF
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 19:33:42 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id s10so10136492wrb.1
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 11:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w2UqAumnQpPSoJViJZMaPGuuNWOwJtEEmGeqEGUqMA8=;
 b=arGzzvgZASuO0Hz2GP71q4bfTO0mObVL6DyilFp3kpi0jlLBIK3E6QrAEUk9udM1VN
 pvkrw6i+PMBwEVlmNKQD6lUAE33J8QNYT4lWn/cUik92QEOyyDtltVmdzA3BOUS/GwCY
 SjcEqdzsyz7PbdX407Z5Ph4bNVdksOr3Oww3ufiNVBSbHWoZQ8M15FW4MyrEpRkkylVj
 vidMU4j/oq1mh9e8n3podhCgDXK9jbS5QHC/7UlhcZjfxLtg13DoNdAY1uDGMyPaFQr9
 yQUp2PA2k4WK636v6P+ino4BYkQW80kIgUBzyzwQnNJwOjB0yfXVop0qU/CZr1Smykee
 etdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w2UqAumnQpPSoJViJZMaPGuuNWOwJtEEmGeqEGUqMA8=;
 b=x/3Vy3xbNNAorft/fWmh9oa+GCjXkpoUpepv/UKZkWxzxcg/Vo2yFink26Qv5eCsJQ
 90X42RDrusin48tXcfmNa5LApYXBdSq/CKeQENZ6tvYxYrXtcMafUc3HQJxB7nIhjwws
 zR7kMhWIaG9zMe1I+GwYzASKGyQtZdRcXK+IpWOQ1CIg4nxjFQzujkWZPmBln9AZl1NH
 T/R2CQ/J4LqJwcUh13nlr6XQVwsMCLdUBnIaYn04EYKqEiS6yA5AL6/o84MDhPhxNTIW
 TfyeemW3uGl+InH4VYKc05Vw0NaYTrDRS9XrDRkJ1b90jpLC+9rexDN/jhJqdvDRgdDy
 xLNA==
X-Gm-Message-State: AOAM530JYGiqm5eqK7TqXbayfEqaPNSZQPn40MeMZ8/eqckgIibXnRFl
 k+lcmihx6JXUxURVVoLoZc4nZluBmC4=
X-Google-Smtp-Source: ABdhPJyO4F6Be226VnWydSNnzTrVnuHc0lnIyIY2xo49mtSTBXOcxDz+MlscbYiydozOPrYaeryOBA==
X-Received: by 2002:a05:6000:2c5:: with SMTP id
 o5mr8576132wry.130.1644780820250; 
 Sun, 13 Feb 2022 11:33:40 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id b2sm1447070wri.35.2022.02.13.11.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 11:33:39 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 20:33:36 +0100
Message-Id: <20220213193336.1102940-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/bpftool: needs headers >= 4.12
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

NETLINK_EXT_ACK is only available since kernel 4.12 and
https://github.com/torvalds/linux/commit/2d4bc93368f5a0ddb57c8c885cdad9c9b7a10ed5
resulting in the following build failure since addition of the package
in commit 3675131e6c654d7536a184db0184fde7a97040e0:

net.c: In function 'netlink_open':
net.c:110:36: error: 'NETLINK_EXT_ACK' undeclared (first use in this function); did you mean 'NETLINK_CAP_ACK'?
  110 |  if (setsockopt(sock, SOL_NETLINK, NETLINK_EXT_ACK,
      |                                    ^~~~~~~~~~~~~~~
      |                                    NETLINK_CAP_ACK

Fixes:
 - http://autobuild.buildroot.org/results/c61678e56bd73609838747048f27068818c21150

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bpftool/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/bpftool/Config.in b/package/bpftool/Config.in
index 39475aa962..e81d874343 100644
--- a/package/bpftool/Config.in
+++ b/package/bpftool/Config.in
@@ -5,14 +5,16 @@ config BR2_PACKAGE_BPFTOOL
 	depends on !BR2_STATIC_LIBS # elfutils
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
 	select BR2_PACKAGE_BINUTILS
 	select BR2_PACKAGE_ELFUTILS
 	help
 	  bpftool is a tool for for inspection and simple manipulation
 	  of eBPF programs and maps.
 
-comment "bpftool needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads"
+comment "bpftool needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads, headers >= 4.12"
 	depends on !BR2_nios2
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
+		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC) \
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
