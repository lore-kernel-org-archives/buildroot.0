Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1FC606A31B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 20:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=B9wpvBu1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=jSKlUmyl
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80CF64087B;
	Thu,  5 Nov 2026 20:13:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aXBO21Uc5a9u; Thu,  5 Nov 2026 20:12:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 71E414084A
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793909579;
	b=LZ+ezVzoFMqneUsuQmUlQ+2oTcyq0i5Bafw+qIDF7xXVSjIJGIdLyNUL52QqFxpfDwmA
	 kbW7NLZbTvj+g4yUPGhcwfwj9dVsRVO85tRiqZ4stcC4DjGL8yYC52M5wKfiLVBhm+HT+
	 geAi6aAB6Xyv8Fh44OrCaLVsW5snZo31ADnr6keApMFUmbq/jS6uJdrtOzz6PchSKVjNn
	 3apLc6Ma+55XE3s/pTIL80ymu1PKlkkp4bHeh0jMMPdJjKID8rl8a9eJN1JSiaXTDLE+E
	 CwA+Lo3cWBto17snfarroIurVIKRoHLlnpX/l8RHN5Yre8WK7FEuZ476bklguWG7h+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793909579;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WYV9YuxP2wEyB/do8b+y6IcrigOs+gu8x7pTQlSvdOU=;
	b=qDSNiLWBUFHv50VVO2XvCQDo7OffPVlixkIvaajdKVAMrgAJyWhOETxpHXKSbzmIyqIl
	 rmEq3k/cSiJP7FiHW8vOS/IRogdhmwc0Cyq+h/OxGeLU6Y6IIGCLSMS4aOfufYvEBqfWe
	 5HY6+xEl94gmWSVClnLNx5I429MV/YegWUZtJpfSFvhKnaKEpZHNIb4qq1mdm06SkFNbK
	 8OX3qiWeiwODrTkM3A2lEtSCBqSt0t9isorzCEO24t0rCIFZy21lYoUrLnHBFMR1b9m6R
	 3RL+im8ToGoReo6tB7G/IYRBBdaPktHGcQWkbuF1oysrbumLfa0q6JLC5w+HEOuakVA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793909579;
	bh=WYV9YuxP2wEyB/do8b+y6IcrigOs+gu8x7pTQlSvdOU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B9wpvBu13cWqtIL+Tjx/2B8KPAhm4B/Cb/NJT2ipPI1vcNTk0iOPQpqI2yidd1Nmr
	 9lBfL+OAHJCmN3FxC60q/c5TCGAOB2vlLAg3XTGaJOhgOThbrELw+uxGgC1cwi/IZH
	 qfrrRpxQjhS1fUmEOr161XbhI2Ze4RdsGxoBGZLHjBT6KFlHe27SevFnlW/nu6OtOG
	 py2x/rnhcGPp6DNuidlz5fNU10xDN9Yfwm9t7IZKYNcFitaIhRrNdZiHHr3g3rnxsY
	 zWcjhQWYffAxQeufl1tdImfAxtOmxXMftJOwoENPhn2i5kv/aqN2JPkPdn/rG7N8vt
	 VwCngdOWL40WQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71E414084A;
	Thu,  5 Nov 2026 20:12:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 00A01137A
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 20:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9C30400FF
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 20:12:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 83Wj_0aX7izD for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 20:12:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2995B40012
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jSKlUmyl
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2995B40012
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 20:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793909573;
 bh=SOg4kmGphPHXZYWF7xsJGZWUlM6Jnm0ymS8V5RrOYRw=;
 h=From:To:Subject:Date:From;
 b=jSKlUmylNMzEZxQZcKLw6ASAQAoGlPDomnG0grrzjndKaiMiIJSz3Y7LJv4p0bhPF
 l67UwxSz9x7dncfImBiNUeh+TOTPbSkpEJzrTxNcM/+SWfHms4ndooysBDZOfPTutS
 CE+pl8/c2kFI2/vc8Z7nEamtxXWG4Rwbo2zqD/SvNd1qgQC04vGvFwsC5gObvchai1
 Gqv+fnPuhCgGWceptBnoKhcOoenloXY7lR78McDUPjS7IXntv7gauyI8AlW+h6refS
 RFJ3Wmg+HbWDPhiQVt8683BHVTzkIydRBZm7W7K9c9aVfu4TFYYZZsNkKKawbz5mTo
 g3k48AivReBMw==
