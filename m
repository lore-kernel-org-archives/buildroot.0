Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6769606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 17:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ng/cghy0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=ibBjtquW
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90D98607A6;
	Tue, 27 Oct 2026 17:40:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aibJwsK5muF6; Tue, 27 Oct 2026 17:39:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E8A9C60699
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793122799;
	b=tdkqLReywLJHunDBHOt0gPp3vpEiBxKkcpi19eu+aAR+zZ+hJ+r7gf6oSoF6wWv8yB6I
	 tj2fLD0+GmCg3Oiw0eZ+jAvr3eohoPqOnR04mK1F15e0FtQqvw3iUqR1RBZZpTyys+3wM
	 U8suTTjJIqArnjQYBRcr0ZE1vXhxoejk/p6zUq1U/zTIB+T/Pk787JuAZ4Hp1AxOdx4Jc
	 rDxXdnSWO0xvpXY3TRlrEFi23xX1g/7xnBN8F7pSRwq1x/19Aim1DZ0mVDZ8qXcDr8Wd8
	 x8aCtQnyNGNxMzJ91v47eMjg+1r7KL5ZeP0aIDpJLmZ/BeUzWDfBSzGzME/LFxukcZw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793122799;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=k1winQ9t2CDIcb72cdDCgLqhniwr0CHb4jnEdoob1ek=;
	b=JuZgHCNx/B8ol7AowIt2sIJ87yrftQWB1DUoulmALs1QcOH5GopXimrUOE/841LkvEMe
	 wzUtppiQFL2swDzIzVSyHl702Kj8/a2+oWLOXi94gjqH+i+E4ztqXC/kjLDhhxXgrxt4S
	 8buOcHZwSp1zpER8zDJBy40S7HPfdd1WxWejRs3Carbc8XSJ0kSIMSPhbmtJ2T4oWfaXz
	 S32GG8ZgaJuFRnMQd7efkFaT3lcGIZENZn5Yod46EvYUpGVmRv9jPDtnN9yaIgjSo2ijh
	 TuwSdkAuTGMV6MsCF+FpNOTdb7l8PyGmOvIDkpgNMy3clCO68jd9MKpVWr70yluiXCg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793122799;
	bh=k1winQ9t2CDIcb72cdDCgLqhniwr0CHb4jnEdoob1ek=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ng/cghy0CxJWLRYk/hQSQzgs/qgHQ1CmWa+z2F2vWJ3rA/Quy0yriyN/1w7c3C6l+
	 W+H8Z+Oyy8WCn6i43HkNYGLEjxOdJ0fqX/Gx37rv1Q7LDXMN4F92XqXhvHzmZ3WdJv
	 R8ufsUKVv9tMacHETk56/Qj2xzktbTLJFv5GKyIcCJEZPIBVH0rzkJg//kCO5m+aJK
	 eKgE6e/u0YwfAWwrZS0t8x0pP+fue40rnLdpcjKRj4nVn77f3ZXKuHdrzUWvEVessj
	 YJTTJEUiZMR7lk8Y4Z5u8r+8eX/YavVR9tvqdfDc5oosvS9zW0CBJ5VEJ/drFIQuaz
	 PMlBUytLh1CRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8A9C60699;
	Tue, 27 Oct 2026 17:39:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E73A84D1
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 17:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD16A80CAB
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 17:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j8Hr9VJFoSlY for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 17:39:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8DB0580C97
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=62.149.155.132
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793122796;
 b=c2u/weMRFK/6pqMj950YdMwm2mxpjF4Tf0UCWbjlo+rhBWmMrS5wINaSz3sGtnHPaUmt
 LE5Zj6IamW8y7Y6vzpY9pGgUOHzavKu2Z56muBcpK8o8odirqNfFroxrE6mcfvhCSHvlJ
 u9UQtSm7r+QaTfaz2T0DgE432dc8vPgp6FsKq8DaEHo7VqRcophQt1Tc1cM75e5CjWtEh
 SVlZsxJQ7/pOpDdhgF8yCK9nDLXrwYA/XlRXJgWap9PkcpVqOc9iNwdkHdd2uUoNoDJUz
 GCdGaHSLxWgYGtar1qQltQIj7gT86y1JTpAf4SInLkOnIHYZe1R95BwRfV56wCoWsJA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793122796;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-CMAE-Envelope;
 bh=ggDKyarzMjVYW3nyv2anQJyfDuwD4bdRr64o7/RWBFI=;
 b=JXlgh9KR14VOSjGv7q/Q6nPTRNHYxnlAU8r+75KY+z2G/A+fRB/np74WWa5qUYIwyvYW
 n6jLjb6rZ18hCArQZfBoXGn9srzWXRV0PqKQxKP8nPk7Vx32oiqfVj+p94ox9ud1iYFXn
 SnNEP6XRSJLU1YocIEuTZKgrZm7Jz8XJlKALC+3bvAEhseVmaQoSNdwC8ktRp1662toAd
 OCEk89KC+1DpamdZ9aRx5c3xe98cVFO2gjuaPJ2LmoFnXMKnbIsbteDPyjM3L8ZXDiOwj
 ms2xzvqRdZJeG3Jxax8cM5dzTY5yM/+iOvMN7e8IrZI3FQboy9N5Q632FhyHtbxKBlw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=benettiengineering.com;
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=ibBjtquW; 
 arc=none smtp.remote-ip=62.149.155.132
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.132;
 helo=smtpdh18-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=ibBjtquW
