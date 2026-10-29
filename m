Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAF7606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mNTte8i2
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC497818DC;
	Fri, 30 Oct 2026 14:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mWHqSVx6cEox; Fri, 30 Oct 2026 14:20:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BD62A81815
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370035;
	b=iEj4gGkF/2+bIkNgIRcr8nRBxMvtdB/DRdXuv+FH01tOuTsw3wmNjDbt0joBPdM2ArHc
	 yjf0UskBmPk/Dz6TidLBoSs8wDWydt2DWy+E51HDWLkrMvxEQTbqhXplrn3qRgo7CmgYo
	 jhHDbuYcy50/nPD0SiUl1msoiMLJc9A7i5eD2RoRyq7x+UkrDoVIDOKVFWMFwJcgbScxT
	 l8iVLcQyO0GhFPs71OQF+TyrrRmW4q5upHn8C4SKMGY2HbcCtaj0o0C4efMpWK+FdD6/0
	 HQTq4tr9C9viZKw6xVnAvMn6xEU52U4WVLqvjR4IHi+kW6PKiqjXUjWImUiHaNO0pMw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370035;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=r7hacgIBtoU46JWjfz9Prw68xXhvuvyq5DZQONnlubQ=;
	b=TS9kCSl8NpRuXpxlWYx01unAxwjczjuIQa8hZoAtgDv00tlBKu8VFQCw+QvY8rX8vD4o
	 s9LsuSl2T4q7gUDuwwkAlmZEWLgjBlGk45Zc6Ep3u3SUWVBWd6WMY8WE4R4yxv7YuSG8V
	 3Tgqsxk0Ill1fAiDGZxk0U0mIrqKvy2/pL0b1DehRxbByiX5oLXvViO/10vvnu9RY0bft
	 eGQzP3NeOXVsV82zQrai5coHqzQnXMmaskfixtII+9EJGCB0XnDOr36uJt8Cnz3Dlvret
	 mR98+X+AcGBz6Yggc/cBn/O/EFgrbJ9EjZfiQvsdUfFDmuEkWwdT3HbCNn+w8+Od8KA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370035;
	bh=r7hacgIBtoU46JWjfz9Prw68xXhvuvyq5DZQONnlubQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mNTte8i2Yu3rEePBsWF+syzYnTzZTyXiITadv4rtCsTe0Kz7Biih0FveV2klQS5sl
	 V26Zw26OSY1+eHgv+Stik40wNJtnQA9flEZYSSBYXEM2Ao5XBuYtCuobaxBhWTdnr7
	 mEEZjM+oQmUZAWcuvHH9dbZ9Auh3wAQiEYW3OBkYtxvrR2I2AGZM4S3mEkcqhfdGWS
	 fg9xA16PHDVeX90IuKyViL+crkRxLcROxsOn0PY9hLlJ30IbHqSFo+X/JfX++UYj3h
	 ZHY5D4nluXdedCKHjulWTlYkgBQrzq5kYFjS4LPlmEcQzk3r6EnkHiC0Dsf5NwfjUv
	 LnJUgwX2Mx+HQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD62A81815;
	Fri, 30 Oct 2026 14:20:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FF86D43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C94C813D8
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KkvqjjRrDlVz for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CAD4281334
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369895;
 b=J5E67WZ0TrIq0+VAr5mT8VjAMt0Qk+gsSAVAlWIm5loRnOr14jWyDe+h8qmD6Rvhlseq
 onQdicG21ZbuuDSQ0BsaAhQCfNIHBNvCrHvGa7xI+qptvWxdm8125OtyA8BchMxnQvwbc
 ImaP+E35qfdxJDNPySf5dbzs25zQ9GXxunLdFqveJXy0qqmq7jZqNoxEYsV1DVeLn5Ua/
 ju9gtqoLszK1qnxZgt4fFMC1zrzXKeWsi15ySY2x1OmYhDCE+MyZX67tNw0popgEovWf5
 hlhySqhDtSN3zRn9ILQtXMmu6snGp4Jxm4oC2FTT+0EHkc0VzOrv//N6tf/92rt13kg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369895;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=dtfT98G89/JTvNAw9+SKB4M9z2ucaWUH5Z2eyjoYKmE=;
 b=ps2VKhHSZwsP1ahjIJRSZmP1TZYY8Qh4dly0F8XghoSrD51s1rS3Qmdav4Lqy8fGA6UW
 mIPD0OHnatwgF0F8lAw75azBtJyb+S2K+ZMXIzkhBxbNRt8Ay4EmFgI91f5UccTO26Yt3
 umhsbvvkyok/Fz6B6HCDsqwmxUISAK07D9rXY/8lwQwsNbxv3Wzzhy/4WtyDJnyCq+7nr
 Kj0lWrz+j3IzWj6UJrktsI/Y9on6cn2BOGys5LIeCIXFzf+OHKjarYnoJd2b0SJXdmgAU
 5mDeyq90jgTDNvpyG6zO5FKgUWrtBYg6nHDL3xTp7ERspd0ksgKhGMUwzlXAIgIMwBg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAD4281334
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E8E039D388; Fri, 30 Oct 2026 14:16:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:11 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 88d8cff680506435dbfe807c3261d14142c48b38
X-Git-Newrev: 45b51c9d7a6528b82b3228cf1a41c2e1806d9b2a
X-Patchwork-Hint: ignore
Message-Id: <20261030141647.E8E039D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/python-grpcio:
 bump to version 1.84.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3468706034375206486=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3468706034375206486==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/45b51c9d7a6528b82b3228cf1a41c2e1806d9b2a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Skip dependency checks as the source archive includes generated C++
