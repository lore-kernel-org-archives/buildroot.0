Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB2C606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 20:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iERM1VsV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=orEyZGj+
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFA7C60657;
	Sat, 31 Oct 2026 20:19:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tWsW18Jxo2bd; Sat, 31 Oct 2026 20:19:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D33A360639
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793477971;
	b=T2dkyuJgMMjypgjE28OsEpng6AMQRx9HHQq5zfpUbM0dhUztQ30kxcxdUx+8ThFh+XR3
	 SoSAutivCFB4RcP72l8vWA6DYEIl227LNKrQV6JWLwpvtD7nSTSvwPSvnbPKLO14ScpEB
	 4vMXNJBJYLxODNwMNgMYSkiAVZsH5kG2bXXfgbaUZ2SD7RV+eWJuuGp83sZzCMGxT/UlB
	 Yo3JuYMnFAmyYPFbevmXckSEslDpHrrMApVGUi+QcbBKHIuWgPb51dAYdNmMxYfYXId5/
	 /u1SLfN4hG5d3gJeBJNr2zeSh29tWsvOl1LkK9DBrQumhxfqsXN5zDKU8pIHI5n6Npg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793477971;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=P1gcavb9wXeQeO1GYz3WK918EgAstLn/M5sJXD1IVSs=;
	b=few21YyCn8zkZBKD3+gwx1TpKzem7dj3lLS/etWSeJQRVRO1K/m0P/9h93HEr62ZmIS9
	 QH5ktnO8T+zUpqECkwWopmtIpKwYLKiVumQXUkI+1DAjbL/G3r7X2NiyxlYpdnDh/8ERZ
	 H1ZKX1oD0mY0yEfS/UZ2zmqBOnLEH9J7vu/zgipOAfv2aNW2Qtwhl+KsZFW5/7KF6rJWN
	 8onwRdzMyYELk07ZI9hPHKK3sTGWPwChq4VE8jhLTzah3tFiDEalpIipYyL6zlWHvHajy
	 P/FdhvgMA/eSP39jzAaujqhg/CaZ1UWtBpWUoN83D4hGv5u5lgPtfBrkh8MTj00iHkA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793477970;
	bh=P1gcavb9wXeQeO1GYz3WK918EgAstLn/M5sJXD1IVSs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=iERM1VsVY/WeuaoYWNzyAMC4DQ70tsMdF6h9JCAF7ejixb65zKlaSOx5dRCCwgU/x
	 EwPbWMYYRlWv0rgJmCu76Uiq63upG2y9i0HCBW5c0DZlXsFwP6kJB0fwDVWWcetXu6
	 FmUhTYfq3oIEzNAOPPQaOTiVr3v74dBA122hh6N2ZpNTHtT4k3VX9nSa3WDcoZDtX2
	 IqP6UqkrNgwIuNGYVt626J5I5L8aX4b5COaydNEBqqaWDwHW8P5RI+kCbpQNxWyamo
	 INzeZ3XLhxfW0MKd/BaqBwcKp/KU+ibu8FvfoyTYI7YuSBdCWb1g8NTdQBO+Ed2P2w
	 51uN0G/oCTdjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D33A360639;
	Sat, 31 Oct 2026 20:19:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E223411
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 20:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70317401EC
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 20:19:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UtzyAwIQM0ZJ for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 20:19:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6A31540070
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::35"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793477966;
 b=TlL6P4/16H13SOOnrNFVvUK0owxo+GpvAm1oj9aPVb4/rBMpLo8zBbtLRvxvkOQz3krz
 n4hWmrjUkkft3GPXC/xDIOqbQfgnKWD6sjt4eEhkQ73ixNduOm+CCddweJjhrzm9hXVzu
 lpMDK+WZtnAEBvmZ+xttMW1jwCTaKmstTzfr6/ue5pSeAI1ZQSLhpach9Jwt+2FjFUUcq
 rqj4l6S8NT6gvut8RtjtFgSTC7o8KcqfIunk2Y5e43lMCjDiyP7IPFZZELtwL/W5dG14Y
 MjSugdc63DTYgzLb7LuFS56IMWH6CTYfc+050gEHWHMR8NXL2YQrh5YBZdhNRoYbIzQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793477966;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=9DQtOOFDb+2PVxaMS+N+KDt+UksFF61GCxma/f4enPg=;
 b=T7LdLt6ytXDAUbo1p8d6/63SKxepvDO9P7OQvXzIXhf/LSTM2mwJjIqkI4dx58t12pnq
 l+v0oEF4kjDit3ymFG4/quf1fwz0lAi8ja5vs/yOFMOvW1GMiyQy4NFYKL77M7MStUPkP
 fO451oABS4JVaTElS+Fx/+lniUPMIAjKxyKxZDDYwz0QAOUZVH9zkxdQVpHpe/rM/7p+m
 /w7IV4VfaE5yWuPYMV8VURyBrH9P3G/kd7L9wBylHSeg542LRLQbvGfZLQnvS4cojYD99
 q+wrs0AbwPjWhQUiSZ/yWz+vCrtLO2BJ/uTvaIjA2zZ6p+UNswnF9JCveCpxsbE5aCQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=orEyZGj+; 
 arc=none smtp.remote-ip="2001:4860:4864:20::35"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::35; helo=mail-oa1-x35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=orEyZGj+
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A31540070
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 20:19:25 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-4911df1e196so1166651fac.1
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 13:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793477965; x=1794082765; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=9DQtOOFDb+2PVxaMS+N+KDt+UksFF61GCxma/f4enPg=;
 b=orEyZGj+pUUQDvA0zR1rVgkMN/XKuepUwS9yJfii1HJNZ/sI23tRqQ9+imViIxuDTf
 NTVBPz3N6FfHfl1EE2RUi5zlM5ezrvwUh08Kb3X+W7ls4HDr9yY9HO1C8GnjYoFNTWFN
 BcmYX2kteGzL4ojpFl4JL4lOjHOUG9UN7NQOVvrtOgTFURIBFkx8xrI57MRF04pYk5SI
 YLlRZyZv3PCCl6UhaVjX4DvBZGsYSxJwQepg7pEWKjCHOTbxcYvHudaSOxHbT/DPmXVU
 Qr0K1mdR8+wTzJxmGyHCzAqaSTslEY61E1N1fsQtS666BpOhniP47KZac7MalGOxUcrk
 hY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793477965; x=1794082765;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9DQtOOFDb+2PVxaMS+N+KDt+UksFF61GCxma/f4enPg=;
 b=xfwxRAJx7XT68iQIh8dQHZ18BGIujZHNJS+bNKZO0tcaFh+r6JAQ9WO6iWPmXhvWoa
 BPW3nEJuI0AlAIoe5Rj/QkcgaAKWqonEuUpCDALM3PgJdmEnpJXiMtroKyBM7lhL8L9k
 yhExpoYqSYAzWxm5n97ChpKvlPhBVXvrGFTk9mRcvmG7UmbSYGRk/ZoJlhJ6gHq+9Q5f
 mqS6Q64vURdUhvvSWyhYS+INC55xv/GOVgyqhKiJ0kiIkF93mEhmhK3oVvNGcDKU8jum
 YDbbVm9Ol5Z5iRXAueK2g3mNfBPboQYu+k+3mZZcmvLYXiRIXO/pGaAGCmsnEJw50x2e
 yRGQ==
