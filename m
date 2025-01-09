Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B042E77199
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 09:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26B54401C7;
	Thu,  9 Jan 2025 09:23:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AdnJhORWDKjw; Thu,  9 Jan 2025 09:23:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14AC1401D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14AC1401D1;
	Thu,  9 Jan 2025 09:23:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B0703943
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC45F80AE6
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:23:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tctim00G0V3E for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 09:23:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0A3080B35
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0A3080B35
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:23:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DBE058416C; Thu,  9 Jan 2025 09:23:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Jan 2025 09:07:24 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: bad236e955a5fdd353373f11f24c155406f43d27
X-Git-Newrev: b043c70c97e57bdd7ea4753e678359e04e2c856b
X-Patchwork-Hint: ignore
Message-Id: <20250109092317.DBE058416C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] utils/get-developers:
 sort reported developers
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

commit: https://git.buildroot.net/buildroot/commit/?id=b043c70c97e57bdd7ea4753e678359e04e2c856b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

The list of reported developers is not ordered: that may leave the
impression (when receiving a patch) that a Cc is more important than
another, by virtue of being earlier in the list.

Also, the ordering changes on every call.

Report the developers in an alphabetically order, so that there is no
confusion anymore, and so the ordering is reproducible across calls.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3177ecd26096ab305c51620eb29b0e639f3133e9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/get-developers | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/get-developers b/utils/get-developers
index b45e617bff..3253ce5d6b 100755
--- a/utils/get-developers
+++ b/utils/get-developers
@@ -98,6 +98,7 @@ def __main__():
                 if i in dev.infras:
                     matching_devs.add(dev.name)
 
+        matching_devs = sorted(matching_devs)
         if args.email:
             for dev in matching_devs:
                 print(dev)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
