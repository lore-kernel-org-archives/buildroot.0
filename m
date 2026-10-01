Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941BCCA5FCB
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 12:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45BF08132C;
	Thu,  1 Oct 2026 12:56:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YEGBG-ACYvDR; Thu,  1 Oct 2026 12:56:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7068E81318
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790859394;
	b=X2ianVCsI/d4lBLlRVcrFW3fGD9DjoC+ZQlz+99e+BmCd663TvKLPQ82aZprmZA3dHqJ
	 IFCmUrluj4RYpjvilLiQ6AtZcheL2jQP5X5ZhEZSllcePK6+B7K3UfX+QVmmxY4KXi8qt
	 OkzSYmvPacGL2tU5mwpHqTj6ZJ/TVauWdiZbFRwDBefio+guHvNNrBxdaVOmIlKbWZg7f
	 Qe7Vy+ZFZXVRxSrT8GqakVS2i8+iGy40cEdr6SZMUek+fzdhOO6/9m/LIifGGdffVvnE+
	 SBf233glS+C+PTp48oVjMgu6S0iXRjhLopl5BXrW00VK4NnnyJ/AM2U0y6Xf+SJAQdQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790859394;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=Lvry0RVJaPgdWNJWvtPJys3JSzwvUFfu12tT9rwtw2w=;
	b=re1LUMZgjOPP87FS+SETWGfzf7eWSO1KA6U9FMUpfDxYpQWwoTQbYjD0VA7Mbf3wdUbg
	 lJpvLK1kPVFOsIBYnvOglCRPtmo232CjCVwApzPEVE/61V1SskFxFmOWWOs+C2nweBmFp
	 dD07G4NWj9hdWnT85NJP8y6Gu7siUHYNUAk4QuRTICSjKz76GpgwDT79FR1HMkY791XjK
	 AA+qWRcubyQkYSYek0jfeVaYvSGLYG5oyxjl3DcjGJXugDz0rNlTl4Fsa1T3LeSAok1lC
	 gNqmbnJ/rbh+F6N4C+1ozA/WXAWSyLNURRnOYQPwYVve5zAcNGDwKZ8vyIoomx6ht7A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790859394;
	bh=Lvry0RVJaPgdWNJWvtPJys3JSzwvUFfu12tT9rwtw2w=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=q1+32eGfoW5UQVkDTwyrOKqCMeHFnCt15ArneHgRHMB+AoNSDqXn4aX5zHkyJQ9BB
	 bJTqQmlmTT9zpqRqbQ+NLKxrQDGoMoOW6AZ1rMNnGjsgeyliQssRLQRWVLG3wIRmnd
	 up9ZT46e/ef1k8Da00aMTfY7NqvHRH4PjCEdJys6EGVsXuRKdGfL5QaA6nw7LbvhXI
	 R72fCB7I2R1gW6KokW0xXCoF9f5zf6iG2A4Yq0llBLbbcQ9ro5fuDBTXdJh7oyT0Vm
	 icvlh8NQuszIiK1JN1nesuwfeE8ABzHcIFdr2+1otPZskBFyCdb4n3ITmROXiNFwSQ
	 5QI3hAHx+VpWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7068E81318;
	Thu,  1 Oct 2026 12:56:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 49B80263
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 12:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EF7B60C2A
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 12:56:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6hEXU0ZEQVTp for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 12:56:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D432360C29
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790859390;
 b=X2YH0GtmMUs/jCo4pw/1CVGvTAFRESXHuDBass4g3JA9Y49m5O/Tdn+e1y6+k57J2enP
 kf9SoGdriREpKBDJe34BSnU2oAniENxK8blSL3lrn12JY5fZ0d3Zs5mXXBjNDkYbexq3t
 S2dbC2ZF5tbro6G62VsuOiXwFTIl5O6P+5QBSttoMVyOiazV7iXloHTuvnYRespFFLbAh
 fDXKPvxNQFT2oMGlBOyKVcQdBRFOEDjY/qUdHzinlld/ZOq46JhTo8FLq6pIbEnAxaHLP
 Qvw1OTw9cSBCgPbrJjWeFqhFPGFcdqnUIF+rbhgPIKkEGAE/Jy2W5/HaOH2DBkcyR5A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790859390;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=xKI/ITBNw+LCqa5TJ9Y9MCdS/ZrNGpyMZamxXMwmQT4=;
 b=Q8Gdq34z3cIXgXPh2efRlVa26P/Qilyq0S3URvVJJkXfGA7jYTWWk4lztC4dk7jO2tY6
 aJk9Pz5r7U81YXbLS50QjVAaAShyHe1Y/uqi2mA6vDJH9l2hcSjqCpNSNiDa0sNRdb92e
 uMuTzpansXEAZX2Hoi43UdG5OrlBhARZYkZn77bC1aYN8tRW9AaK6DQzj05GOj48FWDyz
 YpVuU7XEWZY7Dp/AhAiutbIAXNRvm3BIsXT16WwhAjvpVGt7FSCFf89SZbS2+tub22QKM
 dyuaYM0FLkOmoNqzlwEGv2Hx8CJDBXwunWvl/AyuLU7CpdbuVbr5/UV4m6rxu/0tnQg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=heine.tech; 
 dkim=pass header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=URUqYNXL; 
 arc=none smtp.remote-ip=195.201.24.99
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D432360C29
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 12:56:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4300A1814C0; Thu, 01 Oct 2026 14:56:27 +0200 (CEST)
To: buildroot@buildroot.org
Date: Thu,  1 Oct 2026 14:56:06 +0200
Message-ID: <20261001125613.2347873-4-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001125613.2347873-1-buildroot@heine.tech>
References: <20261001125613.2347873-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 4/4] package/sqlitecpp: bump to version 3.4.0
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- licenses hash changed due to updated year

changelog:
https://github.com/SRombauts/SQLiteCpp/releases/tag/3.4.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

---

Pipeline with br-test-pkg and runtime test:
https://gitlab.com/heinemml/buildroot/-/pipelines/2901349165

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/sqlitecpp/sqlitecpp.hash | 4 ++--
 package/sqlitecpp/sqlitecpp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlitecpp/sqlitecpp.hash b/package/sqlitecpp/sqlitecpp.hash
index 960d9bfb21..c9de5048e5 100644
--- a/package/sqlitecpp/sqlitecpp.hash
+++ b/package/sqlitecpp/sqlitecpp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  33bd4372d83bc43117928ee842be64d05e7807f511b5195f85d30015cad9cac6  sqlitecpp-3.3.3.tar.gz
-sha256  a16149966042207bfc968dd1081403d43a37a6264fe31c7b1a7960dbb0e716b9  LICENSE.txt
+sha256  9910ad8bc0a821856bd6d9fa7cb0b457883108f2b803700256b451077ed6dc05  sqlitecpp-3.4.0.tar.gz
+sha256  00f43691f376cc7abdab1f9d72ba9d1a92846b481d2df5ffa1c345108b28048c  LICENSE.txt
diff --git a/package/sqlitecpp/sqlitecpp.mk b/package/sqlitecpp/sqlitecpp.mk
index 418860fc6d..9c136ed69e 100644
--- a/package/sqlitecpp/sqlitecpp.mk
+++ b/package/sqlitecpp/sqlitecpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITECPP_VERSION = 3.3.3
+SQLITECPP_VERSION = 3.4.0
 SQLITECPP_SITE = $(call github,SRombauts,SQLiteCpp,$(SQLITECPP_VERSION))
 SQLITECPP_LICENSE = MIT
 SQLITECPP_LICENSE_FILES = LICENSE.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
