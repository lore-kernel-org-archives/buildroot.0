Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BF5EEAA62
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 19:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F358401B7;
	Thu, 14 Sep 2023 19:18:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F358401B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Um3XSYS4MjgG; Thu, 14 Sep 2023 19:18:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06B4B41FF0;
	Thu, 14 Sep 2023 19:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06B4B41FF0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D5C01BF995
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 19:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 803D16128E
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 19:18:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 803D16128E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9pigyd5_q8xI for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 19:18:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CC076129D
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 19:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CC076129D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B18F86F86; Thu, 14 Sep 2023 19:18:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 21:02:55 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 999cf19465a7189e5c328b5718a5dd627ca99d9d
X-Git-Newrev: 73554da86f840a8d6905412c2e94c7d49b7d97aa
X-Patchwork-Hint: ignore
Message-Id: <20230914191810.2B18F86F86@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/erlang: support
 building on aarch64
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

commit: https://git.buildroot.net/buildroot/commit/?id=73554da86f840a8d6905412c2e94c7d49b7d97aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Erlang has good support for aarch64 hosts, and this allows it to be
built without a warning.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 54b6eced24326ce02328d64d415753a5c0c79e00)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/erlang/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 8f9700bf5c..d3fe0dbec1 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOST_ERLANG_ARCH_SUPPORTS
 	bool
+	default y if BR2_HOSTARCH = "aarch64"
 	default y if BR2_HOSTARCH = "x86_64"
 	default y if BR2_HOSTARCH = "x86"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
