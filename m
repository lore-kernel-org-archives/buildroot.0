Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1879CCD3424
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E25916130A;
	Sun,  3 May 2026 14:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YNuiyAaux1U3; Sun,  3 May 2026 14:50:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA0B461311
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819849;
	bh=/gFWrVWbkpX5jfTpKB3uQ2ClvGJJDICcidvxdeBAEdg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Eav5zopGzwf/4jKlCRheguWZpDPIgoudmBgSJoIH/twp8KbUWONANGJF+f2X/q6Y2
	 gyQ+IRMKuMJ1isMCrcmzhCLT+E3b0bj53NdLwfF/QSwrNcWCyh05Aog/xPfzPMF6aT
	 wj56JuP6K2kdE0GXLb+udZH1XEoWRhaHqaWVo2dDamSPRUONtnjqNBzWatrL6+vCpv
	 BiR/CtnShF8kO8rBk9ilRGPMYX9dBvCd3B/G3avqz9UyRnETBdhxbhEgRyNV7vCgmJ
	 wp812BxwaLqT3oGCUQxtA9gPyz5altBggZj+KNPMT1vx33+z340w0mg1jymMYjHcRF
	 TmGd4uoaecH3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA0B461311;
	Sun,  3 May 2026 14:50:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5919E392
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D8EA4074C
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ruAo2bI3H4fh for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AFEF4046D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7AFEF4046D
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2616383FAE; Sun,  3 May 2026 14:50:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5aca3c0433834e6bddb3ef2ad8f7cb02b7726a3e
X-Git-Newrev: 703a7bde26ffe0d1adcbac8fe48cbbc4c1d98769
X-Patchwork-Hint: ignore
Message-Id: <20260503145029.2616383FAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-marshmallow-sqlalchemy:
 bump version to 1.5.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/703a7bde26ffe0d1adcbac8fe48cbbc4c1d98769
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/marshmallow-code/marshmallow-sqlalchemy/blob/1.5.0/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash  | 4 ++--
 .../python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
index 138b09170d..1d1385026a 100644
--- a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
+++ b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/marshmallow-sqlalchemy/json
-md5  6bb2860c9acfd128b562f92f72d00e69  marshmallow_sqlalchemy-1.4.2.tar.gz
-sha256  6410304bf98ec26ea35f3f9d3cee82e51fd093c434612add32a0bdcdb5668f7c  marshmallow_sqlalchemy-1.4.2.tar.gz
+md5  ad62daa42396557252047d43e69227bd  marshmallow_sqlalchemy-1.5.0.tar.gz
+sha256  e51192c204770645a2fab0d72f44f8789272eef75951f84b1608d6b4b0bfe0e6  marshmallow_sqlalchemy-1.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  906b5d9051e426144cb173ad911667b8ebd05a9c584c2c26c135b32a3ed12001  LICENSE
diff --git a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
index 4f9bd1887f..15715d9006 100644
--- a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
+++ b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION = 1.4.2
+PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION = 1.5.0
 PYTHON_MARSHMALLOW_SQLALCHEMY_SOURCE = marshmallow_sqlalchemy-$(PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION).tar.gz
-PYTHON_MARSHMALLOW_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/1d/8c/861ed468b99773866d59e315a73a02538f503c99167d24b3b3f1c8e0242c
+PYTHON_MARSHMALLOW_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/ee/fe/247c297809e64116f766716632adbc3f4cd06f376f56dc15bb92f170d247
 PYTHON_MARSHMALLOW_SQLALCHEMY_SETUP_TYPE = flit
 PYTHON_MARSHMALLOW_SQLALCHEMY_LICENSE = MIT
 PYTHON_MARSHMALLOW_SQLALCHEMY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
