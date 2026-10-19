Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1062606A31E
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 17:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aZej7L6N
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5909E406B9;
	Mon, 19 Oct 2026 17:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s984Oy81324p; Mon, 19 Oct 2026 17:45:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E51F74069B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792431951;
	b=BVrgBe7bhSCclJZx/C2N2Su1lJc6/KKXjjEUs5SwXZQg7fx7mQpdMKUP+etVQs7fKoim
	 t024w1Lp8rbNt7pm2X8TiFbWS4NX0OuKZqewPHN5f+lqMtR2YiioiWhzA9k5+ve/I1aNj
	 BWQ2Pu9bF76DOkFf75KrgmpMBt8x0Kb92GPWpxAi/12KD1pasvoL9DXhLULMELXiopDUB
	 S4tkuaJksH+2qeMwicJopDeTsW/e7mlBJJyChDmKh4DjLBfvxhhcDA5+Onm8jtHoH4YKn
	 H7XoFXh39X/WYVkZGZIqBIuG0zWnUP8ck1chcQKNCjWXCtfpB1fk9yTOPx4JyGZ5whA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792431951;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FwHatk/BhQbknuOojHh8GRmW6avTE68WbkfbtoZ3uR0=;
	b=PgGLdK70BDCVs6kwgqEeB8a4nVK1u0CVUr0oGLBGjuPLfvSVzoBIjyiW4e0CezvEu+JK
	 E0iGYtb2dyAbsOmY0d3uv1qc1E5Vhn8xaa88fn7GgNBYRFOnog5+7rUD5XoXXc0V6OXOY
	 +AKi6bour5lvlfxBBZU4NRzOH9uffZbwZEEigxJvixel9jjC8O8aLCR8p6JE+gqt66AWr
	 GrwMMMlTDKQtwRJSGALHZH256n47ehnSsnGy33eoGABqDA64Egk6M6Og39JruQP5XdU7v
	 YcQ33/BRq19iJiqHM09BvGkcLDPn17cW4LTykrMBJ2AO9Sq/04PanxfDwSxaNJciGyg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792431951;
	bh=FwHatk/BhQbknuOojHh8GRmW6avTE68WbkfbtoZ3uR0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aZej7L6NkE68lqAFueNXN8/XFiKV2SuNwciT0fXH8Ax0806suapNQd3U0uwyr92XV
	 FQhP/3hR1awnXGShjkSrVgHCO5xnnvpEC+sXlhODtafTCezRb8dQC80UGiVCMnDnwy
	 FvgBl9UUeqv+It1kT6wn8G0eGC4LELYwsyAzc0VAYRFr/KIwbM1hf0aOZ2Gwt5BFhm
	 N70MFII9PVAGcjIGvSHVKzaNOMc1Q6vgki2YCERxzc1+/VEoYvlamuvw5tGAdSBheT
	 7ZolT5k2TGIddc1ApqplyY7/7+OV0U+l/kpBbBDvcoiG1iPbKu+OQ/UkqK1wz55TK9
	 ZVF4oBFYNStTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E51F74069B;
	Mon, 19 Oct 2026 17:45:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F132011CB
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E03A84062E
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:45:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jFVDl3UWsGfB for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 17:45:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1F3064060A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792431946;
 b=aOP1GJZBOWxGsLCd2P3QYRb02wsOfoP+KS89sJ/9JsIGJiQM+bOWuJ5Kmr8SaNDSnuns
 A7ory7xwNra8g03PxJyMJNyjj2dwRNXDX5B9Q3IVjDUagdh7moB3MTE6teJppv8dquDHJ
 802SvYC0jvq3KC95HNk04ciTvb7b+T3xEs8y+7bIjc3sOq4fLMs/hp8kRG0ORIqhAXiy1
 cTc7zHuahvtLexriY85WtSHHkKKZNnHRBqy4KOzLKiWB+aZrnqtTK0PlCVLQLqemaIQN4
 M9/NkVRclSRiLMJkh8J+oWT8tBfVMtdAZ4JgMJkioZtIh/Nygu1nKqkqttEaT0wV1cQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792431946;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ARIsoW4HqAGuHXWkGKTN4EneBQSefU0v5dyqEeTBl0M=;
 b=Q58F5TqQYTiHbr2Fo9cDgTcrbz9LIEkp1tWpkXGC52QCV2iRpBIgm3Ea0pdG3QmEGvJQ
 8pSPod21qa8Ytbp4dp++G7F/pb/a2KUYqS5bY0FvV0D67rMTTGGcuKWfD1FnQy7h3o24l
 skwKDPb9uwaCIkyog2JE9Tg3AYZtaXE9lY/u33bBpC78SOKUwuF5LWB4pT5oaAz1yiz+W
 9Ov9ln1fzl72HorVRKjudU6yJXHd3Sx3cBlANRC72DkM/h3rwD3C4THPqjoxF0UOzYuTg
 /048mR4nTuFllckbNJxYF1VNe3PpH025mD1wYnRprG2FWS2bjNyz6XPytficZbA+5tA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F3064060A
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:45:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64B7098CAD; Mon, 19 Oct 2026 17:44:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 19:33:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bde0ece5c21deb6e9f50c274025a98de4e8f40c8
X-Git-Newrev: 3057e90598e166dca597fa75b9fdb3ed03b5bb9d
X-Patchwork-Hint: ignore
Message-Id: <20261019174423.64B7098CAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-shellingham: new package
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3057e90598e166dca597fa75b9fdb3ed03b5bb9d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                  |  1 +
 package/python-shellingham/Config.in               |  6 ++++++
 package/python-shellingham/python-shellingham.hash |  5 +++++
 package/python-shellingham/python-shellingham.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index bbf138061a..1d20359c8c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1432,6 +1432,7 @@ menu "External python modules"
 	source "package/python-setproctitle/Config.in"
 	source "package/python-setuptools/Config.in"
 	source "package/python-sh/Config.in"
