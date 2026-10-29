Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95794606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NdTW4l9P
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7063D40BCE;
	Fri, 30 Oct 2026 14:07:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7HQZRloMChsR; Fri, 30 Oct 2026 14:07:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 91E3D40B57
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369240;
	b=cPtlgEy+0zyTSshaXY+zYJ7Pu5GCuZBeer0Wn4WoT0D3GGHbLAAbAy/ip10ohVA+FJjn
	 +8O8HT5SSx9YA3Os7AVpI7wpwIBfayxF3GecH+bLQeyntzM0M1TRgjhJuSBdDWU0zWvVp
	 PAKsFbzrpx5KAMajOxSAS6dJjW04p580Or0WkwGA98TXQcu8fAasjOrjCdze+Brnyv1qU
	 GkeVRKNmb00K3RkXrHVBK4BbqKz3whc5ZFfUVSSStSakS26CYWjZKCmZXUvSvgQV2uEAC
	 cM/p+N6UaJuFxSpxn4XtJe4ax+5VftpHCRbKVTKvSd7/xNp3mICfY1HNef3V8Xd0vcw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369240;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=02xxH3ISFPeX0hI43tIiwWqBPg78gz5t0V0Buw8hgIs=;
	b=HNX49MuHgh4SCiBUBbRttwd0M1XVkAUSP9F0ri3z9zAg6iMMuTmgB6wJTIPrZuzsVMM3
	 g927vrUGAwmxly3GvoHEwrFvE9TpyABJfVeluwbnExPdqFwN8k0K3kq3aaiV1YaGU/Teh
	 +ybwm7a/CusnmUJr5VPg/Pnv0cx/e05IlEYILefdNSYtdSrV77R2Z+uyD9MBy7KMJ2gZn
	 0Q5rx+mJGHlKt8w4/LLBSdAf/+SvbZb4c1wUqj6ymex24QCSKAU48inMKtSruO5twsyN9
	 7pJXM0TXvRavMeIkms0PzlQDkF18Rv2XzBiQRm07+G1Ii19XQgP6+3fLHhqb3sQ9LLw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369240;
	bh=02xxH3ISFPeX0hI43tIiwWqBPg78gz5t0V0Buw8hgIs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NdTW4l9PWCGp9EKuleK69aEe1koLk68lK19h2D9d6tDRktf4F/+le+85L9aOqQoE7
	 kKMCFEqe96D4M4o+oyk2ktvlFdqwK6dJhkxXEoR54OWLWR7o69faPm+niI0R8XMZle
	 ER7j48H0fiiNqS4GeTuP/xFgd4BHWOPpEOyck5iGsUl5txpxkXo7O28jkCwOJ2U3uQ
	 SyjDxZOtqF+G+e3R5Mzc/FURDGPY/JCFDxwgERL1YQiZMkdq+aiRAYnIzWNmeZGKPQ
	 EJxfFg2HEHV0aQwtwKOgFFUFAG3BPVEUTidYlrvgfbSQfps0sUqJwBi+j8UOzP6mOY
	 FY88VuQGVoggg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91E3D40B57;
	Fri, 30 Oct 2026 14:07:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A289D44
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D0E640B38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nn66jvvXb6ak for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5755840B34
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369166;
 b=pqUTzDce9sikrA3Ba2adxTHlbjGl9Gih7d6VZzkCS2tTvYno5lc9FFS1cIOYsxwVE10I
 bu3QKT33Fxt1p/+4zt7KnY4Pb6sL4z2hmafscfdVZD7csw7mxQ3/SPXC7xO6he6Ox5HSZ
 36rdx27onzyqkZWC+ZLVpn5IOYKZnaIEk5/23WHYSNNrI6Fv2Ogr7XM5y/RVfzKB09VfQ
 4EnDLb86gPDCHVMz45I/M+fJnsW04y8GZOg5VewyxU7fDaUjPeBkaQnpbXrjHL1F9GGKM
 wdcYsLkdOWlEYvkg2MDALxKyh8S5aj3lkxMyvJlpp6LJ/iACsnusfE5i8d4qkhW1g3w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369166;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=x+Ath7yybLUGc98IkNlTR8C8rh/CGLvZFGe5Nlha6OM=;
 b=p5G5EdZ5RDSYEayNccAfPZrQ/l0v6hGxmVo6u4bfZZiSzVxy/0Z6QXWVzIkgh6Ok/J/v
 HmbwQPwfhxAcNfV7j9h4d7kV/h9ytN1JVGyc5TRkw191WtuqUJXuc9/yESmGjbEZG2XIt
 b8C7Vuh4k09Dv3zDSy11Nx5a36pmiNwu/Q4IJhRr9D4QKALSChXffh9wzzldUg8hToo2I
 juc2o911CCe/g1AWc/vkJeQ4xIFkmzjHb1k8GgIwxpicHzrxL3LKzcZBefxc30eskmqLc
 aw4H9i3JT2Omdrn9Lg1JOtmk+s9nZIweSQyN01eyxWiX/eZMviy9HLXogmQFyptwvhg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5755840B34
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 76EBF9D389; Fri, 30 Oct 2026 14:04:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:58 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 89f1dc39b09a60147ec020c5bdec2da24691b307
X-Git-Newrev: c1f8c650c784637bb56abbac7c0fa9f02fb2a3c8
X-Patchwork-Hint: ignore
Message-Id: <20261030140438.76EBF9D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libnss: bump
 version to 3.119
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
Content-Type: multipart/mixed; boundary="===============4741462773643294359=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4741462773643294359==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c1f8c650c784637bb56abbac7c0fa9f02fb2a3c8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_119.rst

NOTE: libnss 3.119 require libnspr 4.38.2

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: rebase on branch next]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 050b663f4c52ec56b2f26ec4f1a379dea3b20d8f)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index d4824bc81d..1b15364a93 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_118_1_RTM/src/SHA256SUMS
-sha256  8c390a676ea37266fcd3d0cd2fb070e2f69f4d78fa4ed88e07ac0c9eb5aab8d3  nss-3.118.1.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_119_RTM/src/SHA256SUMS
+sha256  e8412db6c9d6f531e8adfe8a122ec33a8fae920681ff47231a1349bdd399f0e9  nss-3.119.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 80d2035fea..43b1b60f98 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.118.1
+LIBNSS_VERSION = 3.119
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist

--===============4741462773643294359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4741462773643294359==--
