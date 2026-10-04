Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8870CA5FEF
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 15:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9047580ADC;
	Sun,  4 Oct 2026 15:59:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OXM1HmCQBXV5; Sun,  4 Oct 2026 15:59:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 822BF80AC2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791129575;
	b=lvs4BNTuaOQoSxz+5lxzm1iUMd3Bshhs7/lSvA7fdcI9U0bPBD0vNEPCeg7UI4jJwzen
	 8WmpciQX+0gTGNC/ZRnXy9igYp7CkTip3cCgUOkV2ZdcgXN1Ufze8D4Yo3SBAT1Mamn9s
	 7tm2sSwu1PV7vPhm8HnNfuGP9bFMzCOZZ1hJsEfEItoe+3Zx6kmRos+taUQv6xHN6TSKX
	 a/8HkU42p2tFW1BY9zFmZbOLGZp6Gq+UIauyCHAVxX9nVbWeqj9ybPjtZGUNi6Yokd5t5
	 Diphi8u9ONMaCmWSOXDnmEE1lk0DZVUKYsX4TP5t3jFotOPyDBZD7FOz0641IhA08aw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791129575;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=BaHzV3z+t8FDIAEy7B/9ZkjiMRqOb7XLWD9KH8Zvgzs=;
	b=Uz+/Pqb9vyMymMD7Q+TDWJRFB7AkOx41W/9iggvpiVZJ0t5mrsdgNS8umN7BTaENhElT
	 dpoUoMVVAWzBwY6P1bSZj/cPf9fP1h6hLsPtHLwUDdAmHk2SalZWRIS/j01Ol9CIZqANX
	 /j09i4RPZagI0iOhILEqe2bAac/89TAyV8FO9mWlNrfr7D26MNYMPOfW3hAOA3yVA2ry1
	 LIjV8kU7MCgRMwaw5FkvYBZbU8rlHoxQOZ3nVi0W6aT4+vuaVg50qeWmh4s3sWY7hkD1I
	 OtnNb0tgz4lC5ivtW5ll9ANtwQOJgoJneTMF2EtWhtwtJmY9SK1GkRizd0k+uckogbw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791129575;
	bh=BaHzV3z+t8FDIAEy7B/9ZkjiMRqOb7XLWD9KH8Zvgzs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Qx7ozoaZIL/JlHEYRVO/fUY8TZy00LJFMcVFgB89oG4xEXloue5UukHqgrPqj7rl/
	 qONtCvB/HpKf51n2P7sJMT82TXvx+igbss2n31VpuiGUj9+xLlKw4h95/oJ1I9vvU3
	 /eeHNYEke9LejkZiXJDZFeOswxZpAcnyD7v3scuDAEQGKjabUsA4WIF6HL70x5HRGY
	 zYq0MWMF0+zi+Iwob441Q60Y5vJlKFn8r2Xh5GXgoLWMArB6btdaEQJUyNqDpH27Jm
	 nnmQ9Lyv3uvtnWtJHb8GgxAaznWRYLdYPRN8AHRoR2E6bSPyWbb1UIytczBp6iEIZ0
	 92DEcS5ZJTHoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 822BF80AC2;
	Sun,  4 Oct 2026 15:59:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 28F8932F
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A8A540611
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mTVYOalWxZko for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 15:59:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 61FE6405A1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791129573;
 b=oC/7GKnVBwgh4VPWv1JZc4DNr8ieqlfl8vXjdPMvbLaWQCTJPmE71fJn7aR3v+zGBT0i
 oFvOnQDbzswqo8Ni1/XNPDL/ZXbadppvQOC/6UPHk4fsFeVk05WfX54toW97evBK6jKWx
 6JmrIwDGpS60QY57BZoU+glB834ekTJOOVuwRHbDdnRzb8gxap6ZBxrkRamPxZkspKjj8
 lQ4h0aCNLXYh4O45rvPfQUu98PhAo8ETMO4DQYMdcDXhz2BK5pVkVNY1lT7x8dveG+5wf
 xfOHv2Axo1WNUlnXHVG/aDb1h5+jjLY7KzRY1l7Mh+LqkPSgM+Ji2J/n6UrgXkc1JaQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791129573;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=vsriZUuc2rI3lrQ8TDeWAGzMR7jP26G8ne+FnFcSND8=;
 b=jl35kZbWYdMy99en9ZGtifCsaGJqqlCl2VbQZkeYF60AXr234jjfNdKZ6IwLbPVv9ywj
 QbWOLcp2e6fIEALafGOIXXEwxh/I6tKueqCaiTKWbxCTRzqTAEMDxdtRvPUgyMBnYe9+U
 58O8Ag4lDlcQuQMRAWXr0taKx4NuxZdgdRiWRnivhbVaLKVi3OaEXUG+HC1AV2iHtGr/t
 oSbgqTWpcj/8pnrdiyWturkltfftk/yBpEJLEDOceZXDn25D13F4sAtSqs+6ix8JkPgej
 /tQHsFrVRRd20l88hnyG4N8z/BtPF4LNvaQo9aoXa8pa1ys5IJcH0HGbQeYuQ7fxQDw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61FE6405A1
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:59:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 22B948C99C; Sun,  4 Oct 2026 15:58:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Oct 2026 17:57:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 42c3ecb29356fef0df652f8e4b231d225a3e5162
X-Git-Newrev: 906b5bd589a3bb8664a36eda5357176d392eb3b7
X-Patchwork-Hint: ignore
Message-Id: <20261004155818.22B948C99C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{python-}protobuf: bump to version
 36.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/906b5bd589a3bb8664a36eda5357176d392eb3b7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/protobuf/protobuf.hash               | 2 +-
 package/protobuf/protobuf.mk                 | 2 +-
 package/python-protobuf/python-protobuf.hash | 4 ++--
 package/python-protobuf/python-protobuf.mk   | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index 17d42534a6..fa913949d1 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-sha256  dc74fa582f559cbd31614ddfefb4868f43c919d7184bde514bb47f90c6025eb8  protobuf-36.1.tar.gz
