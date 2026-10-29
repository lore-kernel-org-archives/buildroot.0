Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AC6606A31D
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 20:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=r5iP611P
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E46940A76;
	Thu, 29 Oct 2026 20:23:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CP0MNnF8Xsri; Thu, 29 Oct 2026 20:23:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 775E640A68
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793305407;
	b=V/UB1kw4Hg49DDYnnynvZigzwlb+TOn7l76hK2Ef5olCbCvVVVGbZUPTNezFcY3CX/ct
	 QKXQX31FOlu6btXcS59bMMMnPqLCAwGtq6nK32NwngoozqWkINMf3uyoAA1dDUqNcohEO
	 xX0JTXZo1qgUGFtS3rBZaDnI5tG9KTiVMYbONn1DzlYLQJP3prLV1eyKGtLiKH5eI3MI+
	 6nRWmDiK2E4fCr9OeM0h73zYdLu/ccBcICghTnE0DX9vufO7zEo6sfHxNjtUgxbfE8WP6
	 +3VvK64yXOEvAUDtgcr7gF08r93ZtI6Q17mX5wDuJXerKZtigBLi1/VCcxp9v4zkO8A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793305407;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fwOFUkkRS8DT+VD4KqrH28oVlP5HcitJgksWENkkmZY=;
	b=CqzYvmIRsglV+IjAPfuq/swnEMdIc8lhyIgBpylPZOE/DAz2k8qxLGNMXBj1MwJC/qIB
	 g1H0XpIUGW0PGqNCGUm1rctLIqd8db2nHw+gqG+3M5GJIKfFB1WQtcZRw0usqAQ4zDy8v
	 BgcWK2C6QmY+znLBVB7ezbBzsHybP2QsWXyvBMMlEKjG8u9Z3BOompNl7Ew88vhMNtime
	 fDt65PZHOy1y3wLvPZEPe6CPF1QYwtERSGNaRBfUZx3+hTKC4C5Qc4VNlVj6SuuIVCU+N
	 6baVaYWL8PD2glqAL8dNF1rbzVlQ+7Exn6riIO1aaOw7W2MwdE8kR20BnLDNcz5FiWQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793305407;
	bh=fwOFUkkRS8DT+VD4KqrH28oVlP5HcitJgksWENkkmZY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=r5iP611P5EO3B3CQYiMeCytQWIb60lGZ7Ge/P2yO87KW9mn1c97+Uc8y4oJwJd912
	 E21tsx1lN588Ne5wUwMwQ4syu9htGm8F7/iJi4EwBvbNbeUyRpA0CssRl8YdEA6xoh
	 e/ElaJ01PIYuAYbx8Xfpkz7KtuhTYmgkuyZtRPGOxKvbredewF+DYEg122YUwCPy+I
	 A64OAHTeLwotgzpGqdSHA15TS/6YDg9JmKMF1aOerBIplrJSYwbAHeGvojeVr7v+T6
	 eK65mwpI/+wqMGkypMm1ghtJdpSGApL6qUFDYeSk/8bFbmbx0Wx5LFHTtPwR/jqQXr
	 tOxKxC0rh0wRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 775E640A68;
	Thu, 29 Oct 2026 20:23:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C227D36
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A50280DAB
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F1lhNupUdMLK for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 20:23:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A1F4C81011
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793305400;
 b=C22esPZKKjuy2LmTdEcXo7K3SWcvmgVG72FYLKX21r4RKV4A20xGg6m7bYp3nD+sM6+z
 DCotIR5BGdWi6N2Cz3APyscXrWVzGJoFW2aFirFkQzpFKZMdOR6JjowsV9uy7i1FMEeBg
 Wb8VCqpVEYczuklplf4BdTxAfXOQv8OBpqdTDa4y5p8J3eNlAuMgI5lABrPpcUw+jn/0W
 oYrTMnI5385rx/erXdMTXLonqhUJwipFkKsXjC4wKnFtkpuzYZ5z8HpT7sRBwAKcZaFSi
 2ItQ5YC1rhTlZnU30PLE8GaHbBqRWLMDIzQ82kh4nU732S9upinX/D7Cfdzrrd2VILg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793305400;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=PRMFWU74D7tc/XZ0Tdat/Bko3t+m+osGOyef2NbsagA=;
 b=UTiB5/lj3S2uqblPEr+Slo08YB04IIcIrHlJmGBPbGu/xbZ62N4P8JljehcS6KMJy0F0
 CJeprcap7S8IY/Zpqe6ovfhQudIzVL096AJzu86UvQqNaAWCrm1nXQfw35j38hlRcV6bJ
 tSkHbop5fb1Sweq53MfUPGF7lpBpRidF5cJjmgAUSlIJ/t/Ju9k7VCAUJXomyc8rsZZJn
 2CseWHDcesHviQJybnvn1Yc6aqblFoHke2uO1Tuxw0y1+Y9ymGKYVN3IN+/Ak2/Sd9/P1
 Dg5mmBq5Y4BE4HKy+ejREzztDZW05SDu1345Y/lkn3aGDlwZlXtN1FzQ9GS9G9Gt6kw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1F4C81011
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2667A9D2EE; Thu, 29 Oct 2026 20:21:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 20:26:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 98cfc2d6ffaab58a868e324e17a5220f67a69126
X-Git-Newrev: 5def659d99f73a2e879eb612f087456d9c14f3f0
X-Patchwork-Hint: ignore
Message-Id: <20261029202153.2667A9D2EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-inputstream-*: mass version
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5def659d99f73a2e879eb612f087456d9c14f3f0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk   | 2 +-
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash         | 2 +-
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk           | 2 +-
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
