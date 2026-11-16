Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8308606A322
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 21:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UJ9u+WB5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xhUdF89R
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B2FB80E98;
	Mon, 16 Nov 2026 21:29:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KS0_iD1f9Anr; Mon, 16 Nov 2026 21:29:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B853A80E31
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794864561;
	b=ltRSEvDdp3htaWHHNEINC7+2kbJUn2Vr2LgYrblHU9eGtm1hcZJLyRssgsdWQsjzKUqD
	 2VozqVwjtb2nbq2x/IOAOnBi50um+pgOAQhBDrfRR01Hj9HBwQS/Q/B92Q3j0eCRcTeFE
	 NKUfobrhze9GrrhdjgAcLSAyDMV+DoU/63/TDTv0npkiBVdnBRwQXNgCfLcRK/zxfjFoK
	 MfLt52rAdhD8ykMpcsPR42OCSd3BX8Oh+U2Kbic5FamvnkEtrE4qBLGtsyRaTaOfAO/QL
	 GtoMAj6Hy/NMOQRs2OAhuHPBwAD9hNFxJFKq/R8deSpqtFAxoVSXRtEoCB3XYqw7Pxw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794864561;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=/cPrcaUiYdUZ83cvPdE6wRBIwR0yqVADlvgYToNKY+g=;
	b=HQ+ksskB0RXvU43CAUDfOHzuVT0rgTkXnlNoac3B8hHXo6wmo5SK5ArX6TDOMntTdAwi
	 SEIjXtJbCzdCpAMJKx7HKTSJGhF5NmgeZGsyM7OeQLhpBK0defjjPGlO2GgEUhR+3C5/o
	 gb31ldaJhNlk3BROcRPn2sCQNhbnQf/wdPN9zuvu9d4PtgYf+Y5yenkVWAgxGKtWvv9N4
	 Rpmu6AEcFEsUgAm2RFyATWOzjXSo+iuWZAir7HTEmMm9iwYzvw80IjSlBTEJBAJt6Uk8J
	 LQe7qAm9ShK0Y7pV58lwae4KRvrKCFCMHkoknP7XTmBiC094v7hdwM3gCZJkwF6gdAA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794864561;
	bh=/cPrcaUiYdUZ83cvPdE6wRBIwR0yqVADlvgYToNKY+g=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=UJ9u+WB5Zr+7qpt+R/9nPGI2PydwaWvChtnFhWkVm4ChoY4vEhZWQtuMZdCe5UtKf
	 kp0kqmXWJwQHoafz0xUlp232aA8NI4GnpFVO5kAkUVBDDRt0K08UpzRvePUnFxx0Qh
	 ab4kgu+BEzXT2pJEyAlzYmmKQuDXGMPvRhO2m/jG3J3iKL5A3FYJgjDiN7JUfBAqpC
	 PtgQ36L2UodrlL638p4wDGwgTsdMZyKouUbTg4eWQcm5d0AJ/ghiII4mkJNVO9rMb+
	 a8f0KZs+PiZYIffqIvLDf2ZPNaWzTrChwzfJO5vDWenqslIo9Ls3MIHoY/dio7UXcV
	 YOuk5RFUhrDmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B853A80E31;
	Mon, 16 Nov 2026 21:29:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D70A91A6
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFD9E402CD
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:29:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HFI-pGHz_1M8 for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 21:29:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BC038402CA
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=xhUdF89R
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC038402CA
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:29:18 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-498f5fa5103so1769938f8f.2
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 13:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794864556; x=1795469356; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JOaEjYZJnd0Tqy5xrrVpP9pdsSv0Bg/2vcn+eRXfdbY=;
 b=xhUdF89R1JfoT67EYHo/RkpbRKW6uMnL65H9sUfw6JSVTb2qsI4q70gVqcFvcFaL0L
 rDRCPTdXToqEpTeB1D1xr5gjAovQjHX4jdA5K/vblzftyw8yKeSPY6AJ5AP961ZWtbDM
 KLNhg/8yck59dlO8VHKCZqTkGiVN6ogpcS61rvTiBOUiVgL26MrBqJHyqxhRDwuPoi3D
 mRAc8hkKhQ2k9m72PQ16eHG+LCx+I87QvjNEeH8Fc/gNp7EPOEafDZHorDoCr0IbcmlK
 E9ygLiY4YUrOhPfG4BQT/fISinvb6ga0FVuRHfvi14hNHiN9u8mvvOXHbTX2pvftnuZK
 gSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794864556; x=1795469356;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=JOaEjYZJnd0Tqy5xrrVpP9pdsSv0Bg/2vcn+eRXfdbY=;
 b=nFRec4Q92HPXWmzUC+ybKlaDhJ4uWYhzGzn4qbJmCsY3774IfoN9sqYo/z6oGGJtWi
 tHTsPM85DyW/qLAKIhqp/PyRTy6akIo3OheANicARSY1gnQHokwVG6X28BXvyiTu3KXP
 PHCLGYV1Oo+wGWDhsz0IOYlzcv1On2OKELoKY7YPpL/J8q52+xGDMRVJOyW7cCektYRI
 R9VkkH1XxU2rEHnRgV1pAgnXVph9xV01T+LuF3KbVmUXNCcfylIsYQCMHnKNMCbKaFFC
 ZzlHkaeu9JfHXZ7a/4BSCeBrQW4EtpQZ6gt4ZgmZNDuhsJjY/J+I5/VzQahv3yfMoTls
 pQPA==
X-Gm-Message-State: APuU4Z8Dyir1R4ciiPkr7GgKFPuMqNBewpFtj/GzgjdoZ6WrbEu988+H
 fpMif9QO66i7UPJBfUXtnGhq8X4KomEtJ8fdH9hgKplpoESJNeMrmasP/Qx7oRJh
