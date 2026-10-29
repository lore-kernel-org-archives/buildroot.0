Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71BA606A31E
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 14:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=V1GErbXe;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=EghlzgQB
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6CBF80F90;
	Thu, 29 Oct 2026 14:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zK88BKyUEiSb; Thu, 29 Oct 2026 14:02:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E758480F7D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793282546;
	b=q2QK4N1+BJSDzBgqL4rxylAVu7g82u1gxsQTh+xHr8za94FQzvL/X/hkLg0hLt6hN/kM
	 ONBDvMA6AYntybN6AtaZLSEHYDZj1V3mYC11dbhImLi9GLCRYKBdNV4EfmKFp8GDGOhMw
	 wRJUlgQEzOXZoxTIcNBIut4vOHsyuu71V4BgI6Sk47SI+z5cteYqmVu2QGsDxT4LspaL9
	 //NTHbJYx0yMi2L/tTtMykk/fKSZDqx3z7pKhW/jbb23HVTqeNof7gAKRTUhlSbQ/34gX
	 RajE3oxugJc5X6h33rWT9f0NfIB9PMF5Cwqx9v+Jm6YrPQzSKGc0nl1oCnCgHNFs0CA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793282546;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=82pj+rlIqEf0uetoZBuyhNN9Owr95p7ktBj0RFsaxnc=;
	b=kkgmFUF+zfpLL8pENGw+RhjstHNu3VwOKzN9dFttf6T33IZUCImasOmENX9F5IJh9m88
	 LH5SHH6Gm6B6tJNa9nzza3GGMwRheG/uVvcqEaFC7YHyC3S3G5hSBFqN4IH3OxgmJRfmJ
	 Un6MXdm+VPfEsn5wEBX7TIGjvDe3U5Ej81JTlO8CIR4akvTbL0STkTlQOmWAjly4kyhyH
	 cx+08mvyxmxxrxhzheCpOlh9sEBmA9R7miBr3yfSpEw/yvMuLgn6cjbsCEJbaXpbk4PN2
	 mWAsIAFKyxrML3dSi6bJzpkIsfKJEojOKEDlCw5BySQ6EZSlaR9OJvCmz2qImrYqQEQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793282546;
	bh=82pj+rlIqEf0uetoZBuyhNN9Owr95p7ktBj0RFsaxnc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V1GErbXeZFprJZsbMvNsiawB/rcPzSYlacFX7UsFajYVmExsBMh7lecxmQfsQzxkZ
	 WfrxQTcaxAig9oe8NRPbzrbH1NwLKLRCNzmF9tcmoJAaf8O5Z2Zh0dfDYAzgfqJkhm
	 JqKzzR2TI2yD1qt+/pplKNOBKTFReIJ0VPlrxSifI8wkMYBkY9xk6T4leCqEb/5J+B
	 SXmmOSQMD0x3FT18un1C8z+PXNqtBQKaWCPgnMMcDaD5Ius68a2Eh+aGZUnXcr218m
	 v1y9oBRIBp1zymTLkTTCSRKXXtwbIvejK3baj9EjIy8sMwAkuMeoyfcbVr/jTTrt3a
	 2jWmtcDmSgKGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E758480F7D;
	Thu, 29 Oct 2026 14:02:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E1C4A972
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C78F46069F
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cqp-nXT1n63X for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 14:02:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 37B256067E
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=62.149.156.102
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793282542;
 b=IwVkn51T1eydyO1lshbVPetiDkifod1rrPhIsDemGOQsaLzsmQw9NN1NRR5aKKRJnMhD
 5nLk+kIhiYlEGZ/pOKlBgLg6wJ/lTwthYGLyZQNdrl53qnxcgtJQuff9HD2vk1g4vAEfm
 Y/aDrbf2nD5Iv/YuWKX8iEUdnPyjOB8rQyEIpiJmCa5k+wJaVY2AHs6OE5QO4jyNFEpQG
 dzSJLU9Bc1yIyPuYhS+bZHZqvHJKOaFi2p1uNdnDepc1X2HUrmSchAGpT9uAvVzZfRPgp
 KZOPtjqhA4lj4Jn+c0LCP4ova3LWD0FL+KJfXyBFKLzukyUmm8uxzqUMwoLgP0xmTvQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793282542;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-CMAE-Envelope;
 bh=FfZR1jZ9GEJ130qfMJb4UkILFnWaS6xUarwQIT308W0=;
 b=eKTYi8fIWr8KkKSMjRVoKfbgb9JPF1wUShSZ+og04a5qmkC0ka8a62DoagRLwV8MLdgq
 SMIi8klE0EcVk3vs9zdk3nkKaB5/86AFJ09Tn1d67cYK6w25bP3ZXdt8fDK+iR4XoyHu4
 AwDvcymoIFhTe94x/qi/N0VDJ1dlYZSgMsB5HIS2PS06peK0/vvNpzdAGalPDm7BamKSa
 P2QQHpA5TXspYqUoF2sqBwkBxI1KjJUKHw26gon5//o3Mt/5qHAU+X9g2M88+M/ifjSRq
 JhQwQgoPRQk4rDig2Y4YcBcNI9gYzjWpAsHS1IMD/upDN4Ujk/uJPk+zBYK6hF7z02A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=benettiengineering.com;
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=EghlzgQB; 
 arc=none smtp.remote-ip=62.149.156.102
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.102;
 helo=smtpcmd10102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=EghlzgQB
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 37B256067E
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:02:20 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id MQhsxVUaoW41bMQhsx5xaT; Thu, 29 Oct 2026 15:02:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1793282536; bh=RNv3M2NkmkvqA6AlMt+SSClbVofMj5WWHkTe5vcnZYc=;
 h=From:To:Subject:Date:MIME-Version;
 b=EghlzgQBKMpygrJZ1+98Czv8rw5W49b8crI2GbXd7v5r3yMe6o5hM+XxVkLPSDRzx
 rzZiN0i1197+PEE2213E8Eb7O2fh7h6HdWx4PgmqjAQmk71XAL6Q+S91hpupbAw0T7
 KMco0W3bcxXMr70i3qLnO3l8AU1feqF92LP4o45rLItT5kVhDeprRQ/2buUXSBvzBj
 6TPUI883cQp6rVAcov9b/4t3Yhtols5Uih1J5e9/mVydt3HsMR4Ybf4XYQEU/4a2gO
 KUiZZDGwWVvaHxKksFHhsvp1xhk2jx0XeEICMxVJyFYKEBYt3a7HsE8BFrju0y8PhC
 mcWuVFxGmulNA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 29 Oct 2026 15:02:15 +0100
