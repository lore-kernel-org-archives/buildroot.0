Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A40606A31A
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 19:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lKL5PxNF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=tpay7JT/
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCA2681E9D;
	Wed, 21 Oct 2026 19:38:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g0Q6ujg_4SQI; Wed, 21 Oct 2026 19:38:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C49A281F02
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792611526;
	b=K6FcOEfdZ0BPaa3N/eSbqUz6/5+94WBe9sxQkQ4vy8aDhvRzv1pYCzonxvZYPRzytTT8
	 XTUpMGToScra6e9rL+lN1sQXvTfCRR26B8+NErOgdHpjoYqRpJ4xk2dXyidrGvvlloMRB
	 xoDHVb+3VDE6fvn3Fl4lcj/KWJqpMEBCrOAWT/6bu1fswKrAIU8l78HjzntSim/n+QXh1
	 UmpJcK6BWyRU+EjFbSJbeL4exUvU+HM5GfFkPQ441WGPh7aU6SvNzvls03rkfIUp5uzB+
	 mOY3lyLEE0MYGhRHS7Dm2EedbGHc+pdV3VjsZ+N4rN8G/3TY+ZjKct1B4+/psu4+FuA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792611526;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=KP5qwGjR3FzoZBpOVWY0ZmH8i8VS7UmbbNUd6BS/C3s=;
	b=H6uUgb2LTyteqmTS49VuI60chPFqnnPsccMcWjGrPtHqj9nT8m9UqoknGyQ0melxH8HA
	 GkZePOyPqTbtCz1gFoo0OinQ7PSw05qPEA4kc1Qn5qD2zpvnSjhVFCtWODYaxE1APHkk2
	 yo5SPnq+DcLGdqLoJRxpOAzwHvYk4KIcdoy5leaaxlEs62UylpZq/IWE1pYxed+NO17sF
	 bummL8LeHrcXGiXRfBdYtfBINAYUSUyigxrwOG81R7R9IZiwlFWyFhyD50kYNyAqNhjiO
	 N7y1x/fgcL98O0eyuiXmxUUmkW46i/kB1bYK1RxhpF4BWRxsdjEVqXMP8+pWt+dX/PQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792611526;
	bh=KP5qwGjR3FzoZBpOVWY0ZmH8i8VS7UmbbNUd6BS/C3s=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lKL5PxNFQ7nYD6piloGdfHUfWZqPR2UZbdPwTo8boPjWyjn+fYzEdstdg9CZvMXm3
	 Ic4Tq2StCtZTUkBk5HmPR1AKjwepixC0Y+ptmKpxMCyU3XRncuzL2fv2PaL2fxRqzn
	 rCuc7GhdenGIGr+dsh8qme+MYyUFeGKJj9QzjkvuWfYsT/SJnFhhyV1gp8KLhlx682
	 yzcxVMv8LUCpMNMZuVEVYDvQ4Vsnt3RCXtDb/1AyaQftnQDxWeX1e6nhZ17i8mZuz3
	 CqqQi6IX4SJbp7fPNdZT+Y4oi+Q4cdMWpkGPU5j+9gPkQk0RTsJLXRet6FBWi3N+6R
	 q63R6s+B1NkaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C49A281F02;
	Wed, 21 Oct 2026 19:38:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F2FA13C1
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E47CF4053A
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:38:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7jKC6uRc5_Yp for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 19:38:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C780840552
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792611524;
 b=Jz69bAILadeF9rtsAl8l94i+OuHMmWmXAZ4Ci35GybpaJIiEyOvfK8Z30AwOm0cub0WP
 8JlYtzZFsK9DM1gUunQC2qDFTn2ysqYAzAm0QkGLiFdmkehtGdtmE7IKABjMwSXyOBlwi
 04jYDLKdtMGgZWm2juWWKR0CV9918APJg9AziecK9JBjOeZ9U2568rCFtlRE944DPUvAG
 8TuTiiLB5IBa6R1SSagM44djoz/0ZajrD8yTarX3kKroz9+ZCWuvX3ut9vExSO4wHCzHv
 CVAAOboj0Cnr6gMTV1sFP+UXtLAQWg9zsO+RbGwKXyHBw1yT920ZO4zBucZVHzSdptg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792611524;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=AALuTcTCsgmXxnkrEpFuHIBHlxAQ9nlXCaEckBVJJoU=;
 b=jywFSr9VYXBpL9bFNslHro+IDLqUDb73xWlswOxNUmtFZymkGCGrfF7UrwToX/lABj4q
 jmTqtdjhkJiWYsXpB3IQGUurPZx3GR3uo6sdF2ROgp9PGvJC+He7muTisid4Kxa7vY5to
 i3zS9whQxik3DIlVBXm6XTz/+nJm+YQg7eKsAoo2dzHQHFJCeq5elod/8SlEQ5hWldeLr
 +eSKwUWiPeywtMeM+WZexX4UkKyue1z5mqbfZMWrt3mfiKA4vb6l6gxRS0zj6PFoNxgLH
 BeGiO+tqdj8LTQ7Rb6IEVHx5F+kfkoJqH9WWNHuPLdB5bqOOWGB2IMI3MEdPtXQcLsw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="tpay7JT/"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=tpay7JT/
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C780840552
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792611520;
 bh=AALuTcTCsgmXxnkrEpFuHIBHlxAQ9nlXCaEckBVJJoU=;
 h=From:To:Subject:Date:From;
 b=tpay7JT/I3kKh8xYlBGakzpsQT7CauL1rZiqHeMSxA8lDzKe7JgeE1GNp/XlxqVU6
 4Hopx0TgPcYGcr3244yahoxwyXYhocBNDXKBW69Zs0zer5mym6+b90DMeWNUfAwNr6
 3HXeC1tD1CuJOJD/DtyXGjQYPIKhmd1/LdNI8TGuJzDJAKxsn40KGHcgJL8Z8frn7a
 vGGW5pwq67b6TR+UkUgVA6U+4gEvRkKjWeXlMQ3gYusohn2bStiLn/zex3mfkwimy6
 4UoEEuDxqSzRHdjk3hp3W8WfzXcavXhPXce8FH28MkXseooIW1OiTnbi3x/mpMTLFe
 C7DmtkOZxEDoQ==
