Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC08C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 10:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9430580F01;
	Sat, 17 May 2025 10:42:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9DPqr3DzY0sX; Sat, 17 May 2025 10:42:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE4A680F2F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE4A680F2F;
	Sat, 17 May 2025 10:42:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 370931DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 897A660662
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:42:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0tAWRIaNfhXe for <buildroot@buildroot.org>;
 Sat, 17 May 2025 10:42:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 706C060D68
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 706C060D68
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:42:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28E3286EDF; Sat, 17 May 2025 10:42:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 12:41:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 317260f336b65ff0b41a953882cb8cccb789e010
X-Git-Newrev: 9d4b7116cf3ffa2a143c17491b2bbfcce1939206
X-Patchwork-Hint: ignore
Message-Id: <20250517104203.28E3286EDF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: update CPE/CVE information
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9d4b7116cf3ffa2a143c17491b2bbfcce1939206
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since 01/2023, MPD has an entry in the NIST database [1].

Add vendor amd product IDs [2] to mpd.mk and remove the now
obsolete IGNORE_CVES entry.

[1] https://nvd.nist.gov/vuln/detail/CVE-2022-46449
[2] https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=musicpd

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
