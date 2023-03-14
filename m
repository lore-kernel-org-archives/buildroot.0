Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F52EC6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 08:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D99C44091C;
	Tue, 14 Mar 2023 08:44:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D99C44091C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U0OhbgYqKzUU; Tue, 14 Mar 2023 08:44:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D61B840905;
	Tue, 14 Mar 2023 08:44:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D61B840905
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7B59D1BF2C3
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 554C44058D
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 554C44058D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AXmL06VTZ21u for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 08:43:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9292A40525
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 08:43:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9292A40525
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8259587112; Tue, 14 Mar 2023 08:43:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Mar 2023 09:42:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 65f49b2cb3e7902fe90403e56a9ba7931504d99c
X-Git-Newrev: a23128e2a5060136b54c41255bf753638b48d94e
X-Patchwork-Hint: ignore
Message-Id: <20230314084342.8259587112@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lzop: fix COPYING hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=a23128e2a5060136b54c41255bf753638b48d94e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The version bump in ce95217 forgot to update the hash of the license
file.
Changes include a new address for Free Software Foundation, Inc.

Fixes:
 - http://autobuild.buildroot.net/results/c8a/c8ab973077067b2aa57e4f3ab51bd41ca1543d6f/

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lzop/lzop.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lzop/lzop.hash b/package/lzop/lzop.hash
index 99796dc8c9..31849aa0c5 100644
--- a/package/lzop/lzop.hash
+++ b/package/lzop/lzop.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  7e72b62a8a60aff5200a047eea0773a8fb205caf7acbe1774d95147f305a2f41  lzop-1.04.tar.gz
-sha256  70439f6e2b47057a408d2390ed6663b9875f5a08066a06a060a357ef1df89a8c  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