X-KAS-Sym: v3:f51bdf72230551df:r7CgYwwGehmmnk+LyiytBX51W/KkTICE7RDECH0QTK2mA
 hXLPmsOMCn31LxojeYNH9UEylnpBolTDFrZnWEgcr29zW2Y3EUljh4ymML322CfjK+nSMlmEcTo
 6rfENkeBZhXkW5y5sp4OyXHZt9tPSpr5Ozwr1V4pJm1lOlSqTHSxHz+7KsgyXmsVJGYeto/WzEQ
 jbKbpqhHO36+PTRQq9xOld8DzzNEcAJid7EkOOq3cIG0SDNbPD/YO1DCxU6BhJcyahdIJJ2PZGJ
 utsVpWumXodPuibO5HtKO7fhP4ntHt/MyWuLxn0C5uXATaF5RhvqDWnlZBMorX7oW9BYVnDA==:
 4Dl4LCFPY4Oqkxu1RnDVZZHrgcGMxZT9uv5loHb/BpzSMC6bakIm3SV0ljH9fUecXkrB2mdQBoL
 xw84wqUOhOPYcwN+hNXkWjInd0525UKtErd9s7PrpNNhcdVmPQRFQvLv/6rA5nidNIpb2QroQ8k
 34QxH8etAq5ZUvaPYrJGUMOdYK7a8I1fK2oKBWD24/fLiT/hipEqsrvmBXcr4vGPzxW3H0JoMCq
 1RCH0uFNgLgGVWcNmM4rerOGjPJWxfmxXiRIbBQYDyrHg5WVRXIm660NbbRCyuREvks9aLrYbXT
 MlUNZVts4HTkppnlCc99Gi+6nBlLlNpfQeHboDXfG0bgmXm3nIiv/xbTJEWSR9sXrlangLO2nXE
 hOPjZYn4nD4FgJk9hJHAF9kxFcH5lQiiYpYbZkCNQ1DL+iGytO/a+GlH+Uv9NkDOCcDydNo3Dbv
 /th8LSnuJSyS320dJsPCEgQvUruakIJkQsZNIuJQ3ZHekvIVfA/6F/b9XCMSgqSThg3r929Yqc9
 9qQ6ku8FO1dM9XqIuaebzSFJ3EnOjDPFURwXKed4vtRUn5AR8vNtwkOLp7cUghPWO9AfiOOkKVn
 4ejQKA==
Received: from fli4l.lan.fli4l (p5b3a054b.dip0.t-ipconnect.de [91.58.5.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C1E13A4C5E2F
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 21:38:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45942)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xJc91-000000003vx-3pVv
 for buildroot@buildroot.org; Wed, 21 Oct 2026 19:38:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 21:38:40 +0200
Message-ID: <20261021193840.2613533-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v2 1/1] package/xmrig: Add support for OpenSSL
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: updated patch after upstream discussion (Thomas)

 .../0001-Fix-build-with-OpenSSL-4.0.patch     | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/xmrig/0001-Fix-build-with-OpenSSL-4.0.patch

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
