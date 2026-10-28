Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FDB606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 22:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=R10lTL34;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=FqkJ1dm9
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 803E8605D2;
	Wed, 28 Oct 2026 22:34:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q9lR1KFaXjST; Wed, 28 Oct 2026 22:34:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 70F86606DA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793226850;
	b=hs2LfutQt1aAbtemNI83sjj3XVeVFpP3g2N/Ql1SNzVsVf9S7aem1jHRjQKjvAZC3iqy
	 437FBlGhu8WwX3HtnpJ3WwAIlIodvnMGFIbD8SHcbEyVI7i46e7WMKo5cXCiYVO0B0YOb
	 JpYYr7gzqDDaQOZdwAw/LQOHQpwrIPqx0vhKkwLmUM0m24jSv4xRw+NJAZNSKMnanCQoY
	 vvDUvYX5xWNxOuVyTQC80o/kcVr4kOrDWjEOuJbwye+7Zq2DJ7tDeuoAbre2GbqCXRgxY
	 xgV8J/vrZsMfBFLF+lJJMZc+VjltK2FOWnbY5eQqOnldRz/F3ckqpnahil19SIiN1MA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793226850;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=lz+mAzHej/2dpfLnKFnmfkn2XzorsFfmQFvaTRKn2B0=;
	b=hPpRs3W2KNigZJQYIDRpQAzmjt3W1ZDo6ZEx8egZaEO67DGsecLX5obytlr5w4moTTQG
	 c+37m1KP2l4IjRyYOGSauCWzxwKoYYPbfuYcY++Oudxe/RegWJdtwQ65ceKhzgR5ltisK
	 I0autABNip/7sODweP9Kw7U22LVBMLYElQ6O2sCVmIuJtv7N1r+YL/o84fNF5DoSDWXkP
	 VLRWx35TSxor6bxSBnvzRJYH1QEW3NJWFMVvOz4QwlGL3pQY6Zrz0ucqnlYLFcG9x2nJZ
	 O62QjfoannIdIOBDd1EWH2/1PfjfgoOj6q/WUQx1Ql2eFMgNXTBEZ7klPRJFZh71alw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793226850;
	bh=lz+mAzHej/2dpfLnKFnmfkn2XzorsFfmQFvaTRKn2B0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R10lTL349tK2aUXK3FY2vO+xhnFkg9Ic1aODBdKWYS4Z2gmBccXz4gfDQjLjluRwp
	 vfoJiqbnFt4Ta+eWOJ+DsGqvafElzFaP9/4EsancVglg8wHtXqutiwQOlf15gBSfdZ
	 wMOuzlc+NAj/+xWt+3SyVHRTB81tFj6Lx9mhHefC5YfrB+w3wREfNGAeuCqY3+LvcZ
	 VhQOvmWxjiZgLjvFwmJQInT8/waAa/Hg/FXHaiOvxnqbYzMkKEYsVJ6V70nP0QBXXq
	 7Gb65HlYhuVDsF4h8oXl2CxPxldkYDcRjQHpLUBEltuv6mtGb0rXCh32iGsMJfXUJT
	 GIBS/v8vTwhzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70F86606DA;
	Wed, 28 Oct 2026 22:34:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DC85E2A8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE44C810D0
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rQ0Q3E5-GGrX for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 22:34:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F182380F55
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793226848;
 b=KL4yY3CQLuSd9sBk8PDhq38aJiT2p+XvQN35wKzP66n8tpQTahKHyjzlcXeMBrb2ZCQj
 aQ/rEelxVU/miMiOVI+tXjcqCkul9zg0Jn0JxTLvsWAM1GLnX95hYEWgz8U+vuLx9NmfK
 YAGAwjy8hfPS/Gy7i7HWFfpghYCat/7WqjGsUV3otJVcVRlIe7jZ2k1iGtaRZxJ52cs5S
 z7e1m08ecpaC3QfaURXuu6qF5uTVwP4ppOU9xK65AU3jzniYvig6ybLCB3iZUdQP1rOCi
 SNM6Vycf+DaRUWQwogTnfeBqRQL9qBqphuYZ1ZWY7ztV+wTSAS4wpvnBdurOet2AfJw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793226848;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=VOI7og3AGvbWmqoicU9n9Ggu8ww3QaVN/rGVOfgCSZ4=;
 b=fuYd7CaxxEZ7pttMX9aYauwoHsMzYhJhI4Kr7zf33huoujM7NuHJ5uO+Y01D3G2LhP9U
 zxYFRoPP5LjsSle+dvA5KJLwaOKrXQJFJDUAE7e2jpZKqr1Ux5pSTy5UUZmlx2gWE8u20
 0ntSdYxHfpkikqB7bmEwwwNT8qkhKb7cqf3y5WrH5OYlxSg7Lz0tvmsXSBAGToDNUNmbj
 VZ7p90CkVri9T3Kqz1B5ImF5PvQIHknlFWNrZbTWyW3H9GV1noscFqabL2uCUYdrjYHsG
 OhEcgwPbN7TihZPZGI75W9mVggeWx/t2GQaptMNSfN3Z4d+2hLsxPAI0+oxWMuIILkA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=FqkJ1dm9; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=FqkJ1dm9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F182380F55
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793226578;
 bh=VOI7og3AGvbWmqoicU9n9Ggu8ww3QaVN/rGVOfgCSZ4=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=FqkJ1dm9fVmIVuP6CVMmcASVi9GYg+ZBX1nBhDYliH8biwRnmU0PTrOyB7w3dgSB0
 JkUJUWw6KoxCK5ectLmx6O3V3oIzzRJHVnzc4AhwQRGsD2OZu5ZaeE5lI1uSuzexNb
 fxj+u4mheb/Rpx2SjU0zF5U4u8cKwnMfKEEEPFnmmreOGyl5va7CPpgkaovSbTyH7v
 HsCuDqByIozH6dtKcPSHs2hi/OHP2XGrJfWiQGSfsYRwI8H7hK87WDvlL1eSKpTOg/
 iCq0DdN0+msdU1OtSSHl+BsUaUT55u6xARKUedIDwBcu4Gg2GRHSe9iIypMYGWPUAk
 XjxFkA6ogpRrw==