X-KAS-Sym: v3:f51bdf72230551df:S3VCzPl6ROOFQBMVbO39rGpoA1705FJK+ii497TBwzMjm
 8XSwlA5ZCHK9naoPWd9Ir17Ueksyd/EXAjrLgxYdmL9qM+KUWrJeKhWN6dolf5TSiRA2IDOSAx9
 kn7qzpbH+iRhonV0rzLEK4tHjttcPugwKbfw8lBxIGtiv0ZzlL+81ALjlDXM11uFi+ExBcfdkjD
 ZDma5bVIL/sLhjTmyDEy4Qp840tQAsqc57gu1bsjWLkwKZavIpkmGaFJGVDJIBks4okH9vVpZCU
 jycQUoWupL+5jYf/GacHzOD5GYR+ZIQe8Wdw4OxgcZdUFaW3vb92Jqvb/9zvDFVFAHqi0BJg==:
 im4EsK4g2x+3Ph2VdqbPcxgPoufN/KiO11DC0bHGRPvuP+eXlU5UXyCHwY1ak3N+Bls0LBpRl/H
 aIIz2sczl57PC94z1Z6Lkg1Ur8FF3Qbhi0kDhr8U9XR8qBrIx1/GK26eazQq2TYSMhAwQREE8ii
 t42pOQKmBfBRyneIrS8jxVXkHCwB7r9YTMWhNlWAeUuu/jyRWvlOm11PqqfpvMFvoXwRtDSFgiw
 0Rr1+Z6hNwyNZaYL1SbTgb5gnCYBf4pdVasA03ZGHT86vNrXOVyLqCSEDCIwLhZVOZHC700r+HX
 DphyHTitnh1G8w4o9ajDVnHL2FSySjDnqrKUXMwFiBGYladJqjk02M+Fm5IJtoq2rsfbpWLbWtq
 N3ZmqPIRvKTxpyCvI5IMIWpt/aaNv+lBaAB4fVJfAvHNqaFYBVYk87euTar2SKx6nmKXXbVQnh1
 KoSckRxuSdckra+dQNQQWJOau2McNLdrZtKiGYskuxqkM246JK0wWdyp/b9N+/ko8HEuP+nwc2M
 rAc3ZWJ25/Fj+pAqZF4r14elMS7B0qdU/99tYdZtxqHB4VLvGDcaAf/0mKJ+kZ1kir+Lz04ZiMD
 o/bPjNx4bvVCOJEIw1r2neGZpdStzWm2tO4lmw==
Received: from fli4l.lan.fli4l (p54a1b33d.dip0.t-ipconnect.de [84.161.179.61])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8CE2CA4C3BA4
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 21:12:53 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51012)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xP3pN-000000002xX-1nM0
 for buildroot@buildroot.org; Thu, 05 Nov 2026 20:12:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  5 Nov 2026 21:12:53 +0100
Message-ID: <20261105201253.1384280-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/rsync: security bump to version
 3.5.2
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
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://download.samba.org/pub/rsync/NEWS#3.5.2

Fixes CVE-2026-119741.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/d5959de51611367a3fb0cc5e8178ebd7cd0e69dd

 package/rsync/rsync.hash | 4 ++--
 package/rsync/rsync.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rsync/rsync.hash b/package/rsync/rsync.hash
index 3fc2603049..183ffe1af4 100644
--- a/package/rsync/rsync.hash
+++ b/package/rsync/rsync.hash
@@ -1,4 +1,4 @@
-# From https://github.com/RsyncProject/rsync/releases/tag/v3.5.1
-sha256  c55f9c9dc10fb8bec397b399a0fdded53cc9a2d8e30891bb0d63724d25c37bef  rsync-3.5.1.tar.gz
+# From https://github.com/RsyncProject/rsync/releases/tag/v3.5.2
+sha256  a10d591825251e070f74c98df3daad195def4ed81b4a2de16169026aea33f6c8  rsync-3.5.2.tar.gz
 # Locally calculated
 sha256  85c19ea50a224c2d0067a69c083584e5717b40b76610ec1218f91385775067dd  COPYING
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index af18dbf608..29250e928f 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYNC_VERSION = 3.5.1
+RSYNC_VERSION = 3.5.2
 RSYNC_SITE = https://rsync.samba.org/ftp/rsync/src
 RSYNC_LICENSE = GPL-3.0+ with exceptions
 RSYNC_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
