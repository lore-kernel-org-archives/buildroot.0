Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D68606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 11:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=W76Fl2YR
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D881816D3;
	Sun, 25 Oct 2026 11:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ltfT-v1QRkVx; Sun, 25 Oct 2026 11:56:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6F092816E4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792929405;
	b=J1qG0vZdU8n9Eq+kgOapD8Fw+p4NfMvBInhmmL0OU92MbeQVZQ22kxjgl5IgoTdzSPCK
	 uTKOgtE6QIrrGDP355eDF82TvpguKns3VV6IH2G0B3eWzCWZD0n9mVzZhRfeyk//M6tto
	 cm364pwYycqZK3ZkW1+o5oiLpa5oDbDqmFbKgIcCxmSlzszaR9ecBhfXLAj4mx7R9s/FB
	 hww/ld3CsLccZVIZWh37WFvKwq/33sVJpN3IvcxjxKfpNuEWoMn9OIVBcSDsq1vPeahHn
	 /ad9JMymsvWt0aqCSEzhDBakSC5V9V/BtKMp3Y83jLW1L+RqHh8OBd4gIL9Y8s94+Uw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792929405;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+6DIp3o6cAJOGimgYOMjZa51AuBC/LzdGcnmQpmQ/3A=;
	b=caPe8QfKzILY/KbNpAvnP5+RAKDCRobI9EOsPBxAyYfEHCFDC34lnxFm9anjlqTYd16O
	 BK7nK5qimXlBp+YntnFQR9IDHJltqZbCoNfpF5KsCa684GkkOwNBNUMUqkR/nKtt03BXG
	 8e1nYnE6cwbJUNZO/sVxDINwsjQgZFhAFIGoRz5q/otz1KklLzzw8KZPWEQE1gPACYNOq
	 0dugOlStXErNiKtb+PD9+Ojc3h221UyJAJjPD8U8QgQ2yBfoKI0BHs2aqBcPmemKa2edh
	 KSnvd32dt3dYD01Y4e6aDW7dBlLABmghg2co5ORclMjPDjTpcbkbVa66uhFl2ZFKaOA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792929405;
	bh=+6DIp3o6cAJOGimgYOMjZa51AuBC/LzdGcnmQpmQ/3A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W76Fl2YRBcjKT2zxzlbPVzw1359DYot4YFmoHRn8yGceDCh5YXKnvYZxDcg76DCcH
	 sdkyj70uvIqVNTwWZbxPJqL0jhy657Je8NzQzSCx2BIW0Qf5U3K4tvqBY4Xau2PEYP
	 ra8NItP5frZkDw6mB25bFLV09/FKzcb5kiHhTf67P4lQbCC0UaxyxdQVCrGZtaeTDu
	 +SftwEK0he7qm48fUIiHrAf7DsqiEoA6oaN5FQ9tg3aXoxD8OHCc6x+5BlV1LjE14p
	 wNZYSkNpAFSDniWh+TcNWFfPEWov6UFXEnmw+T9vFJdYSCA3bcEFChO3UVM4cvlTf6
	 HZJtF7kYbtkRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F092816E4;
	Sun, 25 Oct 2026 11:56:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 984A6D33
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EAD1406CD
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:56:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OSrs2N2FBoXJ for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 11:56:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4E067406D9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792929387;
 b=ItAW9g0/TwlXDgMq0PYXxW9VAkaRw2I4j4NhHpzzLq8FRhB16OY6273TsKuLg7xgh2sz
 9BqRCnTZV+/ebWyZJEYjgdflEyLdM8VDXMLl1t5uLxlDMAXl0LEPgPMxFl+jRcqComc9B
 WsICm3ZFQTjZbj612vDkGzFFtik4Zapy8RN/CwWRJ1xkEw+J4gobbpVpxxGrB4zQHoGLf
 aU5I5MlOjaKP1BCL1PWcPQd+IYhSX7Gn7RvCk4wH9+/zKSW7204TZ8lk6OqNM/qtjLywA
 PHpu+ohpiKOp5N1RDgmegBLdnFSNQ8zGX68ArkYIg+ZBgmxbqiQ8EalTMv09N8oy6Tw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792929387;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=FJDkmx3VauOP7DTcaIYIMZ1EFgQ/5R/XeSK9sn10R9o=;
 b=jQ2yaU4zd8Ka8XkFlp88W9GxXyIOlu5hV6d2zX5v4KItXQdlKK+gaZTGhdMVQGiTKNW9
 Pcpaju2s1o3afHCl5Cjo0HqPr/AVb3aWkwhgvzXHvmyu7Sd+FLWPPCIDzoe6w8q4KsE02
 hFqtUfh+Cwyj8zPvSRdmf5amrnCZU588HnCVZO8v5cgFMwDkJV53H7rJ8eXOfOrdvOq4h
 fhPwv0RpAKkIZHby3q1V+JS3DSkdmAUYt7RGd5PTZAkxcxyCLmYuR1C1Xl1u1s2y09cej
 KwTQGZOscBvF94DKzvugw/gs9zROOk9ks5Na6xBDdUjcWYSQFu+S1sQmUacERVpOySA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E067406D9
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:56:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1D2D9CE81; Sun, 25 Oct 2026 11:55:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 12:26:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8a5655889d7d212135a28133e716a9f2430ce5da
X-Git-Newrev: cdf33193a96b6c2c7727c8ef96e4612467d19ce9
X-Patchwork-Hint: ignore
Message-Id: <20261025115501.E1D2D9CE81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-wcwidth: bump to version
 0.9.4
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cdf33193a96b6c2c7727c8ef96e4612467d19ce9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-wcwidth/python-wcwidth.hash | 4 ++--
 package/python-wcwidth/python-wcwidth.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wcwidth/python-wcwidth.hash b/package/python-wcwidth/python-wcwidth.hash
