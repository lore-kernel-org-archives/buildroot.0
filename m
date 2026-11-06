Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0058F606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EpzEUb4P
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2DA58128C;
	Fri,  6 Nov 2026 21:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ZjyO2fPtC7o; Fri,  6 Nov 2026 21:14:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E995D812D2
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999673;
	b=ETK/0Nc2C74RelQZBq7nxDMdg9mIzqeW+xqXkg5686PnqiS8bHYiJTWW8FBpVIi1wpca
	 SIfEsBUXzzI0razHRxhH/Oeh3WE2rDGxDdqEh55eex86vBSbZmFYcR1/d2WqeRENTqN5F
	 IDr87IeW3DwA922g9WUBjU4gALaljhjIAPdI2v9PYB5RC5IPgdlSZqtCXj6VYyaUa74iY
	 2erXuwrEqpNqi1H0pb1OiyInNiADmSBiSkTQbTLyM8wOUbLKacPOD/ytFJCtr06/zdqSV
	 ivPWt9sUu7EePCaReORSMwLZVO2m6V/mkfyLKoULztKxcjt4721/H0MEWx3JQecOp9A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999673;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=f2GfAH5s71Zq9PvXAa9kK7PAHIeG3GCmXzG+lcSZRKk=;
	b=dTDDe9CdOOiR2JpYTPB1qPDwBpfadyV5UJH8vqs1R9d/+1IX9cWIHLTNWoljZ6XR8r4X
	 6g4CNB3JUiWtmHbQp0dij2mZCfUazEjUl3McQQgHBOyf0PyKlGaJyymzBdBaJyx2+PyCv
	 u2XZ7erV7kA4GJhXTpBTMMRFdQ+Jzg+459a9ItkahmJ5ZACHZUb4LjWmzNlR/pnFG797I
	 EWsTm95e7rKgLLKdadopRSoWFgbJwb4/R0xNjfH6CL9ZLPqjqrn7prG6rjXnBxEhJ9MAh
	 9Wbt65mz8hw8Q0EmCv4gKOPXgitrF43QeUgEvNARRlnb45XeZdAKuOaBRZdzeCkADmQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999673;
	bh=f2GfAH5s71Zq9PvXAa9kK7PAHIeG3GCmXzG+lcSZRKk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EpzEUb4P4c5AzPGPFDP6b2ND5oKnDstfnC3gEB3XEtayeRwr3902N3ULs6rYxy4YL
	 tiyeb5ooPmwto/dpEDRnxcYDxmtH71GfY2i8/RMOKGq42G6OUeTT9LQgHHQkA+7VTP
	 WJ8sMZYxTCYU0//0l0JqFxaOubKessZYE0mBVG+fSdU+3jkIB0FbsR08WfBGLul6ek
	 X1hdude/Kn1VNnUHYOHhAsrN1A4GVHRpm0EvMjFNTi+Vf8aZnsQuw6YxhLUTos23tf
	 Gg3ecnWXCfoqEx/vRbKsWdl3Sta2eWSeTk7q3+dXvfjQT2EyqkegtE/cxMVpv7FBWN
	 HD//GKaM1+c+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E995D812D2;
	Fri,  6 Nov 2026 21:14:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 514B74B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E06D608A5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uW3jKEkU22Tw for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 90658608B9
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90658608B9
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC8199DCF5; Fri,  6 Nov 2026 21:12:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b3d08d5bd01f23482c11a8308c6386c23a6ef1c
X-Git-Newrev: 6de3342839dfb2d7b80ee3d15c2f04b348d5d695
X-Patchwork-Hint: ignore
Message-Id: <20261106211248.AC8199DCF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-filelock: bump to version
 4.2.9
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6de3342839dfb2d7b80ee3d15c2f04b348d5d695
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index d24358f7f1..41f9f69ce1 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  932426b5d85aa53ea727cae7238102ae  filelock-4.2.6.tar.gz
-sha256  ee7af8ede36dcaf12e1016d9f7c3a63ecd5497d46f85dab21b8c779b8f944e97  filelock-4.2.6.tar.gz
+md5  d97caf3371cc44f6047259ccb420317f  filelock-4.2.9.tar.gz
+sha256  96530b7c538d4ea08493ab067247aab7948c54d8cd622cce711c97cccc5d9896  filelock-4.2.9.tar.gz
 # Locally computed sha256 checksums
 sha256  608c89d5060ae9921adccf3236695bc654a9946e12323ef6c021dfa04e294d48  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index 69032ceb83..5a9ce8c709 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 4.2.6
+PYTHON_FILELOCK_VERSION = 4.2.9
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/35/6c/730b340182f1fd74d4ef8d3f35431ce84f8f97b1a1f2afd145174b7bb047
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/a3/1d/d730c664fcb4f1d264a722722a3134cf0881854f73c1fd58abf87572f232
 PYTHON_FILELOCK_SETUP_TYPE = hatch
 PYTHON_FILELOCK_LICENSE = MIT
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
