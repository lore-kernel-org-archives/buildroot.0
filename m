Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B08C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:29:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12BF360FDC
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:29:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 12BF360FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D21A2402CB;
	Wed,  6 Oct 2021 15:29:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3uzzvJ6mVu0S; Wed,  6 Oct 2021 15:29:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06C46402B7;
	Wed,  6 Oct 2021 15:29:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 58FAC1BF947
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46E3160E90
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:28:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4qobJPUBZAAE for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 15:28:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52BC860E7A
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 15:28:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 297A192395; Wed,  6 Oct 2021 15:26:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 17:28:01 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 03952dfb735b17ef712cf7ce377f0bb563779d43
X-Git-Newrev: 1f56d6fc7377ddf1b00fceaf0bd8108f3a8a0f0f
X-Patchwork-Hint: ignore
Message-Id: <20211006152600.297A192395@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/atftp: security
 bump to version 0.7.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=1f56d6fc7377ddf1b00fceaf0bd8108f3a8a0f0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

- Fix CVE-2021-41054: tftpd_file.c in atftp through 0.7.4 has a buffer
  overflow because buffer-size handling does not properly consider the
  combination of data, OACK, and other options.
- Update hash of license file (license replaced with current version of
  the GPL text:
  https://sourceforge.net/p/atftp/code/ci/bf22ccaef34f5dcdbd48de8b0bea3ef97b9d3545)

https://sourceforge.net/p/atftp/code/ci/v0.7.5/tree/Changelog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit f39ae602acb834fffe6cd1d7062f898e55056fb0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/atftp/atftp.hash | 4 ++--
 package/atftp/atftp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/atftp/atftp.hash b/package/atftp/atftp.hash
index 158e9e3b33..6b0d9a5879 100644
--- a/package/atftp/atftp.hash
+++ b/package/atftp/atftp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d3c9cd0d971dfc786d7a5f4055c35d4e66aafc8102ac03473ef225bdf7edb26a  atftp-0.7.4.tar.gz
-sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  LICENSE
+sha256  93c87a4fb18218414e008e01c995dadd231ba4c752d0f894b34416d1e6d3038a  atftp-0.7.5.tar.gz
+sha256  86dc744860e6dfacfeba2f33fea908db03fe67c7e37a878285b7aae8e4596735  LICENSE
diff --git a/package/atftp/atftp.mk b/package/atftp/atftp.mk
index a2df4af056..96eaeda6cf 100644
--- a/package/atftp/atftp.mk
+++ b/package/atftp/atftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATFTP_VERSION = 0.7.4
+ATFTP_VERSION = 0.7.5
 ATFTP_SITE = http://sourceforge.net/projects/atftp/files
 ATFTP_LICENSE = GPL-2.0+
 ATFTP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
