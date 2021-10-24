Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 565C4C433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 13:25:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D78A660F70
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 13:25:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D78A660F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF3D240258;
	Sun, 24 Oct 2021 13:25:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4TdSbjEyf4gM; Sun, 24 Oct 2021 13:25:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 227EF401FE;
	Sun, 24 Oct 2021 13:25:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8B82E1BF2F2
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 13:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88C42401FE
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 13:25:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TUps75Ql3Iwh for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 13:25:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEBA8401D2
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 13:25:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 351768859C; Sun, 24 Oct 2021 13:21:58 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 15:25:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2033992ac079c38ed3c2d38eb693d345fb0d5c89
X-Git-Newrev: 777b1f91353ddae3a32d2dccfdbbfca853bf30f9
X-Patchwork-Hint: ignore
Message-Id: <20211024132158.351768859C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3-cffi: bump version to
 1.14.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=777b1f91353ddae3a32d2dccfdbbfca853bf30f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- the last version bump of package/python-cffi (790c10d) ignored
  the comment 'Please keep in sync with package/python3-cffi/python3-cffi.mk',
  so catch up now

Fixes:

  ERROR: No hash found for cffi-1.14.2.tar.gz

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python3-cffi/python3-cffi.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python3-cffi/python3-cffi.mk b/package/python3-cffi/python3-cffi.mk
index 7541e71b73..52ea3b3fbf 100644
--- a/package/python3-cffi/python3-cffi.mk
+++ b/package/python3-cffi/python3-cffi.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python-cffi/python-cffi.mk
-PYTHON3_CFFI_VERSION = 1.14.2
+PYTHON3_CFFI_VERSION = 1.14.6
 PYTHON3_CFFI_SOURCE = cffi-$(PYTHON3_CFFI_VERSION).tar.gz
-PYTHON3_CFFI_SITE = https://files.pythonhosted.org/packages/f7/09/88bbe20b76ca76be052c366fe77aa5e3cd6e5f932766e5597fecdd95b2a8
+PYTHON3_CFFI_SITE = https://files.pythonhosted.org/packages/2e/92/87bb61538d7e60da8a7ec247dc048f7671afe17016cd0008b3b710012804
 PYTHON3_CFFI_SETUP_TYPE = setuptools
 PYTHON3_CFFI_LICENSE = MIT
 PYTHON3_CFFI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
