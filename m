Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED307D3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A580C4078A;
	Sun, 28 Dec 2025 22:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pieb3ATlPhr4; Sun, 28 Dec 2025 22:07:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 203A840770
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766959630;
	bh=QBQ5Bgt4lNMRBcU/QdLUjukgney54nh0nE7RDBXv7Qw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oXm0mgZVddgrrUyv1Jm5UIbeiWGFlZXAxr7d1AZgxiiB5yhubWP2WONzh8gm/vo7x
	 lVqb+VjxM9Vy6sO9wWS9DDIerX85iZQu0XhH/g4CfUTh9mIKvSq93OADJpWlvc9QM9
	 bG4M3IVuDPHVD+vXEY1N7IcydYzfg/5jqyvLelo4I6ocqGpMN9TOJRy+eMdN/B4jiy
	 aKIbsF+0sg4RKUYOIhng9Ezl/eMWfY/K1SSZRkJ0nlPztWhlpvbBqTU5ALboKP05xb
	 7m8jenf3z2sWOPpp4bXwBchjRoL5/rTexwW7nElbKBoNGuGWg5kol8UP+6pvAhCFBu
	 LCCoBVOloobCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 203A840770;
	Sun, 28 Dec 2025 22:07:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AFF9D8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FD6C40055
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yzOQg7e_I6Dg for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DFD4401FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DFD4401FF
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C3B785C36; Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 23:02:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5d76be1c041938acee9650cbb777f3880865f629
X-Git-Newrev: 8132e84e0491da912df51e18c35d5fab981a2bce
X-Patchwork-Hint: ignore
Message-Id: <20251228220645.9C3B785C36@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-minimalmodbus: add md5 hash
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8132e84e0491da912df51e18c35d5fab981a2bce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-minimalmodbus/python-minimalmodbus.hash | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/python-minimalmodbus/python-minimalmodbus.hash b/package/python-minimalmodbus/python-minimalmodbus.hash
index 635090fae7..ee688e49d3 100644
--- a/package/python-minimalmodbus/python-minimalmodbus.hash
+++ b/package/python-minimalmodbus/python-minimalmodbus.hash
@@ -1,4 +1,5 @@
-# sha256 from https://pypi.org/project/minimalmodbus
+# md5, sha256 from https://pypi.org/pypi/minimalmodbus/json
+md5  a981b31df61c7dd9fa04d0def72f8486  minimalmodbus-2.1.1.tar.gz
 sha256  c3f5a56e107d537e4bb420f7e735841ab2939c8ca6fb528f5fe4124571315b64  minimalmodbus-2.1.1.tar.gz
-# Hash for license file
+# Locally computed sha256 checksums
 sha256  abe787d472ae2069e935c84eb13fd770518dfb08b92d5f190f3cd7ff6d1f6f32  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
