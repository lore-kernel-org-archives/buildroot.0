Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53B4606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 07:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=clsr7xKV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=cLN/uvSy
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CF7C60664;
	Fri, 23 Oct 2026 07:35:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ckYuPFRfQ_Mk; Fri, 23 Oct 2026 07:35:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 56B2D6064E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792740923;
	b=fisad5FC0KpiPsl8tjBMJU+1mmBrlu1BnKoqq18oYf8g0zqyfLjkl0XFVAsBSHw90po1
	 x2lokQf7duDFTkMTRW7xKDPeZe8/HnqRtWiVuDsrCn7AUzx2Bg0pMs6ymN8MbraVxXfBV
	 zn0iO9mxuKZC6F3Zz8BROhbip9l3ti8jUtdtA0n3WZ7R1GTL2TwsrMEWca/kjspgptuR1
	 kcwovtnMuC3pRXyomy1XWcNIwPr1P2iNskcNn6GYH/KdtsC1EMZPiOWOlib5mPjAgf1ov
	 x1sp0dwB5f6oPMKYhqgHVaq9gJRXlf8pBxiqdrRcEq7OPrOql/eEKYiFscw+ar4lbtg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792740923;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-MIME-Autoconverted:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=JrXheDEKTrTskft4L6PDyMht4nIrPh1i8gPANNvFf0k=;
	b=cccA5yjWSHWISAcpsaU9UuqY3xd+yyT4gp9PJLJuK7BTbFsqiNTk2xep1K59XgXw9xn9
	 OwQMh7zABmeO0mj2ihNP1h30aLtUEPAoy9IBJ4iHiGxF7OtuKYs3nOb4tNItoY5BhoJBt
	 N32P4+REJVMf40TIlbQ84/kohUUoXTLUSA0slu9u/UtIc1rCtWWgonoVOKkd8H5ik8tiJ
	 2FkQ6dXJChHvVAMAyr9V94buuIHz08fuDZeQbYV6UOrd6G7auLPE8tIwAwk8c/qM/PoRs
	 PxcK9ebQFf0WKqj/O4dwC8sWkn2mCs3CUgVKmWGV98PeHQE9x2YvTV7WKJj6pRiGnyw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792740923;
	bh=JrXheDEKTrTskft4L6PDyMht4nIrPh1i8gPANNvFf0k=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=clsr7xKV/owwIutRkkTBbfuBt33GqxDYbo81aWDd+dBSu4iAV6PpFr4AVd74mzbJo
	 hFjrl6wlRfstr6utmI4nHEDpmav4Gd3uJZ1YgcdpdOnYXZ7FB7r9ORGahiRMnuoncT
	 9jKv0zQwmqb2rMM7Hqq8BnKOPVLMrqT20bxcuvGcSiqm4s5mDji8c/93rKtByU0XyN
	 r7ZDbGrnBmM6KfWfpgfI8T6yq6+BS8WBj/gN4N8uKGyqkaBaGm0lEQuNWl+YviXjar
	 lRi4fW8XOgWmQg0HnTFN+J41M9XOtQbi4Cx5Yn3asS3Du1PQJgPTrQBNahjGPBnn4E
	 54SzQmtypOVXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56B2D6064E;
	Fri, 23 Oct 2026 07:35:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BBFE356
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41D0840820
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3cAjoLd7gbCX for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 07:35:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1528440828
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792740918;
 b=VfrmrjECvKJGfZnLQcPVXyZZdXMl4HrL0MzNmFn/RhIPNR+pZkhcef4c+HCF1+T0Kzdz
 SlYBsoAsthNeApyTXuXapv23vlFevT1kFNewgKLaXeNhre4eDKiR6VZV5Dev72znZBDzK
 +UNrBWPl8quIyp2R5bdqa+qVSlUyZLTRqhYMSS/G//9jgzW4QbCgjrSVGKNRPJmKsp8Wj
 tY3d8D7RRTeiWCpUicFtuCj8phBfPeoPhlwni+A+YeboUdjYs9QmQ1ypzLQuUgz5dFAn5
 lS1xAaqtZmqJwQiLAksV4IsFOEE0V8nRaBajHU61nfhpkH8CuZQVHLx+MokbnLO4biA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792740918;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:
 X-MIME-Autoconverted:Content-Type;
 bh=8d72gsrAirWBJULQEJnfkp7RT6P+QVLR5gsb+4x8xoU=;
 b=mfje0+yk653tj7H9o7YRwVOyKG7w42SNgkaDbPXHWp4fnssKPSuJZ55WiSAe9pE0d4SY
 RfwaIQjQO3MX4zFi0AvOeWdSXKWYz3RcPJHCps2HkuAL7Zt8buPmFuhbOCWpHikAywduW
 rO2UsveqWOS7n7iEIo02pemVSOm4/ed7Sob+V1vcbVeB6mzYPDO0ZvBCg4LUdlJIyjU/V
 1vTqw1vLHZJ4ALuGRD1CTkRawD1uSG07TqmD5QntXc5ERv32B/COzt0QVWUdIYLVeSVfi
 YlsKExS++cY9fiXWeOa+7BHERpqsIcTp6oMvK5Xk8EYTdaIZytXBR/eQbFXJQPotG3A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b="cLN/uvSy"; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=cLN/uvSy
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1528440828
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:35:16 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=cLN/uvSyliwe/G/cT4UBiLNikKPPShkvjWSjdkx2BvuU/AsNIcFn4GR/I00659f72GlZKkX7OWwDnNAVPgBnBTrWG5c2i/saTbOrMfsGnclh83RWxr79Kbq+Qywm5NqBiePqLIOJl3jglw1t6qcVd/RpgTsYZ22nZc9tvQe4kR/tg4WUxBbrV/ZeUR3AZIVnQlSgJuMmvKFMOmUsPk1PkxlVJkECmSoQmOr5nK8qcyZ3QY3TxYScsS9ri39OA9W8r7TA0KGgVl3TN3YPPpFE5+ekGuhVZk3s65lCkV5IW2I64Aeqzr0IdpVU6R8lNWL7oJgqWaJEt6ubk129mvdGTA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=eMf6gLxdljbQ5sBliqoblIjy9AtZG7acuO2WvH85Zuc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1055598466; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 23 Oct 2026 07:35:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1xK9o0-0000000FaMl-2ik8;
 Fri, 23 Oct 2026 09:35:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 09:35:06 +0200
