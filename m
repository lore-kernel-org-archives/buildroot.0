Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23492C44515
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 19:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE88E808AF;
	Mon, 20 Jul 2026 19:54:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5vYR-C6x2QcQ; Mon, 20 Jul 2026 19:54:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5B3E808C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784577276;
	bh=mJwrnWTSNuYWPD0jvzr6fTjw+xbmLBwQ9jHINFgD16M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y05+/uO8fDkcZSXU8dCNHpM7jdm2EItQqmV5iCUbm2N7/Z/8e3HC+abL66IIiz50c
	 xcUe7QKAqLg/4FZIT5gr63x1IbZnDx4K/ZcDuPPmqS4iUsSHSyIuSWrmmDW41+nGOT
	 EQNMsg4ThVMisI5jYeAXeSs+7rF40+iexeCqIwIKA+fsVEyP9UJtOJNlTKkcr3GG6h
	 liIepLgysRQqRN2iB//d/6pLGgFmq1UKZ/mr1tS/sjLeKWaTJRTjzSueMI/cqz01WJ
	 mR+nXKERzq9owkJcSR0g9MWcVsAsgi3IfpPcfO10xm1cWE0bhBAUixf5BmFk3U3XJ9
	 cDCS/L6oniofw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5B3E808C0;
	Mon, 20 Jul 2026 19:54:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C93EDF0
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 19:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E61EF4017B
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 19:54:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nR1H0p1kxcZt for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 19:54:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 267724004C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 267724004C
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 19:54:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4ED178907A; Mon, 20 Jul 2026 19:53:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Jul 2026 21:46:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 12002ceeefa496e62f09e3fa324eb01f04ff7d73
X-Git-Newrev: 75f49d3c09d354e5848a82bc1a53f4e8c2f2c075
X-Patchwork-Hint: ignore
Message-Id: <20260720195356.4ED178907A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-scp: bump version to 0.16.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4794772667788258654=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4794772667788258654==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/75f49d3c09d354e5848a82bc1a53f4e8c2f2c075
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog update:
https://github.com/jbardin/scp.py/commit/69e5040cdf0b3d15d7f2a62e10247b005c915714

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-scp/python-scp.hash | 4 ++--
 package/python-scp/python-scp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-scp/python-scp.hash b/package/python-scp/python-scp.hash
index 4ec4e6a41a..e79c4ef4a3 100644
--- a/package/python-scp/python-scp.hash
+++ b/package/python-scp/python-scp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/scp/json
-md5  54c0e3b6cc52620ce3a81362fa8bb29d  scp-0.15.0.tar.gz
-sha256  f1b22e9932123ccf17eebf19e0953c6e9148f589f93d91b872941a696305c83f  scp-0.15.0.tar.gz
+md5  a72edd2cdc0fe6e14d9092065f04bfe0  scp-0.16.0.tar.gz
+sha256  1763a4b8ac424ea0c304f58b95a4a4a51d503a834ed77b4e89f1a32b30cbe662  scp-0.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  2455cf0fc78e13772bf10ef5f209e7eb8625706d671b2f420cc8add37d548c1c  LICENSE.txt
diff --git a/package/python-scp/python-scp.mk b/package/python-scp/python-scp.mk
index d223b16290..a4be23fb51 100644
--- a/package/python-scp/python-scp.mk
+++ b/package/python-scp/python-scp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCP_VERSION = 0.15.0
+PYTHON_SCP_VERSION = 0.16.0
 PYTHON_SCP_SOURCE = scp-$(PYTHON_SCP_VERSION).tar.gz
-PYTHON_SCP_SITE = https://files.pythonhosted.org/packages/d6/1c/d213e1c6651d0bd37636b21b1ba9b895f276e8057f882c9f944931e4f002
+PYTHON_SCP_SITE = https://files.pythonhosted.org/packages/7f/e1/34634a89f100fcf4f014aca65621e701c5b9053cec62b6386866e3f015d5
 PYTHON_SCP_SETUP_TYPE = setuptools
 PYTHON_SCP_LICENSE = LGPL-2.1+
 PYTHON_SCP_LICENSE_FILES = LICENSE.txt

--===============4794772667788258654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4794772667788258654==--
