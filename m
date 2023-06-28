Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC34EB64D7
	for <buildroot@archiver.kernel.org>; Wed, 28 Jun 2023 17:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82BE6405F1;
	Wed, 28 Jun 2023 17:54:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82BE6405F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BspoyrlDpOKH; Wed, 28 Jun 2023 17:54:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3F154185C;
	Wed, 28 Jun 2023 17:54:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3F154185C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 385091BF2F5
 for <buildroot@lists.busybox.net>; Wed, 28 Jun 2023 17:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F3A74185F
 for <buildroot@lists.busybox.net>; Wed, 28 Jun 2023 17:54:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F3A74185F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id snK7lgdLnolu for <buildroot@lists.busybox.net>;
 Wed, 28 Jun 2023 17:54:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9677405F1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B9677405F1
 for <buildroot@buildroot.org>; Wed, 28 Jun 2023 17:54:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BF662A4C04F7
 for <buildroot@buildroot.org>; Wed, 28 Jun 2023 19:54:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48488)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qEZMf-0002Xv-1f
 for buildroot@buildroot.org; Wed, 28 Jun 2023 19:54:01 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Jun 2023 19:54:01 +0200
Message-Id: <20230628175401.3397394-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687974841;
 bh=j1ppJlxEXrGTVB4aqStcb7VQgB3vVn4e1bVhlqfYElk=;
 h=From:To:Subject:Date:From;
 b=jrUzpqROMMfS8tIzMtCodm1yKuPywVEqBO5iuXqXv01kiCOqODIrXZdioFJm1E3e8
 gLkqeeKp4JJdtjewlUH8I7HK4P9w5cHC7J+W8/FDMB9iplBtWGWga7YisXug/DEw+j
 8/5PHElXi4SLJe8cgYxEegXMiOKRWie4G0ax/pBVB8gTSSNrhyBERop24MOA3SPpbF
 08jvadLivmjoeHntqdRWR78/prcMiLbzk/denqd5S88FPq9qdG3yClIfUoai+idhWT
 9qO/P+cTHg9sWD0ifTbQ8JhYtWBZPuVKlwjRz0US4y/QhAR6d17BBcxritX8SB52uS
 JCCKILqXCIyfQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=jrUzpqRO
Subject: [Buildroot] [PATCH 1/1] package/samba4: add optional dependency to
 libunwind
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

Upstream added configure options for libunwind in commit
https://github.com/samba-team/samba/commit/14feb93d481011765f62614ab49b304e17e4f6fd

Fixes:
http://autobuild.buildroot.net/results/63c/63c469106e9daa198f77d8da7a5bb123edcce0f7/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/samba4/samba4.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 2799dbe2f7..4489c28d2b 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -93,6 +93,13 @@ else
 SAMBA4_CONF_OPTS += --without-libarchive
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
+SAMBA4_CONF_OPTS += --with-libunwind
+SAMBA4_DEPENDENCIES += libunwind
+else
+SAMBA4_CONF_OPTS += --without-libunwind
+endif
+
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 SAMBA4_CONF_ENV += NCURSES_CONFIG="$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)"
 SAMBA4_DEPENDENCIES += ncurses
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
