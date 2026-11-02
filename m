Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A964A607F10D
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 15:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=V9g9KV2C;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=LKrdkk9h
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82DF0607AE;
	Mon,  2 Nov 2026 15:20:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5juzwWSJILws; Mon,  2 Nov 2026 15:20:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 69FE8607EC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793632842;
	b=MlJtwYQ20oHvZ1qDINFjZ/k3JKwER/aPjbqSV9ONCoHRIKcVwcfWH6Z+vZJBdxX1Chx8
	 9HsM55EwWAatVQc88HKBl5McNr4wVsFGdvAnk7G/9BeKO35jnBt+HvnTUmlmzU5+fnTeI
	 OLlgZ5ZHgIAxaXjnfG9VEh5Xy2NpoQ6ZozaZQN8rSkkcgrLvq7C1v/UW4L1aYOzG42ZAt
	 urXQjBGK0EmCg//8k2LUc94IhU5ejdCDFzozVycCWJbxjSUUmQj3eAgP4Axl1jugkWqlQ
	 sMdtsz0RMI165s5Oxy1YWM3tP913IKzc5jdYU2BuSQmCGzmrWFLerSvS83QA739mR3A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793632842;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=8nf0s8id3f+yosLzXXTyKjFWgrTjRYmwz4570UU7/zA=;
	b=ImZj4y5UWVsHAGS52g6FMISgbSzmZ19y88pn3whWKB0CxEuOXjY9e3kGmZt4LoPeGWEh
	 U2fyQvaLkVt6g1yHewL4aXaa6Lo+cUnrlRecBiFnXgs36xLa2Lxl6IH0rPqp+p42s3FpN
	 7hv4cCd6Ta3Q1XcfBvn5EF1DugUzEXcu0xoPZSgw3bxEdf7Wg6smwoAUHD3rH+x7kIBIq
	 edMYvExUve4KUMayz8uLazr56Itt3M/REzWoCCkwi/jQh5VEBR3lf2TJoUkSdI7LSdy8L
	 jLicEVi5K7ZpuU3AslwI424MRnEumTv2bNim1PR1oTZ2r/++QRcrSXobPxNfUWGZX9Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793632842;
	bh=8nf0s8id3f+yosLzXXTyKjFWgrTjRYmwz4570UU7/zA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V9g9KV2C4ATrSNB7ojc+jTMj7YKI7f3+9ctpK+qi3mETn7tOUzV1he8CioCa1Ln7v
	 UPv+W0nacc4W1rvCCDoXud7TSCmPZuGdF0LVz2Oo3rhBPlX3fvoqzJrTx25YkywkTd
	 Wc1EKSmBXYw/QRWohkWnbBNmNIbZhca9USVKsjNmXGNRqgLZHG5epbcC89BG1n3A+l
	 LTwTMzn6eqXx8I4pLV+RY5SMyorwLE/ecV+8m3xhAIkaFnXuOdLayYdWTJAV/hYO4j
	 IEjtpFkRIJljeHF355mPWlqTydJrkLVJrLIijvl01cs+QGSCW9/0gD/zEt4ZM0o63Z
	 eRMMlI/l2D6uA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69FE8607EC;
	Mon,  2 Nov 2026 15:20:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D5F72A8
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 15:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8350581080
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 15:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id il0IGD0DLKLe for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 15:20:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 854D08108A
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=62.149.156.87
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793632838;
 b=Y6fjzLYOyVCu+yQyetc9JHaAJIk+hrDNd+hLd+Pk/4Uxrjz+RcxEjSuvTa+pZyrAFSeX
 YGJT8itIamcBL7Lsb2fGpZgUmc1XMbtVh27pkHjUmmcTBEMZYaEstuFdHm5AXAuatXemm
 uKmiEnyelawrn/p+2SqHMXMgzXqaSrwZcWsK7R1n02GKNOXwkku55qPmjpVYVCQd8G0Ht
 rCryD7p9m+PdIw7s3WdYcSWbXE9c0eLuXYq+Kien1jKhp1D8+C9iwdgAZUbceWCeMYLru
 Z4tEsS+l9pbzZPssMVHZwUrgW3wcNXCNC/TJfSPSjfDR7yie8RNxFoJkyQHhYwpsc9g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793632838;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-CMAE-Envelope;
 bh=ijHG0oYDe3+SyvCxPDgasoM3R2cVh46lALKpjwqCa+0=;
 b=ll4AJwt47hKcb1aCvcC/4UGTEy4nSRXsh/Q8yuxEwOVmjd9D1UU85LIUNS75FMTldJXD
 /4XKAjQTjGe92YsOUhTdl6+jEZKx413a6k+0l4KjQzVJ2qfgF4Mt+ld5EHxElVnsjmuCC
 HU6eKQTk1S6EWxxQIePpnLWFDcjrIBw5PC7lARxBpWoDuWyhsospzfA7zWr0VgKhGv7CF
 x+7IEuC1uBr+0ZY107mShaqkpn24GRuDORwUAGc5Viy5SDjXooDIz8MA+v/dbj5R0ELTF
 9zcU295US02HyzbMimz8bWI+6WjHHvcids+m79q97xCwmxZgBL0f4qlcbSAGlr9370w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=benettiengineering.com;
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=LKrdkk9h; 
 arc=none smtp.remote-ip=62.149.156.87
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.87;
 helo=smtpcmd0987.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=LKrdkk9h
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 854D08108A
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 15:20:36 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id NtppxcP346q8sNtppxmdNr; Mon, 02 Nov 2026 16:20:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1793632833; bh=N/M9ap7cwnF25+EseEPkquVbo/4owO/puagAYsS2vws=;
 h=From:To:Subject:Date:MIME-Version;
 b=LKrdkk9hhgoxQ65bKVv0rW5cnCuWwJ9qN0V5cILRtV2CfapGl9lAAC7LHGq3a8P9T
 TRfuGaryWFf2F4naQ8og39jAjuus3prmJqMNBFjbEaorw5YUBhRGHPUHRU4iVAMeSZ
 Eaev0pFKyjazSYSKu/XkMYI3zZ9PGfsbx4UfcYkJ+nA8cdh6Ig8tHJOie+5rhwJPLb
 VvQVxGP+lqbkYRwCSMp2b0QHvR38oFlwU8hDFQ/QZQHasFtcURbQmtfjh9xSB1BKhu
 gxUTYbjuyfVkG1Jvtwk+jrHed1oRKLpOJH7aB0OoaCaBP6iGB/Sno5kmyILDHuXZrC
 EnBb5f4iAkigQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org,
	Julien Olivain <ju.o@free.fr>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon,  2 Nov 2026 16:20:31 +0100
