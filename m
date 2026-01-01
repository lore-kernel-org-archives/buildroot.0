Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98336EEB57D
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66E2381D5C;
	Thu,  1 Jan 2026 09:42:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XSIjGmuHg6z1; Thu,  1 Jan 2026 09:42:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78A1281C11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260566;
	bh=MlITGivJMpjSJnNk7pbYB+RT4TdxsqtNksDxc7u6Yzs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jKcY9iPiz70v2XfTbIlqVyqJvytc4tVUCMS7y9jjKP7UrHVfOKB27lxu87vClamNh
	 FmaaCk7UqBazvx5ZbDKbTd5pb1FkJLIXq3z1MWTF1jNkn30DJccP7r2wmcUP3/tRZL
	 HQosjl770VsYrJGEi8gfMwlo0TafPXBr2jtugDo6sGOAWvDI49BMh6JDC2KDc4Rdzo
	 dnVSOjiWIoF0eUHuQCUJ2NIlKCz17jHGC+dPw1zOdDFO68Kmo2wf3QsVsYhSbsDIWe
	 if+qv0CX7Kt3vuVV2nZiG4mRidWPXZ0mjaVDRf6+/Wr341uiQnGRBi4B74cTD6QLJw
	 lX2Pik/ROTomA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78A1281C11;
	Thu,  1 Jan 2026 09:42:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F39A351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D01F681698
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pItFhi6oZPXA for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEFE7814D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEFE7814D6
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ACFB386FB6; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 10:32:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6cb0dd4026b23a2bfde20beb22f86cad8eed952d
X-Git-Newrev: 6d31d1bb5626b8bcfd370e121b9e854b86e392f8
X-Patchwork-Hint: ignore
Message-Id: <20260101094232.ACFB386FB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ruamel-yaml: bump to
 version 0.19.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=6d31d1bb5626b8bcfd370e121b9e854b86e392f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-ruamel-yaml/python-ruamel-yaml.hash | 4 ++--
 package/python-ruamel-yaml/python-ruamel-yaml.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.hash b/package/python-ruamel-yaml/python-ruamel-yaml.hash
index db511b90fa..5f7c758070 100644
--- a/package/python-ruamel-yaml/python-ruamel-yaml.hash
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ruamel-yaml/json
-md5  ebfbf2a54d9a5b768bc849f4b2c43efc  ruamel.yaml-0.18.16.tar.gz
-sha256  a6e587512f3c998b2225d68aa1f35111c29fad14aed561a26e73fab729ec5e5a  ruamel.yaml-0.18.16.tar.gz
+md5  6966b2f273bdb08cf679f521fa0da4c2  ruamel_yaml-0.19.0.tar.gz
+sha256  ff19233e1eb3e9301e7a3d437847713e361a80faace167639327efbe8c0e5f95  ruamel_yaml-0.19.0.tar.gz
 # Locally computed sha256 checksums
 sha256  0ce9ad6a9d4f0829296a72c77d07795dd67f42751e2922be56c051d39ae1c011  LICENSE
diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.mk b/package/python-ruamel-yaml/python-ruamel-yaml.mk
index aaabee7be5..b1f7a3e039 100644
--- a/package/python-ruamel-yaml/python-ruamel-yaml.mk
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RUAMEL_YAML_VERSION = 0.18.16
-PYTHON_RUAMEL_YAML_SOURCE = ruamel.yaml-$(PYTHON_RUAMEL_YAML_VERSION).tar.gz
-PYTHON_RUAMEL_YAML_SITE = https://files.pythonhosted.org/packages/9f/c7/ee630b29e04a672ecfc9b63227c87fd7a37eb67c1bf30fe95376437f897c
+PYTHON_RUAMEL_YAML_VERSION = 0.19.0
+PYTHON_RUAMEL_YAML_SOURCE = ruamel_yaml-$(PYTHON_RUAMEL_YAML_VERSION).tar.gz
+PYTHON_RUAMEL_YAML_SITE = https://files.pythonhosted.org/packages/0c/5d/8a1de57b5a11245c61c906d422cd1e66b6778e134a1c68823a451be5759c
 PYTHON_RUAMEL_YAML_SETUP_TYPE = setuptools
 PYTHON_RUAMEL_YAML_LICENSE = MIT
 PYTHON_RUAMEL_YAML_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