Message-ID: <20261023073509.3714686-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023073509.3714686-1-peter@korsgaard.com>
References: <20261023073509.3714686-1-peter@korsgaard.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH 2/2] package/brotli: use github macro
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adrian Perez de Castro <aperez@igalia.com>
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

For consistency and to end up with a nicer filename.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/brotli/brotli.hash | 2 +-
 package/brotli/brotli.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/brotli/brotli.hash b/package/brotli/brotli.hash
index a777737338..c851d7fad1 100644
--- a/package/brotli/brotli.hash
+++ b/package/brotli/brotli.hash
@@ -1,5 +1,5 @@
 # Locally generated:
-sha512  460591287d428c8b5a8a2766b5b424d14501fcda12c7118b8f3cc4bfae44b90ac75ca156557f07b6e22542612724d904533e5f70019be07dbbb604c46f03ab69  v1.2.1.tar.gz
+sha512  460591287d428c8b5a8a2766b5b424d14501fcda12c7118b8f3cc4bfae44b90ac75ca156557f07b6e22542612724d904533e5f70019be07dbbb604c46f03ab69  brotli-1.2.1.tar.gz
 
 # Hash for license files:
 sha512  bae78184c2f50f86d8c727826d3982c469454c42b9af81f4ef007e39036434fa894cf5be3bf5fc65b7de2301f0a72d067a8186e303327db8a96bd14867e0a3a8  LICENSE
diff --git a/package/brotli/brotli.mk b/package/brotli/brotli.mk
index c040878c36..47e2f8e57c 100644
--- a/package/brotli/brotli.mk
+++ b/package/brotli/brotli.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 BROTLI_VERSION = 1.2.1
-BROTLI_SOURCE = v$(BROTLI_VERSION).tar.gz
-BROTLI_SITE = https://github.com/google/brotli/archive
+BROTLI_SITE = $(call github,google,brotli,v$(BROTLI_VERSION))
 BROTLI_LICENSE = MIT
 BROTLI_LICENSE_FILES = LICENSE
 BROTLI_CPE_ID_VENDOR = google
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
