Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7485EC433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:37:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3975761211
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3975761211
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D52B83E03;
	Tue,  5 Oct 2021 19:37:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7F4QW8smrygO; Tue,  5 Oct 2021 19:37:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 726E883E00;
	Tue,  5 Oct 2021 19:37:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 809E71BF334
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DA7760C2E
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:37:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i0MMD0bbabyP for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 19:37:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D70216068B
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 19:37:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9625191216; Tue,  5 Oct 2021 19:34:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 5 Oct 2021 21:29:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0298f405255a99d0988ad042e08ba4eef080932
X-Git-Newrev: f39ae602acb834fffe6cd1d7062f898e55056fb0
X-Patchwork-Hint: ignore
Message-Id: <20211005193450.9625191216@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/atftp: security bump to version
 0.7.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=f39ae602acb834fffe6cd1d7062f898e55056fb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Fix CVE-2021-41054: tftpd_file.c in atftp through 0.7.4 has a buffer
  overflow because buffer-size handling does not properly consider the
  combination of data, OACK, and other options.
- Update hash of license file (license replaced with current version of
  the GPL text:
  https://sourceforge.net/p/atftp/code/ci/bf22ccaef34f5dcdbd48de8b0bea3ef97b9d3545)

https://sourceforge.net/p/atftp/code/ci/v0.7.5/tree/Changelog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
index 3db966c169..70ef4c0fae 100644
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
