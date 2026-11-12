Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E507606A23C
	for <buildroot@archiver.kernel.org>; Thu, 12 Nov 2026 17:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=otJHp48I
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23BFA40D77;
	Thu, 12 Nov 2026 17:37:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kRb6pO8PX5U8; Thu, 12 Nov 2026 17:37:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 59350408CD
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794505046;
	b=Xsb1OvYPSE/cet6yLp0NY6V+39oO9n5QVsLyf3G02Tq3Izh7uAx4tzfYroNAR+oXQcPB
	 iB6M4Ku0BYOkvVwW9H2NNz4aSkoFe7Si7LpvuCItMr92lshjlsiYB9/A3PJnI/eemmfTP
	 YrqQly1lAX6I9kddi92C8fTFe6Q9l8CGwzNbHsQZPTVYNCxtckkpVqBv458stpwItJpPG
	 JNgaa9etSTrIIwWXNvY1K6i5oGI9EEtXzAsOLKAwkku4HIThoZzvVc/15QGEMnZaLrVPk
	 PwjNE3obkJxIbUddyumPs29eMoMRpRSK78MxL9sYji/+Ldpx/AQVqDsbZ5iA8hcoR6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794505046;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RAuCkSOaYLrHeICnlesXFPRMLXDHlWId8mARiYqcocA=;
	b=Hkd7zlA5GGzPp6vqgatD9NavBmpZtFqicLx1+c3dFMV7R+RKF6zkfNkT9BUvYtpE2Od8
	 pZQXI9AenkO50gYgy4+NJgD++EkRqihHyNMtJwlMYI3rYAAiC+4IXekLvBCUoR7QCxLDe
	 2uzWRzyZJV2Ia8dMjEyBEjxNJJ+zeSdBzxb3XD8CldqL4OL8H2Jj0oOR6Nk15ZSBha5+1
	 hZpIZqFuovFYJz4F1dGSp9pq07dATzOyY5EMVJhNqogr2MM2oPsQ/QjCauv+xQXjrw4mD
	 dsduy8McuCv7B9aSvkEoPZc+3t7m9WoV+uDeJ6sTSjMCjMQXA84LfJuyfF3LimShmfg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794505046;
	bh=RAuCkSOaYLrHeICnlesXFPRMLXDHlWId8mARiYqcocA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=otJHp48IDvIqxkLPZXecyMrh6avKdpRppE/sbWEkRMP2VFr2AEWgMNQpISfmL5svC
	 Ok+I/46Hj8sCCWl1r16PhOLl1BIyYOVyIVi0ugIcowBjheUgsG1R8y88LC8SndxTsA
	 6h8c61kSIKiREO1v5l3SoNksj1sMLgNOou1RiR8mGWYHb52VheU3c1rKGocmP5e0No
	 i55h+uF+Q65PLMOGTFp7hIhStqzx7AuBishYQbPuS+3nGk0/Da73z6yMi0viZgVIq6
	 lYXV9oVAjnN0FKDFxUr09Zmm8vRqHFG6sOJrpxcZ6vxvPIbL3SXABLxCjgcMlBx4lQ
	 0HYAIFNBpn5FA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59350408CD;
	Thu, 12 Nov 2026 17:37:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A5BBE1370
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 17:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9703B607F7
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 17:37:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Xroh3SG35nK for <buildroot@buildroot.org>;
 Thu, 12 Nov 2026 17:37:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7F562607E7
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F562607E7
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 17:37:22 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-c3f04e0e65fso687275966b.2
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 09:37:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794505040; x=1795109840;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dloihg6EsZh8xtiAIHTjmnLx/YquU3DRK/VFxvLdbd0=;
 b=HicLj7H7FsVlzrAFYXWhuEHR37uyDKgfqvjtbEua5Br9i/ayYYRq4X9Cy/GCAINfbT
 gWwxz3FdOWUNKGe6O8Io6RFa+i7PZ6nC4cJKZVg/t8Bq9sOK5cE9g5ZUwGR7LGjJKQcM
 fvov5Q22J1dPmqB5oDDvt2nPrVUdMeHFCjyu4tza6QqT5vvJrfzHHiHox088XPU1Jz30
 Y6MrVNG8TWNew0bJGGzymvAqEoY5NVE84VdMvBOj9RjaNHr5LpKSndmH8DnxmB2VeRs2
 qqjMBERw6YDqA4rt5BWp5fG5lIvLFAacn9MGQFAR1IsDjrGcPEFn4x2bcV1CijHm9LV+
 zUkQ==
