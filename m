Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55550C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 20:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 086F34052B;
	Sun, 27 Feb 2022 20:05:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RiUYo8v_9IgT; Sun, 27 Feb 2022 20:05:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7322402C3;
	Sun, 27 Feb 2022 20:05:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB1741BF97C
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 20:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9856813FE
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 20:04:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LnaNqX7FxFT5 for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 20:04:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FFB2813EA
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 20:04:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B49B7811CF; Sun, 27 Feb 2022 19:56:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 27 Feb 2022 21:01:28 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 0cc9eed5d452fe1f083203447d7869ecf8d9f927
X-Git-Newrev: 8ab26921c23da19f38a7f1e40a7e758546b5e58b
X-Patchwork-Hint: ignore
Message-Id: <20220227195643.B49B7811CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/mpd: ignore
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ab26921c23da19f38a7f1e40a7e758546b5e58b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

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
index e105352b80..0902c02809 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -11,6 +11,8 @@ MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost
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