index ecf1ce3d7c..b35c57931e 100644
--- a/package/python-wcwidth/python-wcwidth.hash
+++ b/package/python-wcwidth/python-wcwidth.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wcwidth/json
-md5  5679851d1447f3c3690cf67e09300c3d  wcwidth-0.9.3.tar.gz
-sha256  dfe7cfbd4cb59db9fe0931bd6091ab4a95b3acc5d56bfb50fa9fef0ccba5dc5c  wcwidth-0.9.3.tar.gz
+md5  51b77cd684d54bb58d330043f428987e  wcwidth-0.9.4.tar.gz
+sha256  fd8d57d3cdfe570e3265c8fab1885c24e34ef40889c0759c0c304a19e9835954  wcwidth-0.9.4.tar.gz
 # Locally computed sha256 checksums
 sha256  70b98a95a2144eb70af8017fa8c6d95ce247e40867436e8bc649e137fe13d21a  LICENSE
diff --git a/package/python-wcwidth/python-wcwidth.mk b/package/python-wcwidth/python-wcwidth.mk
index 60914a4855..b0e828604e 100644
--- a/package/python-wcwidth/python-wcwidth.mk
+++ b/package/python-wcwidth/python-wcwidth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WCWIDTH_VERSION = 0.9.3
+PYTHON_WCWIDTH_VERSION = 0.9.4
 PYTHON_WCWIDTH_SOURCE = wcwidth-$(PYTHON_WCWIDTH_VERSION).tar.gz
-PYTHON_WCWIDTH_SITE = https://files.pythonhosted.org/packages/69/4a/82d61476a1ccc20d43d0805724c5de4baa4971131a8db1816705ef53fe16
+PYTHON_WCWIDTH_SITE = https://files.pythonhosted.org/packages/ea/01/e5ac23733628a6bbb91913a765fcf55ee8070d8d991bc88fdaaf805052c7
 PYTHON_WCWIDTH_SETUP_TYPE = setuptools
 PYTHON_WCWIDTH_LICENSE = MIT
 PYTHON_WCWIDTH_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
