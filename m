Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDEC7C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 12:13:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E27A6115C
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 12:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E27A6115C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3288240476;
	Tue, 26 Oct 2021 12:13:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y-YAFBl18tIQ; Tue, 26 Oct 2021 12:13:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8182E40485;
	Tue, 26 Oct 2021 12:13:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B1DBC1BF9AA
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 12:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F312401EF
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 12:12:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fkZeTNPU_lAb for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 12:12:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04CDE401DF
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 12:12:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C12A788D3C; Tue, 26 Oct 2021 12:09:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 13:44:35 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 52ba0e173c4b38475d824a08635806ed54953ed8
X-Git-Newrev: 18d5bff30a99c4e70c6368f2256f4c991f41500b
X-Patchwork-Hint: ignore
Message-Id: <20211026120923.C12A788D3C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/python3-cffi:
 bump version to 1.14.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=18d5bff30a99c4e70c6368f2256f4c991f41500b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

- the last version bump of package/python-cffi (790c10d) ignored
  the comment 'Please keep in sync with package/python3-cffi/python3-cffi.mk',
  so catch up now

Fixes:

  ERROR: No hash found for cffi-1.14.2.tar.gz

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 777b1f91353ddae3a32d2dccfdbbfca853bf30f9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
