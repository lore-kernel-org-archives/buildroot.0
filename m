Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974E1606A329
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 21:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PoDrnB2B;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r24itYUy
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75D7180D5C;
	Mon, 16 Nov 2026 21:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OxZPgO5KCiYC; Mon, 16 Nov 2026 21:36:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7A71580DBD
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794864980;
	b=JTQYczKLCGXxjuOMikCCE9CE18IdV9O/OEY3k3NwL84nLMsw59Ve9STSHjZ9HebwTyjg
	 7XFBoaVBP+KbhsrH3mVg8/qBdKhOWxRI/bFslNQFADVob0RFymLC5nKTFWZsM0nIDF45h
	 txaHbnZfKOhD9bE/sCcp0au8mxFahmDhoWRJCcKNWdAEQtaxC7NxXXZfk1sVKqXH1TjbW
	 2Ys7TGFxAzU/XvuL1b6hG5Z6klyvS94PI7K6AmRO2HW2Ux5exKMlTT7djEMAl9DhUvaEc
	 1xiRYiACwseiIIcK+5MVSohuY4HkaDmbsOMZa8fpCKT7eVdfdGJCuA8282ziB7y7eWQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794864980;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=ClczGlJHyfDXI25nI/VCFHyWqIyDm0x9vdL4MQnG+lo=;
	b=BDV0CM17jSR92cmlmNipJw4bmxXOkqaAAVivCwbj38IJl8Vyha6t6CkXkPBlPIzxGtps
	 3aJNh1tjOVA52c4CGGkSDhI0+4mjTmZFy7ebo6d3kPAepAlgoYlUwKC0mgddLDN4v7BLB
	 sCuzFGNL9xWnZUyowjZUPxZSQA/mpZ11K+Sd3RitLy7zsApTe4EHyg/3nN8vAFhn5aecK
	 S/tb6jjvZ3uZg1Ha+nE9Q2UZxzw7dM5gbkKJiihL82GlsPmzSgMQKUlf7Iu/R4R0Z04+9
	 /PsVGvOIAzxTmcYlDWunxG2HnRD3iEh1EAQa8JUPW/15/PSe8sVFxqEvsHpmibMZOOA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r24itYUy;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794864980;
	bh=ClczGlJHyfDXI25nI/VCFHyWqIyDm0x9vdL4MQnG+lo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PoDrnB2BrXDWkZQ12XWdcrroGQ0TciY8tWYhxULWZ5oFouS7tAjCIu9JqYYU6sfxs
	 2KX9j47xP78u1U2/t+iyo4KkfifESD766vUqnlUKC1goW0sl67ujgOMC8RK+dlC+xg
	 H02UKLyGp4kecGOlYb7/YEl+5HcXZevXo0X7Oo0AVoiVEf2e/l75Wsr9nxeCRgB+yL
	 6p5BMV2asD0Uj8H9hdq2pRtxTSfwwQtoh4H1yfNYTkymy539qt6+cj+T7qygfJ3Txq
	 C2qn6pETbm/PVXR9bzTrP0UMZntar/AZ4xVo4N4ZBesu1o+LxB3iHoqhSg159N4edI
	 bXedq54b9t0Yw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A71580DBD;
	Mon, 16 Nov 2026 21:36:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D2A6649B
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC32380E4D
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:36:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id htLSYgEyt0hu for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 21:36:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AD44880DBD
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::429"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=r24itYUy
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD44880DBD
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:36:17 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-490585eddfcso2814816f8f.0
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 13:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794864975; x=1795469775; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=U2rdlQAQ3hWYMqdN3vndt67ckidM/7ypMiQxQk87R6g=;
 b=r24itYUy6dZ+7GE9KfRV3T7OJSYnCjNDNJpBQCnNIivDdBQVBUjp00snPqN5u7Zi1s
 wqQbqCJ+4Sii0mG7nnFZU2nRkKoUj/zYS085WYn7U1yZ68WwlqFNC9BHFMgYC9CJO+II
 /z60XKX69Gu27EjtjdyDS+doENk6SrKieWD/L+6PAdCE8GgE9rqwApTiU1LKDp8l2RBe
 AhY24XbKksXdCf2pO3o64kSkfwrGHs4ChWlvvScq1AFJFBMxbuA7jWdKB7BfD9Wcx1Bl
 DhomePvt0WJtWRz4AA9G84JkdHZe2N9FhQaLfX7hebmPDDY/D79QDeD5n61g53ugnQ5z
 hkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794864975; x=1795469775;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=U2rdlQAQ3hWYMqdN3vndt67ckidM/7ypMiQxQk87R6g=;
 b=djQ2MVeUWgMvW+50oW4iiWhl8NboooOuID/7kP4DuBZ7GV0OoK7fOAniBChBgw81pb
 bdMVVm6aO/8j4R+gqvLo0tn3y5tTrnaUmD9DNfHS9Ga8q1AcwuBpwCjErH/S+wP6QBmQ
 HBAdG5rvOVr3EJ3HQy7/hmm7Kq/JpfnGbuoWvAxMZKNjMhlhvzPqTe/ckt/M5sOvVDKA
 i/uzimqv7CgHRqllYfRGIHVLrbgXfv8YF6EGOHxeggng74AJG7i7XHdOkZnyKazeZA0i
 CyJNWSzrWblNYz0xIJF3LU9832eLEcH/wwnk6G5pKOBJrXgDIesoS9X8cKVt4eKsbXDs
 g7jw==
