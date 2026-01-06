Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F16D0D14F
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2627480D6F;
	Wed,  7 Jan 2026 17:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k3Of5gR5Ret6; Wed,  7 Jan 2026 17:48:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48A59821AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808086;
	bh=K+jwbvdx+FRC8eysAYhYzNZvLBLw7CrTGkpEbk5LSu0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=c1EeQOcd1Twk5BdQ7yz2wM+XBcwpOxY8RWgeJXGGx7Sfq5yigcU0gB32NQYYlpBby
	 MakCT307SVQQcl1DOd7zxKOwTdY/+5qBISg7dQZpZ7RnqGBVmEWZDalGrQ7rib3m3D
	 RoXuOYfrXMVuDW4QUa7OiugSBnAEM7RmWcYUg6E7gi4IyJGKXEsvvytkXkHJvp9x8N
	 2B6wNFZhbxmapXi+HKecKLAQ9ADrIYZPsqw7wbMCfCBgprnXlKaPiKlEPFUdfD48MQ
	 fuif/XCwktGGyqGO21lWI6tndcQNm2DFG97zTwCzn4UZe24y4b7jITomrYUL8Qj2ni
	 HqjhnR+9A5wVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48A59821AC;
	Wed,  7 Jan 2026 17:48:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CE139ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 528DE80C47
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lh5Nfk9WeO8a for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95B4580C62
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95B4580C62
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 947ED81917; Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:18:50 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 432ba70009252693bac2c7b58d3449a1f9825e1e
X-Git-Newrev: 0ca81ef13c44befb0819922a847df86cdd04ec85
X-Patchwork-Hint: ignore
Message-Id: <20260107174643.947ED81917@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/python-minimalmodbus: add md5 hash
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0ca81ef13c44befb0819922a847df86cdd04ec85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8132e84e0491da912df51e18c35d5fab981a2bce)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
