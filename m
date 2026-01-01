Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221A4EEB580
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC57481DF9;
	Thu,  1 Jan 2026 09:42:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kAdotFYmzUHg; Thu,  1 Jan 2026 09:42:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C429781768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260574;
	bh=uwwdiGC81FN+h63QCILNpGsFPcwnK9akCb80hobQsj0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MRa/9WgKvCukpw0mQdlIyq2hsawOXpzLaXoOSVgtqlUbiE2qnbKsin0zHzqlzOjWK
	 6GfdzO8Fak2bFN7+cZGV8AP1On1LGYwyYYtI4OoOhV+fvZ7UGvkkHWnq5jH3lG+VR9
	 2j3qLKwyK2KEaR7x5GnyxXLJq5Np4Yayj27ZBKd8W0RKCTUj3lECOYG5AUMiexAzu+
	 Y01HdpYHUIjCuR2mOSJYSQI6WOqN7Nppl8yamOEXPdFo9OSF4+OIKK5eGLoWbwHoWC
	 B1OVdWJyt/okReptnpiGwSz/vsEwCq/eu1WOwW6EYNQHNAPm/XcSPo97HyfhVILNsb
	 +Zn4awCRZgu1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C429781768;
	Thu,  1 Jan 2026 09:42:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 17AF1206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C906B8154B
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Swwm5KfxJF5Z for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8180181498
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8180181498
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80568878FB; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 10:32:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 13e9170610821ae9bb6481f6bff81f173bed635c
X-Git-Newrev: 9a964cf5134bbe9cea00f53c6e99a69b6e331834
X-Patchwork-Hint: ignore
Message-Id: <20260101094232.80568878FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-soupsieve: bump to version
 2.8.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=9a964cf5134bbe9cea00f53c6e99a69b6e331834
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-soupsieve/python-soupsieve.hash | 4 ++--
 package/python-soupsieve/python-soupsieve.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-soupsieve/python-soupsieve.hash b/package/python-soupsieve/python-soupsieve.hash
index 8dbcd237f7..be9bc3402b 100644
--- a/package/python-soupsieve/python-soupsieve.hash
+++ b/package/python-soupsieve/python-soupsieve.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/soupsieve/json
-md5  111f637c4017009883667bea09b0a442  soupsieve-2.8.tar.gz
-sha256  e2dd4a40a628cb5f28f6d4b0db8800b8f581b65bb380b97de22ba5ca8d72572f  soupsieve-2.8.tar.gz
+md5  ec2c755903968868cb307512203ef3c5  soupsieve-2.8.1.tar.gz
+sha256  4cf733bc50fa805f5df4b8ef4740fc0e0fa6218cf3006269afd3f9d6d80fd350  soupsieve-2.8.1.tar.gz
 # Locally computed sha256 checksums
 sha256  571d0dafef795a196a0bbc3ac9b160a06b3cad41c320fecd98da3e26a8c81971  LICENSE.md
diff --git a/package/python-soupsieve/python-soupsieve.mk b/package/python-soupsieve/python-soupsieve.mk
index cec1b63b19..34fec5218a 100644
--- a/package/python-soupsieve/python-soupsieve.mk
+++ b/package/python-soupsieve/python-soupsieve.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SOUPSIEVE_VERSION = 2.8
+PYTHON_SOUPSIEVE_VERSION = 2.8.1
 PYTHON_SOUPSIEVE_SOURCE = soupsieve-$(PYTHON_SOUPSIEVE_VERSION).tar.gz
-PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/6d/e6/21ccce3262dd4889aa3332e5a119a3491a95e8f60939870a3a035aabac0d
+PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/89/23/adf3796d740536d63a6fbda113d07e60c734b6ed5d3058d1e47fc0495e47
 PYTHON_SOUPSIEVE_SETUP_TYPE = hatch
 PYTHON_SOUPSIEVE_LICENSE = MIT
 PYTHON_SOUPSIEVE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
