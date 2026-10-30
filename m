Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC0D606A332
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 09:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UHv8cwDx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fd8BXIU+
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B32DE810E3;
	Fri, 30 Oct 2026 09:15:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qfrWeuNYtnad; Fri, 30 Oct 2026 09:15:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A7AAD810EA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793351752;
	b=MK1Y+6eO2MTBAIMWL0nsX35ZMp5r6bzUJgO6GO/ldttZqMwRaPw6UwlFAam+OO42f5gG
	 52eHbgeN9ZbQn9WSip/j73SFvhCCOAdFBE5Bq2qXeonDlE9a0Cw7z+Wab3oG1kFbauSaN
	 udTm408kz1bz+2XZ7ro1UcCKge8YThvCw+XRqoOKDTPzJFKzM3EcT6MzMIUZaK3wK3g8z
	 oVVaWCTujKDv4utk2eTy19se66nhHCSpHQIi4AsYYsojdVT+INGxpKbXg5NlKxWVz3o0k
	 rJh0MqJsyi+5pinM30lfojZnvWHICUaiGhoyNgFI8nzgK0ArhlkgA7fwz6gJYrCtEzA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793351752;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=5EnBa2N1WxJhkMrizkGAS30yqExiLLCnVbHronaDaCE=;
	b=L84+rY6KwyjFZwXjnE+9LbMA+YSGijmxW8kqZMdOiRfuj/VuFHFM2xW3R6jYmrSMSbsT
	 mLF1uodyg0kkExBF6s8DyRM4874xRnLh7FzxKHECD7bJ7cORv5lGJ6RorWJJnSKGJ5NjN
	 9s6thVYFJW98nmhlYMCXpIEZE2ts21FFcTm+HxZ4jr1M/xgShpapn3o/9AxCtknzJb18i
	 bshR7BdGp9Iqf07IoMFBa+YFM2KaXGCKOPITdsion3TObm6cVTIQWRYk5Au+C+DuXwkzG
	 CHm5XHzWyQmC9eNXb5bJG40+h8Zjf5CIUTgnMVp+8T1DNNVPvObgERgQzHtE8DMtHIQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793351752;
	bh=5EnBa2N1WxJhkMrizkGAS30yqExiLLCnVbHronaDaCE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UHv8cwDxlkae5bm925t3pSx1A7NptK+tvnDzGvWGsZnYvK9dh3f64XZ5o5r+oUPJN
	 uaQriJvityupclcBKaLvcOFvcaHw3JPEAKOcntwLFNK1+p/YLT8IKXeRrd0U+1BNQ9
	 HyGz1YI/b2XsZY5m/qhF9i7cnQkHKHHSeX5BatPuRlc7o6ei06Tq/07eAPbPyPIRMX
	 YK/Kbkot/s0BZj4XDsxCw1Jqr0wcOAqBkAPhthzIu4G4qKi3ekpkTCw8aD36Je0rKE
	 8AMsstTJNtJ3HYBnXbOMiFMPWj9BcGN3uddbuiZcy6yaXSXY4BJdhOUPp6bb4QtXr+
	 +vlGCXxcKoW/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7AAD810EA;
	Fri, 30 Oct 2026 09:15:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 756822C7
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 09:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B9B84008B
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 09:15:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 71CGypC6JVeZ for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 09:15:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4521240063
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793351748;
 b=P5VcjGUL7TxL+cI6wUHhC08CKpoEsBYjZzZ71FW5GhPvcaD2yvE0Fk/Z0P63xKMKdigF
 xPtQAkCle2gwCeB/VetRQ/AEGoh2xAqIyFogl3y39XmxEWjVQ8lX4Lj9y44FuWFg811C1
 4B81FwyYXh8dmjq8ujQvRRbwy+pFZl8pmi3J4Frq8o8c7/8rCS3dauOa5Rzo8ftUMpWXj
 xiis34y4DjHzKKK1dBbh4EZuynXf2FtjVq2Ty339ultRxytOzJyxU9ptckxD7ZvTSoPne
 250TBayAdw+6nGdHYS/t3dHnosb2q9icC/9/BXY5OQKN6Y+omYbfn4O6xMfzm/x8dig==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793351748;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=XARvOB8VSVXuXXCSYZ2UzSc24btK9RUHwOXBxZcd5CY=;
 b=C9EORbejY+sbR/N7eIXDTKZItcmHtoQr9GUm0lCFZSo9Xdt/9oX03d4XBD/9rVO/qPn3
 AfXnXCa9mXhsV7IyHBJ4XXqrKpzu/yj7677Y/iz9mqgB/L9lOmaq6jPmckFo0ZFfNUpAY
 bXyKNTaFJkoOs811fMrIm0Hhx1JlekEapd01OPqh3M5zw2U2O6IRSN7lMWrOozrhZvkUv
 HFkwrVA8yOcskJmREB9qPTgJhBeMQtGYEuo5wu1E8NcoscXn8uXYBx/pbAZA5aCOsm+yd
 oYiJfNKPcUERnwprsfNwN3rGHidmdWInxle35Icyv4f8xiAy/23l5dlFS9jRvo7q9FQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=Fd8BXIU+; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=Fd8BXIU+
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4521240063
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 09:15:46 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a2000d5fb1so2247225e9.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 02:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793351745; x=1793956545; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XARvOB8VSVXuXXCSYZ2UzSc24btK9RUHwOXBxZcd5CY=;
 b=Fd8BXIU+rSBELEPpfG/sQsdDDICt1y3toF2Qx8G6rRwQenbf72Gk+vLTRhRhsf4f/K
 tRMUpacbRIqNUDfiTqr1J3fDGVKYnqf6XlyjnyyKP4ogM62/w3CHUY12q0pnpZ0M9gau
 z6zIQrr6v4GCFucNcqqSsAHKe0FPNo3xNWR/EMh3Z04vTRzsF20jwVyBpA+94veO+ZOB
 H9yTqo4yLYBADR3ipaBEj0xYuPPbBs42yqIxjvn7uAjhiR4Bk9CT9NkdKDqW1Km9FuZ4
 pj0bOn4a2TnzALsYaIcf6Qi/wSUCa1pduy0tkqDiCJ/o4uLUUzJ+IdnoLlAz999uR+ts
 O4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793351745; x=1793956545;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=XARvOB8VSVXuXXCSYZ2UzSc24btK9RUHwOXBxZcd5CY=;
 b=bxXPDe/j6mh4wBBj6hgT4r5m4MpNLFIzFKPQKQ/iVZWG9CLrSu7FEQdrefNHsOVOmI
 JcT/3w8PvdRJksNOFN+45iPFhLv4STSAKDDuhNWP72rRB8VVVpyvhhm2u5Dzz89dOsfJ
 MyJJ7dnGc4FU6IoWgkV8NwqjGPxs7RlY0wPtyO0Ir6IxqwIkP95dl0+fpf1NinaDxXxO
 G8w0ns0jyqzRbQUoJZITCN7yIhqu15YHE0iUMvnnPDorLUiIlEKiVPGQk8EYyISQo77P
 4sKIAMlsbKCoKsz99vJMFzIoL7/3zaTiTYB0U0D5RiGn0AGhwm8J8JhB3wzp8TBb3oos
 HetQ==
