Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0673606A326
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 17:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hloRGunA
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C57EB403F0;
	Wed,  4 Nov 2026 17:18:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vslafQwOqNFW; Wed,  4 Nov 2026 17:18:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D48F3403E8
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793812704;
	b=aJl//jPrEwSeSivsVjiHuhIdUN+GCza9d6TvQa6UpoLk+Nf+Wrrp44BAIyA84wsr1CZO
	 LITFudCDLp7gRZJKQo67ZzEhL5DBnRLvT1xuOLbVFEw/BcS+VhpaF04rTDt84CwH+pE9l
	 GQ4XSTp3CysD9HnPLbVVStzxTP3ujDiNOPAfWfjuUu1zbnVLvc7GD4NH6X7SxdsFFAqgl
	 OVSP+cW9VmPwmRinXZKY3LWnmDO9yZavh0XsWr4hCL8EKu6tSo0KprEncNfud23JJXiUA
	 FGu/3Hs215Uq708ayt/iC+n71VGBMrQZoXBBqWukxlQ2rc/zdr4oXYXPZyKBw8KH2Jw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793812704;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Sc+n49/vl8sbxEPAaNL62IwMY9p//Rte5M1WvB7xk30=;
	b=NlRjZ8BLJMXkKC7PVfmZTxjpJCyuNC8fJdC/fDNTNBlSXDALaN96ykATdQtm10YSo4IC
	 m2NAjJponFaLvn6B6UiGHf5aO0WxIaYJTUMxP4mED379MEJaBOJpOMhUSYQXaPihpD9iB
	 7BzcsPkbg1PWt7jm6Gm+hOXxFv6YcXO6DWZna3TJvFHRm/fTMCvheNTBcXIKXtKlOJ1zQ
	 cUTq5KI1hygnybRC6qrsmZaK3OUjgc/1mMu5YID2lk5bC7fzhoiox9JYUXvBOtEm7Ulwh
	 aSjfIF5cqGNICsXn5Jb8ST7gl2OZjN4JrwxUHmHz6GbC+HpWh+nyEU2fztgJOIFeDbg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793812703;
	bh=Sc+n49/vl8sbxEPAaNL62IwMY9p//Rte5M1WvB7xk30=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hloRGunANPgGwqoyWZYj+UI+YnZglNLUf0M9Kt/PvX/U1YcRX/618RKYZ9yT/eFR3
	 cx01Qs1mu+bkYc7N+mqmvyuGsuCGC6MzmGkc3zmKvVHzasVWGeBjfgZF2UYmHn8Vhw
	 8DAbgkU8dnd6j5WRVdhA6WTw11JN3K+/+i1b/6t1ny5TvS4khNfJeKKTRjZ/zV9Lp9
	 HUt2cQG2X8PpHZaGuRnHDZY5p2bdTCJPVoWJ/q3VHEusD3P5m90a8t0LteGWTcxe+h
	 bTRoW57qJFZ4EXFci8Z6gOvjWSZOyCknOSKlYutyJBY8lanfrDJ9acEslJEgcEw/kT
	 fUJ+/+XM6ILfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D48F3403E8;
	Wed,  4 Nov 2026 17:18:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BB8EA341
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A18B260642
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:18:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yH6P-bqtM0kO for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 17:18:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9BC29605D5
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BC29605D5
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:18:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B048D9DCF7; Wed,  4 Nov 2026 17:16:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 18:17:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 597f9cf444625739e3add76a06cf347744358ebf
X-Git-Newrev: 8099cdcbdf4d3927de1df95b99df9e495f546599
X-Patchwork-Hint: ignore
Message-Id: <20261104171650.B048D9DCF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cbor2: security bump to
 version 6.2.0.post2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8099cdcbdf4d3927de1df95b99df9e495f546599
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fix shared references bypassing the decoder's nesting limit, which can
crash the interpreter when deeply nested objects are hashed:
https://github.com/agronholm/cbor2/commit/c2c8062eb28d6c4a884f6a4ba9418ac9d1476ab2

Also add the strict_hashable_types decoding option to mitigate denial of
service through hash-colliding map keys and set elements:
https://github.com/agronholm/cbor2/security/advisories/GHSA-p6xp-9h6j-r278

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-cbor2/python-cbor2.hash | 2 +-
 package/python-cbor2/python-cbor2.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-cbor2/python-cbor2.hash b/package/python-cbor2/python-cbor2.hash
index 4ec5434b49..963b44b6f1 100644
--- a/package/python-cbor2/python-cbor2.hash
+++ b/package/python-cbor2/python-cbor2.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  c0be697accd3e106feb9a082f52b6c6e2b83428148ab78ce6732a76c380233f8  python-cbor2-6.1.5-cargo6.tar.gz
+sha256  7b1ae9426ff8a39baa881e9eb54211568f24aa205c861d8ba7e5e93c0c058047  python-cbor2-6.2.0.post2-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  a6afd126d8f545a15166a22f25fadff4b9fb4978bbdd17e97d97d950b66d2fef  LICENSE.txt
diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index b35fba187a..845c062e15 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CBOR2_VERSION = 6.1.5
+PYTHON_CBOR2_VERSION = 6.2.0.post2
 PYTHON_CBOR2_SOURCE_PYPI = cbor2-$(PYTHON_CBOR2_VERSION).tar.gz
-PYTHON_CBOR2_SITE_PYPI = https://files.pythonhosted.org/packages/39/34/d443914ea562a985ccb357682e17b7190d5d58eff797c741379be47a8f31
+PYTHON_CBOR2_SITE_PYPI = https://files.pythonhosted.org/packages/cd/eb/e2ef5f241f15131babf4854032953b97c88b2c2700d7712a0ba8f57cbe81
 PYTHON_CBOR2_SITE = $(PYTHON_CBOR2_SITE_PYPI)/$(PYTHON_CBOR2_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_CBOR2_SETUP_TYPE = setuptools-rust
 PYTHON_CBOR2_CARGO_MANIFEST_PATH = rust/Cargo.toml
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
