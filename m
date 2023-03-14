Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5ACC6FD1C
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 08:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6082941869;
	Tue, 14 Mar 2023 08:43:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6082941869
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N7sz4FPxroZN; Tue, 14 Mar 2023 08:43:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3427541864;
	Tue, 14 Mar 2023 08:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3427541864
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E9291BF95E
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 588F681836
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 588F681836
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z4myNpYWJuhz for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 08:43:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D2208143A
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 08:43:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D2208143A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D62987113; Tue, 14 Mar 2023 08:43:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Mar 2023 09:42:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a23128e2a5060136b54c41255bf753638b48d94e
X-Git-Newrev: 7107a9876b29c0a3e6fc8424eca199dfea5ce5b2
X-Patchwork-Hint: ignore
Message-Id: <20230314084342.8D62987113@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lzop: use upstream download hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=7107a9876b29c0a3e6fc8424eca199dfea5ce5b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The official website includes a sha256 next to the download link.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lzop/lzop.hash | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/lzop/lzop.hash b/package/lzop/lzop.hash
index 31849aa0c5..8cf31d1610 100644
--- a/package/lzop/lzop.hash
+++ b/package/lzop/lzop.hash
@@ -1,3 +1,4 @@
-# Locally calculated
+# From http://www.lzop.org
 sha256  7e72b62a8a60aff5200a047eea0773a8fb205caf7acbe1774d95147f305a2f41  lzop-1.04.tar.gz
+# Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