Message-ID: <20261102152032.354085-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIkNWlekg7j47vIJNC0CqoCguWv86fJGiaxlA04219wLXmxcvYucMCvPESZa+eZGm1baokNhLZI7TQ9u6uESX2d3YsRoigsfxa/ou6s+5T7gmxmyfizu
 pj85C8+JJMXYFKqbCEIRwyLjETiQ1lXb5V6X9AGegunJdk2oQvffTixYbYLxlvfAJbHGxIgHN+aUODXH6RlCZHdrICVrZqH+8+33+epiFlRki1jh+MtSzZUZ
 WQc8JvvmLxvUmvHJXLtd+z/4wHKftgt4m9hoclraDh4BDN5IL/hw/Y2gkR7jKa6l
Subject: [Buildroot] [PATCH v2 1/2] package/swugenerator: bump to version 0.8
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

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* select BR2_PACKAGE_HOST_PYTHON3_XZ and BR2_PACKAGE_HOST_PYTHON3 because
  of runtime failure as pointed by Julien Olivain
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
index 75a902f2c4..a9f9fbe8a3 100644
--- a/package/swugenerator/swugenerator.hash
+++ b/package/swugenerator/swugenerator.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  06098c4b3a6c3e5946a11929f95f280baacb512fc4154e16af2262c60a36cbc6  swugenerator-0.6.tar.gz
+sha256  91f1b1cfee110775ab5a9e99ef20f5576f7a33bb1ed3bc467e111502355935e8  swugenerator-0.8.tar.gz
 # Locally computed sha256 checksums
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/swugenerator/swugenerator.mk b/package/swugenerator/swugenerator.mk
index a892002369..3fbdc1bc99 100644
--- a/package/swugenerator/swugenerator.mk
+++ b/package/swugenerator/swugenerator.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUGENERATOR_VERSION = 0.6
+SWUGENERATOR_VERSION = 0.8
 SWUGENERATOR_SITE = $(call github,sbabic,swugenerator,$(SWUGENERATOR_VERSION))
 SWUGENERATOR_LICENSE = GPL-3.0
 SWUGENERATOR_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
