Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAB0606A31D
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 20:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FuTUxOMX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ztCYa7gV
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47B7240612;
	Sun, 22 Nov 2026 20:22:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0UVjmIyHd_29; Sun, 22 Nov 2026 20:22:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6583640604
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795378921;
	b=GMAKYqZY8J98cJeujJqLtfgmkzz7A0nP0CID8Ja9g6Pt4mTE3CYtoeiQdN+5koSrm+8c
	 s9rTKwjLKoeO5K0CHiH/qTEShzpkjDuLrvIbk6n2AgpLxz3Usa9Tand21SaWhQZnsOK7a
	 7X3wkdMILQHzO0ueZ9UdE0BWGqacDGiFkWDYvXbWu7QU0Rr2Y1zjDJsC5x7om4+D9vNdb
	 KrC4UVWWvfkF0QpgqOKu5D1rsEGFYYZtcHuxbqCqlYpTr3JV5lAvlzNitmBqWZ74zsNmY
	 TES7IJoQWF8ffbZo2uaw9VpbmNYRx4KijmBScTIZ23lmy7AyDwTtTVabviB5occ8fQg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795378921;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=9H3X33RxVKOTpjGDvp2r/eu2T9d6JbCouY+M8EN2f9E=;
	b=I7uTn+gkGBqUbuvCJp1FSNiXCb0KJn2M4COtv66F17J11CF4pv/7cLs/6WXupKqtt8cU
	 WTJHw/gbjQp5Ul+MHiypAMOC7tJ7YE3fApFN/g5G0TmHDKu5h8+h3ZiG5QxvuitCW66dK
	 uS9DvWvnbFyvJdUK86GzDHMPIh1zRuciCGIZ3tL0FhjJO30FyI+F06ZQDwMSHRxYhUYYZ
	 WxEv7iEFRR5OXspmrOS3QeCJL9lUxeWYj11NGU0M5hH0LewZRpxK7AK2LyEt+hPofX+CD
	 fKwGDO04Xew/mZpi4YWev6HVFeD4NaN8EBTqJcNYyqJi4sPNTy1xmkGHwd/YIK6ffjw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795378921;
	bh=9H3X33RxVKOTpjGDvp2r/eu2T9d6JbCouY+M8EN2f9E=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=FuTUxOMX+IOX0Me+aUEdjM7kin0l3dOX7IxePdeJ739/TR76sfzj4kEAdgGzU0/4A
	 1oVgjRAD9CqSHhMVB7F4thT3sAo1NTXYy8mW1NAW847Hi7bmbzFfHb9K7VnFKp0l52
	 w4kCV6zSTyuzKOZ5pffxXPonQcdE6RO7ichO/D9xdkHicoF3YM9sc8x5HNL5JxXtXW
	 4NN8ZyZaEikfkAVkeoUsKzRIqGMixywLx/IkkyTG3A6gzMiilU9d1Atnol0uuFdqAc
	 S6sLlHgpaNh+M9AeIMprzj3DeEfGtvPFoqd0OkU2Kvg2J1z702q9Psm4LnTNd36Jr1
	 T8gEmwnfs9nBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6583640604;
	Sun, 22 Nov 2026 20:22:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A16FF499
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 20:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 931E2400FB
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 20:22:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z0rd1KMeGIFF for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 20:22:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7E5E44008B
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=ztCYa7gV
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E5E44008B
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 20:21:58 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a5b2be99a8so22146925e9.2
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 12:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795378917; x=1795983717; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=yw5sG9sqw2Mquzz1cEKSfZ698zItNvuMMjEXsz0gz5Y=;
 b=ztCYa7gVrhSlt4psr5jxe9u2iblByhE8qgHHCZQ6g3UrQGC4ElOc3/I1SbisyEGoTb
 ++3D80cKtLoDtm6T8ZJuWFnR3JvCbk61H5mU2cATA4SFXhJ71SbJBe3yY2+vMZ5QOWUb
 0yP6Rpz5fhePtuGfASH8HyhHRqzxuwemWzQoth4DUnDQagNHXPoo9eDKKlfqUP/YhX7m
 2H6BdpepTbh722UqJCvbsGYdOt42X3vCND7o9oqDi4x8jiNDu1U5zAnHJfxO/mQ6wB+p
 v39Zmy+XXuofBHaqIDITRGX79C14Xm7IE717T4+/hnqlncF8pC9dK9VOMdCWG4q5fzKX
 iOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795378917; x=1795983717;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yw5sG9sqw2Mquzz1cEKSfZ698zItNvuMMjEXsz0gz5Y=;
 b=pImxDHma/lNvFy2WtXeb/bm7aW2BQy6fzoD0YTB7vmLlzAbuld7JziGMtmWfmiwVWC
 y4QtxlxlNFRGjHg3kDAFd57iIbHIyWtcQNKLsiUOLmKVK7x0PVyAqZCLJsCpOoaVV83x
 KxaqJPQFrqTkYViTzG3o6kzfSYSqErqUUt/yn9jP1u+zR+7n94jIdjhf3HDhvh/dyeXP
 vezsoMNQs8Zn0QQRwjkLaBoRl3FpgHz4niDdA1xJ8jEyElpY+s3SO1gQI/Y8khlV8Wok
 sSXvvmekpFGQS4YLyv5mPA6EmWjOKmp6zn2d0jGb/DQEdxijsjvPqhCnQKhg9YCurr4g
 zobQ==
