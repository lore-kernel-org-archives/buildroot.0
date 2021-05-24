Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A97C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:48:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA7CF60525
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA7CF60525
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EA2D403FF;
	Tue,  3 Aug 2021 22:48:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ovCKFq6xvfP8; Tue,  3 Aug 2021 22:48:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E7DF4020C;
	Tue,  3 Aug 2021 22:48:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 130AB1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35E4F405FE
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W-hgaPZxB3Dz for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9341405A0
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4CE2582941; Tue,  3 Aug 2021 21:09:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 24 May 2021 10:50:56 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a1f3e99f0e518d14a271fcc2f509f99bc032702d
X-Git-Newrev: e4625ae8d5e23bb66a774d085fe74a0463f835c5
X-Patchwork-Hint: ignore
Message-Id: <20210803210945.4CE2582941@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pillow:
 security bump to version 8.2.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=e4625ae8d5e23bb66a774d085fe74a0463f835c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Fix numerous CVEs:
  https://pillow.readthedocs.io/en/stable/releasenotes/8.2.0.html#security
  https://pillow.readthedocs.io/en/stable/releasenotes/8.1.2.html#security
  https://pillow.readthedocs.io/en/stable/releasenotes/8.1.1.html#security
  https://pillow.readthedocs.io/en/stable/releasenotes/8.1.0.html#security
- Update license to HPND:
  https://github.com/python-pillow/Pillow/commit/81078e8a0d26c9094446a64aadfa8047b8af3484

https://pillow.readthedocs.io/en/stable/releasenotes/index.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pillow/python-pillow.hash | 7 ++++---
 package/python-pillow/python-pillow.mk   | 6 +++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 0849577f66..562cb2c1a2 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,4 +1,5 @@
-# md5, sha256 from https://pypi.org/project/Pillow/
-sha256	11c5c6e9b02c9dac08af04f093eb5a2f84857df70a7d4a6a6ad461aca803fb9e  Pillow-8.0.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pillow/json
+md5  21c03274a9f59b9c00419852a8faebe7  Pillow-8.2.0.tar.gz
+sha256	a787ab10d7bb5494e5f76536ac460741788f1fbce851068d73a87ca7c35fc3e1  Pillow-8.2.0.tar.gz
 # Locally computed sha256 checksums
-sha256	37de42abe33a247e8f03d2313657a0f174a239a198f526add6544ff3e2643b81  LICENSE
+sha256	5bb11d96b393a698df70018069a986248021f286344c437a13f299c3daf1dfd4  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index fd0c6ce862..42607e0bbd 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 8.0.1
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/2b/06/93bf1626ef36815010e971a5ce90f49919d84ab5d2fa310329f843a74bc1
+PYTHON_PILLOW_VERSION = 8.2.0
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/21/23/af6bac2a601be6670064a817273d4190b79df6f74d8012926a39bc7aa77f
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
-PYTHON_PILLOW_LICENSE = PIL Software License
+PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
 PYTHON_PILLOW_CPE_ID_VENDOR = python
 PYTHON_PILLOW_CPE_ID_PRODUCT = pillow
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
