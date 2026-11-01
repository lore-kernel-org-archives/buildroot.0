Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E69606A325
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 15:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RxVRCtwM
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A87166066A;
	Sun,  1 Nov 2026 15:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fSfj-YxIgz8v; Sun,  1 Nov 2026 15:24:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BBAD46061B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793546686;
	b=ekWTLjExCuiF2ufIXN2vmJFetAESVPmv0pUSZAZOEqzK5gQ0dnnZWvHsWfBcO94T+wZp
	 w/OL74tBahLpXhGu7ww90TtfMwLMEs34UKkNyVGi+LI7oLDh1wSW8Yl1xbeqL0t0rMrTc
	 cONQrc6Cspwct/oCASTiM33Z3b3iSys7mZxT54+Lnf8Yxag3g8AUwWUsDwoUVLRQNOuh+
	 7rQJXsiuKpnW94K+30s8tNqj5D0LXLAZOg53ttaE9y9xBJfeqgZrhYlBrZ0VsU4cuzN3Z
	 Rsh01QyGEmnkjslGqQJMYb7Ih7E1/8D4UbbKqEsuT0ZgQBo6VlK5YRbEQCTlKPEYUTw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793546686;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=EPTkz1p+MrtNrm8HcYxFZMrPqgt/0q1OEMIoeJ5jpnQ=;
	b=XQsaT45uqxZlOVihAW9ie1Kx81Ph2oiXHhl3Syv7QWx6619s/uhXZp3nzUqVbjKzy/Sr
	 i9gZDxxZx5N6LpXIuJJkG006dZN0K4QnGma4sg5caN2kuBCCC7L9bXHQx+TcxZUd5nzlO
	 yxELwN4WudQxLGhN+JBr2Gk+WNsQOSrlrRH+xkPTnwbHMO0zhCTaYxyMPcR0zeRFqAgnW
	 acm8azhQCWBp0fToz9YDLNUCRNFr9VLxGZf7ni2z7zkkSceVFKYvPu+2/2k8KZae902PG
	 bOGyH4H+BSuvVkYLOU8ABx+V2fxnXmWrclVrvbQaBjLhHZxO7R7wsIWZbKyt/rGHpng==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793546686;
	bh=EPTkz1p+MrtNrm8HcYxFZMrPqgt/0q1OEMIoeJ5jpnQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RxVRCtwMkxhaauEuA2iNdyOB596+zk/niEd8fibNFp9NLT1QjRyzbgqgn9/BRHMVp
	 qCZ9ype9i77JuLCD7TN5Ni26Oj5LHfc7a4p2NUOkCY7X0gUa5tZ/xiDAFBsA+F1HOp
	 +knC9YHtrqkNmVjBKyKmiJVkhvSVgCp+Gd5d3dNWiaVVDIWxaPZKWOB33BNvQOYG4x
	 xdH8VWzYQzazBYzLagMsxGdh5XZm60LEYBHuWJgogFMVX2kQ23QcyPEnbbOGosss7b
	 e8mpsjYo91/2DAi6rEzacdw+gpLYnG0QfBp+AJ19bBDkoHfczB0ppcOScT/8H5kxxt
	 JaOr9RW9nmCDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBAD46061B;
	Sun,  1 Nov 2026 15:24:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 96F072AC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 15:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88C18403F0
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 15:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1g9J8lZJni-i for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 15:24:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9048C40422
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793546683;
 b=TKVTpg/Yz5iXiq6qYifezJRBgMGPLLYnOU33L3ezgpwcyJt6Zpe6hxvGDExc1ZoKTMhl
 cq/K2DDFYcmJG/kORxvEy4nd8RXbplcpybYVwidD1ofGzkk3J5YcFLxQTZ/RlvA1fRbiX
 Sxg/P7omuyaMTZ5GOqNgJXD+9W7/P9HBCZ+JudkI4SZbtEiB+CyrgjxFtqJ1GQwew9Y+R
 Vuk8TzeLLPWrHpbk9yETYZZ0hZYiYNqZHUs1VnbRzh8kj92FIrcqOMLxF3XF9SMvuYDjG
 dC66VsvZmaLYS803vEMl71nMFahqCAgoV4/PHPFh0pW6+Cm5wr9reimTV7HzcQU4i1A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793546683;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=2046w8yydzMWj4Q8rl/jk+EaB8ggmpm3evZkh02iqE0=;
 b=cSyoiwCNb8PfTXTQ4ec9COWLZa6ERRH3/Y5sx9as+IuZHTOX1vPEZCrl/LX4H5BQuT58
 +E74Pzhkkl3eVxmXgLLAyvV9aZK2rWArDh7JLytCTWP2we4ybrFSsoe0KfOj7wj+8qszQ
 0+Jav7t8fS/y6CMI1B/TjO8HSO+/eUdAsrnNCMD7hj4acH4ieSyi5P3K0lyO4NaJiJ/bF
 CGw+Tuc8aPMEil40KBB1mjMTDy0z/mwyNNYWd5Mcj47WhyUR6Qr0Bjq8LvwsfhG1uwqho
 HRm5OqWkrwMVZALzKFxWghQJ8HShu6ilCTZc+M+b21tWkrQEcF92JDYfxP5LiS5w3fA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9048C40422
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 15:24:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B145A9D497; Sun,  1 Nov 2026 15:23:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 16:08:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e286327742d04758fe997f6bf0f5eefa9e73c8e2
X-Git-Newrev: 9f30f21626e31bd558c3074ebba7a578082e900a
X-Patchwork-Hint: ignore
Message-Id: <20261101152310.B145A9D497@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcap-ng: bump version to 0.9.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9f30f21626e31bd558c3074ebba7a578082e900a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/stevegrubb/libcap-ng/blob/v0.9.6/ChangeLog

The new llvm-strip requirement only applies to cap-audit, which is not
enabled by Buildroot.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libcap-ng/libcap-ng.hash | 2 +-
 package/libcap-ng/libcap-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcap-ng/libcap-ng.hash b/package/libcap-ng/libcap-ng.hash
index a39cbf142c..073800e4f9 100644
--- a/package/libcap-ng/libcap-ng.hash
+++ b/package/libcap-ng/libcap-ng.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  a2b4211f59b231d607c61ea2a13e9ecb38f446fe769b44e12da939d5af6d978a  libcap-ng-0.9.5.tar.gz
+sha256  399040138e0ca62fa2bcabd63da9af4431a246ef7a654561a0ca3cb00010a539  libcap-ng-0.9.6.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
 sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  COPYING.LIB
diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index 9d29350b2b..419ebc8b0c 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_NG_VERSION = 0.9.5
+LIBCAP_NG_VERSION = 0.9.6
 LIBCAP_NG_SITE = $(call github,stevegrubb,libcap-ng,v$(LIBCAP_NG_VERSION))
 LIBCAP_NG_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
 LIBCAP_NG_LICENSE_FILES = COPYING COPYING.LIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