X-Gm-Message-State: APuU4Z/bybiTRqjtGZhkx1SQ4cf1wKiZTkXRyMSd1/qWqfdHYP0vK0xo
 NY9aKadIlcSUgn0MX5fj+S9b2fwqUwoncanNqZUd+hJtAmfHvB3VoyZm7YKwVHBh
X-Gm-Gg: AZFdTZdNDEv9ex5K0dqZURV9n/8SDa1nhi4w+iPoesZ3x+ZkO5HenF/0ssUs/Zmpfy9
 iPFj3XgokrCAHlJRA2iXGorumQ7BfVwsabEWdzJJYm22nSelcjCVg4bu3MSqN1brZgU/AAVrC/Z
 TXyiIjBwJuKks85b1x2A3bMpzWWnZ/3RwAMT/MENUGE6G9utEIsWWgRmur0uE3+dE5iWESa4CSt
 VC2JxI73b1XDEOqNyKmbYBXtkeACzv7l0VcWDVlDNUBcsGS5qYezynz5wJOiBXFb3h16ZwEOjxP
 pkk/oc9qjfDrUEjy1lVkFmjYP3QNv+Mo6t1MfwSKXqicJmYD4dKXcSqRIle9IZqLxkTc1ORE8t7
 XrmWH+Z/faCACPs6LbtsUax7xEfwBEKcfLq4F6nCK8o6B9bFOFhjWq3o4O4QuPSjbv6fFXWpqVJ
 5Cni28ihRdRrfPXJOHlY1zTeRnrCED4PVq2Zwe5b4m0fZhulLhQRRGg6xos/LEd+H9pkEKGXtC4
 DF6GtS/KcbRgAIPfXJksuBhdizTwR7TaXSdxIbFHuXY2PKViQEfGAhrl8nU77qsurtelLxWtRno
 mxpElwruGCzAAmR0014MA1hBCIamGzxD5egPIDqf5q9TXaUWKI7O
X-Received: by 2002:a05:6000:1a8f:b0:4a3:8b21:51c1 with SMTP id
 ffacd0b85a97d-4a38b2152c6mr1250897f8f.53.1794864975229; 
 Mon, 16 Nov 2026 13:36:15 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c18b9sm20248008f8f.20.2026.11.16.13.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 13:36:13 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 Nov 2026 22:36:07 +0100
Message-ID: <20261116213612.873856-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116212913.863975-1-angelo.compagnucci@gmail.com>
References: <20261116212913.863975-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 0/5] package/python-pyside6: new package
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

v4 of this series was sent twice by mistake, with the same version
number: first with three patches, then with five. This v5 has the five
patches, unchanged since the second v4. Please ignore both v4.

This series updates an older one: "added package/python-{shiboken6,
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

v3 added a DEVELOPERS entry for Dylan. This series does not: the
packages are now in package/qt6/, which already has maintainers, and
the test files are in my entry. Dylan, tell me if you want to be
listed too.

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
