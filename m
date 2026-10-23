Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29387606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 07:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=i/cgdYmV
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 008D580DB0;
	Fri, 23 Oct 2026 07:44:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ngnY_LIeVWji; Fri, 23 Oct 2026 07:44:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E715080E04
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792741479;
	b=kli3vkObhsEawBsVFE9hfT1LmvIFvqg+g3sItQxmyURQnMV5KbI0/GH1g8jwLPnTliTL
	 FS99PaUwXGg2aWfHgV0SxbrIbW0DwcO9oZH26a7ugzx13LImUZu4eMnJisKV/LRw/KiLn
	 r+jL+LpWvC09YQuu4wIDRgKTGfiENXH5c/z0k1PBpVhmxi4sQnUvkn4wci3ENaT2i9KcT
	 oKCW3Hy1bHyQHrlLF3iLuH/cw79LZIpW2oDVx6TU56IMalZK7/Uj+rfJ2q/NpflS9ai9V
	 zudpyEHTbZzq/9pzQYaGv1UCnYkfybm6jqt7Y5ZI7ZYwt7djvpHYAyEtNsMsnH93CtA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792741479;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=5KfRRGsdI24rFjiCDqkB0cVzACRCbXSoO5lo5h1rvCQ=;
	b=ns8Y19IdbVV7mHESaqWOWoDbqEpkRQLuzho+E6yBjPEDj3wi4fs2dGFN0HIwxQ5zc80z
	 /MmDMR1bi4BUwBaNApTZShksUo+QZOdKitdKGVZyHfnW1h9rdgj6jb+0eJRwJGYntrAke
	 r24NHmA8yuO6HMBStBaFCo7qRN+NMvV3wEoBjBjAGgNM3BJd8KMaaeHGvHGojtQTqBy22
	 w/NdLX+IDfNMs197TmdTaYIoyleZJWOs9VbQCB70Q2O5ynFgytVTtWHZ1HeveUm7+PtrJ
	 H1SqIhxvjKZvAoW02FmdUn69yrQP0alXBRXcSVz3sJ/ppJ/HBBuxtk2S8e/E+d+0gCQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792741479;
	bh=5KfRRGsdI24rFjiCDqkB0cVzACRCbXSoO5lo5h1rvCQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=i/cgdYmVxzTWt2ojR/wU1Sv2Lys8VcdMKya21YZoxyTF19yB/8Rsi8XKQZtX16n24
	 OSn7ksBXHk5ErcwK1SaEPw94XPcSeP/LRN7q1rmYWrBc8A5dcA26yjOeC+wsRCFA8a
	 lY62AM4sI7d2cDA8IAFgnP2r3O4wvGvteW9tSDs1BZJlmsp+snMDPeO8Ipe4cfFWdC
	 PlAo8xIG0n8OgsI4c78+/7abloC3H4GMtQnsqMgG0vHwpIASQHWGCvctHYwrL8nGkH
	 1ok9SYxVqsJB/uQh9eUvdK0okGhnBX5DozUH1ge1nlT3uMOwvrO2ANV06tUonob4qd
	 FOah2TgmOlXqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E715080E04;
	Fri, 23 Oct 2026 07:44:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B71B356
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0D0F40782
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:44:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jo1BIcWgotQc for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 07:44:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org ABF6140820
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792741477;
 b=NCFWs34gO+V9Vp/FIeQ6zhNgsG9YrJzHx5QWZ88DHqr1LiAcLonkrAkDvWfzwRhEY9Z+
 59ahhCTv16T9g2Vcoc3jvPgZMnB3Ce/LtL15yKN+y9hlVn/wkSyILUjKdIH3sePFYAdIu
 Nn1vvLaeOHP7/Ktdd38WIMCwqqxkz3lndmpTSYgAmU0OOQPmOLP++dXHpOfwjzNrvvaZF
 7hoCe7FthWIGeLZSwA+LJ5GaTY7F2QQjhU117ZAnXO7YFM29O879XgFLlT3MPFqa1AS1U
 uQBsbtLgHpnE27KgMZEslRaBlgMAzkIWhHWEvIz3q4BkATRlUSxRqchnPM30y7+Xw0A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792741477;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=2bRaEa/xfh3ajIqFigdry9U3uli4mH5QKidRtZoTZk8=;
 b=eCXa/DGocrtuGS8h078y1V/dzk6UyMP1A96GeletmAgzv6jmKlUtw3vrKyM8EmcxehHC
 xYQ+ahpWbhRRGyYUizJi9sX8iCOwm33sLv+G2OiP3TTbvLQiohBDqCdJnt8WvfuoO/Roi
 xJ9I9SZgonnkEkhgpGIItax0vd8+L0+CZFrZGWY466aGtUBjKgbg4BsuAwq5xgqcd8KUn
 e1OftQ2MmLjyRQXG9pDeoDDArHmcV4mlEP2RPgY7k1ca+u2LokLnYEmBiiv4Y4P0CltZV
 QH/Rtws0aI/95mKeE7gqNUsdm9UkwDOBn+GXg1BDz6EA2+UkuDDb7quCum7uovX1CLg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=TuwH8R5u; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::636"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABF6140820
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:44:36 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-c2afa22e1dcso81483966b.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 00:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792741474; x=1793346274;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2bRaEa/xfh3ajIqFigdry9U3uli4mH5QKidRtZoTZk8=;
 b=FO8EZ/UqyMTYb4bp3maLx8R3o+oXbzioOoNuf4DppdQE1nSpeCMu/LKiXioHRu+4w6
 1o7F/ZhwcLGp4OQJ+DT3ajpdQ1mhdyAO+t4DgYpBabHkqOmewxt+U1zGITwAuYmlU2zz
 ikVkpYU0LHpA/XbDykCr3Ys7ST/XFNv4rWHU8R30KVwIhylPMCxTeL9J5ml6vuPT2GnG
 x9XrApIjrYfXivUam6XPbHf263tL7Tf7Ibtw1Q75JOgUqyw0fSlgl+xNZVljblrrKIBT
 3ND9+c2MxswU4aZ/uVv6QTA88cWjdElwufgsoSs9wjCToPdDXwYmYCNPim4oOe3S7yGX
 Zzvg==