Message-ID: <20261029140215.181385-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCHuBIONraoWSQMguKz92KEfh3KLaGWn4Imj+Wh9AXzYJLtrE3ksVBrhAPnPjREylYp552D+pqu+AnOy2bhRYikpDX1xtQjfZMpLsaDDjPrPmCeqpg+5
 C/Q3guSiIIMjWNtgQur51FVZnwGOgiDW03PaJAIOuVXq4nBWE7ol/QQrspNk9e+Qtqzqd/d2qR/qIgQUwNBDK/3DZwziF5Tbg3ALb0iLaLbh3sEJVhZaXq4b
 IqvSAuyqlHWGk0n/O7BO7zjMKawhWe//tKZguQXr/nA=
Subject: [Buildroot] [PATCH] package/harfbuzz: fix build failure with GCC 15
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

HarfBuzz 15.0.0 enables _GLIBCXX_ASSERTIONS, which introduces references to
std::__glibcxx_assert_fail(). By default, HarfBuzz uses the C linker,
which does not link against libstdc++. This results in undefined references
to std::__glibcxx_assert_fail() when building with GCC 15.

So let's enable the with_libstdcxx Meson option to use the C++ linker and
fix the build.

Fixes:
https://autobuild.buildroot.org/results/f88449ca8a3846ed2bdbcabc00a701ba73ebd5ac/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index a68d8658b8..7395a2a93c 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -94,5 +94,8 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
 HARFBUZZ_CXXFLAGS += $(TARGET_CXXFLAGS) -DHB_NO_MT
 endif
 
+# Harfbuzz uses C linker by default, force C++ linker
+HARFBUZZ_CONF_OPTS += -Dwith_libstdcxx=true
+
 $(eval $(meson-package))
 $(eval $(host-meson-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
