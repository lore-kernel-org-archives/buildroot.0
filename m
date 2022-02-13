Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBD9C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2DF04030F;
	Sun, 13 Feb 2022 15:30:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TMI1bqIlcvNc; Sun, 13 Feb 2022 15:30:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29630402F7;
	Sun, 13 Feb 2022 15:30:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1EDB71BF3F2
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D6AC60B91
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cc_f3irtMnUA for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:26:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BC0A60A83
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 15:26:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E14058295E; Sun, 13 Feb 2022 15:18:34 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 16:21:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ecf705d8c65f6dfce189bc49e880ff6cd009882
X-Git-Newrev: 210e6bd55991497c45eb3a6baf9ed0c20a88067c
X-Patchwork-Hint: ignore
Message-Id: <20220213151834.E14058295E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: ignore CVE-2020-746[56]
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=210e6bd55991497c45eb3a6baf9ed0c20a88067c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:mpd_project:mpd:*:*:*:*:*:*:*:* is not a valid CPE
identifier for mpd (musicpd.org); this string refers to
MPD /FreeBSD PPP daemon (sourceforge.net/projects/mpd)

Since mpd does not have entries in the CVE database, put these
two CVE identifiers on the mpd ignore list:

  https://nvd.nist.gov/vuln/detail/CVE-2020-7465
  https://nvd.nist.gov/vuln/detail/CVE-2020-7466

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
