Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500C0C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 19:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 102EB41A32;
	Tue, 17 May 2022 19:56:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AXCEXEG32HQa; Tue, 17 May 2022 19:56:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E199A41A1D;
	Tue, 17 May 2022 19:56:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C1E91BF403
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 19:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08FF383F32
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 19:56:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xW49qUKm4AQo for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 19:56:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 667F283F0B
 for <buildroot@buildroot.org>; Tue, 17 May 2022 19:56:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 45D5485F19; Tue, 17 May 2022 19:45:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 21:55:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dbaee8e4564392a6ad24807a0f0136a32c80ec9c
X-Git-Newrev: 577d886886218f4c085e812a9a332b97dd3bf12c
X-Patchwork-Hint: ignore
Message-Id: <20220517194505.45D5485F19@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5webengine-chromium: new
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=577d886886218f4c085e812a9a332b97dd3bf12c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to add a separate package for the chromium submodule so that
we can apply patches for python3 support to it and replace catapult
with a python3 compatible version.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
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