X-Gm-Gg: AZFdTZd8zcpKxDT+PGYAjWWw/thG06Qwqn8lkvtkF4wEJRRo5RmPePdWQhZ22AFiebM
 CUVfC9ILCvqWYvcS+exrrvDdy5m1588l29ci/UiM/rbJ0B1wG1c+rDwYnvZ/adLQeCZ6UztOzK+
 bt1Gc3iZBgDbBuXk2o/7138FA7bXWvSsN21/ckwtuOIRToiKJYFYm/WdhSvwllE5a4kSXP4QIp0
 jq2AJX8dPqqZtvOwQ9o35raEDrjzp61cV3iAYEg3WmYZcq4adc9f7K6D8tbxJOqXXKgELrBlF8f
 EuL4g2uX9CWKtKs9GBt1yPz7IIuFrkdoLeaXo8YhDQ10mH2+81UgSpmSoThfwVWPPsn0/huYkPF
 1TlQdycBf8fcbY818o41tLdkG5kAH0han1dI1KNbN4iFRzU8xhwm9bjKM2rBbbc1HKwAsv9hb2b
 CL3K8+n9f+WnZfVN0E2ObKjy2ZrcoCDJiwIYcv93cBAQ7d5dcbqWEZex4DIluGCPu/QTimHjM77
 KSE5Dq0DGmAejKjk5wR1TYSXqDjA9h0ZWxdeD60KIAKKqujtN4LDDmwg8B2w8TDExAdA3XgKu5p
 9x/F6pfe3ahYZuhzqjkEMEFNi5id79BNiN6K9IA58Zft1fSokEYP
X-Received: by 2002:a05:6000:3c6:b0:491:ef47:72d7 with SMTP id
 ffacd0b85a97d-49c712ac8e1mr23437280f8f.12.1794864556326; 
 Mon, 16 Nov 2026 13:29:16 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5d223a29sm24918708f8f.8.2026.11.16.13.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 13:29:14 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 Nov 2026 22:29:08 +0100
Message-ID: <20261116212913.863975-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20240812080307.553359-1-dylan.bespalko@gmail.com>
References: <20240812080307.553359-1-dylan.bespalko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 0/5] package/python-pyside6: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Dylan Bespalko <dylan.bespalko@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

Hello,

this series updates an older one: "added package/python-{shiboken6,
pyside6}: new packages" by Dylan Bespalko. Its last version was v3, sent
in August 2024.

It adds PySide6, the Python bindings of Qt6, and Shiboken6, the
generator that builds them.

Dylan is still the author of the first three patches. I brought them
up to date with the current Buildroot and Qt6, and I added myself as
co-author. The last two patches are new.

The main changes since v3:

- The single patch is now three: python-shiboken6, python-pyside6 and
  the runtime test.
- The version goes from 6.7.2 to 6.11.3, the Qt6 version of Buildroot.
  Qt for Python must have the same version as Qt6, so the packages move
  to package/qt6/ and follow QT6_VERSION.
- The source is the release tarball, not the git repository.
- pyside-tools is not packaged. As Dylan proposed in his reply to v3,
  the Qt tools "uic -g python" and "rcc -g python" do the same job.
- A new patch lets the Qt display of python-matplotlib use PySide6
  with Qt6. With Qt5 it still uses PyQt5.
- A new runtime test checks matplotlib with Qt6. It uses the same
  configuration as the python-pyside6 test.

v3 added a DEVELOPERS entry for Dylan. v4 does not: the packages are
now in package/qt6/, which already has maintainers, and the test files
are in my entry. Dylan, tell me if you want to be listed too.

Angelo Compagnucci (2):
  package/python-matplotlib: add Qt6 support to the Qt display
  support/testing: add python-matplotlib runtime test

Dylan Bespalko (3):
  package/python-shiboken6: new package
  package/python-pyside6: new package
  support/testing: add python-pyside6 runtime test

 DEVELOPERS                                    |   4 +
 package/python-matplotlib/Config.in           |  15 +-
 .../python-matplotlib/python-matplotlib.mk    |   6 +
 package/qt6/Config.in                         |   2 +
 package/qt6/python-pyside6/Config.in          |  32 ++++
 .../qt6/python-pyside6/python-pyside6.hash    |   9 +
 package/qt6/python-pyside6/python-pyside6.mk  |  86 +++++++++
 package/qt6/python-shiboken6/Config.in        |  12 ++
 .../python-shiboken6/python-shiboken6.hash    |   9 +
 .../qt6/python-shiboken6/python-shiboken6.mk  |  57 ++++++
 .../tests/package/sample_python_matplotlib.py |  39 +++++
 .../tests/package/sample_python_pyside6.py    | 165 ++++++++++++++++++
 .../tests/package/test_python_matplotlib.py   |  48 +++++
 .../tests/package/test_python_pyside6.py      |  63 +++++++
 14 files changed, 543 insertions(+), 4 deletions(-)
 create mode 100644 package/qt6/python-pyside6/Config.in
 create mode 100644 package/qt6/python-pyside6/python-pyside6.hash
 create mode 100644 package/qt6/python-pyside6/python-pyside6.mk
 create mode 100644 package/qt6/python-shiboken6/Config.in
 create mode 100644 package/qt6/python-shiboken6/python-shiboken6.hash
 create mode 100644 package/qt6/python-shiboken6/python-shiboken6.mk
 create mode 100644 support/testing/tests/package/sample_python_matplotlib.py
 create mode 100644 support/testing/tests/package/sample_python_pyside6.py
 create mode 100644 support/testing/tests/package/test_python_matplotlib.py
 create mode 100644 support/testing/tests/package/test_python_pyside6.py

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