X-Gm-Message-State: APuU4Z+cPyUU7ek4BasekM24oyHf4bekT0i74we/jSawrEG64M3fhibs
 zoIkmFo1TVuTykGvzPOFnrC/g6KA0HBNIUd0qNAP58FpP63/iFAAqaZgNn1JniJQ
X-Gm-Gg: AZFdTZei7VBZejqwFIzUi4xYQpQ5tP9GPhIBIQGRe6nK+mVe6lyuV2/6QgG7JmJ/rx2
 6PCWJqlsH/r9RQlpyEaUbi8v2UTMpzNhEefRBjINwYggJNubfCiABDeIJzc4tlVjvrNrF1e+ndI
 CbTvXFfuegJ/QZKAxOJjXlaXzNKfnjmajEFZ2edO+aLtw94K3L6YGbP4sudRam6DaCssufiJxZO
 mcPLMBfUAf8LWRnepYhiWHBpAqj6jOerJQFLAetZaJ08xwnSZoBM3nCQQBrpTndoUBsAkvHJHIF
 KmulvKZFu8AVzeVHCTZDMc5geR9SBMAhRjFHg2COmpLiVUJij7NwjFOlcCzPsZce/oCgB0ELly8
 Ty/JkuNPyUzQdNVmPljcpVsixEhM1FODTwxBW1hDNBSlBFMC6JBQxUHpb5p+FjxINjCEpwAa90H
 3TrxZPo7fqoXuN2NUzlZO3xkTZNGSLJtePPERLLj/xFbFRrzIuP/SAuTj7tSWsi1/rDht2NMkGt
 NxrNufpaLp9P1eM3IUQ/wBzoKnd8afslHB6x9t+JmWiofkOKb6tE1cSJWNVsvuZDHARXxjAgZMH
 TpQid7esSE540HhuVKduIDVXvolgbnIhQLDQlxXpYKwvMmKg1HE=
X-Received: by 2002:a05:600c:a088:b0:4bb:6473:cde9 with SMTP id
 5b1f17b1804b1-4bb8880f2d8mr169883685e9.6.1795378917064; 
 Sun, 22 Nov 2026 12:21:57 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853a12acsm319409495e9.8.2026.11.22.12.21.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2026 12:21:56 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Nov 2026 21:21:50 +0100
Message-ID: <20261122202154.3606582-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/4] package/qt6: security bump to 6.12.0,
 with a runtime test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Christian Hitz <christian@klarinett.li>, Bernd Kuhls <bernd@kuhls.net>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Baxiche Su <baxiche@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series bumps Qt6 to version 6.12.0, and adds a runtime test for
Qt6.

- Patch 1 fixes the build of qt6positioning with the Quick module and
  without network support in qt6base. The runtime test found it.
- Patch 2 adds an option to install the qml tool on the target.
  qt6declarative always builds it. The option is disabled by default,
  so the tool is removed unless it is selected.
