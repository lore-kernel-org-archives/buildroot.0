Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF87C4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 22:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58D7C419A0;
	Wed, 23 Nov 2022 22:20:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58D7C419A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Ek-PmRhHbRF; Wed, 23 Nov 2022 22:20:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 631C14197A;
	Wed, 23 Nov 2022 22:20:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 631C14197A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F02731BF32A
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 22:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA63281EBA
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 22:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA63281EBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3gqbxjPJftuc for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 22:20:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C7D381EB8
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 22:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C7D381EB8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E8FD88448F; Wed, 23 Nov 2022 22:20:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 23:20:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2cda2584fbb566284019f39ca89f44b42dacdb03
X-Git-Newrev: ecc33ec02a9c137387b9eb820e8e3b55b732d9b5
X-Patchwork-Hint: ignore
Message-Id: <20221123222030.E8FD88448F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/scanpypi: add LICENCE.TXT to the
 list of the license files
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

commit: https://git.buildroot.net/buildroot/commit/?id=ecc33ec02a9c137387b9eb820e8e3b55b732d9b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/scanpypi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 452b4a3fc3..3c98bb4bcc 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -487,7 +487,7 @@ class BuildrootPackage():
         lines = []
 
         filenames = ['LICENCE', 'LICENSE', 'LICENSE.MD', 'LICENSE.RST',
-                     'LICENSE.TXT', 'COPYING', 'COPYING.TXT']
+                     'LICENCE.TXT', 'LICENSE.TXT', 'COPYING', 'COPYING.TXT']
         self.license_files = list(find_file_upper_case(filenames, self.tmp_extract))
 
         lines.append(self.__get_license_names(self.license_files))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
