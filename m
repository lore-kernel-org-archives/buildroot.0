Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E910606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 11:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EC7RaESm
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70B9960F13;
	Sun, 25 Oct 2026 11:56:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gDISUjxRBzyY; Sun, 25 Oct 2026 11:56:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D616460ED8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792929391;
	b=rKg93U+oF4igEumiEozGzeqVbeYizOh8pHF0EBhThzXBafroByySEZ2L3DJVUIEvusMY
	 ykaTVyKBlKXThmr8NZdJ3Jq46j4WSXDcx475Me5TQhmpW7QVAzMC8ofM+UApcSBLeRcpQ
	 CRn+lLQMTtNNf40aBniUOyPgLv+Ca6LYoqXaKbvcjqqnccpj+cpCnpVoZxl0GxCW1ArfH
	 KTa7eCSWEEEFQsJElGdzhzcqmDldJxxrx6saPfnyRdH/u8MCGascAIASxmCjWl/0kR8uc
	 djUNbH92s/a+rbND2um6NZNQqEixHrSx4ZaOK2p/Fj0y+GgknCqoTlOVa/2gdbTHXIg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792929391;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1ao6YT5VIlQRTWso8OK4n5sZEzQcfnTf4llx+xlURN0=;
	b=YzsIqRyj5J7ksPc3+QhdurvGzv08LWjIpBSigES8G/nxNHeKpwLJVItL77XMxiMtJv2s
	 MhoJ7OXKeekhgnKzRTvdClNHebL3g60FUgjqUtqFQ9UTGerlB24JOHJchzvtSxy3PEKkB
	 eDUwzNt8JhnP12A0DmSawJbvtHQiUZhqWMrGqyfdWZj9gJjiIeB9JIJRmwSAyir296InB
	 BbrX+CCA912rG29Pqsawvdm03OyqfRj+RXN7hmZcoOVtiuW5MOuvGh3uiaTMbuKn2pAD1
	 4DXqgppSlj+7FlW0nmMUGGrA/mZ5xi9i3J2HnqtDSZJYmmoptmamHbti2oO/XX7LArg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792929390;
	bh=1ao6YT5VIlQRTWso8OK4n5sZEzQcfnTf4llx+xlURN0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EC7RaESm5eMgEhFV2zLdj+CQXdmP+hUDCy9fBxu59XsYCqCNKmktls7j4XfkxIGcd
	 eDBRsET6dzmxKgPeXDfShnZkiy4CQmXDeuQXJhHo5rzfSKix7lDeYUl9Swh05v0HHr
	 Xtf7aXn2dhAqJq1vg3sKJ49+wSOTLshl+v3SbnTqY1dS5rGq72ce5khVSKbsB7MaHf
	 W9TfOidGjIGgt7wV6+UR3ST+JmMowQ217KPcTbB95yKFZ5hTfww3atqOLjozHDozue
	 HboJ+PTlRNyG2VySBYK631BEkQ05G+RaK8K8502dvcWCWxPb4weqmU8gemb9vYZ4Hw
	 9XbPUJoFUW5Og==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D616460ED8;
	Sun, 25 Oct 2026 11:56:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E4187D33
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA33160F08
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7EUegNzXXtRq for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 11:56:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CA28260737
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792929386;
 b=BbDuVlOxxPLegoZOPS7+v7UhJTfKjYTcgsf0ZvMKB2LmvMcuF8ysTG8XzuRP7qKT/EAg
 wKnWz9jJDDdaadreIusGIpRGx/wJm2zl01EJIncn4i9zHoLH4V/v68MsMQGCDPxdPVMNh
 vxRMl/CDV3I5FWoOlcp/x1q64CW4tga0MKJkNNzJPizm6TtgEk0JnY4UprS58k6ipruBQ
 v44m1UR3WtBKGrUjc2wyjvl+Adxo+a73YI1eJPCfr9YZgk8wbY++rLoGYrhdKFzNa6U+F
 d5WsSdck52EXfTNV4+y80KbrJ9WeSblj0Yf4mgtSJSuX/uucwZNur4izW/yvUBJePqg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792929386;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=lYCAhpyz6fbqq9HuKpEI20lVkuAJWXaHvqt43FzN8lo=;
 b=i0wOi0ZQj7MrUlOiFgAY1Ifqr//wTzTV3jJz9g/GRnwcFjKtEBF7BGj17SkhDaaQPF8P
 C0Ai0kh4xgzmqLwXGwFyF46ZW+wFijH49RH9k4njDvuOcmr+BJ+gorr0qexDSNfk3hb1/
 vxAK/AUC5m2/UWRa2m5EqprEBlq1iEL6zev0Wz8jcF6IlDHzYLb0X+ssCCRbtQW23mJmf
 Wiax1t/DcnqpeYV7Qr/1KFaBktBkkhhxZScqywP7MPfvQUuNp5hphKfG7i5aG3jU+4Uof
 5ApShESZjF5B63atTmaeEv2sObTJ78YEJheM86grTrLN74jfXwosUKrv00kdnFl1Ozw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA28260737
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:56:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6520A9CE81; Sun, 25 Oct 2026 11:55:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 12:00:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f0381b3074862c1f287a4a4036b6bd154cd4869
X-Git-Newrev: a308036e6a5fcff95af8fc9ad7869043002ec94c
X-Patchwork-Hint: ignore
Message-Id: <20261025115501.6520A9CE81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiohttp-sse: bump to
 version 3.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a308036e6a5fcff95af8fc9ad7869043002ec94c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Drop the Python 3.14 compatibility patch, which is included upstream [1].

