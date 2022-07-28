Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F73C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 07:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08BF340B57;
	Thu, 28 Jul 2022 07:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08BF340B57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J1e8Wjxzu3ui; Thu, 28 Jul 2022 07:44:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18E2A40136;
	Thu, 28 Jul 2022 07:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18E2A40136
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CBCEC1BF423
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 07:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6CBD8266D
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 07:44:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6CBD8266D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z5zf5gyrkKHS for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 07:44:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E472282611
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 07:44:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E472282611
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0DF5D867D1; Thu, 28 Jul 2022 07:30:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 09:34:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca804515166dd45138662b591d1b685ea338fb20
X-Git-Newrev: 117c21820f3d9df67da6524400617d5fabbf424f
X-Patchwork-Hint: ignore
Message-Id: <20220728073022.0DF5D867D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdal: fix license hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=117c21820f3d9df67da6524400617d5fabbf424f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

license hash is wrong since the addition of the package in commit
1e64fa2956171cdc9d6e6c8896b4b589ce573513:

ERROR: LICENSE.TXT has wrong sha256 hash:
ERROR: expected: b82e6cca0b13f5db2f22ab667f22254fb1f4b135ea73d5bd6238ef89aff31f6c
ERROR: got     : fac0116e799ca4de79b076ee04863b5e2b69541ea3664b9bb108c81a5355f16a
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Fixes:
 - http://autobuild.buildroot.org/results/e443db6d7ff3ae867035d169853b880b5e13d181

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdal/gdal.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdal/gdal.hash b/package/gdal/gdal.hash
index 52bb60de35..826a7f0b45 100644
--- a/package/gdal/gdal.hash
+++ b/package/gdal/gdal.hash
@@ -3,4 +3,4 @@ md5  4b7981efbeed69c06c79fb65d0a60d83  gdal-3.5.1.tar.xz
 sha256  d12c30a9eacdeaab493c0d1c9f88eb337c9cbb5bb40744c751bdd5a5af166ab6  gdal-3.5.1.tar.xz
 
 # Hashes of license files:
-sha256  b82e6cca0b13f5db2f22ab667f22254fb1f4b135ea73d5bd6238ef89aff31f6c  LICENSE.TXT
+sha256  fac0116e799ca4de79b076ee04863b5e2b69541ea3664b9bb108c81a5355f16a  LICENSE.TXT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
