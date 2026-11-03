Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD4B606A329
	for <buildroot@archiver.kernel.org>; Tue,  3 Nov 2026 14:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kVE7zR6P;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=DVf3faRN
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29C876077D;
	Tue,  3 Nov 2026 14:17:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gxA3dZdd71tQ; Tue,  3 Nov 2026 14:17:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B762E607AE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793715446;
	b=HvkxmiKRn8jefo/1na8Jzjjv0GxsJEFxTFgXdZBXkNLKfJfDliXxqHg+dknnxLKQPR4G
	 XTBKCaH31f8wX6qLzoJRb2zkDXMGRT9+C58atoJVcLZu9A7xZ4zFNf+PTcqo2HC4xW/ma
	 XHWWmwrHS8kTKYEOBIU/H7IbWQrcgUyFOwOCqCWdDhFthDKnccqXZEMmAAk9MYLxmysvf
	 eeCgz892VdGgkG/8iJg0CozVXwXz4eSO7kQzJV/Xm2tr19TPcFt4aXWhyQntaBSSqdkb9
	 8mH/EkcKUobU62iejoyb1/75RZFzvb1lXwEKWFVzkd3cUo8ohV+l5vN2ty5Q6lsgQww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793715446;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=QzxY5rB3KQ0SQXd0VnN/MIK+SpJ1QBFE+0nidLtZld8=;
	b=rdfJgi/JneVdPqMvhvlbiLHiiLpcY259i8EbLDxsRwMJjWHf/xHgiUz53UhgYfQDSG/7
	 vz8yNxVoIX51GX5uJuN1qTzh7RbioFPzWX36lq/WmW7ZPTbZx9I4OZJoVH2vFAVtqJLkx
	 prNicyJgcnTHHgvoHba4fXFovQEa3fXs60spQMQIcPzGud8LTwAp8m6mMaYugJO8+OXeZ
	 2Ws09klaZc+PntXFQ1I/SMIbDuaX2gpAP29fFGY8xW0+yveUnH5DB01Rsn2FrOZmsU7ZF
	 s7kZgTOD9j9UCNl+gsHgiyDGK2SmWBGq4rMxobnPJ0zEMv9bT64EnuB69RvK7QLKbZA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793715446;
	bh=QzxY5rB3KQ0SQXd0VnN/MIK+SpJ1QBFE+0nidLtZld8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kVE7zR6Pqy6SU3b980+aBQHy76I/Ik0vrTaQBwHketOEh6JlAjMbeuog5kBbgLMcD
	 BV62QLcybO0h0+R4YjWhJLbKg+wHYAvP1adJFzr3Jja2HQYBs4kX08Hd5S4Vh9Tcds
	 OrcIqCEkRMTqe3krSgDF90FsI9UNiWMkbz2Veu+CQhaX19K9ZZ01FpEQOnqJOKKMiw
	 4+FK7ysRLXf+L6QDVRIbS5WKQKULOHrSHB8MswSBkFiNFIVUGydcbCOT9RaJQZK17W
	 n1Bkseex7ytjiJeNDqZ0wYmJboUPgyUFQnlK+8lLoKdQedaald6k1W6nMHlleDjEds
	 bdPjE1ZJWVWaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B762E607AE;
	Tue,  3 Nov 2026 14:17:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 04396A5E
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 14:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDF7B40068
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 14:17:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jlTFGZHQD2ZU for <buildroot@buildroot.org>;
 Tue,  3 Nov 2026 14:17:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8417640070
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=62.149.156.131
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793715443;
 b=F+0YiBf/u26DcbUIremiQFAzoLgph8qSfsKV6mJ/3YrSxf60DwUrWryFD2JYSYJ0yRgy
 S5BW3CZlceciduqt3JrTefG3tbHSHvW00ICF0GTS60v/RxY41mDFI2XtYLpTsHnW0H6Po
 SAieJtZ32pCkIKM+7vpXh+hrlQptjDrgXjjRr8L10JnleSEbY6C9IQsFwLifTinZ3HXeD
 YfGdKYrx3xPreh5hDbW7tNebtrG3oUJ4Fz21al5JKe7byrAFAPMW65YZBk4SZ2aGkuHd1
 kKmoIxE/Yd2Zt16xXNxfUAzqSNcXDmu+VscAOkb5F9fAIho6RStDKXsn43U5BSVL0uw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793715443;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-CMAE-Envelope;
 bh=6opsSsmFiK4OAHFtRMOGnHhUghfS3Q17C58LkkPyBrk=;
 b=qyuyJWkjhwRvv544wtmdCydM+jDmrzKNoEKkD9jiLl1PJaI+opSmXWeV5BkPdOo/CZe8
 1d5TJ6pBac+zYtHJszhJHr1bSd58zivu5V/8WrFWGJDuRf4J15TeUFstFWRyBLNbq6+pY
 Ds5OXJPao13X2q5fGJvd4z54pC10e6kc6VE6Q1MHJndziEKHMfo0MSNFe98bLbg3vzwlk
 2eNPBD8wLeXxxNdb/AnVwpskKvWb5gcLlYucCiUilFJRz+cE6H2YycBXvq6IKDSK4Nph0
 CfTd+Rgi2pHZYN6TR+pfKONBH4VBMIRs6WlKb2u59LsuxgBk5GabCEPVMiRW11MIGRQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=benettiengineering.com;
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=DVf3faRN; 
 arc=none smtp.remote-ip=62.149.156.131
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.131;
 helo=smtpcmd12131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=DVf3faRN
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8417640070
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 14:17:21 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id OFKAx34oJV5J9OFKAxTrd9; Tue, 03 Nov 2026 15:17:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1793715438; bh=Rag2UXgNNfjVKTEaVpokUtsxvvVQz/phW5bngFuuYHs=;
 h=From:To:Subject:Date:MIME-Version;
 b=DVf3faRNbhlAP8rxRBUuGgJqnMBq+inl8K+Y6ZjvadxgbyiNasH5C+5GhgMhtRjeh
 duKtZTmMOIWswDwkAk1fvwqzho5jhjrxniPr9NFsKPAwfozn/4yKjxBwlgD7O5Kfp5
 PWu3IuA4LeeA8ik7glOT9VVTuimU3L9GTD6qcKmxQdWjDEYRnJEsjDad6d7PDIj5JA
 q7aeRIzxIe0OpezrmfgZEPgQwVNmuBgV4q9W5Q6mLZk1dQQXn8jk+lghco11bpSOAc
 Y6cFJKG/SLdokbQTXWjJX6j0n9y5IigeG/3ywPlDxf9WRtJlic/zSCFMj5Nx2xuO8x
 RK0hlA04kQ7Gg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue,  3 Nov 2026 15:17:16 +0100