- Patch 3 adds a runtime test. It runs a QML file with the qml tool,
  and checks qt6base, qt6declarative, qt6positioning, qt6quicktimeline,
  qt6scxml, qt6svg and qt6websockets. It needs no Python, no OpenGL
  and no kernel build.
- Patch 4 bumps Qt6 to 6.12.0, which fixes five CVEs.

Patches 1 to 3 don't depend on the bump: they can also be applied on
the older Qt6 package.

- master (Qt 6.11.3): patches 1 to 3 apply.
- 2026.08.x (Qt 6.11.3): patches 1 to 3 apply, except for the
  DEVELOPERS hunk of patch 3.
- 2025.02.x and 2026.05.x: qt6positioning is not there, so patch 1 is
  not needed. Patch 2 applies. Patch 3 applies, except for its
  DEVELOPERS hunk, but its qt6positioning line and check must be
  dropped.
- 2025.11.x and 2026.02.x: patch 2 doesn't apply as is.

Angelo Compagnucci (4):
  package/qt6/qt6positioning: select network for QML
  package/qt6/qt6declarative: add an option for the qml tool
  support/testing: add qt6 runtime test
  package/qt6: security bump version to 6.12.0

 DEVELOPERS                                    |   2 +
 package/qt6/Config.in                         |   1 +
 package/qt6/qt6.mk                            |   4 +-
 package/qt6/qt6base/qt6base.hash              |   4 +-
 package/qt6/qt6charts/qt6charts.hash          |   4 +-
 package/qt6/qt6coap/qt6coap.hash              |   2 +-
 .../qt6/qt6core5compat/qt6core5compat.hash    |   4 +-
 package/qt6/qt6declarative/Config.in          |   6 +
 .../qt6/qt6declarative/qt6declarative.hash    |   4 +-
 package/qt6/qt6declarative/qt6declarative.mk  |   8 +
 package/qt6/qt6graphs/qt6graphs.hash          |   4 +-
 package/qt6/qt6grpc/qt6grpc.hash              |   4 +-
 .../qt6languageserver/qt6languageserver.hash  |   4 +-
 package/qt6/qt6mqtt/qt6mqtt.hash              |   2 +-
 package/qt6/qt6multimedia/qt6multimedia.hash  |   4 +-
 package/qt6/qt6opcua/qt6opcua.hash            |   2 +-
 package/qt6/qt6positioning/Config.in          |   2 +
 .../qt6/qt6positioning/qt6positioning.hash    |   4 +-
 package/qt6/qt6quick3d/qt6quick3d.hash        |   6 +-
 .../qt6quicktimeline/qt6quicktimeline.hash    |   4 +-
 package/qt6/qt6scxml/qt6scxml.hash            |   4 +-
 package/qt6/qt6serialbus/qt6serialbus.hash    |   4 +-
 package/qt6/qt6serialport/qt6serialport.hash  |   4 +-
 .../qt6/qt6shadertools/qt6shadertools.hash    |   4 +-
 package/qt6/qt6svg/qt6svg.hash                |   4 +-
 package/qt6/qt6tools/qt6tools.hash            |   4 +-
 .../qt6virtualkeyboard.hash                   |   4 +-
 package/qt6/qt6wayland/qt6wayland.hash        |   4 +-
 package/qt6/qt6websockets/qt6websockets.hash  |   4 +-
 support/testing/tests/package/test_qt6.py     |  43 +++++
 .../test_qt6/rootfs-overlay/root/test_qt6.qml | 166 ++++++++++++++++++
 .../rootfs-overlay/root/test_qt6.scxml        |   9 +
 .../test_qt6/rootfs-overlay/root/test_qt6.svg |   3 +
 .../test_qt6/rootfs-overlay/root/test_qt6.xml |   5 +
 34 files changed, 291 insertions(+), 46 deletions(-)
 create mode 100644 support/testing/tests/package/test_qt6.py
 create mode 100644 support/testing/tests/package/test_qt6/rootfs-overlay/root/test_qt6.qml
 create mode 100644 support/testing/tests/package/test_qt6/rootfs-overlay/root/test_qt6.scxml
 create mode 100644 support/testing/tests/package/test_qt6/rootfs-overlay/root/test_qt6.svg
 create mode 100644 support/testing/tests/package/test_qt6/rootfs-overlay/root/test_qt6.xml

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
