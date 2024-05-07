Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71797C10F1A
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 16:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF64360B78;
	Tue,  7 May 2024 16:14:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BHnSvlOrJPUk; Tue,  7 May 2024 16:13:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBB0660B11
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBB0660B11;
	Tue,  7 May 2024 16:13:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3801B1BF591
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 16:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 218A781E79
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 16:13:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jf2HvuHzrLKH for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 16:13:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56C2981E81
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56C2981E81
 for <buildroot@buildroot.org>; Tue,  7 May 2024 16:13:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4DDDD86A25; Tue,  7 May 2024 16:13:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 May 2024 18:11:07 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 30ce03a445ed81706929953c289a4de08c958034
X-Git-Newrev: 5177d62dce792246088a2b9a6d7bd0c24bd290b1
X-Patchwork-Hint: ignore
Message-Id: <20240507161335.4DDDD86A25@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/python-pillow:
 fix legal info
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

commit: https://git.buildroot.net/buildroot/commit/?id=5177d62dce792246088a2b9a6d7bd0c24bd290b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Commit dfaa34ddd3398f22718f7361d617d98d53b51630 forgot to update hash of
LICENSE file:

ERROR: LICENSE has wrong sha256 hash:
ERROR: expected: e706384c6f299d1b6fa782ae657740b372b4bd7938a1a318bf94ac249114758a
ERROR: got     : cf234c27a3f275f5a050f4df3946f8855704226fe4e7ca8b33928cbcecbced37

LICENSE file has been updated to clean up authors and contributors:
https://github.com/python-pillow/Pillow/commit/4197263dff19a79f13cd86f6cdc9a0ec6c06da92

Fixes: dfaa34ddd3398f22718f7361d617d98d53b51630
 - http://autobuild.buildroot.org/results/5a35d83c73367e1b20534b1bc7f2f564cf653a38

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b8a86f5a8fcf2930b17a165ead7274618b7aba75)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pillow/python-pillow.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 073b758dfe..352536a035 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -3,4 +3,4 @@ md5  6c21a12849ae42f93881f614d8f6f651  pillow-10.3.0.tar.gz
 sha256  9d2455fbf44c914840c793e89aa82d0e1763a14253a000743719ae5946814b2d  pillow-10.3.0.tar.gz
 
 # Locally computed sha256 checksums
-sha256  e706384c6f299d1b6fa782ae657740b372b4bd7938a1a318bf94ac249114758a  LICENSE
+sha256  cf234c27a3f275f5a050f4df3946f8855704226fe4e7ca8b33928cbcecbced37  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
