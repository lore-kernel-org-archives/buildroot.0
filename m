Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE64606A325
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SX1Vv+CD
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A100560B51;
	Fri, 30 Oct 2026 14:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pSonBwKx2DOx; Fri, 30 Oct 2026 14:06:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B267660B02
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369212;
	b=RS+RwjcmXAteZ+kMTZYtxFswDDdGMg3xVtkeT8L0Hnm6mZmoUaaBE7MSZItC/lmbkSVd
	 Pa4bGAEGlVrWLZUAiEnu73exUEKjyZetVpg4DJPInkpK5YhYbA743+E6qTHoc5gqei8R7
	 Wp9QmDJvamG0d0FagtDhNYVbHqwKFmkb+ab+oJFEpF5TqKOzwRFgttyxdi93v+A5yinWp
	 C/n90UU79nahAWxL3fX3zcwtYSKlgbtHH1AqBSmWD/4bTRBEQsRPAgTVxZbAPoSOY8JqY
	 hIQvsSPra9GUu9YP8OYRwkkUpSSwAYgwA4ZJhQfybEAclZVWqV+z1/dvR6DVhK5Axlw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369212;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=jlddPfmyJNY3v7Xem4DXaPy+C8qurJERmTsqkpaWh/c=;
	b=rOy86UUKSJtq29TX/9xONwViVQQ5v+gf2+KfA37JYdDrgGooqavlf0OYQt1OkuaeW318
	 Jr0SwYxcSTvbi5x1HQi5CuaEf33vPGtDJbF07emNP15cocAbNTE6S98k5RmBKFc0gNY7Q
	 8bmJZiYGzclqYqmsfarVM1a/xL2HJ9gZRUkdB6pMI6KI6FsLeRPe7iwCGb2XARnrRq5mn
	 sjUXoKHtPqZGuxE3imlQBq1HVpDMBAx2KExaoQmkUmvjZ39jh1nO9jdCkuRxFQnZsgsKv
	 cUVG2g3b4JY5F00P/ARl5LNv7zpJYDBldlZmkXsKZH9J/JhsNN7ly13MugTAvt5d+wQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369212;
	bh=jlddPfmyJNY3v7Xem4DXaPy+C8qurJERmTsqkpaWh/c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SX1Vv+CDWX7yjZ92bAtUPwHGlsWP992N18KUsClSoNeb4AGYwZ4FHSyheErpdG6x9
	 jE+MmgWtARFNf8ejXvZoRXKFny1/XdEbA/c7o8+ze7Kb7EoPmSuC29dJmrOT9+madP
	 jfrzGVMIdDs0TJq3tTtCZ1N7XUqYbAbMr5p+vpBMoE8uB1NELUKYnQXLuIyCHZ0ih/
	 sr7oZB8jtH08aj8afZ16V1a4IequpttwHkDVenGqqSuzZCKUcdgJQYpQbD6llL1tOG
	 VKeQi5t3UceCSbREhFXXTSjYM+cfRX1g/EEiZUl6ymC8wSJkhk4Q/xlWsW61rKNnaN
	 nLR6hhMuxXpeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B267660B02;
	Fri, 30 Oct 2026 14:06:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 97659362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 827EF40B2F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EwsNO1x6AyxW for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D524A40AFD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369161;
 b=kv6Lyn+5oI3kKL8TipMff40pw15b8gcXyF2B7Tl5jLxxeW2MrSO6x1VNuE8ZF74TXmOQ
 ULGxspVhwpq9aMQuqBBAIUwU+czFGRE2NvXXvRzO8FrMifzUDrPawyV7wiAcgNFODBTJO
 y/QGOTx5C7ypccTTRF6ypXm9l22jVX0eOiwoohh20Y7dpgETYDyEPxooLWNhECZ0iQYJa
 OCON4y8okLvyZAxVTs1hFt34qEv1q0dp2LsuQurMGs+dt+KK+yWI6BvgTKE87INBxUlJz
 DAeqQUCFh+7NB0hlCOmdN0inXzRaGTSxpdSX9GpPY5LqUFN2nvtY8lFzxEePh23UAbQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369161;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=aZ0ndk2jDDVhKVJBn+y/80vG91vcvd7MC5vwZoDxmkc=;
 b=r0MqJPz8OzKwEU+ilR0Sft2DyzRPZqZmzsf5zsSD5EUhOSfInqp8OsOiIxT4AzuExv1h
 HHF/vyhsKWrj40x9Ee9XsBH+3GI05+KUGUdrg39N7aU6w1ydDQN798vIlNex4DJUNTm89
 k9nzAFVVATg2l3fnxcxLSobzY6LlCc3iLyi7ODG8G/hZtjZo+hVKw8KNgsROHhNMFRdyP
 y8r/YaobypNoVMyVrIgL5Qw81ydOfE7yJJ3IiVvBKMHONHnojPr8C9IduvmR9Ll8pUFd6
 3ThPPBJlngza2Gn+fiVJIYYzeZwuJQlNW3dG03ubOXxIT34UPYBzEv7F5Y9lQHHZdCA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D524A40AFD
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E6C719D388; Fri, 30 Oct 2026 14:04:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:56 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cab7d2a5ba49265707441fa83d665f344ce3b60e
X-Git-Newrev: 5c089b5ba0fe58eb0fab5f0038ab3dcf96aca8aa
X-Patchwork-Hint: ignore
Message-Id: <20261030140433.E6C719D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/bind: security
 bump version to 9.20.30
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
Content-Type: multipart/mixed; boundary="===============0245093094676350704=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0245093094676350704==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5c089b5ba0fe58eb0fab5f0038ab3dcf96aca8aa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://ftp.isc.org/isc/bind9/9.20.30/doc/arm/html/notes.html#notes-for-bind-9-20-30

Fixes CVE-2026-19630, CVE-2026-94300, CVE-2026-96888 & CVE-2026-97313.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b904a38926a15849ad92482a7ca63914fecda420)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 8129fa2d2b..2d6aa2fde4 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.20.27/bind-9.20.29.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.20.30/bind-9.20.30.tar.xz.asc
 # with key 706B6C28620E76F91D11F7DF510A642A06C52CEC
-sha256  587029508b3b1b43229fae416c97e5543aba45809cefaca98a5004a02a5736c1  bind-9.20.29.tar.xz
+sha256  9e1443a40a72a30272cbc3196d020a6b2e26937111c83e59e101e82e1e3b4fef  bind-9.20.30.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index a05ef6c362..7fb07fc83c 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.20.29
+BIND_VERSION = 9.20.30
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES

--===============0245093094676350704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0245093094676350704==--