X-KAS-Sym: v3:f51bdf72230551df:cTk2JoECzpqnGl/pf59mWisqZvMBXDYOA9XGs/chIxhpk
 tWelRTKRF/MM6j9c4LMiUUsl/7xnaot9wRDU7JV+E5sPbFnIbsth4GYwBy7SrVgIsDvKE6NeUR+
 ReiZDpU6m3mZXStAFKEkbGIqcXld4qyCPlISONxA0p1D1as1hnCqo5M4qV8BIt74q0d1pg+NXGo
 CwGP+VWPAHVhjYBPw8iTxRbcTiq8shEZiNVUGw3kIcW1sXWD66Pvc+KeoOHSLByVq85hA4A2C5a
 FlDr856MT8HS5m6OicpSpgJslOHnDDlK2Gcbl3hwTV3RSbZZMhMk/o6OaxvGf+5L7aVdVFXQ==:
 ai86q1wLXsBEQRbuYTj8/I9nGqex6dEt0gh+lAhjJLvBiquVl7o5IDu8cgDa0dUR3uOG1Zybl1S
 SQjqlt5E2FaEu76dsY8+gLSWDRlOFyVJsJMVEHAiY65m3lnVdQzfHpHBx39m0k8Lu8ek6UwAvqn
 Fomd5+EWCZ7MuemvCfq30S6DgQSmomUTxDhJxFUR7mEXm82mpCs0AJzLGbZoaZpr1xJgYmVkRE5
 tcHx869QdMKSg5x5PY5P7O5b0K3Sr04/mEJTFHQK5YRm4susM2stbnK19bHrKNiKESQ+Cuj9Zds
 OsPeeN3cytePQLYUBdBBm92ViV3EdHKTm+wH5zrus+rEwmQv+8Id6PpPpCLcnVKbAwE8YKyEccc
 QPjOF2OIJZRxLkPD6CS4DjecWrAI6MnGXh10Yh/kU8fP5S+wL4EiJWL2XiMMWe5ZI1Kg9kNEICT
 YtDe4AQgtL5BTFbzvGJaM/0UXmxlMiKCShMlIvh7X3JPmB4Sbz7/wlc8eG92drOhts9sGcxbNbG
 fy1IZNDxhkRFK7LLxCLTFfDh4Zo+COCgrdK1lH0Ekx+wmF52A8e2RKz/zxJDH90bFYwjuPunAa8
 dG3u
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E76E8A4C6FE2
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:29:37 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42186)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMC9J-000000001i7-3hFO
 for buildroot@buildroot.org; Wed, 28 Oct 2026 22:29:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 23:29:24 +0100
Message-ID: <20261028222936.514451-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028222936.514451-1-bernd@kuhls.net>
References: <20261028222936.514451-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 07/18] package/kodi-inputstream-*: mass version
 bump to Piers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash    | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 2 +-
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash        | 2 +-
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk          | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index cfd0b62fe6..146457ef55 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  c4a458045bf4edfe51a1f9f03ac777c7101c9b00e0e72c76ac51a2b3f530779a  kodi-inputstream-adaptive-21.5.25-Omega.tar.gz
+sha256  4aa567ce2de1eafcac02e341a726ecd0fb91be81c8c06f9e503cb6d36f818eec  kodi-inputstream-adaptive-22.3.23-Piers.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
 sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 8aab0c88e8..08db94c031 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.25-Omega
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 22.3.23-Piers
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
 	BSD-2-Clause-Views \
diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
index 497efef7cf..c19949135f 100644
--- a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b7223a30d2774e4c7cbd6c4f8a266bf4d186d160590077be627bd0490d80645c  kodi-inputstream-rtmp-21.1.2-Omega.tar.gz
+sha256  4980297ade011d9c9f34c668702d5ae9528650bb4dbeff34cfa640d3a86f57ec  kodi-inputstream-rtmp-22.1.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
index 7aef9c815d..7b487564b8 100644
--- a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_RTMP_VERSION = 21.1.2-Omega
+KODI_INPUTSTREAM_RTMP_VERSION = 22.1.3-Piers
 KODI_INPUTSTREAM_RTMP_SITE = $(call github,xbmc,inputstream.rtmp,$(KODI_INPUTSTREAM_RTMP_VERSION))
 KODI_INPUTSTREAM_RTMP_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_RTMP_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