X-Gm-Message-State: AFq9FYJWy+mFwEIJipL6AOPXs80aGyhN7+T18jkhpCrOXfUNrtFknkGz
 Zm9Y9YwbY0nJLDxCX4nz+w7dPRMfI8KJVIlGpewjW+cnyzZhtSEdcsAtdA14wg==
X-Gm-Gg: AYBFou1a9SJGBMMHhQPiwFE5Z939NNQ2HCY+PDRUbya5JHHNpBrsXx1f8YX78CDQVx4
 lhaw1wUQ4CvHQ+xtEPDxEnH4Q/2BLSu5nfM4uIC5RI/6PzkF2gvXsg3FL8MUY2b5WQy2QxUDAlm
 35Akus09LJQYpVHPLdD6VInbCmq7+OlOefE4se+3Lt7uEofHMc6+RvC9MJSQpIzZ0GlGWszqgcw
 dK72O0KOx/Fk+aYmXgq+XEm3DJCWOr2hIJhyqcNlh7QmASxiV9JSaZ8ErO39xjCqrSyy7MGtT8f
 Xi4WRWBcmwUHxJ+Pnr8kptokNp00KlMJcNzSHbNtOkjYmO+RW8zPRY+unf9lEMv5CV/D39T5NnK
 vtO0D+cSJMv8t1g5VizpNMfunnoFJqOgymxGC1Ker4BmeatP/bxFf8Rd+L307Ki3CDCurgm45+K
 HXrJso5uKSLWvEnV7hILzZBXXmB37zvg17uY0nRBd0IoufXhCUYGwsXwvi6zV7RRE6StjNaMu9x
 mGbi1cTRKspgSZNdUZ6TNqOWqLD6OLHW+qVolCczHGRvEreqleWrbbrfIsOEQtJyQw0IhgC2cz4
 RlVCSmBrPO6Gi3gUqjwZ8BNI7pIviDWGeTX1kKV7q7rkNrNLKAnw3+N5p2m3120tWECfFpNTybv
 8kBOvntQ8S7GO/meAZtpk8Zl2qtIr2yY5iEv0AFRdyhXPhRmKEtfTDzQW89c37ZuMexAIfWVzPH
 wsDdEXL09318OhaFFsjVpEFMLLJDFmr2Fe5OE3xws6owQEBOfdRW2gL+/y5r6rCSbpH34maYg17
 DWlXIom8TZTOmw5Xft+LNg=
