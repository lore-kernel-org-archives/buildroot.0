Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46D4C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 20:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69A2B40BD2;
	Thu,  3 Nov 2022 20:57:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69A2B40BD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0XDZwfOdkpUN; Thu,  3 Nov 2022 20:57:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84E2040BD4;
	Thu,  3 Nov 2022 20:57:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84E2040BD4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 02F7C1BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8AFE4179F
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8AFE4179F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gzbeAY4LeZ7n for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A66A041715
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A66A041715
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95EF487BCF; Thu,  3 Nov 2022 20:55:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:03:54 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f8a8b58aadfd484c36dd6b164f67aca56f4091db
X-Git-Newrev: effab27db24de3999fb36768d16d4bceb1faefe1
X-Patchwork-Hint: ignore
Message-Id: <20221103205511.95EF487BCF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-entrypoints:
 bump to version 0.4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=effab27db24de3999fb36768d16d4bceb1faefe1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Migrate to flit package infrastructure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-entrypoints/python-entrypoints.hash | 4 ++--
 package/python-entrypoints/python-entrypoints.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-entrypoints/python-entrypoints.hash b/package/python-entrypoints/python-entrypoints.hash
index 95c092e5e0..a8deb85614 100644
--- a/package/python-entrypoints/python-entrypoints.hash
+++ b/package/python-entrypoints/python-entrypoints.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/entrypoints/json
-md5  c5c61ea2e46a0c50ea08f4af7955a0b1  entrypoints-0.3.tar.gz
-sha256  c70dd71abe5a8c85e55e12c19bd91ccfeec11a6e99044204511f9ed547d48451  entrypoints-0.3.tar.gz
+md5  3acd8b72119a8fb1eac7030c24ac6b49  entrypoints-0.4.tar.gz
+sha256  b706eddaa9218a19ebcd67b56818f05bb27589b1ca9e8d797b74affad4ccacd4  entrypoints-0.4.tar.gz
 # Locally computed sha256 checksums
 sha256  de5fcd7349cdf399b0707a2a024833c4704743650133c72d6f0ff7561a03a848  LICENSE
diff --git a/package/python-entrypoints/python-entrypoints.mk b/package/python-entrypoints/python-entrypoints.mk
index 7ab1b4d64a..287b83605d 100644
--- a/package/python-entrypoints/python-entrypoints.mk
+++ b/package/python-entrypoints/python-entrypoints.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_ENTRYPOINTS_VERSION = 0.3
+PYTHON_ENTRYPOINTS_VERSION = 0.4
 PYTHON_ENTRYPOINTS_SOURCE = entrypoints-$(PYTHON_ENTRYPOINTS_VERSION).tar.gz
-PYTHON_ENTRYPOINTS_SITE = https://files.pythonhosted.org/packages/b4/ef/063484f1f9ba3081e920ec9972c96664e2edb9fdc3d8669b0e3b8fc0ad7c
-PYTHON_ENTRYPOINTS_SETUP_TYPE = distutils
+PYTHON_ENTRYPOINTS_SITE = https://files.pythonhosted.org/packages/ea/8d/a7121ffe5f402dc015277d2d31eb82d2187334503a011c18f2e78ecbb9b2
+PYTHON_ENTRYPOINTS_SETUP_TYPE = flit
 PYTHON_ENTRYPOINTS_LICENSE = MIT
 PYTHON_ENTRYPOINTS_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
