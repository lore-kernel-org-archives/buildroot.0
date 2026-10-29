Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D5D606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JHHH0xXV
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CCB640B8C;
	Fri, 30 Oct 2026 14:06:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LQHbSpu0eXhh; Fri, 30 Oct 2026 14:06:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3AABE40B6F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369214;
	b=jiYfww22OtxUrEJa6D7s+JRkFXhQfHRSDmOgmtCNgW+lHkQ2dLpyUoAJlvzGMMOrnh7T
	 TumwWz9mS2P5GRUyae/8t8ymnEn/wD0i3Aq+X+LCZB9UesgsLAouZUjmZMDZCqN9fqQQp
	 oFU0Q0l+xUGzoOI3UW0hbhQRdrGfxkiWOUjLuaTMLOHMNwgO3kl3siQLL+mUCxOAs4atw
	 6cIPUP8KKaMv1ALVGyqN15xP6a5yixCgCb7IjPzAUAE0m1QjZ7uuyudeR4HEhShrZxv4k
	 +Ix/TX8YTeIsjSlQaZf5Eh2SvxJ9Anezht/mUizqykc+Zd5HBfVZLwte05QGNAIlSpQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369214;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=VsfZsISI/aJKQKNjMQTIe7u6div3nPRyNFN2G0+Ups4=;
	b=cxqF5Sqw0oW5ao+6YqeFAcgOFouyaRpL8/A5u3qXFP15nqU6heRWtvnsAqyYU0TIWIB7
	 K+IPJ2g5ZYXV0GETDaA4sUZQ7wfmwtz8ltPdmXCpl3ZkDx+i1rIua2w1S/rNiL8GE+1bT
	 PKZKN0fELVIYw6agyFMrkG2M1uQsQuw2d7xJj7VLnw78rfrlmdITWJNxjBjGUWk1WRNVL
	 nPFWRvcNoF9X3jV3lMKtuNsLlz1Mky4BU2pIHQm2XHQ8ZB1WKzfJ8DHZ5rlyn5fZxJIjL
	 XoUHLYDGkuK5sFwloeJ0rOKJUufy4MxiEUSZoZn3MqGV2YGXG4g8HHgkNPGgE5dYOLw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369214;
	bh=VsfZsISI/aJKQKNjMQTIe7u6div3nPRyNFN2G0+Ups4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JHHH0xXVLUWupiPCMXn4fsxte9BjLPz0L4UPMU+pInq3GlRbfYHQppiLyvJ5JsI5A
	 G2y00AzqYUjx50dHNUeq1XBkJS8/ipcxk1J6XlEQPb1YKhqJHOnUggdQpuhinlhh3b
	 p8cIqDMxU+vNdVnOjchEy/0Ta0JP/dPgp5tKsR/+rNfpblkBzFZj16UiZk7k4rkl0E
	 49uqYn9kRqPGtswydhx8edELIXeVzvIFjijWktA39oll1U0yHJS6bNR6iHlmuGba/5
	 9foIaPm0wmhdQOegyOOPlX3WVrmzg4PejRIjFDWI/qh/OIpGr0rUy+6/4ptBU8sRDP
	 cCQLS8niDdIOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AABE40B6F;
	Fri, 30 Oct 2026 14:06:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7780B362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D7974052F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J6Rpd96OsnK1 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B268B400D5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369163;
 b=EHxx/DauNdr0ekC7XEjINCe3nW8fvltW6xZ4VC5jrrLwYhAXHW7GjY7KGQ5vIlqDu2vl
 5zcaokO9ucaGvGF9ztNGLKWXguDObBRFIayrhWbuBuOxf7WTT2sKc/S4s2uOUIksT/zak
 Ya0AV7yYVtP0JCw4L+oGmErQPb7yq9AG6yWIminIRgEz29yARGX8gknvMA2Uo4Ix6rD58
 Lwu8VhTq33AEW0d1Te9Jr1Hxyll+MwIVPYELZ4pZ/MCeNFOZk0GQVSs7QIwGtto9xYPF+
 AApeIALlY3ol3jxJMqoF+18E92pg8YOGrGCaCFaHeQIbOeFDKPujqcQsmqFdCYsvlsQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369163;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=SkDpmiKR5gwFejQxeYW7bHGRlr/C6e6k8/gyPWxt+Ik=;
 b=dMOnC4ymCuYK+rjUmfvbW5L8B8xxg7TGs4/l04B32eopFVjz1ZGwN4mtXXnD9uY4TTrx
 4jFSDcsVHdQ3wVkW8MVc7v7mq6QeeT7e0TFtwY3hl/oN4bVtSUa/Pn5vqlSf7B28KYjU0
 g812bBxH0dokdHVb9+4I6XDiVfeEqFJyh7djh6Rk5ZOBU4QGwbPQLbUePW7tEgpuJ/u80
 N9gyAasU9+SEjFQKYS5nKQMwb81f7VcMsqzZKeb2il1kZ5XLWwDVCQU6qrVVf9yMtrxgV
 SVLeQDWvxk4etejV1I78+LnioyE6Ixqp8womhhcvr01Q+fVgVExasmDYUgENSgAhU5A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B268B400D5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D17B49D388; Fri, 30 Oct 2026 14:04:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:56 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 83a16590866c7c1071dab2c970e0c3aa9aa828f1
X-Git-Newrev: 55c5a93b5d9136859c39ad1472029e0947bfb5de
X-Patchwork-Hint: ignore
Message-Id: <20261030140435.D17B49D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-pip: bump
 version to 26.1
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
Content-Type: multipart/mixed; boundary="===============5409532004935164492=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5409532004935164492==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/55c5a93b5d9136859c39ad1472029e0947bfb5de
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/pypa/pip/blob/26.1/NEWS.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f8000bbbfb527a06892402956853fdb7114b8c14)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python-pip/python-pip.hash | 4 ++--
 package/python-pip/python-pip.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
index 39a15696c3..3ce6073701 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5  566bd094e3a0c382ba2705349c83d55e  pip-26.0.1.tar.gz
-sha256  c4037d8a277c89b320abe636d59f91e6d0922d08a05b60e85e53b296613346d8  pip-26.0.1.tar.gz
+md5  c05fe5cfafe4cc2ce7a44318d8eed4e7  pip-26.1.tar.gz
+sha256  81e13ebcca3ffa8cc85e4deff5c27e1ee26dea0aa7fc2f294a073ac208806ff3  pip-26.1.tar.gz
 # Locally computed sha256 checksums
 sha256  634300a669d49aeae65b12c6c48c924c51a4cdf3d1ff086dc3456dc8bcaa2104  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index aa02a216d6..d12bea3225 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 26.0.1
+PYTHON_PIP_VERSION = 26.1
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/48/83/0d7d4e9efe3344b8e2fe25d93be44f64b65364d3c8d7bc6dc90198d5422e
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/73/7e/d2b04004e1068ad4fdfa2f227b839b5d03e602e47cdbbf49de71137c9546
 PYTHON_PIP_SETUP_TYPE = flit
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt

--===============5409532004935164492==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5409532004935164492==--
