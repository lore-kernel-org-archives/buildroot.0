Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF34606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OVdNsr45
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B764E81421;
	Fri,  6 Nov 2026 16:08:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rj_BffQNekCZ; Fri,  6 Nov 2026 16:08:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C821B8144C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981315;
	b=U5IMWEqohR3FeJim20I0zcE53lWwrqD5fofiI07z5wqSzpi1NjqwiVrujGRtuDEZfYfp
	 OiL94fmj376SDn8V5YGS84AiJwtv4AIfG5Rb2OS0ehtMqoNuCcqJOO1OBe+9/sGnW6GS/
	 mevgtpU2Zef97VprapDrNVmZMG4YcP0g8AN+ujQgtwvH+1bHJXHn5ZR/QlKtvykWCJ5vg
	 CBjb/SJSb33aAfo4wQrTy2KZZcicx7jPZDR9Xt2gVQHKDMxGve3R6XnXZ1FReJ5rO6II0
	 qR6Tqh1/c0vrKY6kgFZRCBd1JLpVbK3Kkb2ElhbT2rsbRXuH/QTk42Rw1jNzBJa7voQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981315;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=ZggXSoFt35oK5fUmvcnyh6AALuY5QHqqc6rR/ep4WnE=;
	b=I5+oXjZiY2JaRWPUPFdQKh/j0Bw0SRHWL2HhnVLTGCaRy4Ds+aCgYdCq1j2qhk9M5tXV
	 +4Xq0K9bEv9JEGIttv5URc5SFyGJe0O6OgpuHuab36BznCXE7/DpwkovfHO4PSn+l8IuM
	 jeBfs975U09uUXHp59G0p0Ts89qdtMeOhvO596+cc1dYBiDq52PahvcEctNCQS14jYD6A
	 JuHm8jnSyAuKJH3Ccu7A3AfsjYQBhC/CVXL9ohNIm9at1i67xTmkcrUniUKj8MdhklQRh
	 4Gtz2o2jWR2sdF+/2qbTuS8fOq0irX5BY+kq6QFsZLgLjhlI73MEhVtSfwESzi0DuQw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981315;
	bh=ZggXSoFt35oK5fUmvcnyh6AALuY5QHqqc6rR/ep4WnE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OVdNsr45qocJJ0B6wWdNyyaIz0PDvTYyT7nlMisDkS1RKN/VV6Jr8bsy5qT+ZamKj
	 MX+JfgtDcuUgdDhT6h9ysh9yZeohzWNyCPGe4adiatr3w98vOmrfkl1Ev1ZIM8SYp2
	 VlXcT6vf0B3T/1MK2DX9WbiYcBqID/TVOgWFf/locwYyiyRmhdvAa/AEhEuxnpH1hU
	 Y1WkxUHu2S1Z5ct/5Yf0+s1YSnB0Uzc6iPS24JqTdkDu8VWE4bb9w7mQE6+YgdaOmp
	 gIHut5Sg9L+HlfCCbYJZdKWh3SyLSxeu2dxyIInI3XWTatkUukq8oAGF3puR681GBx
	 xNYHQDz0ETfuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C821B8144C;
	Fri,  6 Nov 2026 16:08:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 128D02E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FFF5812BA
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kqQ_tfoQzJ3g for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 35D478129F
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35D478129F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 540539E09B; Fri,  6 Nov 2026 16:06:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:57 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 450c3ee6f7bd30af5cc857d8232c8ed47ba6b5da
X-Git-Newrev: 16fa93eced18c890bd8840bc4752d2646d493a6b
X-Patchwork-Hint: ignore
Message-Id: <20261106160647.540539E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/drogon: fix
 optional TLS dependency
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
Content-Type: multipart/mixed; boundary="===============8709914594485721195=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8709914594485721195==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/16fa93eced18c890bd8840bc4752d2646d493a6b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The trantor library bundled in drogon looks for a TLS library at
configure time, and uses OpenSSL or Botan if it finds one. Since
drogon.mk does not declare any dependency on them, TLS support ends up
depending on whether OpenSSL or Botan happens to be built before
drogon.

Select the TLS library explicitly, following the same order as trantor,
so that OpenSSL is preferred over Botan.

host-drogon only provides drogon_ctl, which does not need TLS, so
disable it there to avoid picking up the TLS libraries of the build
machine.

Fixes: d38b4915e9437c5492836914c0a0fff12b4f1031 ("package/drogon: new package")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1cfdb4efd539ad5917bc43ac806a95687e7f4b6b)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/drogon/drogon.mk | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/drogon/drogon.mk b/package/drogon/drogon.mk
index 73388ea92c..42ae64d4cf 100644
--- a/package/drogon/drogon.mk
+++ b/package/drogon/drogon.mk
@@ -21,7 +21,8 @@ DROGON_CONF_OPTS = \
 HOST_DROGON_CONF_OPTS = \
 	-DBUILD_CTL=ON \
 	-DBUILD_EXAMPLES=OFF \
-	-DBUILD_TESTS=OFF
+	-DBUILD_TESTS=OFF \
+	-DTRANTOR_USE_TLS=none
 
 ifeq ($(BR2_PACKAGE_DROGON_BROTLI),y)
 DROGON_DEPENDENCIES += brotli
@@ -57,6 +58,16 @@ else
 DROGON_CONF_OPTS += -DBUILD_ORM=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+DROGON_DEPENDENCIES += openssl
+DROGON_CONF_OPTS += -DTRANTOR_USE_TLS=openssl
+else ifeq ($(BR2_PACKAGE_BOTAN),y)
+DROGON_DEPENDENCIES += botan
+DROGON_CONF_OPTS += -DTRANTOR_USE_TLS=botan
+else
+DROGON_CONF_OPTS += -DTRANTOR_USE_TLS=none
+endif
+
 ifeq ($(BR2_PACKAGE_DROGON_YAML_CONFIG),y)
 DROGON_DEPENDENCIES += yaml-cpp
 DROGON_CONF_OPTS += -DBUILD_YAML_CONFIG=ON

--===============8709914594485721195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8709914594485721195==--
