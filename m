Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966B3D5B873
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BD0940413;
	Mon, 15 Dec 2025 21:38:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8JoBlnT3rLQy; Mon, 15 Dec 2025 21:38:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 890FA40B00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765834736;
	bh=vYu8DXIGMDLdXPOFLuMZZeBrbaiSsQW2FQn2Md/zuTY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fLduJowZ6Hd0GY3QUH0JQ06PlFeIAPplOO1U4Y12hoHA+aeTT/zyQZjp4gUW+CeII
	 mANqhc9zXm775p0B2jmwXgkT39Tn3DI19D7AOoGijgtN0w4o/BbSroafSXLbk6oiRh
	 q4VEsxuZOeSDVmg5YVom/8jpUpF7moDgV79ZdifZFFzH73/2EJ1gI3P2uqTvMS+7ru
	 oxPDMnSARHx82hymQTckYIpEvn0o1bHMy2Q4xLvvQ69XDa9r21pMCBGTICqvcKTR0u
	 Ur9eV2KlhnGWT8PhvGrRzk/obAe/QMA6jrzXmb708EnYyy88DhyElzF9DiNPSQ59DW
	 mMzt9Sb4RE2Hw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 890FA40B00;
	Mon, 15 Dec 2025 21:38:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D83825A
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7ED140333
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cDKGSeWAGm2H for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:38:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D2024039E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D2024039E
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C0E186FC4; Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 22:37:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e1a7d30ea164d7606d926981b58ebed7bc81c77
X-Git-Newrev: 4519ffe428fc6e7f227bf177e6bbbffb05549a5c
X-Patchwork-Hint: ignore
Message-Id: <20251215213844.8C0E186FC4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyparsing: bump version to
 3.2.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=4519ffe428fc6e7f227bf177e6bbbffb05549a5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/pyparsing/pyparsing/blob/3.2.5/CHANGES

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pyparsing/python-pyparsing.hash | 4 ++--
 package/python-pyparsing/python-pyparsing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyparsing/python-pyparsing.hash b/package/python-pyparsing/python-pyparsing.hash
index b6ca80b040..d3323e173c 100644
--- a/package/python-pyparsing/python-pyparsing.hash
+++ b/package/python-pyparsing/python-pyparsing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyparsing/json
-md5  0af29922e2f22dbc2569b88917b44f52  pyparsing-3.2.1.tar.gz
-sha256  61980854fd66de3a90028d679a954d5f2623e83144b5afe5ee86f43d762e5f0a  pyparsing-3.2.1.tar.gz
+md5  49f6a72433130541fd92c56b110061d2  pyparsing-3.2.5.tar.gz
+sha256  2df8d5b7b2802ef88e8d016a2eb9c7aeaa923529cd251ed0fe4608275d4105b6  pyparsing-3.2.5.tar.gz
 # Locally computed sha256 checksums
 sha256  10d5120a16805804ffda8b688c220bfb4e8f39741b57320604d455a309e01972  LICENSE
diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index cb19f54ca1..5d478a18c2 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPARSING_VERSION = 3.2.1
+PYTHON_PYPARSING_VERSION = 3.2.5
 PYTHON_PYPARSING_SOURCE = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
-PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/8b/1a/3544f4f299a47911c2ab3710f534e52fea62a633c96806995da5d25be4b2
+PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/f2/a5/181488fc2b9d093e3972d2a472855aae8a03f000592dbfce716a512b3359
 PYTHON_PYPARSING_LICENSE = MIT
 PYTHON_PYPARSING_LICENSE_FILES = LICENSE
 PYTHON_PYPARSING_SETUP_TYPE = flit
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
