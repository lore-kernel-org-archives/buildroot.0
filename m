Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2D6C27C52
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 08:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52FE0605CF;
	Thu,  6 Jun 2024 08:38:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7K50KKjq6m69; Thu,  6 Jun 2024 08:38:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64496605EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64496605EF;
	Thu,  6 Jun 2024 08:38:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 47F731BF599
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 08:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40731811D4
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 08:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lR3zlbkykqWX for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 08:38:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CAD42811C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAD42811C1
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CAD42811C1
 for <buildroot@busybox.net>; Thu,  6 Jun 2024 08:38:53 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.127]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MS3mz-1rr7cO3yyB-00U7sV
 for <buildroot@busybox.net>; Thu, 06 Jun 2024 10:38:52 +0200
To: buildroot@busybox.net
Date: Thu,  6 Jun 2024 10:38:51 +0200
Message-ID: <20240606083851.20759-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:XX1Avwqz2VtI6jOac8xOqTtpKDSAQpvYnDGfxQPzapkCvOeh0uh
 NKBDgZekuSW54pTkx0Yq5J3CGl6SqquSXHT0WsbKen/JnF/dMb84vZvdP7ffwcaMkHY8pkC
 x5aJ1IIbdmmm+Rb/pEpPUjvj7a+iIjBCAFd+j7TN9ucnwjBl4hJ5wKy00aLNrwBur5+wj/r
 M5K8Rg1NMLt1CiYSZzpjg==
UI-OutboundReport: notjunk:1;M01:P0:C6TPnt2Q/TY=;wDePo7vRpZDdYmgUiMC6sYQ/SRn
 byqCo8wCnTSXYTxxNM8lYU4VBnvJWKT9DnxIwZ6NeWQTNDiWM3yUK8yUJreZ8x6vxPcQ/gryv
 1utkslYSrow9UIFQBeQq1pc+rqd9jAv/nO5MS+lFFCiYkaQfM/W6BcrjWE97ilLuWVdW911V5
 8SMAn09ysDOX9RfG+6t+m/+jC5AbsB5YKPo4mu0bBZCAS8rHIFM5PzL/LN4JE/MSpw1GsnCtH
 wCxiJLjpFRm4Nc4qmAzAqtU8mVYUJJdsCvVfuEKMC7Ti5y5Vyt6MMwrBQvCaNWzykA2rh1Jz4
 4kpeuKU1N8ag5gMcDHgo+e3+8ow/xSPwmW25bN7hSPBW7HJlikuja0VDG7eWpjT0In88hvnjA
 ShtQVczLL5JEqJMUCtE46lJS/U0IG44u6NtFp95n3C3lKX1WUqbV8Rdru4VRkP864wqyYXZQx
 OKys01Xq+7C8wpYrRHAxPlhwz9gBttsaKO5kt+Ox9Eqmg8grD46mlk+AOkvGKRipfv19gi9V7
 HQHqJyx/zpSTW5YY5sMbAvcYDGffSNjT55+G41d2GUPvlGoykPCtz74qytw+prBPivvhNAWXo
 TYM5UTai4aGbfYoYY5bBSwdrB32oJvf50CnCuTsJgIdNMqzr5SB47wj1ltXVezT2ZuLmgqHtE
 xNQoEnXsisriEjMoMtrEEgfoM/t34esuzWQ8DN11e6nO5xtbvccwCDGMJk99Flz9j87Kt5+3v
 0rlSB6LZzZbwVLNgqeE6ZNRXYxuhHudDqyRrs2ExRoWGm09r9Zy577pvuJ4zRO/EhR6F0EYKA
 r5URVkrezI2sd6TOT/tUdNICU+5j0VW3VwUq6sMRyB3R0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1717663132; x=1718267932; i=ps.report@gmx.net;
 bh=zheetiaELYp7VAj9sN+CSHgdWzVHOcQxUXGLJMouia4=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=GE8fifKhulOWQTj3DmpA/sx8MKLFuxIOoG3PJQf5qaTdwHVWhLXpBhFUtY2hiBTL
 CTaa3ISdfGT93J7V4W+D2OBwAvcxpZB/VK7ltgFhP2FjUStqNHAcshrqGD3kmk+OU
 F9qlXXALxCgcal179ZjcXUoWFiedUy6RP/1zmpGc5IhcW7vr5xTY8OqV5jS7K5H9F
 ca1/CLZ4lUUq6fv1JtqDyYhwwx2skloEP7VTSwifBcXTI/zz3h2V0obVLhwNUz334
 65Vjm64cgXR71E58SowwCrdKd5vu7vRnGDAZzcsNAZ9kBJZ8oDFJY9jZaQyLW6cKJ
 yUtC2WTFGirrV3ccdg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=GE8fifKh
Subject: [Buildroot] [PATCH v1] package/libopenssl: security bump to version
 3.3.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2024-4741 (for details see [1]).

[1] https://www.openssl.org/news/secadv/20240528.txt

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index aca75cf9e4..dd1c99f7a7 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-3.3.0.tar.gz.sha256
-sha256  53e66b043322a606abf0087e7699a0e033a37fa13feb9742df35c3a33b18fb02  openssl-3.3.0.tar.gz
+# From https://www.openssl.org/source/openssl-3.3.1.tar.gz.sha256
+sha256  777cd596284c883375a2a7a11bf5d2786fc5413255efab20c50d6ffe6d020b7e  openssl-3.3.1.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 5ac6bf9713..d209bb8e96 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.3.0
+LIBOPENSSL_VERSION = 3.3.1
 LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
