Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF91606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BavAHd+L
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92A6380D49;
	Thu, 22 Oct 2026 21:19:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TbMYF0H9CzpO; Thu, 22 Oct 2026 21:19:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 99CB181112
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792703971;
	b=gx/nYOUJ9kQYYgaM003Nh964RYBAKr+QJI+gvvIY0988DyG+eCsQyf9Q1csUS9zQ+cuL
	 S5c8iaAlhhDfmUI+LMlRqAVUa2lm8r82ncLOQr4fjo9cBvcaxsY/GEsu8/tXk7JshFG3z
	 8bnaC/3yqYdN1HkJHIlPwX5H+t/CDoRmY0Mhv4eBcaUhMnukv/UA7NQQpRiEtxoiiaI3b
	 uq6a0pIM19x8I1E2HvQaEwhATJAzIinfbXXgb0fYEzbU0TVZDwoiM52cUEG9En/o6Xsow
	 cQG+Tir0rKItMFtdUMR4SxBnvToqxmW3PhEHZAF7aQxqAALw+ajkMPnzf5pmA5i0c6g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792703971;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hOC76yrOCZdEk4D4xWogT/mLrMaRBtm0VcAnRhPxGFQ=;
	b=JQBH8TJg/4P73ztWZNrT6bOReN9roGT0OWKgDEhIprApXmtvKTg0iW1eiYLyiSJ1XWyu
	 XE8baN+RVhv2G+JfWNLCkKSve5ycg3QGxfnUa/MlhhS50jOL0Elrb65K0zSfP+kItVyFg
	 jphb0K4We5CPKkK0rZm3JCOXu8Mf+Tf4vnPxsNj5m+WbkcDcJKiRif5k/72sV6uZ0rzAt
	 WHfgaADUbqHICE5wVlz95t1hB5sshehx6AhTTHRRJrNFMSyFlql43b4iYJQXB7Veln1WJ
	 CcjtoP4zJcka518jRRYxPZD1g6/VttTCWynU5ozRrhSn1xbhdULZAHWKcwmzw2S1QWw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792703971;
	bh=hOC76yrOCZdEk4D4xWogT/mLrMaRBtm0VcAnRhPxGFQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BavAHd+LGJeynZ5m2ejf8pcFU2T8G0s7pgO4I1sT5Yvqq5hU/osTtV5VSmg5W5R0q
	 LK2XZl58fDzotw4Lijhm4hvkm+7xokwhlXWtuxtWZFBRnyM5hE8Y67s57ZwwZwInWE
	 p2+Ml5uus7B9ClwK+ErpOwdOr3lrSTt4SQ7TTMYLwmDDg+I4k1sOfQUhZdESQXSjwX
	 Yp8KnvkrB+71C31j2ZOjDwV42i1YgAWR0ICoT2dMB857uIgVypbhtHIK64jEG6hnWf
	 SN1g/iAZUz1nDQUL/eJVFEqba9cvE4ThAnyT1s4HJsvIfkt/e4nmEtI7thS6XEKPne
	 KBky5b377KYPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99CB181112;
	Thu, 22 Oct 2026 21:19:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E60A3AF
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 604C06080C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:19:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jWjNxzaz9SK5 for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:19:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A6B3B607E7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792703968;
 b=dp0yb1n6ieHyY2L1YQHc5d0zYfA7Ctu4KXaTmcN8AIwytXwHCCJZvieikbWU72QwTWmP
 J7z+1Y6eW2GzC3le9sh3Tva9OpWUXsrknBSyOoK52ZuUaFJCK3lt7dRbMzV40v6KSlwyP
 DvULGjpEzvHrPKhZo93D2+1DiKzCRPb5WCPFF9vAK/CkGPbbBAivPAbE7SRrOQbVSoEP2
 QEfaFUO6N8sPBhX5wAEGR+yaeXIwCBa7V8tYPCpLRuPsK4NBMLp2hP+6OzTtH4TRFQvqC
 birLK/dhbvtk/85Ge/xGh8XIToaMyndqiy+6A4j+ZAfdPe0ix5q3yTSdbGbrKWbiH9A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792703968;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=i3BSqZJ1O7T+K8/5dQqy7CaVS1CIsQ30+YKiFiJAfBY=;
 b=EpGOSIDEQfw85zCNNu/PbpaG8WU0N7oOdgbGOnedrwGasW/YUwl8Bl1fjQp9Os1zgUFW
 778DPt7K5v/qyIZOCba/r3pYvhQt+x0Ml746BL+WgOuFsTplTyU7zbv/iVSIhEv0NOGTI
 c55Vb9y+XHvZbEL4tAFG1onyxBA31KLD6jWRIljB1NoR2Qo4ZlgIwUxmDvqelRcmZeun2
 0aWG/mi5p/besBKDTZq4XRXQ8pHcZh3MymPqG1VjJJARhAsQTPF9zasWDeuNY/xfgEuWU
 HxSJ2NNEXYv/7lGjUkhRhyjTEJCsJNbhcNKdPLWilINJK6HH+EqCQ5jFQsfFruDtjjw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6B3B607E7
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:19:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8150C9C26E; Thu, 22 Oct 2026 21:18:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 23:18:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 656caf6e50a51823d0b54fc2bf62a94f87ed978d
X-Git-Newrev: 4fe78e0d6e0188a2046425965e4905b02874fc4e
X-Patchwork-Hint: ignore
Message-Id: <20261022211804.8150C9C26E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wget2: bump version to 2.3.0
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4fe78e0d6e0188a2046425965e4905b02874fc4e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.gnu.org/archive/html/wget-dev/2026-09/msg00031.html

