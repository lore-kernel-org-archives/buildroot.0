Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7520C021B2
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 13:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C6FA606C8;
	Sun, 23 Feb 2025 13:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lV8MRHe8LzAT; Sun, 23 Feb 2025 13:28:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AF2B608C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AF2B608C2;
	Sun, 23 Feb 2025 13:28:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 179B4943
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 13:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFAE481295
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 13:28:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 27M6QIAd3lbv for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 13:28:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D2CE8128D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D2CE8128D
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 13:28:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 36A9B876DB; Sun, 23 Feb 2025 13:28:34 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Feb 2025 14:27:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c8eb4c63a77131e83ab9fed8c9e5ba2dc76a83d9
X-Git-Newrev: ee91e37299a79c330675e516231f07734d0b862c
X-Patchwork-Hint: ignore
Message-Id: <20250223132834.36A9B876DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: fix cyclonedx script name
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee91e37299a79c330675e516231f07734d0b862c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit dbab39e2d908 (support/scripts/generate-cyclonedx.py: add
script to generate CycloneDX-style SBOM), the script was renamed while
applying thr patch, but the entry in DEVELOPERS was not updated
accordingly:

    $ ./utils/docker-run ./utils/get-developers -v
    WARNING: 'utils/generate-cyclonedx.py' doesn't match any file, line 3179

Fix that.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9a220359e7..61b531f424 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3176,7 +3176,7 @@ F:	package/xorcurses/
 
 N:	Thomas Perale <thomas.perale@mind.be>
 F:	package/go/
-F:	utils/generate-cyclonedx.py
+F:	utils/generate-cyclonedx
 
 N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 F:	arch/Config.in.arm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
