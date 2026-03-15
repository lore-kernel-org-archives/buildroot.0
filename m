Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11592F3028A
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDC19613B5;
	Sun, 15 Mar 2026 22:19:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iXd8bTKZVEeR; Sun, 15 Mar 2026 22:19:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7D44613C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613165;
	bh=3mY0dFHIvIvcxattwPVRO2fEfifBhUfmtnnsav0Lu/M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rOCZg4iH+C6Sm2l+RvkVkp8gdl08oGceEzkXgPyH7xzEnvDaGZ5s6gA3TMH1pR/uY
	 t4m6SSKIeUHvAtrhFxxhDd9mIK7wt79CQ2VXImmdmbq8kyID8/N3SnZ8abi6A33tBw
	 GY03L7F8QrChMDo6QUIV86aVTm5ZCswl91b845gztS6xhQabWyuZZVyY/Fm9M3/mmA
	 rY7vxtnGYQfad9itVEYcj4j16DsVIy2PuZXNTjtg+t2cB/WIwkG2NOubYGkoc9w8hi
	 UWcftsXNbJS4FEc+DDLDer6JstIvyLLL3iNYP1gldH/mbtVYqz1cwfvd6d/x07jP/U
	 2EgLSu7ms+H9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7D44613C1;
	Sun, 15 Mar 2026 22:19:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10ACE357
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62EF640B79
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t5VLaRLvs2ue for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA14E40AAB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA14E40AAB
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB5D780FBC; Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c30b1e522988ffe5d4b300b2447f912b83558ad
X-Git-Newrev: 5963fb870cb0cb07d2168f6f0a487f0e1960af25
X-Patchwork-Hint: ignore
Message-Id: <20260315221803.EB5D780FBC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-smbprotocol: bump version
 to 1.16.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5963fb870cb0cb07d2168f6f0a487f0e1960af25
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/jborean93/smbprotocol/blob/v1.16.0/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-smbprotocol/python-smbprotocol.hash | 4 ++--
 package/python-smbprotocol/python-smbprotocol.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-smbprotocol/python-smbprotocol.hash b/package/python-smbprotocol/python-smbprotocol.hash
index ad0c547d7a..ca8889029a 100644
--- a/package/python-smbprotocol/python-smbprotocol.hash
+++ b/package/python-smbprotocol/python-smbprotocol.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/smbprotocol/json
-md5  3ff374488f4760f2f40e799e69671c40  smbprotocol-1.15.0.tar.gz
-sha256  3c892f4c22ab147d0576a3a8d34279831b26ab4695b7df911a334bc41f6d652a  smbprotocol-1.15.0.tar.gz
+md5  cf9607c3d117e2c53b907f78702808b9  smbprotocol-1.16.0.tar.gz
+sha256  babeb6fa825ba57939f9637c49a34548ddca348386d34de0796d1f87882c0bda  smbprotocol-1.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4c3c550abc2b04c507ed0d641dd7e524eaff5bd06c7862af957301836d496d15  LICENSE
diff --git a/package/python-smbprotocol/python-smbprotocol.mk b/package/python-smbprotocol/python-smbprotocol.mk
index 6b35cb170e..5978b3847e 100644
--- a/package/python-smbprotocol/python-smbprotocol.mk
+++ b/package/python-smbprotocol/python-smbprotocol.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SMBPROTOCOL_VERSION = 1.15.0
+PYTHON_SMBPROTOCOL_VERSION = 1.16.0
 PYTHON_SMBPROTOCOL_SOURCE = smbprotocol-$(PYTHON_SMBPROTOCOL_VERSION).tar.gz
-PYTHON_SMBPROTOCOL_SITE = https://files.pythonhosted.org/packages/c7/b4/68d75ae0c2f925976c7a58dd9bd26741378c79c6d56d57c72fabcbe595c4
+PYTHON_SMBPROTOCOL_SITE = https://files.pythonhosted.org/packages/c0/5e/1eb2adb1e4739e8a1571f4a641850569ed65d72f72e3d3fd4b121e424795
 PYTHON_SMBPROTOCOL_SETUP_TYPE = setuptools
 PYTHON_SMBPROTOCOL_LICENSE = MIT
 PYTHON_SMBPROTOCOL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