X-Received: by 2002:a05:6871:2b17:b0:4a8:6aa4:5ac7 with SMTP id
 586e51a60fabf-4a90772beecmr4188673fac.45.1793477965000; 
 Sat, 31 Oct 2026 13:19:25 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a9218e97b0sm2998133fac.4.2026.10.31.13.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 13:19:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 14:19:05 -0600
Message-ID: <20261031201918.2850153-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-filelock: bump to version 4.2.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,PDS_BTC_ID,
	SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the host-python-hatch-fancy-pypi-readme build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 8 +++++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index 00df59252a..d24358f7f1 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  1aa877c1879a998b938452a55215b5f8  filelock-4.2.4.tar.gz
-sha256  c6d8663535e1650ee430507b4ffbac7b464dd64b7647ea0112a9f406499d163d  filelock-4.2.4.tar.gz
+md5  932426b5d85aa53ea727cae7238102ae  filelock-4.2.6.tar.gz
+sha256  ee7af8ede36dcaf12e1016d9f7c3a63ecd5497d46f85dab21b8c779b8f944e97  filelock-4.2.6.tar.gz
 # Locally computed sha256 checksums
 sha256  608c89d5060ae9921adccf3236695bc654a9946e12323ef6c021dfa04e294d48  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index b95201a391..69032ceb83 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 4.2.4
+PYTHON_FILELOCK_VERSION = 4.2.6
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/d8/28/3893324bcadf8f89b1616637468d766af3f625008c0735bf704fdfa86617
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/35/6c/730b340182f1fd74d4ef8d3f35431ce84f8f97b1a1f2afd145174b7bb047
 PYTHON_FILELOCK_SETUP_TYPE = hatch
 PYTHON_FILELOCK_LICENSE = MIT
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
-PYTHON_FILELOCK_DEPENDENCIES = host-python-hatch-vcs
+PYTHON_FILELOCK_DEPENDENCIES = \
+	host-python-hatch-fancy-pypi-readme \
+	host-python-hatch-vcs
 
 $(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
