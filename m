Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7910E95A8B
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 13:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77EB080F82;
	Tue, 30 Dec 2025 13:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Svm8kbq2MRwl; Tue, 30 Dec 2025 13:00:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9FB381100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767099629;
	bh=HXWolmdtp+b8Z00gcG/Ycg3XEAHcZ/JYBlZfuty/V2o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KOip1F5GkrzJp9x9324DZVFPa4jGRqdQXrgb3vp7zDaGEjniS5HKBvKiR9roOybZR
	 wOD8GyTMfi2mlMCTs4eoAkGzOckxiZElZF4mOS1h2kDrP71O1+2nZoDiCnRjkO0lFu
	 OavObPteoBdvyBKtM/weAPpWHiYnDpgGeHHemwMjA47b47ZUTCDDwrWwdMhuqXVwoV
	 DUfXik4/RKbFqHtXeMQaEaKmYJbALi4Z06H9zkxEL2VEqQNfIZDriK/0VqEA9ERN3E
	 CeYVCuxSPLifcet9ZlVaeZfYooiTyLVNtEJFANZxwjiOlOs3DitVCw6fn8DbCk9cdH
	 GWh0Li0S9/O9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9FB381100;
	Tue, 30 Dec 2025 13:00:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F0D61372
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE57040509
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jF9WOip6XEkp for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23A4C404D5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23A4C404D5
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1EBA487A6A; Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 13:44:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a11a8784c0d84029b85a3d0dd05260ea0854e5a7
X-Git-Newrev: 063e25de6f418cee8082c5398e546b4842ee435c
X-Patchwork-Hint: ignore
Message-Id: <20251230130026.1EBA487A6A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pypika-tortoise: bump to
 version 0.6.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=063e25de6f418cee8082c5398e546b4842ee435c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pypika-tortoise/python-pypika-tortoise.hash | 4 ++--
 package/python-pypika-tortoise/python-pypika-tortoise.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.hash b/package/python-pypika-tortoise/python-pypika-tortoise.hash
index 7e9f397638..9dc7ea9aa0 100644
--- a/package/python-pypika-tortoise/python-pypika-tortoise.hash
+++ b/package/python-pypika-tortoise/python-pypika-tortoise.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pypika-tortoise/json
-md5  5b5c1be4096c75dd6994336f71936383  pypika_tortoise-0.6.2.tar.gz
-sha256  f95ab59d9b6454db2e8daa0934728458350a1f3d56e81d9d1debc8eebeff26b3  pypika_tortoise-0.6.2.tar.gz
+md5  21a08e348b537e745964323874f5a6fc  pypika_tortoise-0.6.3.tar.gz
+sha256  6e17f00e77e78468836cb5c63eb6dc01445f83b1167e4f29f1c678949179c079  pypika_tortoise-0.6.3.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.mk b/package/python-pypika-tortoise/python-pypika-tortoise.mk
index 7fa451f67d..72669f36b2 100644
--- a/package/python-pypika-tortoise/python-pypika-tortoise.mk
+++ b/package/python-pypika-tortoise/python-pypika-tortoise.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPIKA_TORTOISE_VERSION = 0.6.2
+PYTHON_PYPIKA_TORTOISE_VERSION = 0.6.3
 PYTHON_PYPIKA_TORTOISE_SOURCE = pypika_tortoise-$(PYTHON_PYPIKA_TORTOISE_VERSION).tar.gz
-PYTHON_PYPIKA_TORTOISE_SITE = https://files.pythonhosted.org/packages/1a/7b/0a31165e22e599ba149ba35d4323d343205a70d91a4f6e8c6565f5b4fa08
+PYTHON_PYPIKA_TORTOISE_SITE = https://files.pythonhosted.org/packages/cc/28/86ec1bccb2609d20349def444ef9dfe84aeccc984caa62f4634d50fee164
 PYTHON_PYPIKA_TORTOISE_SETUP_TYPE = pep517
 PYTHON_PYPIKA_TORTOISE_LICENSE = Apache-2.0
 PYTHON_PYPIKA_TORTOISE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
