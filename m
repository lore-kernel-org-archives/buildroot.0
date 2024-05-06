Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14126C25B4F
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 21:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3387360A84;
	Mon,  6 May 2024 21:27:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AK6T7u3Xyxfj; Mon,  6 May 2024 21:27:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A439260A88
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A439260A88;
	Mon,  6 May 2024 21:27:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A7E5C1BF861
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 21:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9576960A5E
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 21:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kPIroJ0G61k5 for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 21:27:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C25DD60A39
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C25DD60A39
 for <buildroot@buildroot.org>; Mon,  6 May 2024 21:27:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B069686963; Mon,  6 May 2024 21:27:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 May 2024 23:02:09 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 0bbae94e2292bdf83437dbf31efe73bf889eaa53
X-Git-Newrev: 549aaab347586c2f1636a78c4e14185a14e00740
X-Patchwork-Hint: ignore
Message-Id: <20240506212727.B069686963@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/python-pypng: add
 missing python3-zlib dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=549aaab347586c2f1636a78c4e14185a14e00740
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

png.py import zlib [1] so python3-zlib needs to be installed at
runtime.

[1] https://gitlab.com/drj11/pypng/-/blob/pypng-0.20220715.0/code/png.py?ref_type=tags#L185

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6477656971 (TestPythonPy3Qrcode)

Cc: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 15381b57559182693f6d5530544937f8fcf3b471)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pypng/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pypng/Config.in b/package/python-pypng/Config.in
index c1ed405615..952b46c2c5 100644
--- a/package/python-pypng/Config.in
+++ b/package/python-pypng/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYPNG
 	bool "python-pypng"
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  Pure Python library for saving and loading PNG images.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
