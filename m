Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89263E95A8D
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 13:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE9F081DE2;
	Tue, 30 Dec 2025 13:00:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jh_8Rt9u5tRF; Tue, 30 Dec 2025 13:00:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97BC6811AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767099634;
	bh=2mdNeP2vSpdo+Q/T0LOwZ9ot6jtnzlPh6XvO3gTZRb0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Mk8GD+mMeUOjVhky3aM3kXtKux9pz3W7DTD0/OHP7Mo8XUURO2LfFTmbVTb8wO48p
	 7Xfp4XSVnq7H91jqVZCvtAbo5a8UklJ8VLOK1dpC2YdUr90MaFCyCkp8feeiTsldBM
	 QHBwfzzcww/4i2j/hUfhgQSjOqJt2gMdDWyfTw3taYkupqzEg7iZuRvWo8kxlF4hwn
	 6X3mYF1j4gk5xQ40L90aSqrHkFk+DTxX3AExYEsgmmrhkeeJlgRbhEpJcwYtaglfAL
	 TV8bmk5Ni2bMra98D6RyL73q5dY5PU/PvkaE8NM/SJaMixsQPBBNdaAk7W34b47ZGX
	 KNqWhLj4ut4hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97BC6811AE;
	Tue, 30 Dec 2025 13:00:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D358177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36B5F4013F
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:00:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BhXchFiZU6tT for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DAE3404C7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DAE3404C7
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C05B87A7C; Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 14:00:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d50e0fa0facfec7cbdab7af36281dfbefefd5a79
X-Git-Newrev: f2a4b8c5d6853c76335ebd8d9dacbd508ffaf8a3
X-Patchwork-Hint: ignore
Message-Id: <20251230130026.6C05B87A7C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiosqlite: bump to version
 0.22.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=f2a4b8c5d6853c76335ebd8d9dacbd508ffaf8a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-aiosqlite/python-aiosqlite.hash | 4 ++--
 package/python-aiosqlite/python-aiosqlite.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiosqlite/python-aiosqlite.hash b/package/python-aiosqlite/python-aiosqlite.hash
index b47cdaf6a2..b577de149e 100644
--- a/package/python-aiosqlite/python-aiosqlite.hash
+++ b/package/python-aiosqlite/python-aiosqlite.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiosqlite/json
-md5  1277d7c460a278cc165ae52be14f8fa9  aiosqlite-0.22.0.tar.gz
-sha256  7e9e52d72b319fcdeac727668975056c49720c995176dc57370935e5ba162bb9  aiosqlite-0.22.0.tar.gz
+md5  254707dc29315a01a95728d749d13e56  aiosqlite-0.22.1.tar.gz
+sha256  043e0bd78d32888c0a9ca90fc788b38796843360c855a7262a532813133a0650  aiosqlite-0.22.1.tar.gz
 # Locally computed sha256 checksums
 sha256  ab0c171dc3ef8bf325a84bb77d855421f2611335ddf6e08816b2922c4edc0f76  LICENSE
diff --git a/package/python-aiosqlite/python-aiosqlite.mk b/package/python-aiosqlite/python-aiosqlite.mk
index 208960954d..89fffbeaa7 100644
--- a/package/python-aiosqlite/python-aiosqlite.mk
+++ b/package/python-aiosqlite/python-aiosqlite.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOSQLITE_VERSION = 0.22.0
+PYTHON_AIOSQLITE_VERSION = 0.22.1
 PYTHON_AIOSQLITE_SOURCE = aiosqlite-$(PYTHON_AIOSQLITE_VERSION).tar.gz
-PYTHON_AIOSQLITE_SITE = https://files.pythonhosted.org/packages/3a/0d/449c024bdabd0678ae07d804e60ed3b9786facd3add66f51eee67a0fccea
+PYTHON_AIOSQLITE_SITE = https://files.pythonhosted.org/packages/4e/8a/64761f4005f17809769d23e518d915db74e6310474e733e3593cfc854ef1
 PYTHON_AIOSQLITE_SETUP_TYPE = flit
 PYTHON_AIOSQLITE_LICENSE = MIT
 PYTHON_AIOSQLITE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
