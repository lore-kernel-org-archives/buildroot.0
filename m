Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DEAC433FE
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 20:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4358381FEF;
	Tue, 22 Nov 2022 20:31:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4358381FEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RTJ_T4mB9W22; Tue, 22 Nov 2022 20:31:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 786BF81FFC;
	Tue, 22 Nov 2022 20:31:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 786BF81FFC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA4A81BF285
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 20:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9428A81FFC
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 20:31:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9428A81FFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pu4sFk0n00aG for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 20:31:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30FFA81FF7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 30FFA81FF7
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 20:31:52 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.169.84.171])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 3DBB2B0052C;
 Tue, 22 Nov 2022 21:31:44 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 22 Nov 2022 21:31:24 +0100
Message-Id: <20221122203130.184496-1-ju.o@free.fr>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1669149109;
 bh=bT7fJIB2zNQab351x0hkA6GnHEGkNOnRqOpsC0wJOtA=;
 h=From:To:Cc:Subject:Date:From;
 b=RjH9crb5Wcsh7Hd3HWU2JyKJmqvcgks0Uo6KVHkBLN8l6sbrDODp2KbLWQX0pQivI
 DOYx64vz1thV1i+alH/JBGnxGapaPZcQ9BZIqvlyZl2YFA4AHTwxM8u3ukDCMjox8n
 u+zPapWPGLB/FuEpSRZG4ut5DE6fI7eLKxWg0WWKx+VAJ8f8JbhNWC6woXchLWxXhu
 qzXLZrKIPuQd2NOlGsxu2T8db8gcnXJV+/YNQkp0C9rSlrYhPAokvo8eZ+YTo76K3c
 7r6UZft+hp9YkylJl5Gp6I5HPn7wDflJCbCj/tCCNj8P+iuVF6phmsqn+T+sOAlHO1
 99G6FFP4ML2+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RjH9crb5
Subject: [Buildroot] [PATCH next v2 1/7] package/python-idna: set
 _SETUP_TYPE = flit
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

This commit changes _SETUP_TYPE to "flit" to fix this issue.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v1 -> v2:
- Included James' review comment:
  - _SETUP_TYPE changed from pep517 to flit
---
 package/python-idna/python-idna.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
index 4d9994a9c7..3976cb1518 100644
--- a/package/python-idna/python-idna.mk
+++ b/package/python-idna/python-idna.mk
@@ -9,7 +9,7 @@ PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
 PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/8b/e1/43beb3d38dba6cb420cefa297822eac205a277ab43e5ba5d5c46faf96438
 PYTHON_IDNA_LICENSE = BSD-3-Clause
 PYTHON_IDNA_LICENSE_FILES = LICENSE.md
-PYTHON_IDNA_SETUP_TYPE = setuptools
+PYTHON_IDNA_SETUP_TYPE = flit
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