Message-ID: <20261103141717.385038-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfC9Busdso/ZaWN9G8g/pX5Qh1qYKTi7K41AptMHwXg+PACZQ/+Iqp5UAQPcMF8kA0EHAFcaAK7yjqxcUBzzear71tA+dBSL67WCnxr5B1DPe1JvjlFF7
 Wtr7P9ZsIwOPY6YbxFfKTQdrDb2aVE3aZrLo1A7AXOg3Ke+rvYnhmcaKwVNdU1M19XNECwfMk35QbZfq2xxSVmZ5fihVqxk54iSa0O3la7VyS/bHxWqtNFrr
 xfHAsGrWKSQ/Jmk6sJ6MdOJE4IdvdGtUlKkKlOkvVXs=
Subject: [Buildroot] [PATCH v3 1/2] package/swugenerator: bump to version 0.9
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

Starting from release 0.7 swugenerator depends on python3 lzma so select
BR2_PACKAGE_HOST_PYTHON3
and
BR2_PACKAGE_HOST_PYTHON3_XZ
in its Config.in.host

For release notes, see:
https://github.com/sbabic/swugenerator/releases/tag/0.7
https://github.com/sbabic/swugenerator/releases/tag/0.8
https://github.com/sbabic/swugenerator/releases/tag/0.9

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* select BR2_PACKAGE_HOST_PYTHON3_XZ and BR2_PACKAGE_HOST_PYTHON3 because
  of runtime failure as pointed by Julien Olivain
V2->V3:
* bump to version 0.9 since it's been released in the middle
---
 package/swugenerator/Config.in.host    | 2 ++
 package/swugenerator/swugenerator.hash | 2 +-
 package/swugenerator/swugenerator.mk   | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/swugenerator/Config.in.host b/package/swugenerator/Config.in.host
index df0e9a5170..0d2b63b6bc 100644
--- a/package/swugenerator/Config.in.host
+++ b/package/swugenerator/Config.in.host
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_HOST_SWUGENERATOR
 	bool "host swugenerator"
+	select BR2_PACKAGE_HOST_PYTHON3
+	select BR2_PACKAGE_HOST_PYTHON3_XZ
 	help
 	  A host tool to generate SWU update package for SWUpdate.
 
diff --git a/package/swugenerator/swugenerator.hash b/package/swugenerator/swugenerator.hash
index 75a902f2c4..c5c78aa5ad 100644
--- a/package/swugenerator/swugenerator.hash
+++ b/package/swugenerator/swugenerator.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  06098c4b3a6c3e5946a11929f95f280baacb512fc4154e16af2262c60a36cbc6  swugenerator-0.6.tar.gz
+sha256  4c434a3d49a0a98076ef160bd3ec90f5c83aa7e6fb22f29a52d7db0e53b7a028  swugenerator-0.9.tar.gz
 # Locally computed sha256 checksums
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/swugenerator/swugenerator.mk b/package/swugenerator/swugenerator.mk
index a892002369..2076d59ef4 100644
--- a/package/swugenerator/swugenerator.mk
+++ b/package/swugenerator/swugenerator.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUGENERATOR_VERSION = 0.6
+SWUGENERATOR_VERSION = 0.9
 SWUGENERATOR_SITE = $(call github,sbabic,swugenerator,$(SWUGENERATOR_VERSION))
 SWUGENERATOR_LICENSE = GPL-3.0
 SWUGENERATOR_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