X-Gm-Message-State: AFq9FYJWiWEBwAEOdTXbn56o1kZmE83kjmaGTZZVZkLr7aJmxD745jTS
 l5uwjALy2yiFqCZVdvp75TXz3rvGBl49qDUw90dofygJwfv3884adDb8mI2SPQ==
X-Gm-Gg: AYBFou3L0z19gEzC6os6P0qArx1EYIaVehxaBEIyhLQsUThZg+PQ+2+MjCSju5H1kZE
 R9UilNlmr4+Tou8mt2CD12TxUaq40EdPXSrMvvYXYY4VE76uZf44R5/iA73heS41mzwD/Fm+svv
 brWlXPmI7l8UtGIbmsywPCJ6s+AvkmdiYrhlMp97pcBr1PZP+WTSm0NKq4z5bDkSmYlKATHTNAQ
 d5Au8GFTNIfNjn5sVOM7WlI9J5I4hvCgei4VLjkVsVd4i/Cxr6RhSjvJPxAhdq1bUwZGj0H/xOG
 nfzDQ8ELrG3qsPDhj7jru0emLGCCXtLsWKrcy5/rgHQpji8t96N3zQljU2lUk91HOCsAegW1X4N
 YTjIdn46sTv/7CffL5w5Kq+39HB4vCKmd5OnnMJCGxzgO+iANXtZsjnaHoLYAmh3ZPTzEoHL0Ux
 gzmTjZneL9Vf+y5Wq1hHaZRaOwLDzqWq0qnvOt/7wFNTeRvIa0Sbq1jcZsGtjjQjdYFxK6CCopU
 a5Kll2KYv9C9m+wvKFBmJI4emrzA8fprWHMA3aSPugHFsok87pgXABH6XhDb9XbqpxsaXO+bxfp
 KXh6q2Qg191akJnpRDQ9MxmDIGs82lfkgsDY7BP51x2kBwSYMnN8ZA==
X-Received: by 2002:a05:600c:a012:b0:4a1:d675:b031 with SMTP id
 5b1f17b1804b1-4ac17b2bc4dmr32868995e9.6.1793351744597; 
 Fri, 30 Oct 2026 02:15:44 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b7815fsm2106312f8f.22.2026.10.30.02.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 02:15:43 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 30 Oct 2026 10:15:33 +0100
Message-Id: <20261030091538.1773417-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250820163921.1968030-1-angelo.compagnucci@gmail.com>
References: <20250820163921.1968030-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 0/5] Bump cups-filters to the latest version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
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

