Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC12606A335
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 20:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YQmAHcjQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=mCXGsLdP
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2EFC605EE;
	Mon,  2 Nov 2026 20:12:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C6fgtwwgNDFt; Mon,  2 Nov 2026 20:12:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 06CD3605EB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793650363;
	b=fFfCR6afujxmLK7x6Ob4Na2BHgiLxjOpgXYcWbZivYOjuFgbwj+0DIKGOsOtqjKqDde4
	 UpaXmO/ZJX4xbXKYnA11ZT77eFmBHMpVDB0gl/6+ZbdsHIeYdM3ZZom2kSFJnYZFcTif2
	 bb26Nc+zV4hFFqPieFXgwamx9GiZ7oPz/QiQxS5pu5l2bpezgU/9dcKnkCp2b25vgQ002
	 PvnIHgCCwJYupL6FFXegh4nk/PhQMHsWk+aWKhC82mwOgpcq933d1VrHNZS3nQ1qr5X6p
	 gsA8H7baLb8WlCPlDi4GOh5lvlV45Q4RCJzKClF+k1V+ngw2MW3W7azJ3hIP6XxLK7g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793650363;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=mwk+MQJxuunWr1Yht2WpHrMonEZJlg9xj2UxGHVLIV0=;
	b=MOP0hOP/p4oP26WrTcwYCCElrMoIZX3lzLvbMhkS59tcbORLGau4rCGk4GPzxUME2VWm
	 2CpM/GXgCBqG58I0eYqOZ+CT7qcf7vRYsd5DUYJa7ITjEid8g33tjOrQw5a7NTurqOw//
	 JcAM6WvfwLDpfFvMzF8q9qSVR/LXFmKPmFMRuOXEfzfqz+Avn9ArfNWPz/sUsNnMhtXE/
	 Ayfg3EAVRPEMSeA1Jr1MEKTSp7t2wCAkY2nnUHCUjUfk0bCOEEogyQZJNxJA3xZgDFs/k
	 SjbaKHSHeBamJHEiwlzH5gIWp9/Tvx5PHGqIcl42KaGqkk/gcM2lsPLQ52/u3m3mxug==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=mCXGsLdP;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793650363;
	bh=mwk+MQJxuunWr1Yht2WpHrMonEZJlg9xj2UxGHVLIV0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YQmAHcjQumL6Tf7KcKe4CvjjMaXBGKT49LNNLWq0TgF+oEgh2EksXePsesmDSXQWZ
	 NcSLS0nFnhNYHgnvFajLvS/yfH7xthAXzzLr2xEAiZCQD/vG9zx2jIFYzNpJyfCecF
	 IzSr9xjdXztES5VsJ0I/EEagJ83d+NfgIfmWiUz2WMbzDu/04LnB7vRXBwKhrG653J
	 0Fa1hGO94ImqWubaRAdWRn6ybRk1lj4FH38NgZBgbCDGK61Kb6Wdqtppse3TCCsXZ2
	 QuO9Pu376bjVoerxt47Mt0PsiA/rkyfwnRTofrXV1l7CkjI6uD0JQqLQJXrLh6Z683
	 JsBC/b+NZ1Huw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06CD3605EB;
	Mon,  2 Nov 2026 20:12:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AC0444BC
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 20:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A99AB605EB
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 20:12:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CT6Lcj1F1hQN for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 20:12:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2F350605DA
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793650360;
 b=PifwTG5nkmmxXJtLfQbNIEakAWx677/iEpgf8qPqyPMv+P7QyDkWbwgoRImQEZGtlGMn
 gpKvXbbWQ0rDJVIMqtTc9o3T+hExJpAyBd0XRu1yDtzENNAK8cFeZ/LWNPYdIeD9cs3Iq
 z/29m8vB4CLIqGvS+zimcivzD95jAr01iclhFI+5D6tecJZBtWe+RGHPah1gfSSpWG+Wb
 IQFvLnSVBfknfmoueQnuUAsAlqQqKOLyp4IqnGOEsajNFG7ie00xlFevlujywclIF4epP
 rugC7rQzbt35rDlftTyWe8LOa+HI4dbjrWTaVHpvabTqiYmWPuJt2nGH6aLAgAqVwDg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793650360;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=iAPiftO6bDJauCxmJm9L9ujQaePS6VA3VfhWs7VWbFE=;
 b=YnBnm1vH4szjxN0p41W/4M7ecj0VKobPHEBmVJFY0Oe/2cenA0QQAYjhbTkXxgTST30A
 lJUJ21COLDK9jkwbSptxYlH0+AEFDu283WOh4hleQBu/bYXBfyDhqdDE4ekOm4auvjaAW
 Oh2bVwuf2bY4qJFXmQMAPxR305z7Phplbv+hSSNdiQwZDqX2ITcVUQWQHkSU730UOAoy6
 BIxZu5KqmY4pDjuH9HKqd2gQApAB5oq1hSdYqcfELvEUJBTPJZr2Y6gjqJSbt+A5zrl67
 4WC/DRJF+t6hXWZaSl66Gwo5ygmsWSApQHMnn5kCggsmcKiQo4vCJqKNVavWyqdA+Zg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=mCXGsLdP; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=mCXGsLdP
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F350605DA
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 20:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793650357;
 bh=iAPiftO6bDJauCxmJm9L9ujQaePS6VA3VfhWs7VWbFE=;
 h=From:To:Subject:Date:From;
 b=mCXGsLdPvrTh+I8hxtdmwa42+O9a0/97stBwuBQEi5Fyc1N6BybqzozcD7Y3fma2s
 d+PXyXcoYSgHGpg6MlOfzfDHyIyOrFciOM+A/CaSvS9/Fv/sBrY6fzwVVR2JaKDzE+
 2fpLqoMfPrcfCLhA41AZOiKsGeE5Bq1aMHXeRcrOlKBvlMHZa4e+V6RRTPzG9GyxaF
 Qih4pWPr8yfNkbXtkqLJKenuXmwhr41lKb56NnsP3kuqXcZyaL925FOYEBxK8P+oME
 PauJTKrcIDB1pCjSHVKjMrA0k2nKvtfDbaUIEmL9WqKr+A7of6NZ3CDh2NESlq0+5i
 PTQHyEoyBgAyg==
