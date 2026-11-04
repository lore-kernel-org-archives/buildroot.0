Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25483606CA04
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 22:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OI7j2bY7
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75A4960820;
	Wed,  4 Nov 2026 22:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0DUHBOn1Wyv0; Wed,  4 Nov 2026 22:20:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 85DC560878
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793830830;
	b=ArTut9RQG5og20LFgZPJURGQPYwYhqJHGk5TP5y8n/+ERyUpV42+opyuhAN71hzgcrcz
	 RR5SeZvgS7HJtmxEeVA5r2OONBEyx6/zDTvFEGZ29SvFD5FIlcF+Idw+g3JM7WIFPkMAB
	 +SfAMw/GuArVQa/qw3rWLma4i3Y2/qnY9fkCB/duqCldi8NaYrCTF2C/VVWnL2vts/Ykw
	 uAgGVvotlUvB22NFVvCMKob1SjQK/Ng1ZlhjwEjd+ewlanAc0jgE05q6V+WEdIIAnMaJK
	 wPINBruu+ZWnUu8ustGfprGz4aPQ1C0sLpsi1yMiQk0ve/myYo7MLhge6n7WTlnbV/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793830830;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=sMdvUzBjj9olXK4CLptq0G9IqmzQ6wYtRlPrgwBRjkY=;
	b=fOOa6FtM8seM0rP1lWPqCcIoXtu0x4R8YJDAW4D21kh581xyLl7+P9FF7aeSYwYXKB8k
	 Z+iIn9GHA2UoiBSIX+ELFhag5UUCMXXVcBixwRsHsKsy90C66cFdRd3cHPR7Q3Gc6zE4d
	 BYjvvscxlIUSiOinkQ09AQmrWzUDoYdYmjQUqKz+0epWOfJFdT6UhwEhko2ZZtyBrlRKP
	 f+fC6+WQIdM4ByAJTF6ia96U/Izm1rAhWH32s0dzVXFJOcdNgoa9bRSzMH+0yf1HBLbCZ
	 M1nMLvBL9auKr2VePxpiW1NVUWUc0olJlAa/ZdDDqBgt4NWFm+621sNP5Di0+U2hmug==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793830830;
	bh=sMdvUzBjj9olXK4CLptq0G9IqmzQ6wYtRlPrgwBRjkY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OI7j2bY7D7ljuUnlCMJax/fLUJWCi230bcWly/L4PEyN0bM8O262SBBCQGDg6VzGS
	 grZLOcewViSnij4SoJrChrV1BIQiHn78knw/ZsxZFGJf6fWasu04VJUCQdUn3WH8aV
	 Cr/Qz4V+1AWlWK4RQoW+hn1EygwTzXNh0f0bCo93r0Zu6js/4FxZ0mO+eLEqUlAYXc
	 k9Q4vRonx3E2GBBHXoj9kUtHjCMhmQYNLiw6GfxMpaQg7J2gRxiq0Mc277krIaz6Ul
	 AG0t52SkdhvN5h7PQt34O+W7pKT1Lb8M/s91OUZrVdnN06OE1QzE+JWarLycZAmbh+
	 rjJ/GSxilzeIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85DC560878;
	Wed,  4 Nov 2026 22:20:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 03855362
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8FE14008E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:20:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A6MxOvlhsfpu for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 22:20:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1A94F40211
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A94F40211
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:20:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E32C9DF1A; Wed,  4 Nov 2026 22:18:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 23:19:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd0e3871abfc355d72dcda742ac78575f8b22085
X-Git-Newrev: 10c2e1e45ab61d9cd2edd9078f13fcca8ef399c7
X-Patchwork-Hint: ignore
Message-Id: <20261104221853.2E32C9DF1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-trio: bump to version 0.35.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/10c2e1e45ab61d9cd2edd9078f13fcca8ef399c7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-trio/python-trio.hash | 4 ++--
 package/python-trio/python-trio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-trio/python-trio.hash b/package/python-trio/python-trio.hash
index a6ef3cbceb..e0fd5e6725 100644
--- a/package/python-trio/python-trio.hash
+++ b/package/python-trio/python-trio.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/trio/json
-md5  19217ef09ab5a871de7b6165da677e34  trio-0.34.0.tar.gz
-sha256  63b9485408bdfdde544fced107045a8c0086cdc4bd0ef2f797b9e0dd111b964b  trio-0.34.0.tar.gz
+md5  9cc8a72143b8610deacafc5121f8f12c  trio-0.35.0.tar.gz
+sha256  7efb295c78a0ecd1235c5759e620b5da564ca80d2efcb0055423588547248b96  trio-0.35.0.tar.gz
 # Locally computed sha256 checksums
 sha256  418d025e1284311f2690263e6efa6bf51585e5741818ece63e5862487e505bb9  LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.APACHE2
diff --git a/package/python-trio/python-trio.mk b/package/python-trio/python-trio.mk
index 05f288642e..4dcb4ce614 100644
--- a/package/python-trio/python-trio.mk
+++ b/package/python-trio/python-trio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TRIO_VERSION = 0.34.0
+PYTHON_TRIO_VERSION = 0.35.0
 PYTHON_TRIO_SOURCE = trio-$(PYTHON_TRIO_VERSION).tar.gz
-PYTHON_TRIO_SITE = https://files.pythonhosted.org/packages/92/dc/a2d25ed73ad49cfd79bf18d262577c3731c98e382284e28d522f49a0df35
+PYTHON_TRIO_SITE = https://files.pythonhosted.org/packages/9c/e2/1db4e79abb730bbf048c1024a622b0e1e895f5b0e18c59f3f6b3e4b296ef
 PYTHON_TRIO_SETUP_TYPE = setuptools
 PYTHON_TRIO_LICENSE = Apache-2.0 or MIT
 PYTHON_TRIO_LICENSE_FILES = LICENSE LICENSE.APACHE2 LICENSE.MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
