Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2FF606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 10:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DLYbVQwZ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27661605FF;
	Sat, 24 Oct 2026 10:33:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ZFCLaQl4VZh; Sat, 24 Oct 2026 10:33:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 44DDC60688
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792837996;
	b=gf+KQunnw1obk0tFzU+LDVnY0jp6g9Mt962Wfz/qWEWbqeCX0ZsuWg2Rf9VI61e29laB
	 o1Gz9WaCM3inRfoYAptOQ9TQmVMf3Mga39d1yTswDCvfz49MGqEP0z6qm4lWszQzIEH29
	 sV9+xkHfpJZdEoUsSJ3e6oYsqMilMrt9Hq7Ab60FrVhizDZFyCrDKFF4tAAbcDjH0Hcb1
	 Z75i99HpiJDAcHeHBV0Vo0uuGAm2RZ7AoQK1IsWBR0GkDVSQjoaDSOq6wdD43dP2REz+S
	 +XHwbBoMaeTLjjBrMBN7U1SSsLhZBMcvrSHqOJk9TkywlS7IYsIk1STw1HuCPghTHcg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792837996;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=emHpgrxIUNCTdbN/0HniQhYbyeND69r5OPpavjZF1A4=;
	b=pWR2gsjQ8Tl0eNJqXTlt0fKk4ieo1Q6ygE4dwMSeyWTC3mxoH0iFsvC28UQBb2dYK/dq
	 NO1yUwOGP9FjJ1PwaB62DUgBJ/X+BPGEgNyYIiyIg3KvfX6JSLnr4OEbAUysbcRak7P1S
	 mUpNe+Kh6Au6fYXY1MaLXbxQfVTL/OuyRQUrOyrmh4acmbZMoTSa2mg5YUa6W8iRzrSOs
	 XxbRLAwTLsturh2D/HJk+Ki6YPHO85MlDtV71df6nXvUxcA/NrPvhx2HaN5/rIXXqWlYv
	 E3oaTIzfot4ec+IDBz7h3dtjpcVjeGrHcwid6Q6IWDTD+hBDuRXbRGQTXdWfWb9cDNQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792837996;
	bh=emHpgrxIUNCTdbN/0HniQhYbyeND69r5OPpavjZF1A4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DLYbVQwZu0M57thGf13b4HF1I+gdw6AGCCnytc7awSnr/G1NUatgku+8+h0vP8FA8
	 iICzAgClyvqy7XAn7UtwEGl5Hv5gjZEWz8QTb4rB2tFaXcI7re14fY8+Iftzkauqwe
	 rcmaaD36IcrSW9pdT9chcQO9kXinfNMXoiJ6+TotfdWyrkwt594DkCZ/dEXMn+5lba
	 L+eVe9Jmu0o6FVt4jS6cj1zxUKQVJ6GmufahFSawQwRMSRoNx6n4Y5fLSP4V0S+/7m
	 BEVjF85l35CfvuXPwMQP6TJxap0UWS45Z8lUsxS+t/NB93JNzBCskjBVEkQJQ5frOQ
	 imWrcIW2FWwIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44DDC60688;
	Sat, 24 Oct 2026 10:33:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 05C1E43
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB62681685
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:33:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HtUHyEmrBxuZ for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 10:33:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4054C815DF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792837992;
 b=cixkLR2pdanCsxoZoHQSp+klmCb1rdULaQBiMjrSU8vQ4VFbVF6buFix4toR1d4x79QJ
 4DgIACu8MjG17wjtDHd0VcF17FyBQ5/A/VOPwPlr6r5B6xqbNhkY72nu4ye5pMhtC57fX
 hG2z8lN8cRwrcZ+RAhxbjOgBL1LFz48lJjN1+gyfvWEaMQN2daPuFAQGIzhN/HiLV1MTl
 WXyXVt5+u1XDOuXpiFysUP/sIoKe55u0OowZQcpASxYi8abuXaEJvnt1C4DtrmGdm0ghb
 qxEvm8/+S8zMBiTK2g1E7tVImvvsQseNMuyj2e+CsyqQBj3QCnk7Rntu2D+fvSfU6xA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792837992;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=mfBkdIHsgz8oDhmL/QBf8IsLrr4gIfmmHRwJwM2GunA=;
 b=hLdbQ4KouvxzaX1FGeXamBqDMzsJwIghDDjfXBB4J74t85tt+spfucjvfS1d9i0621Fx
 lh5+pfrWQyWnztjIaZlg/KMd/MMaT4W2d+L80rYX1UWTVp5GVf+xnJITf7IPSiXF4RDcg
 oXjszoFJOc1IzmgRx+Sd6rJyNCr/VOkXPSq5jtHSByYXx1Q4PhMBwKQJuKGJA+3bJYnMB
 zZ8yZ4No3Pt3/dL8ZXT+W3nA2lsyMdV6yutNCUo+vf7EmjWDUZnw7la9NJDmi1SDiNvem
 S8VdBIa0dzg2VR4QLV2ck0auxJQPmWrCs6rEE2uTLM5GU3u+DbsYYKas8+ZaRNtFAZQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4054C815DF
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:33:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B0A28D6C1; Sat, 24 Oct 2026 10:31:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 12:00:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55a60382ae9a0e03a65186fbdf9e3afbeec56130
X-Git-Newrev: ef46592ee7d343c306484743a6c307cac67c91fc
X-Patchwork-Hint: ignore
Message-Id: <20261024103147.5B0A28D6C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-s3transfer: bump to version
 0.19.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ef46592ee7d343c306484743a6c307cac67c91fc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-s3transfer/python-s3transfer.hash | 4 ++--
 package/python-s3transfer/python-s3transfer.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-s3transfer/python-s3transfer.hash b/package/python-s3transfer/python-s3transfer.hash
index c089207b1f..75d2ec66da 100644
--- a/package/python-s3transfer/python-s3transfer.hash
+++ b/package/python-s3transfer/python-s3transfer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/s3transfer/json
-md5  b97db752b08e1cea95b7f958788d83ed  s3transfer-0.19.2.tar.gz
-sha256  ba0309fd86be3c27dbf78cdd813c13c5e1df16e5874b99d2535ebbdfb9892993  s3transfer-0.19.2.tar.gz
+md5  18a4436009a8dd5b667f7e2e77d04169  s3transfer-0.19.3.tar.gz
+sha256  8326acc3d056d7f7b8a37110c7d2aea41f67e83f6ae79cd3b5fbcca34c726406  s3transfer-0.19.3.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/python-s3transfer/python-s3transfer.mk b/package/python-s3transfer/python-s3transfer.mk
index 12d654da60..b0b7328457 100644
--- a/package/python-s3transfer/python-s3transfer.mk
+++ b/package/python-s3transfer/python-s3transfer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_S3TRANSFER_VERSION = 0.19.2
+PYTHON_S3TRANSFER_VERSION = 0.19.3
 PYTHON_S3TRANSFER_SOURCE = s3transfer-$(PYTHON_S3TRANSFER_VERSION).tar.gz
-PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/76/43/35e4d8aa320bffe8287fe8f65f578fa2d2db0a64212f0e710dce58267854
+PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/49/c5/0a5ce655109cb96b8dfad36908a4e108d15f5dc2eff8fbc3146c4312e704
 PYTHON_S3TRANSFER_SETUP_TYPE = setuptools
 PYTHON_S3TRANSFER_LICENSE = Apache-2.0
 PYTHON_S3TRANSFER_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
