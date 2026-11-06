Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA683606A32E
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VuFfIlkQ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5AD6814F2;
	Fri,  6 Nov 2026 21:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s9_vzk0hirsI; Fri,  6 Nov 2026 21:15:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B09E7814BC
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999712;
	b=D4C1hnhxB5Ad/JJ8wVBq9re/8th4sP+D09rpsklbTl+MnsO8YOrkiegdU2/GKL1BlW24
	 WdfjRYOnvEJI/4hY/k54Ry+OYoZacMKF3C6vmwr9L2fPe09degXUZMdmg+Jy47L8yRxhR
	 RVggQ0fkfHy6v9QjFynaBaGdWim49zBZQAxIKJMN/I/M7gHrVkg8v5zdNob3qlwELcuU4
	 psv0Lp8zZZzWP0RsKLnZsRbnlP/ttM3rj+iB76ZqfPiD/NBeXFHjAWBibngVDBDG4sqsz
	 +enUWoJQXIYaw+5YM9WT+dfho2vBaHugVOGvHUexXE7R4JlKPxQpTZSZvp/+Wj0TIVg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999712;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=VtdWiyygSJ0Z+U7Ex4VcV4HS1iyz3885N/IjZ6217ZQ=;
	b=qKag7qUDSC1qz/WAOXBNj6T179+clfnPa0YyVLzAszH9Z6BlSCghVZUXb3Y/XlfLQmGc
	 jfofxDqJfxJQfjxCd10bT/DZlwENjB28yjL80dWG4+gdGB74aXwQ9IATV9y9zNYTCim6I
	 GVNSF5m7/6PdyEzo26Gr1sg8Grk96/SRPuSZFcn36q1t1GQ5987voirxYHfAHHqUGNfXE
	 AwdLpPA7FuPEvcaToVOiJYlRwLM5gF7p25mqHMVZGMXvTRPaMzynvy0qYnk8ZDn6PEvWn
	 lSNN5r3bRv9/AligNCPXO66uN5VVZ+83mZvXVk6Dp5o1NMid/tyy/PdF4M1Ufd0ojAw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999712;
	bh=VtdWiyygSJ0Z+U7Ex4VcV4HS1iyz3885N/IjZ6217ZQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VuFfIlkQPQ7tyyyiHNS9y/nChpWx8Nv9CBXhZmSUZrU4MqUdjjc6xvqGHEBJFfPTK
	 Lid9x5eKprWrSoDDieDeI+z8U+9Bnn8iAfamsa00AAl/X3wy61AR6nvJJEn8/LpQKB
	 YO81ScMDd2U/4CoaU5Kj14tuUw5iGLEDK9+59u8USnH6rPtBcJgRa2j1tolrxVzEzX
	 zJ1PGCKI54Z+hzPsFfyB+YWv8/VHVX9Ow4yRxBpPXeLcBHbwJ0MnGLsrURAeDwDi/j
	 wOeNNLQaKFZvTIu0DvIKj4Trh0qN4bvcmdb6G/+WGq5DRMRZXiCyMe2eg0LF4aIRFs
	 pGW32w1F//T9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B09E7814BC;
	Fri,  6 Nov 2026 21:15:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6140C32A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43E4A400A2
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ApoboQ2xsZB for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7974740401
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7974740401
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 953FF9E0B2; Fri,  6 Nov 2026 21:12:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55e4b7d561f75b4cba2bb0913a87821437078b2a
X-Git-Newrev: 0deb06a477d3733f88fe8ee1f251a611131d193b
X-Patchwork-Hint: ignore
Message-Id: <20261106211249.953FF9E0B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-types-python-dateutil: bump
 to version 2.9.0.20261104
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0deb06a477d3733f88fe8ee1f251a611131d193b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../python-types-python-dateutil/python-types-python-dateutil.hash    | 4 ++--
 package/python-types-python-dateutil/python-types-python-dateutil.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.hash b/package/python-types-python-dateutil/python-types-python-dateutil.hash
index 3f070237df..e4efd3686f 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.hash
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/types-python-dateutil/json
-md5  244541b7e8735556c5994511bedad8af  types_python_dateutil-2.9.0.20261029.tar.gz
-sha256  3258b491686c441d8074cfc8712308741900c9ff128a06421baec3767c503511  types_python_dateutil-2.9.0.20261029.tar.gz
+md5  113522414b63246aff0a477fb0aa0a57  types_python_dateutil-2.9.0.20261104.tar.gz
+sha256  5d0495702a5f7343741f5d842c531bcd1c941da8b4a85307d52ef43ba80252db  types_python_dateutil-2.9.0.20261104.tar.gz
 # Locally computed sha256 checksums
 sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.mk b/package/python-types-python-dateutil/python-types-python-dateutil.mk
index 352ec00472..12dd6b462b 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.mk
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.9.0.20261029
+PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.9.0.20261104
 PYTHON_TYPES_PYTHON_DATEUTIL_SOURCE = types_python_dateutil-$(PYTHON_TYPES_PYTHON_DATEUTIL_VERSION).tar.gz
-PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/3f/1c/1ffbe325ab57b36f134f6c9b1074bfa36ed2a169e530ff7a70fafd5c3bb4
+PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/8c/da/aaf5b20ea6c9e714fae9fdc611b68bde4edcba0aa4b1b853fc157d3d7b37
 PYTHON_TYPES_PYTHON_DATEUTIL_SETUP_TYPE = setuptools
 PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE = Apache-2.0
 PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
