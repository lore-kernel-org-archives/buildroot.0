Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B117CA0ECA
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 06:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30FC3610FC;
	Tue, 12 Sep 2023 06:27:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30FC3610FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T7ZBVpit8A81; Tue, 12 Sep 2023 06:27:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59D73610DD;
	Tue, 12 Sep 2023 06:27:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59D73610DD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 340041BF27E
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 06:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0AD181F38
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 06:27:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0AD181F38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EiyXQlA6MOUs for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 06:27:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0289181F6D
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 06:27:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0289181F6D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E25CB86D77; Tue, 12 Sep 2023 06:27:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Sep 2023 08:08:08 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: e8077da481b8b22512ab70ddcedbf82e128e1fc3
X-Git-Newrev: 5a5b0f82ecc62322e58348059543c9aa0b727529
X-Patchwork-Hint: ignore
Message-Id: <20230912062709.E25CB86D77@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] linux: fix hash for
 kernel 4.14.290
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

commit: https://git.buildroot.net/buildroot/commit/?id=5a5b0f82ecc62322e58348059543c9aa0b727529
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Buildroot commit e0a786a46733cc473f0e4c35064a3b09ccf548e6 added a hash
for the wrong file.

Fixes:
http://autobuild.buildroot.net/results/fc0/fc0e253e3535bbc1413d150554e836d3da9e2042/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1c5560cdece81eb02c56ad2841103cd3515db7d0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 8f72e0edd4..9868aef2c2 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -6,7 +6,7 @@ sha256  150f3846b76cd23a6135f49cef71372bade5a06e851cb4f8558df8b862d8fec7  linux-
 sha256  4c03516ae1d417571faaef175932d0892710bcbe0173e40550014d043d9098c9  linux-5.10.189.tar.xz
 sha256  3a78587523940374a7319089b63357c7dc412b90f5879d512265e59173588267  linux-5.4.252.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  6ee30a46f3fa6576602085b7b4b0c640586f99d1c110982db411819308b5755c  linux-4.19.250.tar.xz
+sha256  9fa5e24b7d791583f8cd001bcf02b52f569f261e276dc1dab2552974dca20ecf  linux-4.19.290.tar.xz
 sha256  d0e32bd47a547cc20e0ce09ff45514282742edb2af38df5dc0a03f22d4321715  linux-4.14.321.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
