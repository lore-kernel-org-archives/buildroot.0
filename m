Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308DEC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 12:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF16F40877;
	Sun,  9 Jan 2022 12:56:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LbC9JELj4kZW; Sun,  9 Jan 2022 12:56:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A6404088C;
	Sun,  9 Jan 2022 12:56:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5261C1BF417
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 12:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D467400E9
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 12:56:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ytNgbf0ii9uO for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 12:56:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 395EF4051F
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 12:56:07 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id s1so21525579wra.6
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 04:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qm1oJ5Y7REosSFdzHSCbviNliBrHw0C2EirdaxD7yaA=;
 b=dqKMg1rJ75l/K7z9xkmK6oN64oMa25Zuls0vh5MAINNn8YUsIMwtpDwXHV922s32f9
 +QNMnzDnlzXB3AFZg8LO4ouWOjpI5FQVrslNDNIVg/ls5MgkpFVh2hh5mV//3bD46pBb
 LxZByjXRykC0vMwmVGri7r4x1mNKry2ONXs0lRxv0vCQj8TY2ketbyAZaquOWyVExFUP
 2TCZqLqExQQqYYEsXAYCU+Ht+m4zokQ91Yx/VDHJcCcMPyjduR8mS0EUPD5DYkEoejiF
 rpgntY3R/pvHaQgkKFYzZecJS4VtXuv2p9VBUz42ZipO8fBueJY4zK1Jpz6JmQdiO8XQ
 AiDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qm1oJ5Y7REosSFdzHSCbviNliBrHw0C2EirdaxD7yaA=;
 b=FgN+C19gnNuLAgXNI3JXBcRcGp1RseiCxlu5Xzi26RwV2XfLDTRCkGbTLPz2R0FUBo
 0T/as5YB6kFJu95ViapKpA4fSKPvOYu4CUQHiDPqrBzb3Y1Di0YT+t9mLrE/mCola80O
 ZoXxF+5uFlAbVgtVjo0roTMTwloir9lkqJqjzSFn5x9AvHjIhOcZHFgnRa7aPir0zBcH
 iQQ0ic9c+ocN2syaju+0BU0kg8rcMi+vFgxwMIUh8GmBhxnRLqQ/OVLNzPMBvxxbaecE
 4W3NwXoUTF6iHmg3qEopSBxMvWrItgFQNSBXgavAUTPkETlZN6ZsjlSuxNgGr9PZ7X7k
 Ps3w==
X-Gm-Message-State: AOAM532pEsjGwfbPXJ8n8BDteU+M95RIq7XsFUvn5Pcgw1y/Xcb9XDwb
 Tq0yr4I5/x3ydl3x80EAXev1GqGz8A4=
X-Google-Smtp-Source: ABdhPJybZFeBH+4xrrnfcoX6k/N0izae0/66Iaj8LYXhET0VrrGvDZGkTXojIuv3h2OlNtxdFxbUCA==
X-Received: by 2002:a5d:5451:: with SMTP id w17mr10109936wrv.3.1641732965344; 
 Sun, 09 Jan 2022 04:56:05 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id l7sm4036846wms.1.2022.01.09.04.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 04:56:05 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 13:54:56 +0100
Message-Id: <20220109125456.316484-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gnuchess: security bump to version
 6.2.9
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

Fixed potential buffer overflow in pgnload and pgnreplay
(CVE-2021-30184)

https://lists.gnu.org/archive/html/info-gnu-chess/2021-07/msg00000.html
https://git.savannah.gnu.org/cgit/chess.git/tree/NEWS?h=v6.2.9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gnuchess/gnuchess.hash | 2 +-
 package/gnuchess/gnuchess.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnuchess/gnuchess.hash b/package/gnuchess/gnuchess.hash
index b68eb6e0ee..0248abcf71 100644
--- a/package/gnuchess/gnuchess.hash
+++ b/package/gnuchess/gnuchess.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  d50446cda8012240321da39cddbb4df4d08458a8d538a4738882814139583847  gnuchess-6.2.8.tar.gz
+sha256  ddfcc20bdd756900a9ab6c42c7daf90a2893bf7f19ce347420ce36baebc41890  gnuchess-6.2.9.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gnuchess/gnuchess.mk b/package/gnuchess/gnuchess.mk
index 29d3590849..630b3aefa7 100644
--- a/package/gnuchess/gnuchess.mk
+++ b/package/gnuchess/gnuchess.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUCHESS_VERSION = 6.2.8
+GNUCHESS_VERSION = 6.2.9
 GNUCHESS_SITE = $(BR2_GNU_MIRROR)/chess
 GNUCHESS_LICENSE = GPL-3.0+
 GNUCHESS_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
