Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8DE606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=b5eO7Gxs
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEE3D608B7;
	Fri,  6 Nov 2026 21:14:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vhpro_9YHj2J; Fri,  6 Nov 2026 21:14:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 80D4F608CA
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999665;
	b=sotnMJK2zmcTPuLUOa56qe/z/laOuwsvBsYMqdhuCxQwQH/bhBXzNKCVhYmvxpPKMxwY
	 HEyAE3GulPKiwteTc7qk6xdAku8YOd4FBZvg8/kjpQsJVyRi0Z0XEZHD3Ylm6/pvjJ5Zf
	 42BiSFwVhNg4eB0EAB/fBQA+dx+98IxR4sxbg9sJUJW2HiJ+kmFYbxdu6OUwm3weOy3Q0
	 0aATBxzIze+Nk+MfrAMCBRaRraI82S9l1ZPOfe1RWwZV+rbPO3NqPvClg5lY8OX267Si5
	 YOf9P2hlr3gDwVWvxbexNtEHNeoFJOXrDBxtioxw1XGCZLRiprc8TIqF8s6OE/SY9kw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999665;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QVqakNUxeQzHGso+QYzUM2s/fU5OEXqQ1kSMRSdO2QU=;
	b=T89ZKGoieXZ0LviMSmt93YzO+1BbhExlDovhCQ4ZQuN5OApjKy7r5Ezb6yofd5yweZsw
	 o1/FAyy/HGsZbdIottV+UueN9P0FRKQjTwRxYd8WxF9ri4WYl2nNQYAJVBDkeAxG8ivzp
	 WHl8ByFmBCkdIsxOPVVK0H5EMp7R/jLsCsBRN/CgEbyS/qWSKEwkww4F51Y6tfJ2+TIMR
	 PiltKZEl7QHQdziLi66Z+DFo43JhPEnsKmyw5/AHs6jF+x1aXN6QByYSnR/E+9Nj8PhJu
	 YZ1ri4BkZvkvzdqChF68DOLzqZnQHljZDBUOcOs0lxbghve+KCVzfY7eHZuPdLkg2aw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999665;
	bh=QVqakNUxeQzHGso+QYzUM2s/fU5OEXqQ1kSMRSdO2QU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=b5eO7Gxs3nQRcsaBoAjKlnO/Upd3iK+UM4r5Z3s1Mp+fC9Q8OAgy4b/SnINtgCh8Z
	 jfObVVMee8+fylDEjFuBp3mFIDTtVMzbchIJ8Cwj9VSI8+aaXzQBkblpGW4pkVu9XJ
	 whqeAko28NikDqX3XTLsjJ1SxjugMyvfWIHJmldAB8fTlkzwR8Ot0GbUSCXOkjEaju
	 r7MgUTxAv8RE7TnuUmedbPG04+x3n4kD1AutALeW06k6m+YUnTQNOdGcfRebrhXER0
	 U55YjrQivukbx/U8lX5eBLallRPvqHQRZZbl4qfoHQB1fazs1IfQSps+jN8nMvTHFP
	 LGRS6c01sebxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80D4F608CA;
	Fri,  6 Nov 2026 21:14:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2576E32A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B69A81287
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X9IRY_1FwQAh for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4006D81220
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4006D81220
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F2D29E0FA; Fri,  6 Nov 2026 21:12:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b79a7bfa3aa98a8d51bc24549c6f9a7504a7696f
X-Git-Newrev: 74a624e3fa2eef6eb227e8db36703032c6ae4b08
X-Patchwork-Hint: ignore
Message-Id: <20261106211248.4F2D29E0FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bsdiff4: bump to version
 1.4.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/74a624e3fa2eef6eb227e8db36703032c6ae4b08
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-bsdiff4/python-bsdiff4.hash | 4 ++--
 package/python-bsdiff4/python-bsdiff4.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bsdiff4/python-bsdiff4.hash b/package/python-bsdiff4/python-bsdiff4.hash
index c3551e455f..b6a706911c 100644
--- a/package/python-bsdiff4/python-bsdiff4.hash
+++ b/package/python-bsdiff4/python-bsdiff4.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bsdiff4/json
-md5  2b1bc9f016efdbb413db2954ddab7cde  bsdiff4-1.4.1.tar.gz
-sha256  d66fe7d6c50ea533aa860ac76689e05cfb0a3f8c7bd6730ddf5089a948f66ac5  bsdiff4-1.4.1.tar.gz
+md5  a96b7596b75e444f2e39dc791fdd836b  bsdiff4-1.4.2.tar.gz
+sha256  3ffd4d8b2d5b9f0f1c427e4fb58512dc88a4cc807623b72bc0e95e0baa21c70b  bsdiff4-1.4.2.tar.gz
 # Locally computed sha256 checksums
 sha256  409b960b948de9fe1ed54308394b225572661fd9cb6378002488bb318a7f1c66  LICENSE
diff --git a/package/python-bsdiff4/python-bsdiff4.mk b/package/python-bsdiff4/python-bsdiff4.mk
index d56d524f2e..3b6414f392 100644
--- a/package/python-bsdiff4/python-bsdiff4.mk
+++ b/package/python-bsdiff4/python-bsdiff4.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BSDIFF4_VERSION = 1.4.1
+PYTHON_BSDIFF4_VERSION = 1.4.2
 PYTHON_BSDIFF4_SOURCE = bsdiff4-$(PYTHON_BSDIFF4_VERSION).tar.gz
-PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/9f/56/f7e929c66b74e0efb7239ab02254cbc693f079b7836f3cbc2760fbbb2781
+PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/ae/89/6933ddf0a7d1d117a1c4c8e33b893c686935a8b392e36a8ae098189faed8
 PYTHON_BSDIFF4_LICENSE = BSD-2-Clause, BSD-Protection (core.c)
 PYTHON_BSDIFF4_LICENSE_FILES = LICENSE
 PYTHON_BSDIFF4_CPE_ID_VENDOR = pypi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
