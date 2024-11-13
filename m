Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD887D41C27
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 09:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73D2B40402;
	Wed, 13 Nov 2024 09:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VMOVAi0TjpDd; Wed, 13 Nov 2024 09:54:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4ECA8403C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4ECA8403C7;
	Wed, 13 Nov 2024 09:54:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D888E11
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57BDE405F0
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:53:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TIzNFwwAqak5 for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 09:53:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 459BB405F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 459BB405F7
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:53:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 430668621D; Wed, 13 Nov 2024 09:53:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Nov 2024 09:02:01 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 79db543d0a260cf72d3ecb1f2a9a32bea5727bd5
X-Git-Newrev: 308371ff9fef85a264fb552cfe36a55bf01b3fd4
X-Patchwork-Hint: ignore
Message-Id: <20241113095351.430668621D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/criu: fix comment
 condition
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=308371ff9fef85a264fb552cfe36a55bf01b3fd4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

in e97fc89e7b a dependency on host-gcc >= 7 was added but
for the comment the condition was not correctly inverted.

Fixes: e97fc89e7b ("package/protobuf-c: bump to version 1.5.0")

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 84ef9bede635726542a72af5c61f84914acfe122)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/criu/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/criu/Config.in b/package/criu/Config.in
index 30b131cd30..fc6897c4d0 100644
--- a/package/criu/Config.in
+++ b/package/criu/Config.in
@@ -50,4 +50,4 @@ comment "criu needs a glibc or musl toolchain w/ threads, host gcc >= 7, gcc >=
 		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18 \
 		|| BR2_TOOLCHAIN_USES_UCLIBC || !BR2_INSTALL_LIBSTDCPP \
 		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR \
-		|| BR2_HOST_GCC_AT_LEAST_7
+		|| !BR2_HOST_GCC_AT_LEAST_7
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