+sha256  3d9642a662d10e68ebae5e53f14dcce5105684212d5078f8e0d47d1ab3ae6b64  protobuf-36.2.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index c4ffbe9eca..7f42b40f04 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works and to update its hash,
 # as they share the same version/site variables.
-PROTOBUF_VERSION = 36.1
+PROTOBUF_VERSION = 36.2
 PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
 PROTOBUF_LICENSE_FILES = LICENSE
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index 469ca3e6bd..c4b333e629 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/protobuf/json
-md5  5cef553eb5bceb0d5a57610f1aa3c40c  protobuf-7.36.1.tar.gz
-sha256  d0f6470f0ce2b84e3feaea2d4b816378b37ba4d4aa08a274305373de93e2d524  protobuf-7.36.1.tar.gz
+md5  905e08d5b281bc0255336b03db97f57d  protobuf-7.36.2.tar.gz
+sha256  497d0463ff3316681da6c0b9e8d06cb465d61abce00b613ab42226175644d1bb  protobuf-7.36.2.tar.gz
 # Locally computed sha256 checksums
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
index d73c265302..8903b4629c 100644
--- a/package/python-protobuf/python-protobuf.mk
+++ b/package/python-protobuf/python-protobuf.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
 PYTHON_PROTOBUF_SOURCE = protobuf-7.$(PYTHON_PROTOBUF_VERSION).tar.gz
-PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/86/73/f66c748df06e7fe24e658eddd600d19c4b40bad836c97ce2d0ad9851fb6b
+PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/d9/89/5b8517baa72f84a67b8a307ba953c91057af618bf40bf676f3c03551f8f0
 
 PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
 PYTHON_PROTOBUF_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
