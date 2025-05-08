Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C273FC3ABC0
	for <buildroot@archiver.kernel.org>; Thu,  8 May 2025 12:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7613160F61;
	Thu,  8 May 2025 12:32:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GSPK2wiezULT; Thu,  8 May 2025 12:32:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DD4F60F0A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DD4F60F0A;
	Thu,  8 May 2025 12:32:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E12715A
 for <buildroot@buildroot.org>; Thu,  8 May 2025 12:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 144FE40D81
 for <buildroot@buildroot.org>; Thu,  8 May 2025 12:32:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OudwpmdH1lIL for <buildroot@buildroot.org>;
 Thu,  8 May 2025 12:32:30 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B7C8B4026F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7C8B4026F
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B7C8B4026F
 for <buildroot@buildroot.org>; Thu,  8 May 2025 12:32:28 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 5A9E2BDF0168;
 Thu,  8 May 2025 14:32:25 +0200 (CEST)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br015@umbiko.net>
Date: Thu,  8 May 2025 14:32:05 +0200
Message-ID: <20250508123205.1559-1-br015@umbiko.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.7 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1746707545; bh=ER7qtQos8l04XwlN5Z+lPdBv7iQJ44HSHtG/qm32RVQ=;
 h=From:To:Cc:Subject:Date;
 b=ZFmfh5ATIxLR8URhlUA6BlDJDe+1+A7BKTNtHan6U//ea4I4FPr3DEo2vzp1ZXeEw
 bbJyuW/tl2vjAyRdj1CIl7BRftYp+r8Jtk+fnRWS/ZhsRxM//At6Yl2tcaegtsfQ+h
 vfKAb4ObGESI4N6W+76awxh6uXHY1cSLWnoVoYZw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=ZFmfh5AT
Subject: [Buildroot] [PATCH 1/1] package/mpd: update CPE/CVE information
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since 01/2023, MPD has an entry in the NIST database [1]. 

Add vendor amd product IDs [2] to mpd.mk and remove the now
obsolete IGNORE_CVES entry. 

[1] https://nvd.nist.gov/vuln/detail/CVE-2022-46449
[2] https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=musicpd

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
---
 package/mpd/mpd.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 6cae2845e3..35632f97b4 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -11,8 +11,10 @@ MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf fmt
 MPD_LICENSE = GPL-2.0+
 MPD_LICENSE_FILES = COPYING
-# these refer to the FreeBSD PPP daemon
-MPD_IGNORE_CVES = CVE-2020-7465 CVE-2020-7466
+
+MPD_CPE_ID_VENDOR = musicpd
+MPD_CPE_ID_PRODUCT = music_player_demon
+
 MPD_SELINUX_MODULES = mpd
 MPD_CONF_OPTS = \
 	-Daudiofile=disabled \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
