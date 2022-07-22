Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D31C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 07:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D78B409FA;
	Fri, 22 Jul 2022 07:09:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D78B409FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id doyCm7cOg1ig; Fri, 22 Jul 2022 07:09:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04E6540A09;
	Fri, 22 Jul 2022 07:09:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04E6540A09
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B410C1BF36D
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CE2F416E2
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CE2F416E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ly1VnEhgSJqH for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 07:08:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 933A6416C7
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 07:08:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 933A6416C7
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8326E8414F; Fri, 22 Jul 2022 06:55:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 09:08:46 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: eaf50b2e6096820a2a34f04fdd8ac6ea89921063
X-Git-Newrev: 08726993d1709f050f42f46168963b2a054484b3
X-Patchwork-Hint: ignore
Message-Id: <20220722065519.8326E8414F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/systemd: replace
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

commit: https://git.buildroot.net/buildroot/commit/?id=08726993d1709f050f42f46168963b2a054484b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

freedesktop has been replaced by systemd_project since January 2022:

<cpe-item name="cpe:/a:freedesktop:systemd:247:rc1" deprecated="true" deprecation_date="2022-01-28T19:09:42.747Z">
    <title xml:lang="en-US">freedesktop systemd 247 Release Candidate 1</title>
      <reference href="https://github.com/systemd/systemd/releases">Change Log</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:freedesktop:systemd:247:rc1:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:systemd_project:systemd:247:rc1:*:*:*:*:*:*" type="NAME_CORRECTION"/>

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asystemd_project%3Asystemd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a143c012ef1fb21fb1d2761e9cd172285f1b5131)
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