Since version 2.0, cups-filters has been split by OpenPrinting into
several projects:
- libcupsfilters: the filter functions library
- libppd: the legacy PPD support library
- cups-browsed: the browsing daemon
- cups-filters: the remaining filters and backends

This series adds the new packages and bumps cups-filters to 2.0.1.

libcupsfilters 2.2.x replaced qpdf and Poppler with PDFio and is now
written only in C, so the series also adds a pdfio package and the
toolchain dependencies coming from qpdf (gcc >= 10, atomic) go away:
libppd, still partly C++, only needs gcc >= 7 for C++17.

Changes v2 -> v3:
  - drop the qpdf bump, qpdf is not needed anymore (and master is
    already at 12.3.2)
  - new pdfio package, needed by libcupsfilters 2.2.x
  - new cups-browsed package, with the init script moved from
    cups-filters [Thomas]
  - address all the review comments, see each patch for details

Answers to the questions on v2 [Thomas]:
  - CPE vendors: libcupsfilters, libppd and cups-browsed all use the
    openprinting vendor in the NVD (CVE-2024-47076, CVE-2024-47175,
    CVE-2024-47176), pdfio uses msweet
  - zlib is mandatory for libppd, as it's used by the rastertops
    filter function
  - all the optional features that configure enables by default are
    now explicitly enabled or disabled
  - LIBPPD_SELINUX_MODULES was a leftover and has been dropped

Build tested on ARM (Bootlin bleeding-edge glibc toolchain, gcc 16.2)
with a minimal configuration and with a full one (dbus, avahi,
poppler, cairo, png, tiff, jpeg, fontconfig, libexif), and pdfio also
with a static-only musl toolchain.

Angelo Compagnucci (5):
  package/pdfio: new package
  package/libcupsfilters: new package
  package/libppd: new package
  package/cups-browsed: new package
  package/cups-filters: bump to version 2.0.1

 DEVELOPERS                                    |   4 +
 package/Config.in                             |   4 +
 package/cups-browsed/Config.in                |  22 ++
 .../S82cups-browsed                           |   0
 package/cups-browsed/cups-browsed.hash        |   4 +
 package/cups-browsed/cups-browsed.mk          |  36 +++
 ...ecv-instead-of-system-CVE-2023-24805.patch | 209 ------------------
 ...x-infinite-loop-caused-by-crafted-f.patch} |  33 ++-
 ...ilters-Fixed-building-with-QPDF-11.x.patch |  57 -----
 ...ated-code-to-be-built-with-QPDF-12.x.patch | 165 --------------
 ...x-out-of-bounds-write-in-pdftoraster.patch |  41 ----
 package/cups-filters/Config.in                |  42 ++--
 package/cups-filters/cups-filters.hash        |   5 +-
 package/cups-filters/cups-filters.mk          |  94 ++------
 package/libcupsfilters/Config.in              |  19 ++
 package/libcupsfilters/libcupsfilters.hash    |   4 +
 package/libcupsfilters/libcupsfilters.mk      |  89 ++++++++
 package/libppd/Config.in                      |  19 ++
 package/libppd/libppd.hash                    |   4 +
 package/libppd/libppd.mk                      |  42 ++++
 package/pdfio/Config.in                       |   8 +
 package/pdfio/pdfio.hash                      |   4 +
 package/pdfio/pdfio.mk                        |  22 ++
 23 files changed, 329 insertions(+), 598 deletions(-)
 create mode 100644 package/cups-browsed/Config.in
 rename package/{cups-filters => cups-browsed}/S82cups-browsed (100%)
 create mode 100644 package/cups-browsed/cups-browsed.hash
 create mode 100644 package/cups-browsed/cups-browsed.mk
 delete mode 100644 package/cups-filters/0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch
 rename package/cups-filters/{0002-rastertopclx.c-Fix-infinite-loop-caused-by-crafted-f.patch => 0001-rastertopclx.c-Fix-infinite-loop-caused-by-crafted-f.patch} (61%)
 delete mode 100644 package/cups-filters/0003-libcupsfilters-Fixed-building-with-QPDF-11.x.patch
 delete mode 100644 package/cups-filters/0004-Updated-code-to-be-built-with-QPDF-12.x.patch
 delete mode 100644 package/cups-filters/0005-fix-out-of-bounds-write-in-pdftoraster.patch
 create mode 100644 package/libcupsfilters/Config.in
 create mode 100644 package/libcupsfilters/libcupsfilters.hash
 create mode 100644 package/libcupsfilters/libcupsfilters.mk
 create mode 100644 package/libppd/Config.in
 create mode 100644 package/libppd/libppd.hash
 create mode 100644 package/libppd/libppd.mk
 create mode 100644 package/pdfio/Config.in
 create mode 100644 package/pdfio/pdfio.hash
 create mode 100644 package/pdfio/pdfio.mk

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
