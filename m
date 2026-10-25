Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66696606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 11:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LInQRt+p
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8155060F0A;
	Sun, 25 Oct 2026 11:56:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1QJkIdtWJU9N; Sun, 25 Oct 2026 11:56:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 398B360F29
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792929398;
	b=PBL72g7SZj9ouIyAjQTbokexxU0oLrJ8MO8L/GU7PN9ODnccAk3arIso41qHAMxObrMn
	 kJNoBpgyJF8k6UaRAklc0I+jkxnWRUHTsQBEZ+qoeajY4NyqDsOk4ed62DupulBWyxfRb
	 DF47S7lBRciJDWKSvPFs06gz57SdOMVg1m+kfy5nTYS8KkXPyNIJ/yupYRI2lIHyw+Z8C
	 ktowhsvP1nc4lTLqGsZDioW53nc/sijAEqSAYqMc5DeMN/LC7VDWqbdeoBG0cP9nR9Yem
	 e3IU4TtSBI29rnCz86wNVmksxSNfgLXKZsP8gpvYAaT0v5FRQ98CJfkgG5JbYLVwWdQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792929398;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=UAXeOZ9L+DFFwWH+NrdnIchkACoWlVMdPQDbIOYjMqc=;
	b=tWq3LOBRN3m35QnVPllit8ma2AGhVDsAiqRfxXbneZYYAvrkUWS25/I1V9+D2Lu+yUJS
	 CSSGmFkZ1fvQXcqa3KEz9Ph1M42eQ+G5MGIznJ1SuIrJMvaQcZbjkHLQgr4GVtPyXMCmT
	 4SeCjEh/WzhVoNKjejEAIoLhKEfLk9j1s5T98gOXLJBEFImUpIyC3k2JXHVJuJhm8Kdoe
	 JeX5OzOJdoPDv3Nv2dkhdsOhrnrIIsWc7ZqRyM5BfH9y/3QrQ/AsEvCWcYmtoDDtDQFgf
	 g4TmMQDr/dfQrereTYf1hh1UvwmyNEJUCKs6pSldaHo2CQuSZKcibZqsgiGdMbmTszw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792929398;
	bh=UAXeOZ9L+DFFwWH+NrdnIchkACoWlVMdPQDbIOYjMqc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LInQRt+pNu7PPicmEKWkE2g7Tt8fB+yx6R2te4i8bBk7BO8K0B+uKCeqvP7eZNvkn
	 yCIo03d4wt3kUuzv+Cf2zxl31rMFFc52Vq98CIWwW5gyoZfclrtWZiPPMw1k3lfEt1
	 kZl3CUF+RASIcsbW1+VryY3x+TfW/nt+3aszsMqNlkbf7i0ytiaSb0S10VwqPsCA7+
	 icZbuRW87AUAw1/GUBPNt5BV4flEKA7NgrXAjUGEU/9UvfHUXtWelaPkM3nmZ80QV7
	 A4GfwDZnTDgZtrm2ppl6PNaIBbu8jvAijdgV/1A3sI5VwjjHbDQebapCEJj0IsSz2t
	 6keMBH0SzMkBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 398B360F29;
	Sun, 25 Oct 2026 11:56:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0811A43
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E251F406E1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pDrthl2j9cwv for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 11:56:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 345AE406D1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792929387;
 b=RafxY61s3+IJAtExjPRgHLUdLfXudHe6tgJ55ogWnQ3Y7KYLbApgmhnYarzvBjoWwf5U
 gmi9nhRlBMTEXidzi/Sfd3xVIh3PtruhbzwSwNJQ5NVFrPaTt+YUFae/kqI6djbifUSrx
 26UQxN2lxZ+QRZGw1M7bWXPiGQadP6NA3u6C5l9GhKy24Xq6aImlFO2y2Nb5fkaa7XGao
 hmrng8UYdozIZRURb8JTc/bbamu+GkIpDxhj/JBEk3p4LiPfOfUoufPPTPqk9z1nJOLVK
 UCFU4DK0z2PBvryCs4HvUsi33OcRMKCegL/jqmfMOsDVkmiJbx0i/Xh3c++OQ3jgBgQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792929387;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=u3o7aYZdYoNihSqy8K2G7wA69f2r1lCNsfkIxQDo1W0=;
 b=lXFHhl5zT7oMuMn/uqPiSHsUsy2lbdPreKWHZ+aPf2aIf2HmL4S1lW+BfwmoEp5BBLmI
 exs0rUMAGhCj8AB/by07ZkmBlpz7b0cC5lKXdXpiMEv0Igi40MGZyp5la/5pZfJ1G3hm7
 i6IzVJU+V6UlO6w/J2YiIJOt6an4SgPz09zJwFRhrETyCxNBJX9e7JkCiEZfxElq5cfDq
 tFmpn7ZABecx2QyMQBDah3mDslm0nakkTWqD4T8fFCfca7Ik4tX17eM5+noJnJvEB8rLD
 np/M9y1z8tE3wjD9STkm8m/3szt06mCQOd/WUCVnxp+7NStNUvmWooAp8fz/Xl+OyPA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 345AE406D1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:56:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C82169CE81; Sun, 25 Oct 2026 11:55:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 12:02:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa50cdd44d39d004b370d0438b99d5a127652ec0
