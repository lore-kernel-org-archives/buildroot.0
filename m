Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D412C433EF
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 20:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7530F408F0;
	Tue, 11 Jan 2022 20:07:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2X7YygEU2qLk; Tue, 11 Jan 2022 20:07:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30703408EB;
	Tue, 11 Jan 2022 20:07:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 208A31BF989
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D32F408EF
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:07:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qsWfWuj69U9d for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 20:07:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48CA3408ED
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 20:07:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 91B3F83483; Tue, 11 Jan 2022 20:00:43 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 21:06:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e93068e049c85df6ac2777ca58539e2fced51f01
X-Git-Newrev: 184e710c82b87bf2eaf1d200e148e686263945e8
X-Patchwork-Hint: ignore
Message-Id: <20220111200043.91B3F83483@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tinifier: fix license hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=184e710c82b87bf2eaf1d200e148e686263945e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

license hash is wrong since the addition of the package in commit
43c580ac9f848449333ecbe4336c2c9f2ba12158:

>>> tinifier 3.4.0 Collecting legal info
ERROR: LICENSE has wrong sha256 hash:
ERROR: expected: 791d8fd993ace44d4d83e2f4820a64d5ad3e37412f029afad46d17a9259de2b6
ERROR: got     : 18f524914c0df04e21289c3d9ca3e27c10abe5869cc4e4d4790a1b2c56df282c

Fixes:
 - http://autobuild.buildroot.org/results/5fce7f16daca17216d786391ea0fffff856c5404

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tinifier/tinifier.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tinifier/tinifier.hash b/package/tinifier/tinifier.hash
index 5681ed6a55..0c35508ebc 100644
--- a/package/tinifier/tinifier.hash
+++ b/package/tinifier/tinifier.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  927e966f9d23ea7cc1942967a8fc16ef4c55c51bd096d44f54b418844a51aa12  tinifier-3.4.0.tar.gz
-sha256  791d8fd993ace44d4d83e2f4820a64d5ad3e37412f029afad46d17a9259de2b6  LICENSE
+sha256  18f524914c0df04e21289c3d9ca3e27c10abe5869cc4e4d4790a1b2c56df282c  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
