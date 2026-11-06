Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98CF606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pSJg161D;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OGuKXVoA
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF3708140A;
	Fri,  6 Nov 2026 19:16:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 13L0QylJSfvZ; Fri,  6 Nov 2026 19:16:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C441E8130A
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992580;
	b=mte5VmDDSsoBaeErRmJ+VGVCb0fnPYqxNmL3H8G3sxLmRHtDmSGwauMub1uhg+jxg2gQ
	 f+l3aAZ1jNHBQKMm10RQWalp6jMy7kYR1rykUtQleFCEOrZ8C2492pwIJUU13NrYEtzjt
	 hi5ttl8fDBmV4Gyq9CIo0wNLxOKpUYoaK+rAoBsI0kneEHJ4Wzokca7S5Jt5AF8s69Ktc
	 /XbV92BIT7uT5ZyoofW6m1qs13+XzxfupJRtsexJWxH+Mj8VOCNlAEZ35uG29EXTMZcaZ
	 Izn/7cmfgY4zDv0S/sYaQ2bOJq2d8a26wtBBS3YFns4v4Xp9M3j6MIc4MGlrIZB314Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992580;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=CkHiWEajVyXwUTO0+H6sgCcyFHBDtd/7MCvCQgVo+Cg=;
	b=Xsz3HrXuNUhsScOWB6daAtG/D6LkMn7XKvF8QKYC+gsi/IAsvhsdLZRn6feVW5Z9uB7k
	 cFOoBEnJTPJeQHPINZdoLvMmqBXkpO5XrBHnUk4o0SmRe9G6+l+xKFEZpCLUEAluLLHFH
	 BS+zerYW9CBl0ZcgnZSGCZxJzQ1K7K/HbNR20oabkg+rUjymiQT1rX3+4dz+0VnMXqvrz
	 yLrR7Iu+wSR22pHpJKCHy5ls9J43hCPdHE9SkhwASZW0gr2lr6gr2s1F6pSP61rOlsAYh
	 SlLe4D2W8AavXHhywrpkKrQWypoppuzEt5bVgSgntXF58VkEgOxMTM5eQy3uNlwzf+w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992580;
	bh=CkHiWEajVyXwUTO0+H6sgCcyFHBDtd/7MCvCQgVo+Cg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=pSJg161D1GlA1WwCIoqkw5RUwY2hxOzLBV37/fzvprPcWCP3HcK+MyDU5UCGiIkjM
	 bdtIfvcY5+szftniEIxEt34ghn/2Mg742pS3N21KFQgUx4AlJLBVUdHYBgEOIxdImb
	 SKpOf9tCxw3/wVVWNBg3c/s3QVPUtCegTUrWfm+7Qz2FHz1MGKLzDEq1ndNRgg4rlX
	 mrmlBY8PyPA14pn/5xVsxETarZU1gS5ciQZ/elDJ43Xkx8cZzVAa7FxS+7cUHlnCJu
	 fv5hNdgHLhC0Iwt08D3rzDGm1zFwIGvsGDqAeS8hrnWMl710o+ZtAe0sTlTdUmNgGB
	 z7aX2hgOVcSUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C441E8130A;
	Fri,  6 Nov 2026 19:16:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B27454B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96C9B60A41
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V-7BwhSk9NMW for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:16:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 49FC1608D4
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=OGuKXVoA
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49FC1608D4
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:15 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-85ac281604dso593473a34.0
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992574; x=1794597374; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=S93Zdxfu7fMrilBBl46i4CtsvQ0Ia+KLduBe8Is9yK4=;
 b=OGuKXVoAvNc8ob+ZF0rSbsqF4hhhjTYnVC/x2rIJgOQoLBByk+GIZdMUEADkxTH5YB
 iG8pZUXREU6fUVXZ2PfoHKHFrtVHFZ+5/1ko1bPAHO5dY/Td3h/GguvsiA44mYywwRgl
 bls+Ne7Qz8G+pQTcgprCdt1yHwXtkUHPpaxKViBUCx7Yw7G0qVNkVHzkxbjmEnHXfAkS
 oIBGmD6Hf1Y9cjB95JxoeGT+OW1csdW6jaKaIxC5tM2EZbzB/f4rhIzSVRIZ471ASumU
 tvsZ/XAxu//S9dfpCE+1AQZrOBX4UnjiLcBv/HGvwjtDNacCb3VPY+7qAbPuAEXzcLFA
 YJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992574; x=1794597374;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=S93Zdxfu7fMrilBBl46i4CtsvQ0Ia+KLduBe8Is9yK4=;
 b=F6G42eVO0UFaicg7rZT9Tnfe+BMDXE6jnlX6rI68kh2LqXGWPBAA9GXZZIDOmucIir
 b7X99HS0m/ZHcarLOlbj2xh9ccZAmhkjq0QboKNl0Phg5UswKLsHi352WlS1VunAM7rt
 MpyS7BacVrgK788nzpPxiOQCIi75ZX4sBE1NrDS4cY7vcGaNAbe8kwat4KkmcFeV95JJ
 t1UFTcDuLr9Nv4c2B5k3cV6tzvNa7iJKloH0KZUJBQpxhiqHKIHRRty/iapgSAMFyHiv
 neHOjpQqjzTIjOW9UX6skbhHH6GVoC84Oi0cLX6VElmqHC2lXeSSS8keIDH39xrhme+9
 veyA==