X-Git-Newrev: 121f2be8e7b265971e2a5d3a55f1352f7214c535
X-Patchwork-Hint: ignore
Message-Id: <20261025115501.C82169CE81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-wtforms: bump to version
 3.3.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/121f2be8e7b265971e2a5d3a55f1352f7214c535
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-wtforms/python-wtforms.hash | 4 ++--
 package/python-wtforms/python-wtforms.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wtforms/python-wtforms.hash b/package/python-wtforms/python-wtforms.hash
index a74c49c395..48be774f62 100644
--- a/package/python-wtforms/python-wtforms.hash
+++ b/package/python-wtforms/python-wtforms.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/wtforms/json
-md5  171d1dd8e3d63d752b1cd5e9f567a093  wtforms-3.3.0.tar.gz
-sha256  efbc626b0b68d3bcb77822e0eceb995f56c5e9d0aeb4220b9dc2fc9f03e7e1ed  wtforms-3.3.0.tar.gz
+md5  8251238be8923c56314d24d133546aba  wtforms-3.3.1.tar.gz
+sha256  9d10ccb5740290c9ae6673522d87bcae3b669cf0cb4e4584aee229b4694af10c  wtforms-3.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cf40d60ff34f6b2b68a53d220f8b66567b5ac8dd1119b37b62fd15e9518fe59b  LICENSE.rst
 sha256  c9362a7258a11c84a8f7e825ccbbb5c425c6fc02368d3aee6494533fb99ba1f4  docs/license.rst
diff --git a/package/python-wtforms/python-wtforms.mk b/package/python-wtforms/python-wtforms.mk
index 75ea618491..93b37acd76 100644
--- a/package/python-wtforms/python-wtforms.mk
+++ b/package/python-wtforms/python-wtforms.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WTFORMS_VERSION = 3.3.0
+PYTHON_WTFORMS_VERSION = 3.3.1
 PYTHON_WTFORMS_SOURCE = wtforms-$(PYTHON_WTFORMS_VERSION).tar.gz
-PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/c4/42/db38b45b7d791f608d7f1afbb9176dfef4a0dec415eb435b07cd44eb96cf
+PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/ef/5b/588dc20774f4cebeac23908a87e493f2f6fb2a4c54756675cd59afb8cc72
 PYTHON_WTFORMS_SETUP_TYPE = hatch
 PYTHON_WTFORMS_LICENSE = BSD-3-Clause
 PYTHON_WTFORMS_LICENSE_FILES = LICENSE.rst docs/license.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
