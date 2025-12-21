Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2F2E66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 448D940778;
	Sun, 21 Dec 2025 22:12:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h7h6JPp1l1T3; Sun, 21 Dec 2025 22:12:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EE3D4078D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766355149;
	bh=AWDvAAmuaCueimLVM6pccWuTXNq8I25HC0YV600LiEs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=abDsjXcFIE5brjaONxrYt7fst3l73A5HJHAZgcax8D6ihzZfxfG5VE8YJICkekQBp
	 AyB65k40ODVTiLA6hwWcHaqw7VWyMcsZeggxwCDZ2EVbqhF399405xFDdO2DP/SyEP
	 /HgtQSID+O+6RQs8JkKafPr2lyTB8BvirSjrV+rUBZ5K12I+6FGfo6DSi2lsG20nzf
	 0ItVz52FaQvCvHqOw+xgt/0MJOOy+35OHEjdgov0V+Ld5HdQGGOFAw+H08zA3p2rg2
	 aIkcUTtjMqXO5cOIAht73xb2WqrW3aTfkIgP9FD4oBfPJ6wis+0Gw6oLFGxex2gxAI
	 NYUMihqbIpYsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EE3D4078D;
	Sun, 21 Dec 2025 22:12:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 44B47119
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 420D640146
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h-M8EbkTWDdC for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E32B400E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E32B400E3
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8BE8E874A8; Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 22:58:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5957f9e85730b56902c12fb1fa8e3281569be61
X-Git-Newrev: eb918373c448bd472ed81eed50da7bfb2bea86c2
X-Patchwork-Hint: ignore
Message-Id: <20251221221227.8BE8E874A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-boto3: bump version to
 1.42.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb918373c448bd472ed81eed50da7bfb2bea86c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/boto/boto3/blob/1.42.14/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index f8816bdf1f..ae99b5092c 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  2dd524bffeeac5d9ee37f8ca136558fc  boto3-1.42.5.tar.gz
-sha256  e3b7be255e5e29272b6424af4417005384f5a3f1caf6ca3352258ee1d9b8551a  boto3-1.42.5.tar.gz
+md5  8abc4bb707739d3ad3e9fe14b42d5234  boto3-1.42.14.tar.gz
+sha256  a5d005667b480c844ed3f814a59f199ce249d0f5669532a17d06200c0a93119c  boto3-1.42.14.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index e3da232e51..9ee51b454d 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.42.5
+PYTHON_BOTO3_VERSION = 1.42.14
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/8b/91/c00b45b5ca95184f7ab6140f586ba7d23074168ee3feae3eaf6954cc11c3
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/09/72/e236ca627bc0461710685f5b7438f759ef3b4106e0e08dda08513a6539ab
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
