Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72ACC433EF
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 09:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F73A6060A;
	Thu,  3 Feb 2022 09:48:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HXobSZAq6FUN; Thu,  3 Feb 2022 09:48:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DAA760F82;
	Thu,  3 Feb 2022 09:48:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BC6CD1BF303
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 09:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7B6240119
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 09:48:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8MsObl9K-3IQ for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 09:48:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CCDC409A3
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 09:48:16 +0000 (UTC)
Received: from iago.. (ip5f5be916.dynamic.kabel-deutschland.de [95.91.233.22])
 by serv15.avernis.de (Postfix) with ESMTPSA id 9EB2FC1E1643;
 Thu,  3 Feb 2022 10:48:14 +0100 (CET)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Date: Thu,  3 Feb 2022 10:47:46 +0100
Message-Id: <20220203094746.22715-1-br015@umbiko.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] [PATCH 1/1] package/mpd: ignore CVE-2020-746[56]
 intended for FreeBSD PPP daemon
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
Cc: Andreas Ziegler <br015@umbiko.net>,
 =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:mpd_project:mpd:*:*:*:*:*:*:*:* is not a valid CPE 
identifier for mpd (musicpd.org); this string refers to 
MPD /FreeBSD PPP daemon (sourceforge.net/projects/mpd)

Since mpd does not have entries in the CVE database, put these 
two CVE identifiers on the mpd ignore list:

  https://nvd.nist.gov/vuln/detail/CVE-2020-7465
  https://nvd.nist.gov/vuln/detail/CVE-2020-7466

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
---
 package/mpd/mpd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 6f01b29c6d..a55e4adde2 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -11,6 +11,8 @@ MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost fmt
 MPD_LICENSE = GPL-2.0+
 MPD_LICENSE_FILES = COPYING
+# these refer to the FreeBSD PPP daemon
+MPD_IGNORE_CVES = CVE-2020-7465 CVE-2020-7466
 MPD_SELINUX_MODULES = mpd
 MPD_CONF_OPTS = \
 	-Daudiofile=disabled \
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
