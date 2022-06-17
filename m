Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0CDC43334
	for <buildroot@archiver.kernel.org>; Fri, 17 Jun 2022 21:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DED8660C02;
	Fri, 17 Jun 2022 21:17:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DED8660C02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r-2Xg2a09jWY; Fri, 17 Jun 2022 21:17:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F25BD60B95;
	Fri, 17 Jun 2022 21:17:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F25BD60B95
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6DB621C1189
 for <buildroot@lists.busybox.net>; Fri, 17 Jun 2022 21:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44E7360E4C
 for <buildroot@lists.busybox.net>; Fri, 17 Jun 2022 21:16:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44E7360E4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uT3qKQLG0zkg for <buildroot@lists.busybox.net>;
 Fri, 17 Jun 2022 21:16:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7732560B75
 for <buildroot@buildroot.org>; Fri, 17 Jun 2022 21:16:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7732560B75
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 50C4987122; Fri, 17 Jun 2022 21:04:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 17 Jun 2022 17:04:37 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 55b14a596e580ec5092c6c3951e5a91f4ad1f343
X-Git-Newrev: 4e48f444df0bef531e25f3ff217d75289703f31b
X-Patchwork-Hint: ignore
Message-Id: <20220617210441.50C4987122@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 package/qt5/qt5webengine-chromium: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e48f444df0bef531e25f3ff217d75289703f31b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

We need to add a separate package for the chromium submodule so that
we can apply patches for python3 support to it and replace catapult
with a python3 compatible version.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 577d886886218f4c085e812a9a332b97dd3bf12c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/Config.in                              |    1 +
 .../0001-Add-python3-build-support.patch           | 1858 ++++++++++++++++++++
 .../0002-Don-t-rebase-sysroot-path.patch           |   32 +
 package/qt5/qt5webengine-chromium/Config.in        |    5 +
 .../qt5/qt5webengine-chromium/chromium-latest.inc  | 1257 +++++++++++++
 .../qt5webengine-chromium.hash                     | 1256 +++++++++++++
 .../qt5webengine-chromium/qt5webengine-chromium.mk |   23 +
 7 files changed, 4432 insertions(+)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
