Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627B2606A883
	for <buildroot@archiver.kernel.org>; Fri, 13 Nov 2026 06:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MeezuEmW;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=YjGuy6Xm
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D05D60D79;
	Fri, 13 Nov 2026 06:27:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AYZgeeGKIWhX; Fri, 13 Nov 2026 06:27:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7FC9360E26
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794551257;
	b=oyrYiTH676RemqkJ6ZBNA3mihT1MBvrsH/l3nyIFlw6wqcmisrL9308jtQshOSYj/tj4
	 K17ZpiS105gvoNgzKiv3LE34IWDDCgalcXDFCXN0IsxEr+XIYTIDQDQno8CU1RBbx76GM
	 S4T77iOueMnxZpkpavzUvYosIZiSGICxFRzOhbvcnAno1G8sE/KBFLi4b+B2H73c6Pjfy
	 JAAhEX0V5CgW1rgI19Q58iwXc+MeUshDThxie1tM+pC/rLvist0tWUMhguAjpaAALzPjf
	 +MwGirYoPx0LY9ZqsHwBn4oGqw4ttZYTN4AM061QkcP4/BnLUb7cGmQU/8cv1WdpqHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794551257;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ARn5xff1NcJ3aUHcxQsLNMMJUGSXfFq9F2PemXiU3cE=;
	b=jgPIsLWDq/t5YdPnCgj6J5AGDjoXrdYH/qrIG/OHyo3228yWECzxxihEiX9hxPTUVaCy
	 iEuJZuq49VQdaLpWyS5YDfVZrH2yM0+Qq9/NtTmjzsMNAQPvh7j/fw3Ng41Jkbnn188i6
	 rCUOoLdenP5dJGImKOjdzSemNtK3gO/JE3+UyWVe0Sb9iRKyTo6zioDIpBnEO0fkBPEvU
	 6UCtIdXNlkOGESRrzP6EoKuUq1t9SzAdx3Xb64bI7MOZtnwDytPLgKEKU7JIlMIGKNTgU
	 5HUkCfTJgC27Z2kfpFWNFw77li2pzOOeI/cJ10ZWMVrX6Iv1hQTWrnIjgUgJZCGjsZw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794551257;
	bh=ARn5xff1NcJ3aUHcxQsLNMMJUGSXfFq9F2PemXiU3cE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MeezuEmWzIo3sErTJ2lAOXAlrDDtgPjjjK5hQPEhsq+frOwzO4xPXJ6oEso8Furvt
	 lULmoHJdXDNSRfLnDTrERH2S6XN3Q1MW4MP3jAoAFmEwUE7rGcM1YpYiO65v6qU6aK
	 VFXdCPU2ZVTeYl3I6g+MfMnGKGDu/WD+vCQf+hOiiY9e4fjqKiL8ZzbYn7p/u0mjix
	 BDS1qMDs/JGyF7C2iKo/lkpLhZ08kiAQTFiBVjx+sRU+GCWNPIqBkEFvV33RVhbWkX
	 cifrtenfskkZAaqtGYCszlxYddPDvEXMQL5ZjFt++YNh7oL5PmNr5XTQQkLZZ7ZNea
	 hDejAq977JFiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FC9360E26;
	Fri, 13 Nov 2026 06:27:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E583AF8
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 06:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84081811DA
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 06:27:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ya5pXQmnaoDW for <buildroot@buildroot.org>;
 Fri, 13 Nov 2026 06:27:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6FDC1811D9
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=YjGuy6Xm
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6FDC1811D9
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 06:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1794551250;
 bh=zZLRbqSZri238TMTaQnQKo9zL8KAeohZAsYt3ZnK+E4=;
 h=From:To:Cc:Subject:Date:From;
 b=YjGuy6XmUtAXJE/31Tr3KHyS9q1JrsU0W7xbN2p6TsfEfrSx0Vbtrp0L6Ca6Dr/iu
 gIg+usz3k+8oGaxbwVSqUrFpyvnOI2HB0uaMMf0AtlpwTrFtHE5ZbXucTudstWHFDG
 7gpsoxK8GFaj25YoAn23iWsbHaXhYBcaP1wI23ousEy8J+W4Y0KuB4clOWMPrshwZO
 HL45ILOo14YD7RjDO+kfa+st0MSkNkCLUfsdeMowbprKua1DID3j6qiK6Zc3rdeCG7
 4GVtY43rARg2RRp+r8rdcstKICdLplHBYwTmzcqLXa5DSrRK8RSyQKyomp+wURe9tK
 Q7nnT/jm7ELFQ==
