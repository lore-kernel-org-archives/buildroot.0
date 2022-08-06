Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39044C19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 22:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2F0060FAC;
	Sat,  6 Aug 2022 22:22:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2F0060FAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vGbp53gFKIB7; Sat,  6 Aug 2022 22:22:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B23160FA4;
	Sat,  6 Aug 2022 22:22:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B23160FA4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E4A01BF580
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 22:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AC1140117
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 22:22:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AC1140117
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F3zjAeijeqvn for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 22:22:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E783401DF
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 22:22:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E783401DF
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 93EAA86EDD; Sat,  6 Aug 2022 22:08:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Aug 2022 00:22:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 974ca92229a4d82fa015adf4164315d0c7a25d68
X-Git-Newrev: 09463cb4e9152d1adf4e0d72f0774081961c41ff
X-Patchwork-Hint: ignore
Message-Id: <20220806220817.93EAA86EDD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-scipy: add CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=09463cb4e9152d1adf4e0d72f0774081961c41ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:scipy:scipy is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ascipy%3Ascipy

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-scipy/python-scipy.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
index b5006a2e15..a8c23c6c88 100644
--- a/package/python-scipy/python-scipy.mk
+++ b/package/python-scipy/python-scipy.mk
@@ -22,6 +22,8 @@ PYTHON_SCIPY_LICENSE_FILES = \
 	scipy/sparse/linalg/_dsolve/SuperLU/License.txt \
 	scipy/sparse/linalg/_eigen/arpack/ARPACK/COPYING \
 	scipy/spatial/qhull_src/COPYING.txt
+PYTHON_SCIPY_CPE_ID_VENDOR = scipy
+PYTHON_SCIPY_CPE_ID_PRODUCT = scipy
 PYTHON_SCIPY_DEPENDENCIES += \
 	host-python-numpy \
 	host-python-pythran \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
