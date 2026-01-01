Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C6CBEEB57E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 122EF81E2D;
	Thu,  1 Jan 2026 09:42:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AxdIaHbs_AtI; Thu,  1 Jan 2026 09:42:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1810281E5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260577;
	bh=bXEgrGN12LkPEEXbsEoNKTbQrtNyVCZnXy84LJRRVNw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ePuog0lBYB/+xYyvkLAmTIsD3Mc2EgvoJsF/lqjkVhFOBSobvC/UHKR1p/7qQXjQQ
	 wJbQgf3z7/aMYdfqkC4RfGGs0e8+ASH6qBEWYNEVH9corZYJei9WhSibaYZ+IjX2R6
	 0oUvn+d2uZ3nF4k+THkWVhBjF8KdO4UvmbkvoUX0FCwAU8e02GtwsqY4v++vUCPzYA
	 ql4LZ1CklutN9n6Soxnpb4+XDm5Hu65VATdEwu7q39uFKBpcCSLLzKuVyUwgnwR2Z8
	 ysVDo7fg56zaF+YZc9lVLRnLQSSG8zyGQM6hLbTfGCI/03Xng9C4njb0xfyh9YtGEo
	 l9m5LCJRGY/Iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1810281E5C;
	Thu,  1 Jan 2026 09:42:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10045351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E796381434
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fnveZimHloyx for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:42:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E2B88156C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E2B88156C
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C5D086FB6; Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 10:33:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9cfcacae0f30530f345f2d3502475b35f7480a54
X-Git-Newrev: ad3054501a52f7f1c61565d79c667f9748062876
X-Patchwork-Hint: ignore
Message-Id: <20260101094233.3C5D086FB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-psycopg2: bump to version
 2.9.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=ad3054501a52f7f1c61565d79c667f9748062876
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-psycopg2/python-psycopg2.hash | 4 ++--
 package/python-psycopg2/python-psycopg2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psycopg2/python-psycopg2.hash b/package/python-psycopg2/python-psycopg2.hash
index 52f3f76712..c72759f43f 100644
--- a/package/python-psycopg2/python-psycopg2.hash
+++ b/package/python-psycopg2/python-psycopg2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psycopg2/json
-md5  3a1ed36b492a74789563577edc0b0689  psycopg2-2.9.10.tar.gz
-sha256  12ec0b40b0273f95296233e8750441339298e6a572f7039da5b260e3c8b60e11  psycopg2-2.9.10.tar.gz
+md5  ea0f76b3d0358db5d8ff84e18c4a7252  psycopg2-2.9.11.tar.gz
+sha256  964d31caf728e217c697ff77ea69c2ba0865fa41ec20bb00f0977e62fdcc52e3  psycopg2-2.9.11.tar.gz
 # Locally computed sha256 checksums
 sha256  9614b85dfc9a72c5b2ca33144c1d7e1ed3b1c297459d9fb28a6a5762c2e8d71b  LICENSE
diff --git a/package/python-psycopg2/python-psycopg2.mk b/package/python-psycopg2/python-psycopg2.mk
index 0df79c5412..689788c2c0 100644
--- a/package/python-psycopg2/python-psycopg2.mk
+++ b/package/python-psycopg2/python-psycopg2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSYCOPG2_VERSION = 2.9.10
+PYTHON_PSYCOPG2_VERSION = 2.9.11
 PYTHON_PSYCOPG2_SOURCE = psycopg2-$(PYTHON_PSYCOPG2_VERSION).tar.gz
-PYTHON_PSYCOPG2_SITE = https://files.pythonhosted.org/packages/62/51/2007ea29e605957a17ac6357115d0c1a1b60c8c984951c19419b3474cdfd
+PYTHON_PSYCOPG2_SITE = https://files.pythonhosted.org/packages/89/8d/9d12bc8677c24dad342ec777529bce705b3e785fa05d85122b5502b9ab55
 PYTHON_PSYCOPG2_SETUP_TYPE = setuptools
 PYTHON_PSYCOPG2_LICENSE = LGPL-3.0+
 PYTHON_PSYCOPG2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
