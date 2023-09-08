Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A452EEB56D
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 20:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B5C741527;
	Fri,  8 Sep 2023 20:21:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B5C741527
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CSM-iqdnwGi9; Fri,  8 Sep 2023 20:21:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4539E4037A;
	Fri,  8 Sep 2023 20:21:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4539E4037A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6702A1BF2BA
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 409CB81F9C
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:21:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 409CB81F9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2g9bIOlhKjBM for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 20:21:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 750F181F0A
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 20:21:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 750F181F0A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60E4B86B3B; Fri,  8 Sep 2023 20:21:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 8 Sep 2023 22:19:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f862a1abf167dd95c419758ad84e7652cbbc2b68
X-Git-Newrev: 54b6eced24326ce02328d64d415753a5c0c79e00
X-Patchwork-Hint: ignore
Message-Id: <20230908202102.60E4B86B3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erlang: support building on aarch64
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

commit: https://git.buildroot.net/buildroot/commit/?id=54b6eced24326ce02328d64d415753a5c0c79e00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Erlang has good support for aarch64 hosts, and this allows it to be
built without a warning.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