X-KAS-Sym: v3:f51bdf72230551df:SC8qBmBch/BfRjDGcIN+Vvm65HWnBpDxi5PvB0nGeUcjG
 QfDHk+waQ8KIfWiXQJzpciEorSTj3a+Bb686GciQcrl2RFNgSYgkw8lbkROBCkmfvtgALnPkncB
 /xiagCGmyB2u67pHGnCtLb3OySQBfWUB63llWuzElKo09iKkxyfmkc3/tlLm0uTemQl8jfs5TV9
 g0GsYaDOc2k36RInQrhi7JYeM1OCz7tDcsBbkdGYp+zdCTH0DeasxWaIwZJponBRuKbfeNaZGwT
 7GIdiikbeYV+F2Ljs+ogiYe6umeNRPDtKMNTZxRAG1m4nOFyJQCU+2AE6hNbSn+MYwaXitAA==:
 vld1UVQj7HBg6dP+Q9qlMVstCjtGw8DShn8qugDVym6CVv7sJWNfVbzi2ASJSEXgqvBANM1t70X
 Ho1Ndbzv7CLLtXY8bnTXugbpxt78MOOFjKvyZNvvx3Te0ORBwdi2ZGOrq5T1Ex55ly/tt6kddjY
 Vt7dvz6x3SwX77yyLvtAto6dkfxK4Wnw/ryzf0EoluALVjAl8ROLUz7CNoge/fbXn3dP8zOLhqu
 WVm3NUw+/t3b0Ffs88HVwfZKgfjdat/2i/O2X5IveZreoTgfLa5Ig3B7wiF+0mIaRNPzfek4veD
 pXgpTeabkgIVSaLsgsV3QwrtFbDhhoHpSY/aSOMfTuWAgXgBjlKKPa1iFD+ZWibvXYMpc0xHbYF
 xJcljAkGsWE+r2c7rrn9J6/AjTjj0WbWPbsxKBwivBwqUuRlHnTHvESeazerjGcqOPhR7MblSK2
 zeV8nkZ+FPkRiWWrhq44IqjtJ6FZr/PrFXIIuKbmTvjaJOFI6hD3WqdW9f6TToC4Gw8TbL7vh5N
 gH3rnZOlrex3sJMOLq5ugsoYskRYIk+1e81AMutWKpxUg1IMQlMZa/ma6g1mMW8MYChdlqeutpB
 qQ==
Received: from fli4l.lan.fli4l (p5b3a07b2.dip0.t-ipconnect.de [91.58.7.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 44129A4C425E;
 Fri, 13 Nov 2026 07:27:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34802)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xRkkz-000000006Ij-34R4;
 Fri, 13 Nov 2026 06:27:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>
Date: Fri, 13 Nov 2026 07:27:29 +0100
Message-ID: <20261113062729.8725-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/go: security bump version to 1.27.4
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

https://go.dev/doc/devel/release#go1.27.4
https://groups.google.com/g/golang-announce/c/iY8TY0wWgbM

Fixes CVE-2026-97033, CVE-2026-97034, CVE-2026-97035, CVE-2026-97036,
CVE-2026-97037, CVE-2026-97038, CVE-2026-97039, CVE-2026-97040,
CVE-2026-97041, CVE-2026-97042, CVE-2026-97043, CVE-2026-97054

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/50f221e8462c6d8acf73a86dd200c835d2930bcc

 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 828f809395..57cb5fe2f0 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  6e7749035cf360f06b2575d162ea79df9fda8ef671889e5c375f8e50777f26bb  go1.27.3.src.tar.gz
-sha256  cfc243057c03dd131413b91269d16b5061f87f312059c1ed78681cbb95d6afbf  go1.27.3.linux-386.tar.gz
-sha256  65efbc80fdc1fa2cd2631cad5b481777a68e8725f34e89f50fc6ac714e379b40  go1.27.3.linux-amd64.tar.gz
-sha256  a06e99309dbcbdca1a8ccd2282c3ee146e55930886e26b4f1193269587165f49  go1.27.3.linux-arm64.tar.gz
-sha256  d6f4e11dd7157030d7ac11c51c8f73201a2db932d593c3106b1da11cc32bfdf8  go1.27.3.linux-armv6l.tar.gz
-sha256  f180f01943865b7942ab3b4acbab6da6f0f669b61da999d004d16c537a49f7b5  go1.27.3.linux-ppc64le.tar.gz
-sha256  62e109a6280a073c9025e1b51ea298ec1d3575d3ce62238721311f5ff2c854e6  go1.27.3.linux-s390x.tar.gz
+sha256  73cfb8571aec0c01177687db87163d46aa20e9779672772891aa17654d9a6099  go1.27.4.src.tar.gz
+sha256  6ecb45737d2315acb0dbbc97ea8e13e7c19d4c796abe8d68907c40bce6f50bf7  go1.27.4.linux-386.tar.gz
+sha256  7226736c2339719cda28fbf3a54d71aa63bcefe376e98cef00034268dab24840  go1.27.4.linux-amd64.tar.gz
+sha256  3392582988a273a87ab5043ee1b2c9c17a2c3c00580bf9326c47a2e0aaaeac92  go1.27.4.linux-arm64.tar.gz
+sha256  e50964c41c6e187375387939e2f380de7250eba44e2259dfeb75c540d9d585c3  go1.27.4.linux-armv6l.tar.gz
+sha256  f508314644fa6f466d1935f8a34f01e7980092a4730bfb9d7fa3ffde81910d20  go1.27.4.linux-ppc64le.tar.gz
+sha256  4e56b1b9f26c649c1f3dc61fd16443d0154bd0860e59a8032b4cb05ac42f283e  go1.27.4.linux-s390x.tar.gz
 sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 88b4163ce1..b7e61f9ebf 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.27.3
+GO_VERSION = 1.27.4
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