X-Gm-Message-State: AFq9FYI9725/WOFg2N0H/dmSJS04AlCjc947YWVVbaKAPrkijrJEkWIY
 vznnpy1ECKe13PV0fZx2G4OOZ7fqo9zmXH99jIBRpSS82lXse9XijqcM1J1rzg==
X-Gm-Gg: AYBFou35oTtfg434Z+nOfZzwDDTAq4EhClN2gzJqlPykM1sZLss2q3Bne4HUsIT54F5
 JqB5zJRKt9Rr7HjMa4VxS9DyfBuYOU8eSecgMH2yXcHXmc1inFRjIXFwuXTqhqNkxmqFI6VV+3Z
 Z+R1rYT5FZ5cPhSO4DM6tJvMAYFR4d1s0joxP55SNl9lZi5gsTv1lwVajeGxBBKHjo0HaQUONx5
 00/1FMwjAdVjZPZNsGmrYUKoaoquVNAHztCIuIPISde6//nMQkwOGDeB1TfZGx++WejWqdEHObq
 tCE0W+KP+dhKiCO3Ho+atHb1pax42bs5R1FWYRfeVQPsOdLtKnYwjMdMxc+IhOct2DTPtQdkyNi
 PpKfQ60KeC6XRBPHzDFuvpytMkT5iowSMKJIy2VNjGlywWvlKA9tjyK8rd9J+05h3UuIJBlopWd
 D9nIpscikJGqSdXmHlG0NTf3mt4tJIIEh5g572vkpUQ4awQSLTzIBN29/kX1PB+bUCP8xt47TD5
 Tz1m+EJqZeBA8fSR8udOut+m91EQB4LM79t4TkkoDTYazd1lAH2Fk04wUGLFLhiReDdpYtEBya+
 CiJn4fGQ40ltp1+iQxKl+TapNSAG5v1dFgU=
