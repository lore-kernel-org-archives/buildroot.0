Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA52C433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 20:35:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E38060F4A
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 20:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E38060F4A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35061406AC;
	Thu,  7 Oct 2021 20:35:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qf9uX-JCIuTB; Thu,  7 Oct 2021 20:35:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04DE140676;
	Thu,  7 Oct 2021 20:35:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7AFF51BF84C
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 20:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77344605C1
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 20:35:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sIhtVi27MHA5 for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 20:35:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38A9660606
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 20:35:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 401EF934FC; Thu,  7 Oct 2021 20:32:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 7 Oct 2021 22:34:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 24d608d27bd9ca656ef911ff791cd976bffffebb
X-Git-Newrev: c424eb25ca22d2b455eaf48580ba0484e3cf2fca
X-Patchwork-Hint: ignore
Message-Id: <20211007203248.401EF934FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-oauthlib: depend on python3
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

commit: https://git.buildroot.net/buildroot/commit/?id=c424eb25ca22d2b455eaf48580ba0484e3cf2fca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to the package release notes
(https://github.com/oauthlib/oauthlib/releases/tag/v3.1.1),
python2 isn't supported anymore.

All the reverse dependencies are already python3-only.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-oauthlib/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-oauthlib/Config.in b/package/python-oauthlib/Config.in
index 65016c1d08..0084e7cbd9 100644
--- a/package/python-oauthlib/Config.in
+++ b/package/python-oauthlib/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_OAUTHLIB
 	bool "python-oauthlib"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  A generic, spec-compliant, thorough implementation of the
 	  OAuth request-signing logic.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
