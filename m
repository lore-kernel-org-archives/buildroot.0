Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08143606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=k1AA8+FI
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2DC260AD3;
	Fri, 30 Oct 2026 14:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qpgnfMLiJOnG; Fri, 30 Oct 2026 14:07:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EE6B060B2E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369264;
	b=T5ePgQXSc0rhMxapKFkOoHtLfn3CBBbtcCpFUlara5GCmNCjv8FdfDHKICz68aREdESO
	 I9LcdGOXghw58jwyCnO38KH/cxAFapkdQAazCZaFTJgXWfcdeUEX3sWU1WsE4jmOkX8ii
	 1xIEcmTpKUPbcLhd54OtwrQ3G03hpemevAyWcRSuCheALNDS6uByLWlgAQ8z59Spi9mx7
	 o/nslaK3s8oAN/nYlEmrF3+sdQf7UfZZtbVzfEDjiLsU4HUygA+/h5gso2i1YAkbJKq44
	 NZnM2AmSfSZ/0WLxIhF1j7Hdc+AZKvLNbAL/KLgucgXj4P7u/Za6fhyAoNksylBdbRg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369264;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=ODiTBUYEigclVDCAD34Lw8u0/6V0suxPY3v9kQbZtgo=;
	b=VHjWlnJYjwNiUbvHHvGg90F7COGmmHeCMnWj8Rcim4hvFcDyMU5lp1Bos1393XxXRnv4
	 JjsvCQE4uEnwrAWap4G//5m5z7laqfyDbzUDrUoYrn52vU6ZCGhcT/892uXpuVAjAvaAV
	 Manpd7LIiguwoehyY6UM+rKdRzbPxBgj7tcUB4MTb+beX/14m9hUlkuaLcf40AkP8N9bw
	 nOPvr82NTaRIqfgF+OaZKxK/UyuYwQIyf5NnAn5lsRluU64bXsDa39D5WjUjAAtGdRYLW
	 aYyYyUgCo0do/9FYcyjorQ+Ri38aw1y8jPoFJzXTFqWeDXXifjcDsfep5LOtvxlk9CA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369264;
	bh=ODiTBUYEigclVDCAD34Lw8u0/6V0suxPY3v9kQbZtgo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=k1AA8+FI+rMvkHmV1o18i87tm/Bgpdycc3Sucu/EvgIxEYm1xUvNJMt+NC/LSpaUi
	 K3xTMzugLO3nA7/VdMVTJ3usCD+nrvxU2SKDtbJ5K8G9tsijF4HxZ/7AooKiSId1kI
	 SaiDPKfLBuCLc0c1RJfFg7ELlXQV3VDDeqPUlUY+50Lh8AUXe7f5MAUSvkWSXUnSun
	 pE4g38LF87UxFU3fX+uDomp8MZ3jEwrAgYPo3Q2RkvONpSEx2wu7pKTT0UjIKws6gO
	 FrVfBWLHxTfjzR08xw/kPChNDGmPKAjPpCiRazmroybltonb47qFO0rNu4r/R25vzm
	 G9ulXcyrXjaIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE6B060B2E;
	Fri, 30 Oct 2026 14:07:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 97A3BD48
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C4CB81191
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QHJ8VxuTTAhs for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4601A81195
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369166;
 b=sSTkWylcEa+STUM+wlGGKXj8dFHp7JK9R/fM1Kg8T5cTDHDYY1sBbWMMRPx+DXeqsp6V
 2a+7RA+sYDf4npVBMo6l++WL1L10iNDi1OtfHEYV9XgO63PK6veQdxZoQN3cIoI/OVXdu
 Abk8QSpL6HokfeiLml3EiHCnQJyMcbmoKr76nXw/8htKwwJTuwPJEgvMQLlrNQUrSNfy8
 BaTMPhkyhQ4HuckIa5rCcWTyq5QOUvvazal7/tWPgZi/yPAgeH3Ebavhs5KIkmcmrP3o9
 EbYykYEAboXSRyK0EKswDyFil7GVLnwGqKUSvJish51josIIDQyotZLBcpULBpERfaA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369166;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Y01c17cpWacmKjbZjflSB5biEMx2HT4mciBNA6TrnRo=;
 b=cTiVvOqatCEqhq6jgdRYUmJcOxY94vMuELiEVlajUnS1h0hxUdkiuRTyLELb0CeAwWvf
 T7A12rvKeLNEXp7zKcHSJi0vg6FiWPKPhN2gdPjAYhT6vWAPvE00WbtIwSsPv0Ppx4nuA
 pXCtkDfBEzw1df9kYmXP+GbX65MnjAp/gS9+v6et12yBi6odrkZWD66tg4E48IQGg4xlZ
 MPIFfdgpjuOBadEJTcwG3q6DbKxODP/eWGOII0TtjkAmc8LHDDw4/iMy5okIWaRTC7tKx
 ekH4VKFImhpzIaEnpvp+MyFB1ivrBijAY92/Um8nc8LU7vuJTxEXIZPo/P+HMKpL74g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4601A81195
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65E399C668; Fri, 30 Oct 2026 14:04:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:58 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 52e831017449cd4388d459ca2ee6772ea05a3f60
X-Git-Newrev: 89f1dc39b09a60147ec020c5bdec2da24691b307
X-Patchwork-Hint: ignore
Message-Id: <20261030140438.65E399C668@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libnss: bump
 version to 3.118.1
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
Content-Type: multipart/mixed; boundary="===============8886963403896186009=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8886963403896186009==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/89f1dc39b09a60147ec020c5bdec2da24691b307
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For release note since version 3.117, see:
https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_118.rst
https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_118_1.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: add link to 3.118 release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 16528da35a0de376b0403891797bb88e2fe78965)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index cf339697ea..d4824bc81d 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_117_RTM/src/SHA256SUMS
-sha256  5786b523a2f2e9295ed10d711960d2e33cd620bb80d6288443eda43553a51996  nss-3.117.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_118_1_RTM/src/SHA256SUMS
+sha256  8c390a676ea37266fcd3d0cd2fb070e2f69f4d78fa4ed88e07ac0c9eb5aab8d3  nss-3.118.1.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 12a1a7c140..80d2035fea 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.117
+LIBNSS_VERSION = 3.118.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist

--===============8886963403896186009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8886963403896186009==--
