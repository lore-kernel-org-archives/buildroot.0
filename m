Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522CCC47077
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 22:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBA7D415ED;
	Sun, 14 Jan 2024 22:24:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBA7D415ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AoPKsbUUVHON; Sun, 14 Jan 2024 22:24:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29DE8415E1;
	Sun, 14 Jan 2024 22:24:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29DE8415E1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B357F1BF45A
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 22:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99682415E1
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 22:24:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99682415E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fkb72KQEQysb for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 22:24:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90C5B415DC
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 22:24:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90C5B415DC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D99B8618C; Sun, 14 Jan 2024 22:24:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 14 Jan 2024 23:24:27 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 75846d63725e1c098511826524b5b33d4772b7f3
X-Git-Newrev: f353b6fd5ddbd3a8ce1aa886d6d4edb1295a4e9b
X-Patchwork-Hint: ignore
Message-Id: <20240114222438.7D99B8618C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/micropython: add
 MICROPYTHON_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=f353b6fd5ddbd3a8ce1aa886d6d4edb1295a4e9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

cpe:2.3:a:micropython:micropython is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/853A709B-B8CB-4E8C-BF5E-6621C3A1D994

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 30d5d1a2295dceacb9dd4db1b4c6aa5a7e11b9e3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/micropython/micropython.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 3d356c51d8..6e0af59f06 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -13,6 +13,7 @@ MICROPYTHON_SOURCE = micropython-$(MICROPYTHON_VERSION).tar.xz
 MICROPYTHON_LICENSE = MIT, BSD-1-Clause, BSD-3-Clause, Zlib
 MICROPYTHON_LICENSE_FILES = LICENSE
 MICROPYTHON_DEPENDENCIES = host-pkgconf libffi host-python3
+MICROPYTHON_CPE_ID_VENDOR = micropython
 
 # Use fallback implementation for exception handling on architectures that don't
 # have explicit support.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
