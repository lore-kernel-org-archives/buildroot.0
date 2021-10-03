Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E67C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:17:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FDAD61B00
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:17:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9FDAD61B00
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6848F848CE;
	Sun,  3 Oct 2021 08:17:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YEds-id8xZau; Sun,  3 Oct 2021 08:17:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C556E848CC;
	Sun,  3 Oct 2021 08:17:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A56711BF5A4
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93C68848CC
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:17:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0z0UQ1bh0dQO for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 08:17:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2386848CA
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 08:17:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 6E1D28D220; Sun,  3 Oct 2021 08:15:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 10:17:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b03ea972ae650434b2d72085e1fd5d676cb6c5f9
X-Git-Newrev: d24387ef26c2abeaeb0e4e687335fff02673d3b4
X-Patchwork-Hint: ignore
Message-Id: <20211003081508.6E1D28D220@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-inflection: python3 is also
 needed for host
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

commit: https://git.buildroot.net/buildroot/commit/?id=d24387ef26c2abeaeb0e4e687335fff02673d3b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit ac120d277704fb212654356a6d2a2ff7be90737a forgot to set
HOST_PYTHON_INFLECTION_NEEDS_HOST_PYTHON

Fixes:
 - http://autobuild.buildroot.org/results/b0f7e56fd1dfe891396adc2b232a2663a9715196

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-inflection/python-inflection.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-inflection/python-inflection.mk b/package/python-inflection/python-inflection.mk
index 7c030e99b9..59f35aa135 100644
--- a/package/python-inflection/python-inflection.mk
+++ b/package/python-inflection/python-inflection.mk
@@ -10,6 +10,7 @@ PYTHON_INFLECTION_SITE = https://files.pythonhosted.org/packages/e1/7e/691d061b7
 PYTHON_INFLECTION_SETUP_TYPE = setuptools
 PYTHON_INFLECTION_LICENSE = MIT
 PYTHON_INFLECTION_LICENSE_FILES = LICENSE
+HOST_PYTHON_INFLECTION_NEEDS_HOST_PYTHON = python3
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
