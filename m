Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95316FC6165
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A60980A8C;
	Fri,  2 Jan 2026 22:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ievBKuvKZwFi; Fri,  2 Jan 2026 22:01:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CB0681200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767391275;
	bh=DBaHVCKDtIDN9tJpLiDyu80kFafgweGhknekpZzxSYo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ETecLXDX/WIl/2pZNReKD5IVWBEjiLqkefs7HuHwd/Gozix7BVzpkLhbdWH9FripP
	 j94uh2DQH26F1RDS9bYIpLQ9PQarycHRBhvovsTsPQ0gnC9VuHP/2GGYWdLk7S5N4S
	 x22H9YkQ1aBhIHeEVdXwjREmSoJWPCPtORmigxuwVa/LrSnmpf8Q20OXLFZGsqYMi9
	 llWhr7VdNeXYKG/2XL3EEEkpTkTaKTUJEK6WrKVhDlS/DkzU8vkbhRnAXgN84Slh13
	 hJgw+64TglD4L3/jFwSKdHR3uCrM6FYHpErhEDdynI0irk75WPHb0BVtk44In8c95u
	 lmcQYJoSuOiCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CB0681200;
	Fri,  2 Jan 2026 22:01:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B6CE972
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DD7280A88
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yTxrAb5IReox for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:01:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34F6A80A8A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34F6A80A8A
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:01:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 212C888115; Fri,  2 Jan 2026 22:01:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 22:59:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 174ff88a966f561c3f78f8403108c7de9423cf8c
X-Git-Newrev: 0642c5301349574efb0549138eb516b243dd8453
X-Patchwork-Hint: ignore
Message-Id: <20260102220105.212C888115@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mistune: bump to version
 3.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0642c5301349574efb0549138eb516b243dd8453
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-mistune/python-mistune.hash | 4 ++--
 package/python-mistune/python-mistune.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mistune/python-mistune.hash b/package/python-mistune/python-mistune.hash
index c790096af8..b5478a6d57 100644
--- a/package/python-mistune/python-mistune.hash
+++ b/package/python-mistune/python-mistune.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mistune/json
-md5  47bd96502dcf22434a329b1814769480  mistune-3.1.4.tar.gz
-sha256  b5a7f801d389f724ec702840c11d8fc48f2b33519102fc7ee739e8177b672164  mistune-3.1.4.tar.gz
+md5  26272a8d5ee997f80b32a93e51a24b54  mistune-3.2.0.tar.gz
+sha256  708487c8a8cdd99c9d90eb3ed4c3ed961246ff78ac82f03418f5183ab70e398a  mistune-3.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  539013fd8e19f744f8bf0e27a532bbff54cd689ecef7a800f56ae5dc824be870  LICENSE
diff --git a/package/python-mistune/python-mistune.mk b/package/python-mistune/python-mistune.mk
index b5ec61e3a3..b67700b1a7 100644
--- a/package/python-mistune/python-mistune.mk
+++ b/package/python-mistune/python-mistune.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MISTUNE_VERSION = 3.1.4
+PYTHON_MISTUNE_VERSION = 3.2.0
 PYTHON_MISTUNE_SOURCE = mistune-$(PYTHON_MISTUNE_VERSION).tar.gz
-PYTHON_MISTUNE_SITE = https://files.pythonhosted.org/packages/d7/02/a7fb8b21d4d55ac93cdcde9d3638da5dd0ebdd3a4fed76c7725e10b81cbe
+PYTHON_MISTUNE_SITE = https://files.pythonhosted.org/packages/9d/55/d01f0c4b45ade6536c51170b9043db8b2ec6ddf4a35c7ea3f5f559ac935b
 PYTHON_MISTUNE_LICENSE = BSD-3-Clause
 PYTHON_MISTUNE_LICENSE_FILES = LICENSE
 PYTHON_MISTUNE_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