X-Gm-Message-State: APuU4Z9wa8IppAgaOtPMtSjSIMPPAXbUL9AAxAweQlAeQ2olBkrSl/yo
 6+di3RqiZtEYviXs+3BKM0UHZq6lpnzqfrW8JSrpXFuSNyXo/UT3SWe7JHwNTw==
X-Gm-Gg: AYBFou0el9f8qvlVtUzd0rjE5FJme83N5XhE4KSyWfgV/PkiOJ2SMR7ZBtUmC0pfHkC
 D6BX5Y4P/AQ52k5ZMrdUTHadZjxJhmttv3ChXTYPqTVg27k6LSIc5hkYlSL5vHamMmBIqAw8ixx
 jIq/nADHDEbFLUQ6FG/UG18egZMPItEKXCZdCROCXJPsX0eZ6NlJq41tUPnmy5bOKKa1mmtT88a
 24yehRYPrp9Js5fgovJMWT7PzqYCxikFUS8no7VtEOWEalJLVWUKLkKjXJseO0XXG+S3zBcSRyU
 F1WaoDR4+tVr5Tn8t9a6Mpms8pv6fF9UIsisyNmwWKpVG5mCljbRbrR08d57lDVuEz3pOagqESz
 nRprrxjLmmFjVdQw5mFoev7WJyaEktg9IibfMz+ljr5nI7dViMAFXXSUcpVQ+mhwWmEq5kM0xKP
 t4W+audk+q7gFv4B/vjS1z9tIEvCyccH01SJxZONYSFjelH78xgtSbn1p77fHGx0bkGgkENOyWL
 DGc+r+5sBJuS3XMmB1xN71814tCL8JWvRHF2PVpR0R+grCOLjsSQVjNb1VXJT9eCqkSnhzuLhPA
 Z2iyVLQC24wmK3m2VtK2zJ6LBxEU1LJTWrpkE+twyOT+04sdJDteAMepYwDPc7bVxzrY44ZrfKO
 wWezJF/pDXlrRwnjaFDCk+vG+WbTzAmyXaPApo2nKy2Vjer0F8yHQD8G1yNZFwgXpotpgN5RnC3
 JKqZr3+hxc93WpLPkYF5E1tXwEtNfl+6kLvmAQBFx/svk6KbWQ3d36c+JHwtvImuw5inpaM9FKf
 Q==
X-Received: by 2002:a05:6830:1cc2:b0:81d:8057:9b7f with SMTP id
 46e09a7af769-85f1d0d9721mr3001941a34.28.1793992573964; 
 Fri, 06 Nov 2026 11:16:13 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:16:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:14:43 -0700
Message-ID: <20261106191536.2120153-17-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-mypy-extensions: bump to version
 1.2.0
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-mypy-extensions/python-mypy-extensions.hash | 4 ++--
 package/python-mypy-extensions/python-mypy-extensions.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mypy-extensions/python-mypy-extensions.hash b/package/python-mypy-extensions/python-mypy-extensions.hash
index 10e7b74a9e..d8d7561171 100644
--- a/package/python-mypy-extensions/python-mypy-extensions.hash
+++ b/package/python-mypy-extensions/python-mypy-extensions.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mypy-extensions/json
-md5  f59bfd7f9dca73f36c8feed12f9e8eba  mypy_extensions-1.1.0.tar.gz
-sha256  52e68efc3284861e772bbcd66823fde5ae21fd2fdb51c62a211403730b916558  mypy_extensions-1.1.0.tar.gz
+md5  25d0c46efc1c271fd976944f6e66a3e2  mypy_extensions-1.2.0.tar.gz
+sha256  c6e275a07f1c2fc096b62940452d0eaa3f3af7de45d704787866240a7c6d5a51  mypy_extensions-1.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a50450da1d53cd777b80ced77c58ff96abe0ccd879706bd142c3ec20e245f0b4  LICENSE
diff --git a/package/python-mypy-extensions/python-mypy-extensions.mk b/package/python-mypy-extensions/python-mypy-extensions.mk
index cf0f7c681c..594037ff68 100644
--- a/package/python-mypy-extensions/python-mypy-extensions.mk
+++ b/package/python-mypy-extensions/python-mypy-extensions.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MYPY_EXTENSIONS_VERSION = 1.1.0
+PYTHON_MYPY_EXTENSIONS_VERSION = 1.2.0
 PYTHON_MYPY_EXTENSIONS_SOURCE = mypy_extensions-$(PYTHON_MYPY_EXTENSIONS_VERSION).tar.gz
-PYTHON_MYPY_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/a2/6e/371856a3fb9d31ca8dac321cda606860fa4548858c0cc45d9d1d4ca2628b
+PYTHON_MYPY_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/d0/6f/43edf3be2748d0e40974a5ee046a8bb4c9961a4bdd3e7d5c6dcbf32d1af6
 PYTHON_MYPY_EXTENSIONS_SETUP_TYPE = flit
 PYTHON_MYPY_EXTENSIONS_LICENSE = MIT
 PYTHON_MYPY_EXTENSIONS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
