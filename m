Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3645D606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 09:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lF9/j7/S
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F07F98123E;
	Thu, 22 Oct 2026 09:52:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GKamxMEwSUXF; Thu, 22 Oct 2026 09:52:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EFEA08124D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792662764;
	b=ZOAeNL3WnlobgPLWXePCN+3uJ3iP8+Csor7jzwtH0KuC/lC6dwz53TnLXUf6xuqvFVfJ
	 oCWi/QujI2J5fh1LkWvVSL8itvTRSi9UDSACpz61hVD8RnTEyNsSI6CsXaD7mARG2GovV
	 2AZf9WjLpzMReNUH+/YgVbRilSIiiVanQMVtmuefRpuj6UQ0E8/gluFtHKoLYaEAWoHX2
	 iW6ssP+OQCD1oi8dyBCoYXnyNnir9RNt2o2wAWsR04OZlVfYGXtiKoFMwSrOKMq79rB3Q
	 N6IxAbzIftRUdUw1TfmwIjD3XdvzfLw73/jf9xwv7SWAymf48iDJT/BE739t77uaeRQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792662764;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wLHkUUs5tvhAgSx1zVa+no6/ItWW8eXZQbohXff9mOg=;
	b=duKPGmQTGM6YrjIbS8dG98dFRkoWt75cJGfKIS3FxIHdIFpZKqSq4AwzhRuMzWOg/nwx
	 6sveMisCrbx5bgzlZoQneNIjRA8W627oKMwSEI4qXYZS3F+d0SaVyVgu23tuom+EcZtyn
	 B0Nia/S91zDq5gZEVFhZBm1EXHaIUy41FscYn8MzIv8WtddJGtuSKKXad/ri5PIgapE+P
	 j5HJ8UaRZ8rBSNG2eRWlUaicJNUspMeQPyoP3TOHGetjS5Fs1oubyij0szpuWHU4C0XtI
	 p8bqpmAckhH3wIv2+WGdVyWbhlZB/S1c3kaOQj+Ici8Sq82Cenq5UXxEr73oSSy7bKg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792662764;
	bh=wLHkUUs5tvhAgSx1zVa+no6/ItWW8eXZQbohXff9mOg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lF9/j7/Sgqc0pzM0/+oIx2kvJdYjANxPrGooc7Z9q8aQw/1HZ4iADBJ4+gM1/qMxg
	 waNkkaJwYollF0v/lvXAnMJdtaGuu+wJQIU+fil9pSa5FYtNTi+I4AGABBLrYgfOLD
	 5eY8itOt2fHbZUrhRFdPr9Ijrwy9cm/DXNlLv/bhcL37/wG+lrggcnNMbgbMHquNu0
	 R7+5qOVCEsr+Nq0aILFJ1bxwnhikOWYOTt62uTnuqwxpdeZ6sXyBBSrRHJh4DdMmJ1
	 fZaFRAy8YUZrN55lmgXMH+UhSmt9ApYuJNi+88d8DCHEYtcX7RDLBvl2Ywt1ODMw7H
	 kKFHQZHGPakOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFEA08124D;
	Thu, 22 Oct 2026 09:52:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 76376356
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C7A840404
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:52:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oZtOOdFRlK8B for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 09:52:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A16E4403DB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792662761;
 b=gV6YWZCAa0XrDRayaKIJltI4bxlDDaw83S0tHkjANFZB9dWDWRtVvpDZUMTmg6zVidu1
 KEKOLsj6r2ZiSMQMoK8oDEcPGSGXDoFTVXvmEHYuPgUjt4bOGQJGef2QN5TiLa3zfknyN
 UawFWvysqPRhV38CmYdqJxXu8rHsHBKD+n4ZZG0zJGX5h1ueRbJCaCaPQ39LG7CfihxF4
 5EI629ORBqUeogBOK35vsC1JDrMv6mWntxU6qBLkB6UiYSuPYILb7+2PK0U+4SLB0tqNr
 /yTKr3sjlQLz/T0TQP4Z9qcoV5+uwZF5Te/QMUYwm03b1cGxcrvVsfk3WFS9HTFVtCQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792662761;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Naidtjd1s5CgJye0S3klQauF9As/uomik06ftZyr2Gc=;
 b=MxxxU9TKW3K3HIWwAXn+8ZAhOT+Syore092hwGDoag502UObmtw8YUfiFiW8yFy+Em1u
 9VmrXjco7gYsMqxhyAHGM6GORMD4DAzu3ysDCMYrqtakutimiOA+96gJDCmcxJrANe3zK
 vLdax1qFNtL5i4Vn3254+RPkkyQfYpvhYwIwG3+11W+XxuXTb9SzrzfwwUpYY4tbaj7jh
 lLM1+p4e6j4tZPPQslGF7bRjU9k+WOJpvbevljO71Wdqh5/13pXuCf8108nSYvfOd7M8D
 LMWUrpojGDrX/YOeudt2vtsq1Fpf6kNgPAJXjhrgbR5HnefUGcWMSV2BkCTKpkTRaxQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A16E4403DB
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:52:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A64D99B992; Thu, 22 Oct 2026 09:51:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 11:44:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 63cf7e10a9fdbe5ac48cf7d132a8f59f3ef4db66
X-Git-Newrev: 2efd7262dff4bc43d70d785d44eab12ca1603aed
X-Patchwork-Hint: ignore
Message-Id: <20261022095117.A64D99B992@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ca-certificates: security bump to
 20260816+nmu1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2efd7262dff4bc43d70d785d44eab12ca1603aed
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This invalidates the compromised eMudhra intermediates by blacklisting
the roots that signed them[1][2].

