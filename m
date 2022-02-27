Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB728C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 20:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C3C4606CB;
	Sun, 27 Feb 2022 20:05:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4B-cftQ8mvbf; Sun, 27 Feb 2022 20:05:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98608605BA;
	Sun, 27 Feb 2022 20:05:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9E7931BF2AA
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 20:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94AA040533
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 20:04:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZkS6EHwPRUsf for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 20:04:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99D474054B
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 20:04:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2A36982B3F; Sun, 27 Feb 2022 19:56:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 27 Feb 2022 21:02:09 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 358b9a9a0b5900ee2e76dbecb2937cd5b04eea12
X-Git-Newrev: 1eb88d25b1ee3ca890da9965fa15ec4e473144cf
X-Patchwork-Hint: ignore
Message-Id: <20220227195637.2A36982B3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/mpd: ignore
 CVE-2020-746[56] intended for FreeBSD PPP daemon
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

commit: https://git.buildroot.net/buildroot/commit/?id=1eb88d25b1ee3ca890da9965fa15ec4e473144cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:mpd_project:mpd:*:*:*:*:*:*:*:* is not a valid CPE
identifier for mpd (musicpd.org); this string refers to
MPD /FreeBSD PPP daemon (sourceforge.net/projects/mpd)

Since mpd does not have entries in the CVE database, put these
two CVE identifiers on the mpd ignore list:

  https://nvd.nist.gov/vuln/detail/CVE-2020-7465
  https://nvd.nist.gov/vuln/detail/CVE-2020-7466

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 210e6bd55991497c45eb3a6baf9ed0c20a88067c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/mpd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 06dc7e15d7..05aa7153b5 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -11,6 +11,8 @@ MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost
 MPD_LICENSE = GPL-2.0+
 MPD_LICENSE_FILES = COPYING
+# these refer to the FreeBSD PPP daemon
+MPD_IGNORE_CVES = CVE-2020-7465 CVE-2020-7466
 MPD_CONF_OPTS = \
 	-Daudiofile=disabled \
 	-Ddocumentation=disabled
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