X-Gm-Message-State: APuU4Z/txEdUZ7N5U0o/gOFFiLGcXv96B6jNn2/+1Y7kb2d8TPDPCX+T
 0wUq/SVEGHBcXxyQ2qMleqLdIojGJ0pOLN2fT6DdH992N9qj6yRmeShYN+wzlg==
X-Gm-Gg: AYBFou3rAcx8iyguQAG3QWnEo/Rnf1tSWDMhFgY8xdq7L5dh28KUeT6VYiYLcyzzU+6
 n7bAonlW6M2JvgvwFXJmNwMKFXGKJRo6fnOqXdwWlx6KZ0F6dupLQudbgMpz/4UrFDn8K/Uz92I
 JeX6htcdsdnwQ8MjpqwZcG3XXfqoZZhOm/5E4pUd0ig4mnpSkiG1V3VMAVpDk8UHGGWVuoETEm9
 WIJA337PC8P5YBw0Y3IhIIyfcUsOUwGINZ165uf3v9aXQvxeQd3jwblkNb9wRBBl/jhAbRPh80X
 0ZYTOACFeFYYOOIhMm/SlVBXpLz5mu4avF8Y2LVNcDw7Rkej3e4E7F7JM/45PGuUNrhO3wFNFtv
 s+lWDXp7rC5vXRkqC9CQCQurH5tinXgFSGkt+2z3Ra4DvhqSq2N8qDGgeAZe1jhPJisY2fjRz1n
 mSREVUxLewbyxGLJSB8Z6EbUFcNjuN/Q0jNppn0Z+kvDMzVakQhabjPULOjAOEIYjEWtocUxJv6
 SVfjgTCHzkAhVESYYGHJarRV0DRqCj6wE4HQDo4L1TuXbVLga6cMYAFl1aiEk2/zU7zEyT5dEHl
 DYJLYBQqmUjoqZpN/gUnPkHXrAXamOoRv/7HeJKucE8cqKtMjP9QrMeLoBcfzgyCy480PCGXEFJ
 u4mtZjXgPBg==
X-Received: by 2002:a17:907:d407:b0:c26:19de:9126 with SMTP id
 a640c23a62f3a-c5066b7ed7emr682078866b.25.1794505040366; 
 Thu, 12 Nov 2026 09:37:20 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c5095b9164bsm1436666b.82.2026.11.12.09.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 09:37:19 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu, 12 Nov 2026 18:37:19 +0100
Message-Id: <20261112173719.4063790-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/systemd: fix build with libressl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since systemd 258, the target build no longer passes -Dopenssl=, so
meson auto-detects OpenSSL. systemd requires openssl >= 3.0.0, which
the openssl.pc from LibreSSL (version 4.x) satisfies, so when libressl
happens to be built before systemd, openssl support gets enabled and
the build fails on OpenSSL 3 only headers:

  Run-time dependency openssl found: YES 4.3.4
  ...
  ../src/shared/crypto-util.h:39:12: fatal error: openssl/core_names.h: No such file or directory

Explicitly enable openssl support only when libopenssl is the selected
provider and disable it otherwise, as is already done for the
dns-over-tls option. As systemd-importd requires openssl support, make
it select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL like homed, repart and
sysupdate already do.

This issue has been present since commit c38d7326e093 ("package/systemd:
bump to 258.3"), which dropped -Dopenssl=enabled/disabled from the
target configure options together with the gnutls support, and also
switched importd from libgcrypt to openssl without forcing libopenssl.
It therefore affects 2026.02 and later, including 2026.02.x.

Fixes:
https://autobuild.buildroot.org/results/a37f44f3df16d4f49297b2a24bad20b0ad603ef1

Fixes: c38d7326e093f45252c01e241d0faf6b04023e02 ("package/systemd: bump to 258.3")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/systemd/Config.in  | 1 +
 package/systemd/systemd.mk | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 7fd05be41b..59257bbb41 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -286,6 +286,7 @@ config BR2_PACKAGE_SYSTEMD_IMPORTD
 	bool "enable import daemon"
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	select BR2_PACKAGE_XZ
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b162b1f948..2d41df7bc3 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -602,11 +602,13 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 SYSTEMD_CONF_OPTS += \
+	-Dopenssl=enabled \
 	-Ddns-over-tls=openssl \
 	-Ddefault-dns-over-tls=opportunistic
 SYSTEMD_DEPENDENCIES += openssl
 else
 SYSTEMD_CONF_OPTS += \
+	-Dopenssl=disabled \
 	-Ddns-over-tls=false \
 	-Ddefault-dns-over-tls=no
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
