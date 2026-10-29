Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366DB606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LZ+P0ezl
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DE8040C59;
	Fri, 30 Oct 2026 14:08:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ekJ58CZZWIZK; Fri, 30 Oct 2026 14:08:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 35FD740C4C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369301;
	b=fnzvtPTqn3xPNuVoPETIT3H9kavKLlll6i1/lqxMcdRag9yr///RKtUiSDDFXygc8sEI
	 CELLg6OM3nM/cX4yB1wVvI7R0a5figJVbiGJl/JL9+oIPm6PeIG8SB7JfrDk+UWnXunqh
	 Fu5xQsCNwgtLumwkO8aEtH7/Qn/dosBytONf3jA1gJyL8rcAcx+xqQaVv9QU34rIAn7PF
	 K+fluMR2iWo/oCKfQZd30LKuQCRIC06ajQ4t1fxrbJSXfY6YGEJIAsHMWuBbYyBZ5hNKM
	 nO3bJpCaXZfswySUNYYBZGdaBRDuedxAW0t2QuE0XczB0jvjZAxmudS7dJZg4JwYhHg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369301;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=YHqUvZjErvrHYVeJVeZFVmPe9pLi+/Rh6rX5Ydt+O3E=;
	b=ISsNfQXA3kcffcbehvSvhcVMAAESpTeNDz2NAVy8hdZ79QIXq44Bc1r5Cd+sVqDelrxE
	 sulTJUrmAiltXmKU19+bvHIaEt6kykN9HfdiNHX200ZM2feu2HJlT9DlQNGdVz3K/dD+4
	 sDOdAbxA6t4pCltLB2KgHdZnSgNy5IAbx/vIJ/v/FFk6dA30/VQJeQ0grRpZWPll3QsaH
	 6MwsHzPQFP24WYKtvk1EAPl1jKSYdKCCIppjiVmzCSEHO/nwPVsPh0LqSDU8BVo0E06IA
	 IaLWmMCjbFtzGq1b90md9Oam6VBcRDCuSRGBtFRyMqjWemQVvu1/e3Sd3uXNWCEBhXg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369301;
	bh=YHqUvZjErvrHYVeJVeZFVmPe9pLi+/Rh6rX5Ydt+O3E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LZ+P0ezlwyk+47OxT2KK0oDH+QpQf58jwsbwIIdtO3SzSyy3/MOsPxi5epaIOiHQC
	 zxVVFXDqIp1RlorEvL77vX3nuuwdB+qPmy00mfstB1ydY9ZGsfXRwcm53QkmpjmN+x
	 M0J5jXYQpA+VTlS4SZT1VxtdHvAKrGm0YIKZ4ohxr4OZP7LvlE2wYmPmUkSea8AdIe
	 BWGR5827WW+FbeF0PNNipKvt+ivF8NgywV9QZMTkSrrHHIkl9/pQkUeXFYiz/Tjc/v
	 E6u8BAaQSjyH5ktfEp/0xHDATc+/NpxBSklb4f1GRQjo9pnmOmsKavh0Q+JG0PMmqC
	 p9surH03xhXug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35FD740C4C;
	Fri, 30 Oct 2026 14:08:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8ACDBD38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70F498118D
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C328rx72VL6X for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CDF9B81172
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369168;
 b=NFNd5NhswgUJij0L0A6FKth+1nDeAh39aiT/fkObphj8y0GQGMK7O5EE2Bu16X4td15P
 b+qpvvBU9foJR4LtSOCUX8CmXybSY+H1jjH7zBJ4FPyWkDyrFBAs37NArEIzLEt00o57B
 FoEk1PZiqcpbowoB6hgXa5nUsnmd5g5CELrwObAM1KC/gVCpuCj98UN7mtxIwvXwCQfuM
 yVFMOcZTpUokwL6KzZsKsu3kqcf7hGLls3J/ga8a29MC5rAnxs7OygSspUxzWz8odYbFq
 1moBvzXMH8jzaKrhjS1lWEqOpHgu0jQCBzPAR1AKPaqiqo2ZZxM7rQMdwD0lwVIrXkA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369168;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=xLx0C6Ezbp7iU4nfQ5+lqVDBj3nFfAkadDWaEtv7/jE=;
 b=PXRLiDfm7StSmq4WjvJKx6Ik0qu4pCFBW+l/NNPddQA7UWSKTI2te7Tw0qWyREjxKKx5
 /SPuyHinzokWHe1RXUUDHzYjp5BAdO9EtnXKRtHs/Cq0MF2jl/LM7lWjsWPG6tOpMIxMi
 pIH2MDOAZpNG8m7F3dwhY+OtEU3fXNDbmV212DPg1QP5ajIjBmyQg8l57zeALkRikrOpk
 sFda3rdEBFitqR2o84z8siWBicqiUnDwx7ZcBjpsU/Yj0mNqHxnLXAnn4VCxNBBQivgbY
 8bZGWYepZoWyvvPXvYHTxoCRjLVhdJ1VCz7hVhLvdEKL+f1GLf/LPZYvkuin+P2QA/w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDF9B81172
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EDE069D389; Fri, 30 Oct 2026 14:04:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:20:01 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 60f01615f91dcf7b755199f87c439d2cdbac269a
X-Git-Newrev: cb125666dfdac541059efc0931e843a89cdcbe08
X-Patchwork-Hint: ignore
Message-Id: <20261030140440.EDE069D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/cups: bump
 version to 2.4.19
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
Content-Type: multipart/mixed; boundary="===============2407175941468762877=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2407175941468762877==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cb125666dfdac541059efc0931e843a89cdcbe08
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/OpenPrinting/cups/blob/v2.4.19/CHANGES.md

Added sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ca673af9efd9ff80106adbfedebbde079add9b3b)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/cups/cups.hash | 3 ++-
 package/cups/cups.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index e421c6457b..7cb25fc4dd 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,4 +1,5 @@
+# From https://github.com/OpenPrinting/cups/releases/tag/v2.4.19
+sha256  820984b12a67f98705785aae2dd1347fe0ac097828001d4583ff64574aed6389  cups-2.4.19-source.tar.gz
 # Locally calculated:
-sha256  89c703238de210d4f4f4e5d4269e3d60c4b2f487aad75a8a1eaecd659e4d0b77  cups-2.4.17-source.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 sha256  977206f041b9a6f47ac00531e1242c0fab7063da71178f8d868b167b70866b6d  NOTICE
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index f79e3846df..0df4f411bb 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.4.17
+CUPS_VERSION = 2.4.19
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/OpenPrinting/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception

--===============2407175941468762877==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2407175941468762877==--