Received: from smtpdh18-1.aruba.it (smtpdh18-1.aruba.it [62.149.155.132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8DB0580C97
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 17:39:53 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id Ll9LxD0UsgnmRLl9LxrJ8T; Tue, 27 Oct 2026 18:39:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1793122791; bh=uiqnFG4F9uwynNXDIuszSMgS4S4kWKkWMSLxITtOYFQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=ibBjtquWSYGrqvcXU5nWfJam+ZT89YhFNdFW6jIeeBSMGCtjVqckPhX8twcSl/Uca
 kdx0erv5gCGBB7oRJA2X+UzXTEs9RHaTP1orATZ/guVJvQoPE1lrIz42ah/QgkBXs3
 MIHpHr87Hn43HtplCZrMYGvpWWBqKzAZ4mDpFGibCKXec9jU4fRJAeWjmTqGHd3MlR
 yg/lAanjtnARqkiUpCrQDcRYkHvedmlCn4drAvYJjPv57DlPNeF24pVMK1TCjFPnIT
 GCq3s9jGYDeGXrBlANlVplvDjpCkSciCv04MN1nvjc6BsezKLiJ9RLgMGNGl7OW/Z0
 UaCcU+ADvT+Yw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 27 Oct 2026 18:39:50 +0100
Message-ID: <20261027173950.2315819-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEB95h5djzG+QfUb5Wjq+Ey2/W94B2UdiQmE3JfAvYXtmdAwAsytr08dE32FXtaKZSmXS6/d5kujRX0McBpOZGIjn1H+zTnvlDhDzxAmrNk8cKez/4cB
 GDdZ4VXfh5TQyNzt9DG7ea5q0sYPNl9JXPmMF/qA0I8XEiC1PcGRVYX8r4FTPAE+wm208Mg0bCGfwVBGhmg8W2AuHtIVlO6NT7q9etkteEBlJLAa92HJrMsV
 WM0JRyDvZ8Tl/SR11yMHltEiuoSkOTMIm1Gg6PZ72oo=
Subject: [Buildroot] [PATCH] package/mali-driver: fix build failure with
 Linux >= 5.10.266 and < 5.11
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

Bump to version 2026-10-27 to fix build failure with Linux >= 5.10.266
and < 5.11.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/mali-driver/mali-driver.hash | 2 +-
 package/mali-driver/mali-driver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mali-driver/mali-driver.hash b/package/mali-driver/mali-driver.hash
index 38fe03f459..885fbe284f 100644
--- a/package/mali-driver/mali-driver.hash
+++ b/package/mali-driver/mali-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  12623376da6c8a92c5bbbf5e71d8a61f5b88a0c68a17a0dfda26fb64af2fe00e  mali-driver-fd0865346db356f08295df49f96ce0df47ccdd2f.tar.gz
+sha256  d169823152e327513cf8e728d6aeb48497aae9d800fbb57593461fe12c1472c8  mali-driver-27e42e6c5c8fb33ac36a39e5eb6146756c2e5fa0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mali-driver/mali-driver.mk b/package/mali-driver/mali-driver.mk
index 9fde901bbd..24555a583a 100644
--- a/package/mali-driver/mali-driver.mk
+++ b/package/mali-driver/mali-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MALI_DRIVER_VERSION = fd0865346db356f08295df49f96ce0df47ccdd2f
+MALI_DRIVER_VERSION = 27e42e6c5c8fb33ac36a39e5eb6146756c2e5fa0
 MALI_DRIVER_SITE = $(call github,bootlin,mali-driver,$(MALI_DRIVER_VERSION))
 MALI_DRIVER_DEPENDENCIES = linux
 MALI_DRIVER_LICENSE = GPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