+	source "package/python-shellingham/Config.in"
 	source "package/python-shutilwhich/Config.in"
 	source "package/python-simple-pid/Config.in"
 	source "package/python-simple-websocket/Config.in"
diff --git a/package/python-shellingham/Config.in b/package/python-shellingham/Config.in
new file mode 100644
index 0000000000..3d3ec047b5
--- /dev/null
+++ b/package/python-shellingham/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_SHELLINGHAM
+	bool "python-shellingham"
+	help
+	  Tool to detect the shell you are using.
+
+	  https://github.com/sarugaku/shellingham
diff --git a/package/python-shellingham/python-shellingham.hash b/package/python-shellingham/python-shellingham.hash
new file mode 100644
index 0000000000..d83c2fa88e
--- /dev/null
+++ b/package/python-shellingham/python-shellingham.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/shellingham/1.5.4/json
+md5  883d381da8fe788fb24428591e61eb20  shellingham-1.5.4.tar.gz
+sha256  8dbca0739d487e5bd35ab3ca4b36e11c4078f3a234bfce294b0a0291363404de  shellingham-1.5.4.tar.gz
+# Locally computed sha256 checksums
+sha256  f388fd38cad13112c1dc0f669bbe80e7f84541edbafb72f3030d2ca7642c3c9d  LICENSE
diff --git a/package/python-shellingham/python-shellingham.mk b/package/python-shellingham/python-shellingham.mk
new file mode 100644
index 0000000000..7e07606714
--- /dev/null
+++ b/package/python-shellingham/python-shellingham.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-shellingham
+#
+################################################################################
+
+PYTHON_SHELLINGHAM_VERSION = 1.5.4
+PYTHON_SHELLINGHAM_SOURCE = shellingham-$(PYTHON_SHELLINGHAM_VERSION).tar.gz
+PYTHON_SHELLINGHAM_SITE = https://files.pythonhosted.org/packages/58/15/8b3609fd3830ef7b27b655beb4b4e9c62313a4e8da8c676e142cc210d58e
+PYTHON_SHELLINGHAM_SETUP_TYPE = setuptools
+PYTHON_SHELLINGHAM_LICENSE = ISC
+PYTHON_SHELLINGHAM_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
