Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BE8CCF2D3
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 18:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A88A8101B;
	Sun, 18 Oct 2026 18:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cbYkqnQ0x4p4; Sun, 18 Oct 2026 18:25:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4361C81005
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792347940;
	b=n85acQAgh6vyKD6wRMGxQAQT2YTHKkSuJZhOI9D19Ba97/yfRzejSWm0GmbPbCbuSw6T
	 oBWTEI36FtoGFFKF9ubdps0DRFZo+FyKhTTfSeOO0rWPzHDbS1Radx5bc2tK3kBjrto0l
	 AaSI7QoYYYd6T1WOV1APoxQlJjZWHPXDU1ZiAftB8xfoEaLCv9e57wSiBNr3Iy7SNq4U0
	 4IJ5v6ng2/xV2m3zx9dNpAAx/d4/Ldf0suyZ8klIV6J0kXZfejvv8q4d+BeebBsr1z8NI
	 3x9I2+8yvlbGJ/uj55yw0CTq006xbS96d7QGmJiexUxBdLeMrDprpNoi7liI1l7ZE7w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792347940;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=XSpiiOJPMQY+KVdBQEV7hXSynaIdTfNZYmr4s64MKZE=;
	b=bWiQF1oYWRW9Wv2Qu3FDgAKuTuhamQ//UpwX3Hki71X7ZQ++cAecOKq567gxQiwRAdFA
	 wap5eY1Pq/vtfd1VWdelLly/3liuwALRNKekstIUjAo5fTyWNJ7z9YvIl0bocn2OomL+n
	 DmYqiaQJTRTmh67/feSpg8IhkcE26XwE9yfDNczAXmXoJivska3vf0JEyAlyIwN++h4t8
	 Q2MtfdBxYct1gqOY/plTy0xmOIipKXFgCjPDH/+CDJPeAdOrZct+85glg5e/7BE4L0atd
	 nUE2iiN6pqDruTP10Rs68VMsEBJBj0szRoE8sum6oXIqd6T04/ZYgzxCx8+ccg9Ampw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792347940;
	bh=XSpiiOJPMQY+KVdBQEV7hXSynaIdTfNZYmr4s64MKZE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=nle2xrXErBXnXU7mM/rk+0e3KT0CV1BYzOO4o6B94nx3uyxvZTaKNQTmI1GzSOynY
	 c+DD/sbP6WObc8/uGuHz3csdzBT1DtY5iE/JeevmPUp8yN6PCpY2R09PAHaVRf80rK
	 mXepAIwA0tXuGzqS6npv4evrZCh3SflQH6Ftav/+7ml6bB6Qs0fiHhXt3fpoJm/mf8
	 WeI4gyDZ+woK3GpY3ver3G0ol1ud7C39gumcekH4+qEn63QGu4jpZ5Bv0aDdTIL92Z
	 wQwL017eCefC7wHyPsBeGEgVA0jJPaLQEbLbdeuo9Ajta24zKDw/weCOf2cFIfhPWO
	 3pnuUeiWUdt7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4361C81005;
	Sun, 18 Oct 2026 18:25:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 69E0D1AB
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5029E400E0
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7h-gVgXYpzbJ for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 18:25:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7D8024009E
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::329"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792347935;
 b=nTxzsejGJhwkk5WbOr0dqSwhyerd4W39johnIgnehqh0FvBGcfqThOzVA+TedIGD1ZHu
 EbkPmmWGD63zrOTjQv5A/YkpMVpeg/Rz540oPk4Fh+auPA1GYnuqb41HTKA9nv5HtqvsL
 0oYu2o3Fgkz2oZgPBdQAkVZX/rk6UIuA1+bdWtJCPG0bwcppf6dlA5PPXRgxASWyMPB1w
 nNtsuwO6eEeMTJ1qQFC1M+tA/YRA47iLmycXFb/5haURJdzmZboqGUndUtrE3hmJher6+
 Ct6KbafHiDSARjYvOpeLBM0g/HmJeMSUdeKvBCyn2uXLoQJiHAVHb1r6UTnupqz2xRw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792347935;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=HlhgzK1CK5sgXk2bhhHOD9H2YzK4SxNYv+ZfwICyvfY=;
 b=kjo1tmTbAGCuJvMMX1JrpgyJRfmSzd0cQ8hb9QOVPIc2OpHAuvbYgWEBZ4Jf6vYEIlzj
 b2mKbYtbZQDgQKxZrA8ds9uhLh2yalrx8x/3S2GLBIHXRitPUgLR85ResI7w5H4NK3Ie2
 j2toqVK3FsuJ9Gq5nUQyktf0kVqaXPOvs43HgZFikyUnt2l9Fi1g11lmPi2I6C5RIrsD3
 ltD5LmV2CdS9fZ/2jRfH82xt4DBOBediRVb3J3DSXwmxg6cyRgNItYEmHHzWE0WsRS2Mv
 ExcmlaiDS8So4DVQrZmfvCWF1jx76HOUPBtLrPrElEtEjI6jv/3OpmbLtB8OKw4fVdA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=jqhyS5Ei; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=jqhyS5Ei
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D8024009E
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:35 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-81ae6aefdceso1264785a34.0
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 11:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792347934; x=1792952734; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=HlhgzK1CK5sgXk2bhhHOD9H2YzK4SxNYv+ZfwICyvfY=;
 b=jqhyS5EiXshQ77O3kfb1fLPE9/6FPPivUGl0JL59Dic135blwPVLLOnqMC+X/gBmqQ
 cKqtgoXJpC2JoMoWMPeaURau6GNM7uQu3d+bvr/XMiFGiK753NsiXf241kZcgZDjCTP/
 9479oquEV7tdQnin+bYJNyQowDKMVAmEQUMrqXSc/NZW3XXDQArAleZQsuR7tDHc2qle
 Wu1KqIpfh9hlfsJFt0x9W8kRwLBZ46nKCbqsaIcnUvp66sKOvEYhbBGpOGk/awv3VUFd
 WKJPzPgtebklvIeW63QAn/lOOxYgBIhl3JfLBYqRxPyxiZXdfB4C8lliy8LdWQxoaXE+
 bc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792347934; x=1792952734;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HlhgzK1CK5sgXk2bhhHOD9H2YzK4SxNYv+ZfwICyvfY=;
 b=IU0AxS0G7va0cqSlij9IYwKMzHtiDFj3P7WwAe2K552A/V7vJcjztxae8kwOOMwNPQ
 WU5qT8A7CjWfewmDZRW2niQkN2iqTs4LoNwK7Ei3D5rk0dOz+5yrhQ1emLFW/8a9jPba
 czASNgPRtV++qPOzOuGCHHtMfLbO/bxh/Ed4vcpYd3M7v7r+6JjFeLBZNoYnPEjqbGwm
 VB5edJVTJNSfoNKuzyw+ySBpK4gAk+eY1kdl98VV7qBg3T5yRSxVqa8DkYXXcrFhyFgL
 WYZjzwJMNcH7L1krgTCWJxmNAwZTwGCBpWZRVA4roJ30vhbPh6lKvsIJaulL+dOW7ENx
 8ULA==
