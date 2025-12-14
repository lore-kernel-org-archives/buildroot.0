Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25DBD59D99
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 17:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B11D881517;
	Sun, 14 Dec 2025 17:47:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VQ_hAiAODRbg; Sun, 14 Dec 2025 17:47:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAE6C81518
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765734474;
	bh=pY7lqR80Py+Ou8OQNPAiyPsxQi9z1Us4W6i9WQUuUPk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pkhfBs9gWeQM2H+tJUMI487UuBn938rbZLMp40KIttv1PNIAHUXRVWi6tWRIHwu1P
	 tWlZC1ztcmM03qRubyHyCpjPnXbFoXhC2HuVNDgAqJoSeXoPtNHUyGm8B1i5yU8WJW
	 93RhC4xl0bpTm1TwsagK9iqVZVCbLqoYc3kEPSLznOHus6VxJ1vJMGkmC2NQ5DII+U
	 SxxB0m6Yq5/2UpgwYHNlb8KcxUwWR32mrYPsxZAuG/1EzS/DkeoM+zJlihNHtZi8ZU
	 KGaMqkufVAINRWmCzh+gfs8FkTFo8MKxY4gRSH9HzQcY3DnWX8K0c7zV4NwfYIKxgf
	 Lm23rupta28WQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAE6C81518;
	Sun, 14 Dec 2025 17:47:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 27D6A2D0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E4AD8144D
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0SJ8MPJlrQ-h for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 17:47:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD2ED81340
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD2ED81340
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B61886E96; Sun, 14 Dec 2025 17:47:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 18:47:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 00108540f78b073db67cb11dc2b7160c9e381bde
X-Git-Newrev: ecf116f9509a87b3633fb8a11d4adc01fabfe114
X-Patchwork-Hint: ignore
Message-Id: <20251214174742.8B61886E96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiofiles: bump version to
 25.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ecf116f9509a87b3633fb8a11d4adc01fabfe114
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/Tinche/aiofiles/blob/v25.1.0/CHANGELOG.md

Added dependency to host-python-hatch-vcs to fix build error which would
be introduced by this bump.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-aiofiles/python-aiofiles.hash | 4 ++--
 package/python-aiofiles/python-aiofiles.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-aiofiles/python-aiofiles.hash b/package/python-aiofiles/python-aiofiles.hash
index f68b0b55b5..0016fd58c8 100644
--- a/package/python-aiofiles/python-aiofiles.hash
+++ b/package/python-aiofiles/python-aiofiles.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiofiles/json
-md5  530273426ff7ee50283e52186e185c81  aiofiles-24.1.0.tar.gz
-sha256  22a075c9e5a3810f0c2e48f3008c94d68c65d763b9b03857924c99e57355166c  aiofiles-24.1.0.tar.gz
+md5  7a92207aab48342239959dc5ccffb81d  aiofiles-25.1.0.tar.gz
+sha256  a8d728f0a29de45dc521f18f07297428d56992a742f0cd2701ba86e44d23d5b2  aiofiles-25.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/python-aiofiles/python-aiofiles.mk b/package/python-aiofiles/python-aiofiles.mk
index 79e4a2cacd..aeabb42d22 100644
--- a/package/python-aiofiles/python-aiofiles.mk
+++ b/package/python-aiofiles/python-aiofiles.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_AIOFILES_VERSION = 24.1.0
+PYTHON_AIOFILES_VERSION = 25.1.0
 PYTHON_AIOFILES_SOURCE = aiofiles-$(PYTHON_AIOFILES_VERSION).tar.gz
-PYTHON_AIOFILES_SITE = https://files.pythonhosted.org/packages/0b/03/a88171e277e8caa88a4c77808c20ebb04ba74cc4681bf1e9416c862de237
+PYTHON_AIOFILES_SITE = https://files.pythonhosted.org/packages/41/c3/534eac40372d8ee36ef40df62ec129bee4fdb5ad9706e58a29be53b2c970
 PYTHON_AIOFILES_SETUP_TYPE = hatch
 PYTHON_AIOFILES_LICENSE = Apache-2.0
 PYTHON_AIOFILES_LICENSE_FILES = LICENSE
+PYTHON_AIOFILES_DEPENDENCIES = host-python-hatch-vcs
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
