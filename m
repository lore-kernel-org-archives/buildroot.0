Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07195C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 22:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B137A82BE5;
	Mon, 27 Jun 2022 22:42:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B137A82BE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RmrHAVxTHu7P; Mon, 27 Jun 2022 22:42:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3C2E82BFD;
	Mon, 27 Jun 2022 22:42:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3C2E82BFD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B56A51BF2F0
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E71484155F
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E71484155F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L1gK9ziq0y3C for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 22:40:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0AE2415A8
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 22:40:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0AE2415A8
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 77282876FD; Mon, 27 Jun 2022 22:28:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 00:34:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc66cf922b0481b66011b171db7985a27c79c381
X-Git-Newrev: a143c012ef1fb21fb1d2761e9cd172285f1b5131
X-Patchwork-Hint: ignore
Message-Id: <20220627222807.77282876FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: replace
 SYSTEMD_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=a143c012ef1fb21fb1d2761e9cd172285f1b5131
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

freedesktop has been replaced by systemd_project since January 2022:

<cpe-item name="cpe:/a:freedesktop:systemd:247:rc1" deprecated="true" deprecation_date="2022-01-28T19:09:42.747Z">
    <title xml:lang="en-US">freedesktop systemd 247 Release Candidate 1</title>
      <reference href="https://github.com/systemd/systemd/releases">Change Log</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:freedesktop:systemd:247:rc1:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:systemd_project:systemd:247:rc1:*:*:*:*:*:*" type="NAME_CORRECTION"/>

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asystemd_project%3Asystemd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b309507e12..46a4e8de2c 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -44,7 +44,7 @@ SYSTEMD_LICENSE_FILES = \
 	LICENSES/murmurhash2-public-domain.txt \
 	LICENSES/OFL-1.1.txt \
 	LICENSES/README.md
-SYSTEMD_CPE_ID_VENDOR = freedesktop
+SYSTEMD_CPE_ID_VENDOR = systemd_project
 SYSTEMD_INSTALL_STAGING = YES
 SYSTEMD_DEPENDENCIES = \
 	$(BR2_COREUTILS_HOST_DEPENDENCY) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
