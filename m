Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E213F606A31D
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mTmoC1xZ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCB5782061;
	Wed, 21 Oct 2026 20:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9vmdFpRWR2Pw; Wed, 21 Oct 2026 20:34:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0D5D1811F5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792614882;
	b=qKP97ZZAyursPjC9aZDQbZagKwclX/Yrauelahp1zxrc/xZBNmppUwc+W7xoOhcbwpXX
	 RptKHKRT4B14UPy/pjPtV6Jo2vhVB5oOD0XMTvAiE/P71aE7JfVeUV1XoNdmcY3dut1D5
	 siUrzH95N6g+D4WgyEnpXs58nAPraQEx9ID9mqHP2jpCRf/Ea+wI0pob6gb/xDZucKSdw
	 dvm1ywufd3w1rXm80OSjjALbYN5fGUslj/jezm/bUfturVzVVxlGEeCKEGro2vlgJvTnQ
	 1OP0SoU3mURMeIRUt5iy41AngPSW10djcODoiPTRTKNSfFC+186+rjlQ4Mwv/xu4vZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792614882;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WHvyE/OYnonYGzXuwzF1pV/KoXqDflEiru6J5gBW+8g=;
	b=CIqyvy5PqIStHTp2Q5RVsJe0JxaC3+Z4yvbF40I+nIHkJFp66WGk9BeLJSJkJaPpgbUa
	 n/p2lic/vkSzBOjrd3wJ/ugNuBSiaQD1NJQBG3VTdBvPqCMSM/qDvU0O/jmnVAYSMVMfV
	 ByuhNC4ZdlVN9uMkGhQfE10l5ZevePFR2q/G/B1YCNn1yUtr3iCy4+KdicvrIOTAy2ydv
	 ea9RUuskza4czN/8CBF+7ICTdylhNhAp9LRa2/X4RWVpMmHmIB54NygYbBie/eK2T94xZ
	 SdTdFrJU8DK35blH8WBiDG6RJSmixqhc80JJHTHbhLhwen4nYJD99tO8T8XuWCyhdnw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792614882;
	bh=WHvyE/OYnonYGzXuwzF1pV/KoXqDflEiru6J5gBW+8g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mTmoC1xZiCakd+3naPdVoDmrGQwqrxe+mLu/Z3zxuY5HuE7xCCRVi+AgIH4pefHxR
	 C/FenbM9FG3iiuEx1ZzFVvrbGDMNyR/1QpCUVkvyOrHm8DreWqX/S+hx3Cekp0XVSR
	 JOPhwTqkaBzjS2PMGeQfkyz5noOoKu0kc/uXpIxBEmBnO5zq/HwiBHi51JgY0CCNe2
	 hNGbHdwV0zkykhm2gVaX4T99N/lIYM8jjxqXFHAjteR4vAh4utL/RNrygHdeT9fBr4
	 MErnipucAw0yUhQkyXma9AfgNzyLTFuCcJvXeW3yGzS0V0hS00YCkvowvtAXw5LPyl
	 59+Z5+idNp3wQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D5D1811F5;
	Wed, 21 Oct 2026 20:34:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 69727769
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FAA44016D
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z7Gy06aRQ9On for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:34:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A9D3840042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792614867;
 b=Y4gTGuzswJ2df1NyieOwey6dKaXqb09EaWs4DD7H73LR9N9DCWB293/oGDHUj/ufRg8k
 wSW6sCXy67n/OdRV4eaj7tXDkSJXF59mHqL2FmBwzpyZDIDSmthlQgpuVvf/kpeWDlxpL
 i/ASqPHFA52FQk0mM838/7xkFppSxnvs43PaG0gCH39VNIOCpMaWbLtneplcJtuAQ6Xre
 +dfJBx7qhBUuxs15T3zuR+8oBDjDdstMlzn5XpTUYfziMQA2fe+Kj5e6nJME7ymPS5yS/
 aA8lTr5L6wKyM9PP68G2TiXn/H6SqyD4FbrP+EDU7XkfmgCXP1s1Y+MUBONj140jdxw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792614867;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ZA4Yye9XGaAsP5HEeFbtCnOiqRkWMA7Wb9JPIKWRnnk=;
 b=dhBL5LBq2G7ISrI7zPmkyHQ1O2roCUt0mi1epXnVoP8ugtgF1i1W2VT8Sz8HptGzsmP7
 Dmmr2t9C+ZEFzt0u25D6A8rOEy31nDjkQEizLbW4ltx6tuAXw6D03twETsqdDdfL6JOgm
 yb7fwyajYAknujur2a/S327xgyIWe5ZdT9wJp+HgARaQKrzNUbPIM/m5GJrWfZXMIGusP
 0eVQvba7BqQA8gzoH55qUbktDkhE1sSE4J1QKybEewMr8LjIulzgv2rhdhPMMfT7OiFs/
 x3FaHux9MPlAjMuxVcPwPNRdiziwv1x7U7bWKgaERRXSs02t2sLqpCYKEA3ZRrcN/jg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9D3840042
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0031999C78; Wed, 21 Oct 2026 20:33:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 22:34:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7d1f43fe182b999979e624995b3f1a2ae7c970ce
X-Git-Newrev: bd3861c9610d93577cc7ed236cb819ec6ede41fe
X-Patchwork-Hint: ignore
Message-Id: <20261021203304.0031999C78@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xmrig: add support for OpenSSL
 4.0.0
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bd3861c9610d93577cc7ed236cb819ec6ede41fe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../xmrig/0001-Fix-build-with-OpenSSL-4.0.patch    | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/xmrig/0001-Fix-build-with-OpenSSL-4.0.patch b/package/xmrig/0001-Fix-build-with-OpenSSL-4.0.patch
new file mode 100644
index 0000000000..f9b49a0070
--- /dev/null
+++ b/package/xmrig/0001-Fix-build-with-OpenSSL-4.0.patch
@@ -0,0 +1,36 @@
+From a768091a0001cf4e6fb24885daec68d8c48e1cde Mon Sep 17 00:00:00 2001
+From: Reuben Roessler <reuben.roessler@canonical.com>
+Date: Wed, 21 Oct 2026 21:33:52 +0200
+Subject: [PATCH] Fix build with OpenSSL 4.0
+
+Patch was suggested by Reuben Roessler:
+https://github.com/xmrig/xmrig/pull/3808#discussion_r3799768416
+
+Upstream: https://github.com/xmrig/xmrig/pull/3808
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/base/net/tls/TlsGen.cpp | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/base/net/tls/TlsGen.cpp b/src/base/net/tls/TlsGen.cpp
+index ad2e648b..a5306789 100644
+--- a/src/base/net/tls/TlsGen.cpp
++++ b/src/base/net/tls/TlsGen.cpp
+@@ -114,10 +114,12 @@ bool xmrig::TlsGen::generate_x509(const char *commonName)
+     X509_gmtime_adj(X509_get_notBefore(m_x509), 0);
+     X509_gmtime_adj(X509_get_notAfter(m_x509), 315360000L);
+ 
+-    auto name = X509_get_subject_name(m_x509);
++    auto name = X509_NAME_new();
+     X509_NAME_add_entry_by_txt(name, "CN", MBSTRING_ASC, reinterpret_cast<const uint8_t *>(commonName), -1, -1, 0);
+ 
++    X509_set_subject_name(m_x509, name);
+     X509_set_issuer_name(m_x509, name);
++    X509_NAME_free(name);
+ 
+     return X509_sign(m_x509, m_pkey, EVP_sha256());
+ }
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