X-Gm-Message-State: AFq9FYIf6xD1YyaPaDn5C4QYLcYuue75gFYsnqPYN3z1gPRK1Mw3/Cat
 qgMV8YQwLGJjlOXrILTo+XyW/PmMXX+ThBfefUFFgx768re2Um2Kx1Msix0BNQ==
X-Gm-Gg: AYBFou1UXDgow0ZCMB/Z4GjqVhN+C2BYIXBpnXXsV1Z4AVKp16G96BSA7CYZ+mSyukq
 be0J50NyEfMkQHxk+so622mN463jV7rqKCs7oOum1fIkBzdIAiyIG7oxy74ISVmSwkDpM5ImfXx
 CbN+BJapTvPHW7xIeKODQNjQfgCScyzneE1CvTSfkaG7dow/WlugJbQFVibdd5lYoYICs0pMfGI
 dCO9tPHpb10ksSuMKrAHaaSnXoH4WDwtmwgldl2IOdl2HKFR2uYFG4MOgXPyuL+y/CkTcBpZopZ
 m4T1fk0827QZGQVSwxqeLTDG/ZCh6N3YYQLm2C9PwWUZRNSkACemWpuyX3TaV7pHV1wJl5SYFaX
 J+Ft4FOExpqioP0CFRvMCjIPtWd/ZOeyLK1sk7V2xx1q1cfaCXwE8lPsPKB++mFoq0rjeL6dWg7
 3/L/Ou06jVDmIWTp5nRUlWfWty1CEtyqOwfvMQ/pSwfoB784UoGdw0GxRGdIvBx+I3t8lxmQDY4
 2aBVodksjwmLeU9Q8E2hMVWTWrFjGRUpv6IOWen9vuGUbCgHqgXfkFnbRHb0ZNopjRPoFhEh/Qx
 zUhTiHL/d3uuh4SzkZQtScQDo/c++EUFwFfOx6SNMS+g3n9quGKdYv4nAX7eRc65JXGA+ZpJq2N
 QDyFcEv5xTiqS3fTiu3x1ZyM1XJ036l2peLNnomIdF9c=