Changelog: https://salsa.debian.org/debian/ca-certificates/-/blob/5bee010adca85eb867534f6445735ad5cc0dc6f3/debian/changelog

Hash of the license file changed due to:

--- output/build/ca-certificates-20260223/debian/copyright	2026-02-23 16:32:21.000000000 +0100
+++ output/build/ca-certificates-20260816+nmu1/debian/copyright	2026-10-20 16:31:42.000000000 +0200
@@ -2,7 +2,6 @@
 Source: http://ftp.debian.org/debian/pool/main/c/ca-certificates/

 Files: debian/*
-       examples/*
        Makefile
        mozilla/*
        sbin/*

[1] https://emudhra.we-have-a-problem.com/
[2] https://groups.google.com/a/mozilla.org/g/dev-security-policy/c/0R3XLJL6FuE

Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ca-certificates/ca-certificates.hash | 4 ++--
 package/ca-certificates/ca-certificates.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ca-certificates/ca-certificates.hash b/package/ca-certificates/ca-certificates.hash
index d234705082..6ec824836f 100644
--- a/package/ca-certificates/ca-certificates.hash
+++ b/package/ca-certificates/ca-certificates.hash
@@ -1,4 +1,4 @@
 # hashes from: $(CA_CERTIFICATES_SITE)/ca-certificates_$(CA_CERTIFICATES_VERSION).dsc :
-sha256  2fa2b00d4360f0d14ec51640ae8aea9e563956b95ea786e3c3c01c4eead42b56  ca-certificates_20260223.tar.xz
+sha256  914416a1e44a25733aff51092fe4e27fdec1c9f6e8d1db0b8364922486153134  ca-certificates_20260816+nmu1.tar.xz
 # Locally computed
-sha256  e85e1bcad3a915dc7e6f41412bc5bdeba275cadd817896ea0451f2140a93967c  debian/copyright
+sha256  1ae033c4679e4440848d2fcf6bc8e57d4da2644662775f401e2fede57862674c  debian/copyright
diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index 0f88df3eec..64dbf29dae 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CA_CERTIFICATES_VERSION = 20260223
+CA_CERTIFICATES_VERSION = 20260816+nmu1
 CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
-CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20260223T202245Z/pool/main/c/ca-certificates
+CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20261020T202723Z/pool/main/c/ca-certificates
 CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3
 HOST_CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3
 CA_CERTIFICATES_LICENSE = GPL-2.0+ (script), MPL-2.0 (data)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
