Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838A9606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 11:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UrDrg64z
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4686C81266;
	Sun, 25 Oct 2026 11:56:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3CkiHhB8pHzL; Sun, 25 Oct 2026 11:56:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5616281693
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792929389;
	b=HPjY5xlHqqvoU1D24mKPwKoUGMjZTz/MQsf9866+w+/Og3p3QF0iUact3rTrvxwaE7JP
	 /toXNzvE9Yf9rqkH2b3Z401no9XPmnVkUzlI14/GwvrR4SzG2xwiJ9Lk4ejXkO7MQDbXK
	 NExK2Tiq2hWqozKpynRhmrK/hSuPRxbWnCzp8Rr//dmhO4TdRxPdF7xzWArLVh7uw+QQT
	 qPGhZ6OBwxQWcATqm9L4vl4iTp7M/5WZG1nnZ3g1dGoQljNUNVOpGDDlyoOBYIyVxm5Yl
	 z1oH74qv4me5ZZili7L0Jj9C+iVNgRvitGxqa18Biu6cbR0Yu89HPHeMghSlHPLnH1Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792929389;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=BKmhW7z2Fiq4O6Z2KupON49wCdG/U6hGMjGPe8jA/z0=;
	b=T0kadGFOLz/ivWYn2JCl7u4nWfheYiGtkBYBuNnemFmuCmUzpRzIBjwNwKnZWtTRkbin
	 t8knq51oOtcW/6gwAVzNe3zt1ReCKhKD3QAnwf6XZ/D16Z6/itjFphuBDArLOuKjH8lLo
	 TFFnho7OLBGRI3voRiUm/KcjmN2ISjHFiIPP5VHF+wBV/0EbJ4VQr/dMBj4FgyloJSo98
	 Irz4ekCrMIaqWHN5Rvd90xuMNYHT1fzdzwWyBWv4/+BK5EAPL4FWd+wnQov2zSPU/Osv4
	 wlFyi3BEsHJpsA6CFdk92mgxZ/LHdeJ6hTJ75WfLMCXAQnU/cw3GO7UVZ0zkoBOBDxg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792929389;
	bh=BKmhW7z2Fiq4O6Z2KupON49wCdG/U6hGMjGPe8jA/z0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UrDrg64zLfMMPOz5aor8XdphYZZSgfS7Fq7Rxpa33HmWAfipx2Eb2HPbVNOwGBR2G
	 cTp4mRsOyBQNWiYadasdgPqUbDp5SYNZCyhJ5xauosD72uSMP/u9T2ZHfM17PfrtEO
	 2LlVs2Dn6iaF0lyAstAt7IVV6hnnWou40X6Z7kb4tJ4ihfi3eaEKa5yBt0x9DZcOgc
	 LVpE1dpsm6C3jNREw+OUj8bUk7fUN4OAfpHVLpT+H1CmKK1RB7bXiChpf2B86saIZh
	 D0NEaWUsxIIvxFmNgqDQPe+0fBeJEKBn1hbsFGGbmvJy03XfcByZOGvxJbgicDLQID
	 32CvmN7vIzvdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5616281693;
	Sun, 25 Oct 2026 11:56:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CACAC43
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0FC5401F1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4qOujkVOUgoo for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 11:56:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E4A3A4009C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792929386;
 b=cqhwb+FgWnqHQP0wS56HISws4bDHEIsqfnE+sakth1ZOkj51BjJQhbuGq6TXxQoLUF+4
 8meSEUDeC+qldH/MBUzHt02xjAo+KTSKiU3dDBFA3w4oO+GyaOXJpURsNaBhsswUtErij
 KoMUpix1QxBIxnY2TcmRvd4Zfwe2rGzg9pIvLVRp+9pAPjWHu59BXs/nGMA1YR9rMqHRh
 sfLXKjDxqlxE9/cRwWzacnXFS7g4YQq9ThW9T4h+NxQxSxCtC8QzYoFvJ0rQ3XHwjgzQW
 3yVy+WLqoTMs8pORURUGFojUwEy038TH/V4tM0CA/eZ2iAsE6hPzx7ZlvFdUEZYdpwg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792929386;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=usJe7Nxc/0xT4nU5FFtgypp2fnx0YLdk6y724RR/YgA=;
 b=j/ZuXLC0xxXj0enzMVQnfgxXt/OnZyUuJx1YSN1jUgk+VQ5xGFk4n0EdJF97h07CClsC
 YEb3MNIbYMFzybDde5SBgUgu1PHHEGoD3YpconcTbt4BzOBEF0ax0QYRSRBJZpldDcKEo
 oEldmWUchTNHQA8EF1QBomMjdRy0+UC8RsgUoJ3HGGyAZHcr+RXHZgbfFLkgSLt7xFrkh
 TJiihOH08GVCuSvnkMT4M9Eiy1XSDHnx4mPKFjrxtvT+jAMoVYyXluxEj66yIjHCgF+oC
 2nSr6+WYJHgW++4Ee5FNfz8rznxsXnbNImngk2Va/MRJepOeakF4IQ6p87YR/6oGkPg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4A3A4009C
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:56:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73E979CE82; Sun, 25 Oct 2026 11:55:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 12:00:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a308036e6a5fcff95af8fc9ad7869043002ec94c
X-Git-Newrev: 2313a15905fc459c6faf4bccd7832cb464640b18
X-Patchwork-Hint: ignore
Message-Id: <20261025115501.73E979CE82@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fastapi: bump to version
 0.162.0
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2313a15905fc459c6faf4bccd7832cb464640b18
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index ed222d8e6a..8422f7684c 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  9319a9bb00c891dd4d6df45dce5b34e6  fastapi-0.161.1.tar.gz
-sha256  4076b88434452e20289379068e976c4a04c65ffc8e6be31510106e150a422f0f  fastapi-0.161.1.tar.gz
+md5  615d6ffdfaec36a6303202c48fa9f676  fastapi-0.162.0.tar.gz
+sha256  6a22c1e2e6e32e0633ee7e170f00009a29b8228b16feb219ee42f32fd8d88a8f  fastapi-0.162.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 547748417c..9efb3b23b1 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.161.1
+PYTHON_FASTAPI_VERSION = 0.162.0
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/ed/3d/2cc1a0dbc2dac6e157b4ef12bac063e1016cb7c6d7395f76665e439cf1aa
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/e9/eb/2cf8c80abf09b2800aef0a83b41066fbfda8ee5495b7a08b9d1af40f7046
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