X-Received: by 2002:a05:6808:2f18:b0:4d5:291b:b852 with SMTP id
 5614622812f47-53cd841c7f3mr4811753b6e.56.1792347934269; 
 Sun, 18 Oct 2026 11:25:34 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-5388a5572b4sm5715659b6e.6.2026.10.18.11.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2026 11:25:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 12:24:54 -0600
Message-ID: <20261018182507.536698-14-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-tomlkit: bump to version 0.15.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tomlkit/python-tomlkit.hash | 4 ++--
 package/python-tomlkit/python-tomlkit.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tomlkit/python-tomlkit.hash b/package/python-tomlkit/python-tomlkit.hash
index d796a1c53d..8411872c4e 100644
--- a/package/python-tomlkit/python-tomlkit.hash
+++ b/package/python-tomlkit/python-tomlkit.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tomlkit/json
-md5  8e5245fd4099c9a6f99774b24a4591ae  tomlkit-0.15.1.tar.gz
-sha256  e25bbf38843005246210a12982776f27f99cb9be67160e14434d0c0d21ee1e97  tomlkit-0.15.1.tar.gz
+md5  65f5e37b20e3b81a5ba29e8149e01c01  tomlkit-0.15.2.tar.gz
+sha256  83e32755ba1d20d9340bd069ee97e9f6232ba2346b63ffcba425de01f7e327a6  tomlkit-0.15.2.tar.gz
 # Locally computed sha256 checksums
 sha256  f2f9b460ba719da6626add264d3782f275a4ff7aab677beda08b330911e23adb  LICENSE
diff --git a/package/python-tomlkit/python-tomlkit.mk b/package/python-tomlkit/python-tomlkit.mk
index 1466772fd9..5dc015533a 100644
--- a/package/python-tomlkit/python-tomlkit.mk
+++ b/package/python-tomlkit/python-tomlkit.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TOMLKIT_VERSION = 0.15.1
+PYTHON_TOMLKIT_VERSION = 0.15.2
 PYTHON_TOMLKIT_SOURCE = tomlkit-$(PYTHON_TOMLKIT_VERSION).tar.gz
-PYTHON_TOMLKIT_SITE = https://files.pythonhosted.org/packages/94/96/e07752635b98536177fa1f37671c8f3cdde2e724c6bcf6034b2cfb571565
+PYTHON_TOMLKIT_SITE = https://files.pythonhosted.org/packages/08/72/fc01563df95c189a9f65850096bdc205bc2fe37da6c740cd64afaf18d07e
 PYTHON_TOMLKIT_SETUP_TYPE = poetry
 PYTHON_TOMLKIT_LICENSE = MIT
 PYTHON_TOMLKIT_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
