Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CB4CA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 665B060815;
	Tue,  6 Oct 2026 16:31:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TPO2RRq7rFEB; Tue,  6 Oct 2026 16:31:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8D50C607CA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304277;
	b=EyOxGvC/HgR9WPddPeUqSS+SmyMTngC6p9M+1V6ESxRphTOb+03pd9aDEQNPfhrX2Uj4
	 MNmY5fxWm1mngVtiSw+C2DR/EwDnmv1gwdA57H7hAOu7AHoHKESrAZk5zBqBSpYbOQ0ia
	 GtzHaZoF5gOKrrvGQ4UNJPfO5rAkFpX3l6EDMIbiWT8t2+U789a1Z4F9fA5M+3UrpB5Cy
	 NOFdF1LcvmnXvP09KIu01ZSesVqiOTbPyLyP376cwwYXaeU/z/rIo2ptir4fLPC52fTK5
	 RUnCQAJBkoCVjAzlLDaMv5uwb5w3mhVE37x6ASk2L8FJTu1RhDmZ3ECXj3BXK9N02KQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304277;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8zWAJoyBdwFqiotJ/1IX5Gc8Z1Z7vKiz+K/3eboXSnc=;
	b=MjoFAtnWVosLh77eQ1DneKh4oOKw9Y732YpyWVXIgpR496WpCt2S6VDFOTa53XV11cbQ
	 RX5TMyr4mIeoXSOTMdyFhR78JqpgQ3tSCNvdNbhSQ02z/LAfqM1utlvhqBxk7tVDPM6MU
	 hZX3y2Rl5+GAzutbZMZLpaCzPBCqObBYW7Ud1r0Y755dXjMXzfUvF7CCy8JFqBYEpZerf
	 dH4k+JldTT3nPMHLYmqEVTjQVzVbVgzZgvCaoqTCy1Jzgyr9AOn8rnykkznJqFx73BWqO
	 /xoJvqTIB0nuAjE1ktwJDtD8i7yNFSOa62R7HKWUFY0htVrM7Ib2km/vj++7nSfwhAw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304277;
	bh=8zWAJoyBdwFqiotJ/1IX5Gc8Z1Z7vKiz+K/3eboXSnc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J7bH8fuZxm+sl7tlYPnEq+B/Wp6m/oYU2rCrxgiTnfhm0Ke9Uzt+ZVa/OKTi6fEJr
	 QlCgRHtjVjkCzyPtaxJ9zuwoCJCGAELeEJNsFyGJOiwtLzHsWu+U271Adxydf/fLMb
	 00uc70EBH8wUYEdktlkgo/K+8nXv9EEPz8SMd6f5yogKedjCs62MazQF5VYTEfeOPC
	 pFKsuT0G3gYeqN+tu11LI3yZ7i50ZJnXY2tZz2/7YbTZjSzfw5ozokpW573sDqlEK9
	 +DQr05uNIgbmvH8t8OEamhI0q9AsErkJTOjiyK0zOKWhaa4I7Drr+IphRRVR8sUtZk
	 W/BIrMSOEAMug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D50C607CA;
	Tue,  6 Oct 2026 16:31:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A211317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF35F40274
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:28:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PCee_zIIoTTM for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:28:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 3DD7B4009F
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304084;
 b=UrgM9McQAKxr5XbFQ7JfacrHeTdYF3LtZVjw5oTh/5f1loHztFAvouR1UgAozanKA30+
 eqG21SnN/1n6at0/fRLHH0xzavAxHUXCNpsmRklP8opHUShfmEc9wY4ZdyMqVsurGW5Hu
 BrpSNSQSz/tynn69XV7fR+CtKqKg0URY1soHFZPOAcE6OwhiJMWu2MlyzgthQqxIRBalX
 vZ3W7GJ4b6SXYPcZByWkyC8sBWUCM/fdILR9JGxzbEDZ8V1ScZuAkfc6V+1Tz6x2PHzvD
 n+joge3OQk6qCm3TA0orZBfwD9dT06slhmSdYtGQHs/7WxSdezv0NIuUNFqlLlSVCYw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304084;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=8lFftwLN5jFP0aUqyv5knJnQhOjQSXU4NRdRhCftBZ8=;
 b=KUubDO/ckAzQmcWiswWiWR1LGFCJ2hKGcKXyVcznyOg6141U7X4e7BVIpAchaNuPAoTn
 g5TJc0D2FVHbTFf9iFAxy2mQa4w1/9EgVj3WbQkWRllFOjEE2GSXh7fER5DluYhPxlYqk
 J/zQ/11UM7wb5TEdRcEFlX0k9fph+G2PcCRZC+f27fjm37slv7RZmpwgEDiFYd1hkLq2R
 gppCJ67W1tEKe0W9mhGZri1DM5d6AVA/RbwQuqWswlZDQuNHmxfiSEGOBWLjZSMNbnaWY
 JD+R+E9fc8mYf85FFdqXO/+WGsw5jheTJiLFxyAYl3WVOnPhnFC75Zkylkxn43E0cWA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=LAdUpK9c; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=LAdUpK9c
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3DD7B4009F
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303706;
 bh=8lFftwLN5jFP0aUqyv5knJnQhOjQSXU4NRdRhCftBZ8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=LAdUpK9ctFBoqn4ACTT9F3eKYFUZAAknYo4NQLlOBsj+S7AUI235FwOAPPmbFAqyx
 BfA3e5CJsiVCAA0epNkWJxOWGtCqB2CPJcqN7hswWwakWqfF8RVw7EwztPsFI1/8z+
 ti9G3SVV9jF0VKCkdv7EN8y3rxdvKFi2UAtpYK6Zjkg8w4VU3zNbcvv4/JN2VXhfMI
 lyfTXXAiEunT8ke1oSuVUHQVnrvkAkujih8gylSyC47fL+FzVfaDiThIto2b2IUFgw
 4/q9DM5ZttRXTtXZ83KJ5ieWuCekXv/drABQ/puZCQAixyshtBJNn0E4Y7g1z8AHS4
 mbzxI1vICgojw==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 GKPyEzWBA2gzlQ9Arvy9NPhLTVHgJhau0pn26wkEP2g6aRXds1Wjc1AcZ34w5YSt3K6FKapDTIp
 y5Zrc8rsl10OpJvsf3DvsEADevrKkVlsIzNZ99Ps01gFGAQQ04rcbeAL6/8Nm/LlUgzYlcybMpR
 1osiVkNHdjIYgTlwwU0IcJ+PyJxLvWHBYrF6cHZZkQidtC/MiUR2dlsATt2py+svRN9kMdVAQAP
 1APyQtraZzRt81AZboo0gWPD6xKs+lJ0oR+Jct4cDgadxd+A7NR4+t++ORxrQftNoahKsaLJtYb
 HsZyDhfZVM2Gr79iOba6qjq7c1J0L8QBWZ41sQVrERGkJ6rbkfQRBLDPUWBoehJLZLOliGXOSu5
 luspAmmWbF7okcMK3WE6XDkpN47d+knna02gLSefuTfA3mZzneKJttevIt1h79x3ppfcyXbH7lt
 QV2s1kB+5u+iM/1cQ7oByT3fHvmdZN5YTZSlL+dAj5qtZX0paZNDgZXieO0k8bMW5GL6f9tSuZX
 Bw9Q1/g9JwHh5b45vnr7NkVTZeYTE09m3voww/1MoVDYdJnZdLRZZYwxh4sysI1KYdRSkL7YiB0
 +Zzg7ouqcdgT7w06abf7i5plf9EyoIoOW775asquRrxWwQ0=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 83F9DA4C5378;
 Tue,  6 Oct 2026 18:21:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uh-000000000ir-1D9c;
 Tue, 06 Oct 2026 16:21:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:19:51 +0200
Message-ID: <20261006162106.3439373-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v8 10/84] package/boost: thread needs more
 dependencies
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Michael Nosthoff <buildroot@heine.tech>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 406a5b4d6c..70e99aef11 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -370,13 +370,18 @@ config BR2_PACKAGE_BOOST_TEST
 
 config BR2_PACKAGE_BOOST_THREAD
 	bool "boost-thread"
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::current_exception
+	select BR2_PACKAGE_BOOST_ATOMIC
 	select BR2_PACKAGE_BOOST_CHRONO
+	select BR2_PACKAGE_BOOST_CONTAINER
+	select BR2_PACKAGE_BOOST_DATE_TIME
+	select BR2_PACKAGE_BOOST_EXCEPTION
 	help
 	  Portable C++ multi-threading. C++11, C++14.
 
 comment "boost-thread needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 config BR2_PACKAGE_BOOST_TIMER
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
