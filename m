Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA46D5B871
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3028160F35;
	Mon, 15 Dec 2025 21:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iv2masmRfftN; Mon, 15 Dec 2025 21:38:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 618E860F31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765834732;
	bh=k2dIfG9imaE4rYKy32pC/2TvSJrviGgg77KYyynYHwQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ng9xiSeeYGcJwM4Wnq8vZ77eDHfIWpY6QRODg2c93DFbGjrgtv4iEEqz6oTP4x2Ue
	 ZNHeP3dBbV6yWgogyywcUS+oIHpWEqqWnM2NypGh43uR01WvpuiiqUhj6af/+qTEvI
	 RiAp0gUexBDmDGed7KIFr8pHGzPo9dr0W9FYu6Cf8TVlDATmPWIoJTm4WCQjMPxRHL
	 Ltm8+lKayDN3NkD5NqGF4xihntSlDh/SdCMo6Tzs7aLrPsvMATSFl4/83upUpuQZOL
	 HzB9LDavuNMUVHfDRPHQdjeyEnXIeehlseL/hhTGgaUWhdm4maX2U36BoZkE5AcTN6
	 gU43tjzqXgL9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 618E860F31;
	Mon, 15 Dec 2025 21:38:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CD0E117
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50CD340256
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BV7TTYRfTSwg for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CFC640333
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CFC640333
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BF1286FC3; Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 22:37:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ef2649936766c1db160f037d5a57f00f6fbe20b
X-Git-Newrev: 1aa015ae8d9c40476b6fabbcaebaab47546ce1b8
X-Patchwork-Hint: ignore
Message-Id: <20251215213844.7BF1286FC3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pymysql: bump version to
 1.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=1aa015ae8d9c40476b6fabbcaebaab47546ce1b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/PyMySQL/PyMySQL/blob/v1.1.2/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pymysql/python-pymysql.hash | 4 ++--
 package/python-pymysql/python-pymysql.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymysql/python-pymysql.hash b/package/python-pymysql/python-pymysql.hash
index d697dfae88..21f84af741 100644
--- a/package/python-pymysql/python-pymysql.hash
+++ b/package/python-pymysql/python-pymysql.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymysql/json
-md5  66e1b2c679250e0ae9ae037444de950a  pymysql-1.1.1.tar.gz
-sha256  e127611aaf2b417403c60bf4dc570124aeb4a57f5f37b8e95ae399a42f904cd0  pymysql-1.1.1.tar.gz
+md5  abb9c2e708ca71c6534cc04b7e4a8f86  pymysql-1.1.2.tar.gz
+sha256  4961d3e165614ae65014e361811a724e2044ad3ea3739de9903ae7c21f539f03  pymysql-1.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  314120dc65f0800f738a4b31400c76ee14decd1fbe77ce9c3540a421b86ea7b6  LICENSE
diff --git a/package/python-pymysql/python-pymysql.mk b/package/python-pymysql/python-pymysql.mk
index 742fb4f6f1..ce848d8e1b 100644
--- a/package/python-pymysql/python-pymysql.mk
+++ b/package/python-pymysql/python-pymysql.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMYSQL_VERSION = 1.1.1
+PYTHON_PYMYSQL_VERSION = 1.1.2
 PYTHON_PYMYSQL_SOURCE = pymysql-$(PYTHON_PYMYSQL_VERSION).tar.gz
-PYTHON_PYMYSQL_SITE = https://files.pythonhosted.org/packages/b3/8f/ce59b5e5ed4ce8512f879ff1fa5ab699d211ae2495f1adaa5fbba2a1eada
+PYTHON_PYMYSQL_SITE = https://files.pythonhosted.org/packages/f5/ae/1fe3fcd9f959efa0ebe200b8de88b5a5ce3e767e38c7ac32fb179f16a388
 PYTHON_PYMYSQL_LICENSE = MIT
 PYTHON_PYMYSQL_LICENSE_FILES = LICENSE
 PYTHON_PYMYSQL_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
