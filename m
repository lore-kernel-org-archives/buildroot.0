Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8BAC4332F
	for <buildroot@archiver.kernel.org>; Sat, 19 Nov 2022 22:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAEB760DF4;
	Sat, 19 Nov 2022 22:43:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAEB760DF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MMzzKgZgYloK; Sat, 19 Nov 2022 22:43:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D42360D80;
	Sat, 19 Nov 2022 22:43:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D42360D80
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 219F01BF4E7
 for <buildroot@lists.busybox.net>; Sat, 19 Nov 2022 22:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0359682020
 for <buildroot@lists.busybox.net>; Sat, 19 Nov 2022 22:42:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0359682020
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G5X2i9eLyckm for <buildroot@lists.busybox.net>;
 Sat, 19 Nov 2022 22:42:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 274F482018
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 274F482018
 for <buildroot@buildroot.org>; Sat, 19 Nov 2022 22:42:55 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.167.43.158])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id B35A3780306;
 Sat, 19 Nov 2022 23:42:45 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 19 Nov 2022 23:42:19 +0100
Message-Id: <20221119224225.589941-1-ju.o@free.fr>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1668897771;
 bh=GqSN3/RoOmCkXPfAN0cGwJytPMw0HVb+Uy5lBFFBVHU=;
 h=From:To:Cc:Subject:Date:From;
 b=gHSYlQ6inhQFI4WwfZyexkPdY9gHyGZZnmGYQR8/ARTOrX2aaeb4GLEBUOSBinlTc
 ZPFmQYL75dQ0mz95Gs/bhH1xmAXIkBeI4c1elPz+agffZKnV2fQphgWfuTsTEjKbD9
 JuzlBEWOmI2cCNAGMyjNhSvv/AiD44KwMq/wiEaUqH3T+nCuPuhS/os7Pysil8KzxD
 zEUTOoPsbEM75SMJ+iGEAZiO0Xs28H51M0QwtK70C2JKuQsIHx/3PIjLIrjAWeU++f
 /RYOQ10D2ROdp+Y3YWDd0NtAaYk4oZ2cy5pvPoVnHxlXmAJkEuO+QUwdsCSk/EnU5R
 O43leDzzEs1SA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gHSYlQ6i
Subject: [Buildroot] [PATCH next 1/7] package/python-idna: set _SETUP_TYPE =
 pep517
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Python idna package switched to pyproject.toml in commit:
https://github.com/kjd/idna/commit/2a00e518efe55d2eeb62cd3f88ace7db41338603
which is included in idna v3.4.

When using the old setuptools infra, the package is incorrectly
installed as v0.0, which is then incorrectly detected by other
packages when using setuptools pkg_resources.

The issue can be reproduced with the command:

    python3 <<EOF
    __requires__ = ["idna >= 2.5"]
    import pkg_resources
    EOF

which will fail with output:

    pkg_resources.ContextualVersionConflict: (idna 0.0.0 (/usr/lib/python3.11/site-packages), Requirement.parse('idna>=2.5'), {'hyperlink'})
    pkg_resources.DistributionNotFound: The 'idna>=2.5' distribution was not found and is required by hyperlink

This commit changes _SETUP_TYPE to pep517 to fix this issue.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-idna/python-idna.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
index 4d9994a9c7..f8641aeaf8 100644
--- a/package/python-idna/python-idna.mk
+++ b/package/python-idna/python-idna.mk
@@ -9,7 +9,7 @@ PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
 PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/8b/e1/43beb3d38dba6cb420cefa297822eac205a277ab43e5ba5d5c46faf96438
 PYTHON_IDNA_LICENSE = BSD-3-Clause
 PYTHON_IDNA_LICENSE_FILES = LICENSE.md
-PYTHON_IDNA_SETUP_TYPE = setuptools
+PYTHON_IDNA_SETUP_TYPE = pep517
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