Added upstream patch to fix a build error detected by the Gitlab
pipelines with defconfigs br-arm-full-static, br-arm-full-nothread &
bootlin-aarch64-glibc-old that would be introduced by this bump:

net.c: In function 'wget_tcp_write':
net.c:996:24: error: 'sockfd' undeclared (first use in this function);
 did you mean 'socket'?

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ation-of-legacy-TCP-Fast-Open-code-branch.patch | 55 ++++++++++++++++++++++
 package/wget2/wget2.hash                           |  2 +-
 package/wget2/wget2.mk                             |  2 +-
 3 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/package/wget2/0001-Fix-compilation-of-legacy-TCP-Fast-Open-code-branch.patch b/package/wget2/0001-Fix-compilation-of-legacy-TCP-Fast-Open-code-branch.patch
new file mode 100644
index 0000000000..6cc6419c87
--- /dev/null
+++ b/package/wget2/0001-Fix-compilation-of-legacy-TCP-Fast-Open-code-branch.patch
@@ -0,0 +1,55 @@
+From db600f40c51f0e612085f19351df3f9ad963bb5f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Wed, 23 Sep 2026 12:02:24 +0200
+Subject: [PATCH] Fix compilation of legacy TCP Fast Open code branch
+
+* .gitlab-ci.yml: Add libwget compilation with -DTEST_LEGACY_TFO_API.
+* libwget/net.c: Use legacy code branch if TEST_LEGACY_TFO_API is set,
+  (wget_tcp_write): Fix two compilation errors.
+
+Fixes https://github.com/rockdaboot/wget2/issues/391
+
+Upstream: https://gitlab.com/gnuwget/wget2/-/commit/db600f40c51f0e612085f19351df3f9ad963bb5f
+
+[Bernd: removed .gitlab-ci.yml part from patch]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ .gitlab-ci.yml |  3 +++
+ libwget/net.c  | 10 +++++-----
+ 2 files changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/libwget/net.c b/libwget/net.c
+index 1cd7188c..fb7227bf 100644
+--- a/libwget/net.c
++++ b/libwget/net.c
+@@ -55,10 +55,10 @@
+ 
+ #if defined __APPLE__ && defined __MACH__ && defined CONNECT_DATA_IDEMPOTENT && defined CONNECT_RESUME_ON_READ_WRITE
+ # define TCP_FASTOPEN_OSX
+-#elif defined TCP_FASTOPEN_CONNECT // since Linux 4.11
+-# define TCP_FASTOPEN_LINUX_411
++#elif defined TCP_FASTOPEN_CONNECT && !defined TEST_LEGACY_TFO_API
++# define TCP_FASTOPEN_LINUX_411 // for Linux 4.11+: newer client API
+ #elif defined TCP_FASTOPEN && defined MSG_FASTOPEN
+-# define TCP_FASTOPEN_LINUX
++# define TCP_FASTOPEN_LINUX // for Linux 3.7+: legacy client API
+ #endif
+ 
+ #include <wget.h>
+@@ -993,11 +993,11 @@ ssize_t wget_tcp_write(wget_tcp *tcp, const char *buf, size_t count)
+ 				/* fallback from fastopen, e.g. when fastopen is disabled in system */
+ 				tcp->tcp_fastopen = 0;
+ 
+-				set_socket_timeout(sockfd, tcp->connect_timeout);
++				set_socket_timeout(tcp->sockfd, tcp->connect_timeout);
+ 
+ 				int rc = connect(tcp->sockfd, tcp->connect_addrinfo->ai_addr, tcp->connect_addrinfo->ai_addrlen);
+ 
+-				set_socket_timeout(sockfd, tcp->timeout);
++				set_socket_timeout(tcp->sockfd, tcp->timeout);
+ 
+ 				if (rc < 0
+ 					&& errno != EAGAIN
+-- 
+2.47.3
+
diff --git a/package/wget2/wget2.hash b/package/wget2/wget2.hash
index 0e5742aed4..63c90e664c 100644
--- a/package/wget2/wget2.hash
+++ b/package/wget2/wget2.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  d7544b13e37f18e601244fce5f5f40688ac1d6ab9541e0fbb01a32ee1fb447b4  wget2-2.2.1.tar.gz
+sha256  4f1915b2a55a789a15f2f9ada7cc44bca81418e648f76fd88a7f4dd028b2149f  wget2-2.3.0.tar.gz
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
 sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  COPYING.LESSER
diff --git a/package/wget2/wget2.mk b/package/wget2/wget2.mk
index 21005bd708..58f95c2355 100644
--- a/package/wget2/wget2.mk
+++ b/package/wget2/wget2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WGET2_VERSION = 2.2.1
+WGET2_VERSION = 2.3.0
 WGET2_SITE = $(BR2_GNU_MIRROR)/wget
 WGET2_DEPENDENCIES = host-pkgconf
 WGET2_LICENSE = GPL-3.0+, LGPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
