Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D679FD0BB6B
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 07:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AB0A80F5F;
	Thu, 24 Oct 2024 07:31:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cT6kyea_mGOS; Thu, 24 Oct 2024 07:31:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A79DE80ED1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A79DE80ED1;
	Thu, 24 Oct 2024 07:31:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1249F972
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 07:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16DAF40B24
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 07:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id busVFVbbsnDy for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 07:31:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18E4C40A60
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18E4C40A60
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 07:31:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05DF08645C; Thu, 24 Oct 2024 07:31:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Oct 2024 09:27:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07c18b879191f90cd50dd8364c0df89e000aca01
X-Git-Newrev: 9eb383f0767615ea75573bfc85cfd840ed5b5867
X-Patchwork-Hint: ignore
Message-Id: <20241024073112.05DF08645C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-hatch-fancy-pypi-readme:
 use hatch setup type
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=9eb383f0767615ea75573bfc85cfd840ed5b5867
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
index 2a26892388..0857864965 100644
--- a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
+++ b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
@@ -9,7 +9,6 @@ PYTHON_HATCH_FANCY_PYPI_README_SOURCE = hatch_fancy_pypi_readme-$(PYTHON_HATCH_F
 PYTHON_HATCH_FANCY_PYPI_README_SITE = https://files.pythonhosted.org/packages/b4/c2/c9094283a07dd96c5a8f7a5f1910259d40d2e29223b95dd875a6ca13b58f
 PYTHON_HATCH_FANCY_PYPI_README_LICENSE = MIT
 PYTHON_HATCH_FANCY_PYPI_README_LICENSE_FILES = LICENSE.txt
-PYTHON_HATCH_FANCY_PYPI_README_SETUP_TYPE = pep517
-HOST_PYTHON_HATCH_FANCY_PYPI_README_DEPENDENCIES = host-python-hatchling
+PYTHON_HATCH_FANCY_PYPI_README_SETUP_TYPE = hatch
 
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