X-Received: by 2002:a17:907:6096:b0:c3f:e414:d35a with SMTP id
 a640c23a62f3a-c46a90f499bmr201018666b.26.1792741473934; 
 Fri, 23 Oct 2026 00:44:33 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46a5c4d54dsm71846766b.24.2026.10.23.00.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 00:44:33 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 09:44:32 +0200
Message-Id: <20261023074432.947659-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-remi: fix build when
 setuptools_scm is installed
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

python-remi fails to build when host-python-setuptools-scm has been
built before it:

  File ".../setuptools_scm/_integration/setuptools.py", line 174, in get_keyword_overrides
    assert isinstance(value, dict), "version_keyword expects a dict or True"
  AssertionError: version_keyword expects a dict or True

remi's setup.py first calls setup() with setup_requires=['setuptools_scm'].
With a PEP 517 build, setuptools' build_meta backend always raises
SetupRequirementsError for it, so the bare except fallback is always
used, which calls setup() again with use_scm_version=False. If
setuptools_scm is installed, its use_scm_version keyword handler still
runs, and since setuptools_scm 8.0 it rejects False.

Add a patch, submitted upstream, that removes the use_scm_version
keyword in the fallback instead, so the static version is used whether
setuptools_scm is installed or not.

This issue has been present since commit 8937db8dd595
("package/pkg-python.mk: migrate setuptools to pep517"): before it,
setup.py was run directly and the first setup() call succeeded when
setuptools_scm was installed. Combined with setuptools_scm >= 8.0
(bumped in 2024.02), it therefore affects 2024.05 and later, including
all maintained branches.

Fixes:
https://autobuild.buildroot.org/results/cf1985c008c0af6a0a2dc08f98ae426b3b17874b

Fixes: 8937db8dd595e0988751e5dbb568e870b07b39cc ("package/pkg-python.mk: migrate setuptools to pep517")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...drop-use_scm_version-in-the-fallback.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/python-remi/0001-setup.py-drop-use_scm_version-in-the-fallback.patch

diff --git a/package/python-remi/0001-setup.py-drop-use_scm_version-in-the-fallback.patch b/package/python-remi/0001-setup.py-drop-use_scm_version-in-the-fallback.patch
new file mode 100644
index 0000000000..67190a4519
--- /dev/null
+++ b/package/python-remi/0001-setup.py-drop-use_scm_version-in-the-fallback.patch
@@ -0,0 +1,43 @@
+From c653ab24e36ef6c4190e70e064e8102401247428 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Fri, 23 Oct 2026 06:08:41 +0200
+Subject: [PATCH] setup.py: drop use_scm_version in the fallback
+
+The fallback setup() call sets use_scm_version to False. But when
+setuptools_scm is installed, its use_scm_version keyword handler is
+still invoked, and since setuptools_scm 8.0 it only accepts True, a
+dict or a callable:
+
+  File ".../setuptools_scm/_integration/setuptools.py", line 174, in get_keyword_overrides
+    assert isinstance(value, dict), "version_keyword expects a dict or True"
+  AssertionError: version_keyword expects a dict or True
+
+The fallback is always taken when building through a PEP 517 frontend
+such as pypa/build, because setuptools' build_meta backend raises
+SetupRequirementsError for the setup_requires entry. So remi can't be
+built whenever setuptools_scm is installed in the build environment.
+
+Remove the keyword instead, so that the static version is used.
+
+Upstream: https://github.com/rawpython/remi/pull/554
+Assisted-by: Claude:claude-opus-5-5
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index ffcda9a..1abc27d 100644
+--- a/setup.py
++++ b/setup.py
+@@ -26,6 +26,6 @@ try:
+     setup(**params)
+ except:
+     del params['setup_requires']
+-    params['use_scm_version'] = False
++    del params['use_scm_version']
+     params['version'] = '2022.7.27'
+     setup(**params)
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
