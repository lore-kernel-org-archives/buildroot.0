Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FB560A5BC4
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 19:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dTAzIl58
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5A66403F8;
	Thu,  5 Nov 2026 19:34:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2OTwSEFvhDOo; Thu,  5 Nov 2026 19:34:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E3822404E7
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793907264;
	b=DGNKn4lhrmf0FoDSFtmuCBIjvY7l69lb/lYKdd8GkWMQaUsAE6/uD5r2+OtrMLitrDLm
	 KoLw1uxKroiM9xIIcMrxAWdmAjBGO+2KF3gNMKHhvthQtNsBNiznGNFB1mGpu0S/WHIcP
	 Y1meN3P+tevPLjLuBbxs6IfS5F5fa1pzw1vPjh6Tf17FSbKXtIhh7IJ/A4h15yfSWwGsQ
	 Y42sIB2Q/Jo5rNIvlrlxo6kq20pMPqw/SXXTc03Zuig/kALvaNKdNmOdeGdSfgfYuUbuX
	 TNNPWmuQTBOdnQyYBx+Ny8oblJQokZ60oreDPPpoDtq+CZvk/QNpUIAmliVizk4C9XA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793907264;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2C8M8zsvqsNhGT4s1DAyJAiEYyWU0i+kmP3sm2Wcu/I=;
	b=UwJUsdXiPc13b6N3fu0k3z0TM0MFLRSVLI2Y42/wdGwPUBtw0pMOTuENRAcS1eluXvdE
	 qhTqIZRs7aKyeBSjfp2C82phO7rJDs8RV8bZYtdfnqslhvn7guUgnU9qPYUPmBTayn+MM
	 Ai6BvcRYx2dDSitsoP/VzXMkFbC7eh0MfeH7q9Gr/bygbJwZCxCngOyZj5D7fPJG6fZVx
	 Qxu4ZhOTmeUHTyKGFhq19av5YxoT6ldc5gvKMIlcgDx8hB5SWXDWfjtCIKSyDmJtxnRsx
	 RZKsSj65mdwy2CfrN3BwXWq4860DbiTbGn0P/XomHIam/kAJPZ/Ci9tYDW+VGKqomCQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793907264;
	bh=2C8M8zsvqsNhGT4s1DAyJAiEYyWU0i+kmP3sm2Wcu/I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dTAzIl58SnPQLpk8aVWvwPqUz83mvYel+jiSMPhBhjs8MS0jE1nSmlBXm0Gw9O8Nn
	 agg33qFg0AepzOjrybEX735Pp4QtgJWMcJWbQrVT43SRDVjoxJB/VIYrsa6fV5Xk6h
	 Ag19hBkhfCVeAIr9mmQOxdaOnr+UPV3kBSZ3bPLJQazrSAMibFFWtnvcREdJnmIvqO
	 GgpNbw9UEduWYkm6XJuxAdk16AWf+XlXjFKhXRhnxOkodD7Q0vjpsBCOzNiNjvt5lx
	 3T8sS/vjkQbbEADBwVOJJUXJQsujGYDglsci26zML6uVq48CTTdE+cMi7n3b2XAamF
	 Nt6Wc0Pk5pZJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3822404E7;
	Thu,  5 Nov 2026 19:34:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 620EE235
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 19:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 485FF404E7
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 19:34:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FGjkgSpZHf8L for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 19:34:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 63B72403F8
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63B72403F8
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 19:34:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10DFD9CFCC; Thu,  5 Nov 2026 19:32:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 20:31:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c4e371d76cfbdfacd8bcc5a6322809b093d470f
X-Git-Newrev: b4b0e7b369761a4cea9809f73c836afc8adc3432
X-Patchwork-Hint: ignore
Message-Id: <20261105193250.10DFD9CFCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/json-c: bump to version 0.19
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b4b0e7b369761a4cea9809f73c836afc8adc3432
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For the changes, see:
https://github.com/json-c/json-c/blob/json-c-0.19-20260627/ChangeLog

This release also addresses CVE-2026-9146 (documentation update only)
and CVE-2026-11322 (in apps/json_parse, which Buildroot does not build
as it passes -DBUILD_APPS=OFF).

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/json-c/json-c.hash | 2 +-
 package/json-c/json-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/json-c/json-c.hash b/package/json-c/json-c.hash
index 88bb49cb9d..c63a399e2b 100644
--- a/package/json-c/json-c.hash
+++ b/package/json-c/json-c.hash
@@ -1,4 +1,4 @@
 # From https://github.com/json-c/json-c/wiki
-sha256  876ab046479166b869afc6896d288183bbc0e5843f141200c677b3e8dfb11724  json-c-0.18.tar.gz
+sha256  37ad0249902e301bd9052bf712e511fcc6acff4ecaad4b5900aad9ce564e26de  json-c-0.19.tar.gz
 # Locally calculated
 sha256  74c1e6ca5eba76b54d0ad00d4815c8315c1b3bc45ff99de61d103dc92486284c  COPYING
diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index 20fa767c23..385a11105a 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSON_C_VERSION = 0.18
+JSON_C_VERSION = 0.19
 JSON_C_SITE = https://s3.amazonaws.com/json-c_releases/releases
 JSON_C_INSTALL_STAGING = YES
 JSON_C_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