sources and does not require Cython.

Update license hash due to clarified third-party license paths:
https://github.com/grpc/grpc/commit/fb53717dfa6b264e7f930bb5e9a7e5c86a31ed9e

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 978efc055d705d97f36f08352d2eaed76c578b40)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python-grpcio/python-grpcio.hash | 6 +++---
 package/python-grpcio/python-grpcio.mk   | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-grpcio/python-grpcio.hash b/package/python-grpcio/python-grpcio.hash
index 9441d89389..e533bc1bfb 100644
--- a/package/python-grpcio/python-grpcio.hash
+++ b/package/python-grpcio/python-grpcio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpcio/json
-md5  b2b6afdac225e749c4c97284a0c1113f  grpcio-1.76.0.tar.gz
-sha256  7be78388d6da1a25c0d5ec506523db58b18be22d9c37d8d3a32c08be4987bd73  grpcio-1.76.0.tar.gz
+md5  f217241814a3d2f9bfd0fdc00a5d419c  grpcio-1.84.0.tar.gz
+sha256  19aaf172fc2edbefccce3f6e92c5150975dbe56c45744e9e87cf72ebdf85bfbe  grpcio-1.84.0.tar.gz
 # Locally computed sha256 checksums
-sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
+sha256  58c86a3f2b5cca0ebdf9ed3e7f4e6dc38e3b38796d8c3dc92064c62a4e39d0dd  LICENSE
diff --git a/package/python-grpcio/python-grpcio.mk b/package/python-grpcio/python-grpcio.mk
index af9817a0ef..bf32da46a2 100644
--- a/package/python-grpcio/python-grpcio.mk
+++ b/package/python-grpcio/python-grpcio.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_GRPCIO_VERSION = 1.76.0
+PYTHON_GRPCIO_VERSION = 1.84.0
 PYTHON_GRPCIO_SOURCE = grpcio-$(PYTHON_GRPCIO_VERSION).tar.gz
-PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/b6/e0/318c1ce3ae5a17894d5791e87aea147587c9e702f24122cc7a5c8bbaeeb1
+PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/3f/4f/4435c0aae54657258d9cfcba78598f3d9e5fe4c82ff18d78558567b90faf
 PYTHON_GRPCIO_SETUP_TYPE = setuptools
 PYTHON_GRPCIO_LICENSE = Apache-2.0
 PYTHON_GRPCIO_LICENSE_FILES = LICENSE
+PYTHON_GRPCIO_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))

--===============3468706034375206486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3468706034375206486==--