X-KAS-Sym: v3:f51bdf72230551df:Xp0McvTuVdI6xYIdn/GKl0xgZgA8qMiClKkPsmgM2nlEd
 mNlzTNzUwPMGiQJM3Amt1M7jy9O4UxyeuTrCmaENZ2RuXHEqk3UlRPpaHqVjOvvDio62Wv+6baJ
 /zOy+IzLLpBhVH9QFGAQ/5soQATJQ66i1SlM/Ow8xPk1KfeM/xaQaxQYj1RQ4upr7W16c1TzUZ1
 S7l1mR0v0ABdXjCR3ayIp1oM6wYeyXZXgBBIC0kt5bI6/x/ZIBP+eVo6Tp3qLZAiyUpy15SeQsZ
 ZKYVSV9FEU0f8iymgrD1P/3+92olV5syCYrQUhimgnV8GjdIQsiW6DK1IOl5wq/SRV4wP0XQ==:
 /j1XJ6qmx3YinAT5QbOZloVBqUq8Og7r1Z5LKmohCfdyCD2CFmRjGXk/pJS+YGVaDjsCPq2VaB6
 2MSa++NfDoOAOWnKpTI670ES+STCnl2K5KaXOqxZRAzlnH+mUtyFUj1WNoIrL/5qUXWJ4PrD+lu
 N1G9PesXYmhMs/9agyRNtVsZxEPbrLcOz1fIg/vDV0WbCSY1RcmUaeroIqMvGbnRxDjg4/5dV13
 VLN4l50wQA2LVQ9COoTrx2l8taJ2Zdjj2Zgql/Qpimx4rkSYm9mq7B4aezsM5OjmBk/GTGJspqX
 3+CK+06yXPy5SueqUXlC+wLOQwaM5LXgqpfq9TEGTwz46NHuWU1tiM7cvG6tYz0F0qbTi1rjNrj
 CW2E9lY5s4hCufoUUC9HC9cuUA5mwtLYOka564b4hVYZabiGf4lX+saAMeaM+VCrYjXQTFCQz4A
 TfZujHEPZ7WZV5VgJ3nblPjV9oaxbKlYFJ9AknwZHr+aDBN/EuDphykG5ImNelyT9NXITMsMKSV
 vTngOIaN6jTALzUFJJoG9hmnSAfVOXfICt2HjnIVhkXyUwb8SDNT7rjdN7m4opE+iBV24p/r1oh
 jsss76ZPnWcxW88Nzt2hEMjNyM4AEBcai/c=
Received: from fli4l.lan.fli4l (p5b3a07a5.dip0.t-ipconnect.de [91.58.7.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B2FDAA4C0A99
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 21:12:37 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52042)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xNyOT-000000007Bf-3EN3
 for buildroot@buildroot.org; Mon, 02 Nov 2026 20:12:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  2 Nov 2026 21:12:37 +0100
Message-ID: <20261102201237.11307-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/liburiparser: security bump version
 to 1.0.3
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

https://github.com/uriparser/uriparser/blob/uriparser-1.0.3/ChangeLog

Fixes CVE-2026-48841.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/ae3ea29b57a932ff3a6a5e11d4751ef6f94a0956

 package/liburiparser/liburiparser.hash | 4 ++--
 package/liburiparser/liburiparser.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/liburiparser/liburiparser.hash b/package/liburiparser/liburiparser.hash
index ad5bf40d47..185476922b 100644
--- a/package/liburiparser/liburiparser.hash
+++ b/package/liburiparser/liburiparser.hash
@@ -1,4 +1,4 @@
-# From https://github.com/uriparser/uriparser/releases/tag/uriparser-1.0.2
-sha256  7b2496f9622b4b201186a3d159d278605f1fb7262402a10cc1c0824889798b00  uriparser-1.0.2.tar.xz
+# From https://github.com/uriparser/uriparser/releases/tag/uriparser-1.0.3
+sha256  a327e438e238d6c9093f1845acc44dec20d4264639a3de1f3caf0927bd852e3b  uriparser-1.0.3.tar.xz
 # Locally calculated
 sha256  287f09e6546a9610f949f89e8fb937cacfeabd7bfaa8c8a0c18312193bf04ad3  COPYING.BSD-3-Clause
diff --git a/package/liburiparser/liburiparser.mk b/package/liburiparser/liburiparser.mk
index 9d1b9a1aac..eeb4e5da1a 100644
--- a/package/liburiparser/liburiparser.mk
+++ b/package/liburiparser/liburiparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURIPARSER_VERSION = 1.0.2
+LIBURIPARSER_VERSION = 1.0.3
 LIBURIPARSER_SOURCE = uriparser-$(LIBURIPARSER_VERSION).tar.xz
 LIBURIPARSER_SITE = https://github.com/uriparser/uriparser/releases/download/uriparser-$(LIBURIPARSER_VERSION)
 LIBURIPARSER_LICENSE = BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
