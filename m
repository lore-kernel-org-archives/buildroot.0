Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98A8C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B5A3404DD;
	Wed,  6 Jul 2022 21:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B5A3404DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iT1ApBFfXdz0; Wed,  6 Jul 2022 21:12:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9344740B14;
	Wed,  6 Jul 2022 21:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9344740B14
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F95B1BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA61A8124A
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:12:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA61A8124A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SJ3cbw8MByhG for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:12:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F03FD81002
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:12:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F03FD81002
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 22E0182852; Wed,  6 Jul 2022 20:59:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 Jul 2022 23:12:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 03920e842bc5f8e7387f76ed7058d5c176fa65f3
X-Git-Newrev: 876be2b0f32e9618aede307e78204105d37f3bc5
X-Patchwork-Hint: ignore
Message-Id: <20220706205936.22E0182852@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/keyutils: add
 KEYUTILS_CPE_ID_VENDOR
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=876be2b0f32e9618aede307e78204105d37f3bc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:keyutils_project:keyutils is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Akeyutils_project%3Akeyutils

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/keyutils/keyutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/keyutils/keyutils.mk b/package/keyutils/keyutils.mk
index cba57cf199..5af5c4e92c 100644
--- a/package/keyutils/keyutils.mk
+++ b/package/keyutils/keyutils.mk
@@ -8,6 +8,7 @@ KEYUTILS_VERSION = 1.6.3
 KEYUTILS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git/snapshot
 KEYUTILS_LICENSE = GPL-2.0+, LGPL-2.1+
 KEYUTILS_LICENSE_FILES = LICENCE.GPL LICENCE.LGPL
+KEYUTILS_CPE_ID_VENDOR = keyutils_project
 KEYUTILS_INSTALL_STAGING = YES
 
 KEYUTILS_MAKE_PARAMS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