Update the license hash for the replacement of the abbreviated notice
with the full Apache-2.0 license text [2].

[1] https://github.com/aio-libs/aiohttp-sse/commit/9eec5f5b0355bb3853d0e4f2af6486c9a5887e38
[2] https://github.com/aio-libs/aiohttp-sse/commit/390f93d64bcb01db32b02195c8c90d2fafe5d8a1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-Fix-build-with-python-3.14.patch          | 35 ----------------------
 package/python-aiohttp-sse/python-aiohttp-sse.hash |  6 ++--
 package/python-aiohttp-sse/python-aiohttp-sse.mk   |  6 ++--
 3 files changed, 6 insertions(+), 41 deletions(-)

diff --git a/package/python-aiohttp-sse/0001-Fix-build-with-python-3.14.patch b/package/python-aiohttp-sse/0001-Fix-build-with-python-3.14.patch
deleted file mode 100644
index 76b595c7de..0000000000
--- a/package/python-aiohttp-sse/0001-Fix-build-with-python-3.14.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 7a649de6561ec181208a9c4fa712aed614a224d4 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Mon, 8 Dec 2025 18:03:03 +0100
-Subject: [PATCH] Fix build with python 3.14
-
-ast.Str was deprecated in python 3.12 and removed in 3.14. It inherited
-from ast.Constant, `Str.s` was equivalent to `Constant.value`, so we can
-use the latter on both old and newer python versions.
-
-Patch was inspired by
-https://hg-edge.mozilla.org/mozilla-central/rev/dbf9702ed87e
-
-Upstream: https://github.com/aio-libs/aiohttp-sse/commit/9eec5f5b0355bb3853d0e4f2af6486c9a5887e38
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 6843260..fa41025 100644
---- a/setup.py
-+++ b/setup.py
-@@ -25,7 +25,7 @@ class VersionFinder(ast.NodeVisitor):
-     def visit_Assign(self, node):
-         if not self.version:
-             if node.targets[0].id == "__version__":
--                self.version = node.value.s
-+                self.version = node.value.value
- 
- 
- def read_version():
--- 
-2.47.3
-
diff --git a/package/python-aiohttp-sse/python-aiohttp-sse.hash b/package/python-aiohttp-sse/python-aiohttp-sse.hash
index e8382e7f8e..63aa6bb6d5 100644
--- a/package/python-aiohttp-sse/python-aiohttp-sse.hash
+++ b/package/python-aiohttp-sse/python-aiohttp-sse.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-sse/json
-md5  8c86e737a2f3642941c1d383f42ce6ae  aiohttp-sse-2.2.0.tar.gz
-sha256  a48dd5774031d3f41a29e159ebdbb93e89c8f37c1e9e83e196296be51885a5c2  aiohttp-sse-2.2.0.tar.gz
+md5  86392c1b821f9e2b22b787a295f9beff  aiohttp_sse-3.0.tar.gz
+sha256  4c2158dc7221fbcad225699c2b7c368c15ae45ef195447ddd0ba3dea5af24c70  aiohttp_sse-3.0.tar.gz
 # Locally computed sha256 checksums
-sha256  5585eb91ec607b4fdbe97d44a61146a9cc27bb703336628bc3c6a1eaffe60307  LICENSE
+sha256  2e4be5fc6c4c72a466fcb665d726e049a6891981fe536c4f04b6366749461d23  LICENSE
diff --git a/package/python-aiohttp-sse/python-aiohttp-sse.mk b/package/python-aiohttp-sse/python-aiohttp-sse.mk
index bf46c98528..a8c27218a4 100644
--- a/package/python-aiohttp-sse/python-aiohttp-sse.mk
+++ b/package/python-aiohttp-sse/python-aiohttp-sse.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_SSE_VERSION = 2.2.0
-PYTHON_AIOHTTP_SSE_SOURCE = aiohttp-sse-$(PYTHON_AIOHTTP_SSE_VERSION).tar.gz
-PYTHON_AIOHTTP_SSE_SITE = https://files.pythonhosted.org/packages/80/df/4ddb30e689695fd91cf41c072e154061120ed166e8baf6c9a0020f27dffc
+PYTHON_AIOHTTP_SSE_VERSION = 3.0
+PYTHON_AIOHTTP_SSE_SOURCE = aiohttp_sse-$(PYTHON_AIOHTTP_SSE_VERSION).tar.gz
+PYTHON_AIOHTTP_SSE_SITE = https://files.pythonhosted.org/packages/af/6d/01d7f71e38ac91a912dd8c4ed1a1481316dc83cb6c42043bbfa1b647c0e4
 PYTHON_AIOHTTP_SSE_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_SSE_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_SSE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
