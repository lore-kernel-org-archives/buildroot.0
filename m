Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B451DCA5FA1
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 16:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71931606E2;
	Mon, 28 Sep 2026 16:20:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3g5zoPcbGYNp; Mon, 28 Sep 2026 16:20:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 82010606C2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790612419;
	b=qIrhkXiwWwhXN8v3isDhy8+wxMMw9Xe8vybqKBGhbvobBE4d/6N+619Z2C9YzIUjef4w
	 1enVCiqs1qLDoS2z4yRbnhn1gSe3U1GBRQIbFBoogivBTPhEtLCa0GhuI8lrCdp68IUd8
	 k4lXPDg3L34521+caOHTe+9P7mNByZhLlonC3hp4hC8zx3Razmxo2/yl+CkdrrIeQzaAy
	 2yyo7k+RBTd9fqcqDJwWMhxU8iq20KnZW5ZT2HnOM8RZ7g4bGx9JzvmFccKW14e+oEezM
	 rFoUBTnVqvHac79LMt8Tfvkt+15gWY+wnS9fvYpcE0X3FFyi/GUUJjv5zG9MVmSSI9Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790612419;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xT01kovJXgUr/XCY3RQUU4yHSh8EcUdI26w0rMXZO+4=;
	b=slCsXZ93AlTcFH3IIyLV0VfVTok8S8j8JTqbn5FYZZaUdbmHxZqRBEF7T0pjjw1P5Ro0
	 E+UIxQQegikjNUNMwsHahk7+bfiPr0Tp+jKI970uiFmp802cNsdygcKu6SIZhJRg00i04
	 sa9vNGKaQzPdkvawfSFETaWO3J/q9hdGcAYN5Nca1FH4KYqIay4Dom9gztRcpTFQ29hVO
	 ldKRu/6eXOgi8pinjWumrILz0OULfQ7qswpbMhhuIa47BZEW/9W7KPhQn0Yv6uUA5KspE
	 StRpZ35EH3i5tVn8aSVxSyJNhoc7ck4RMfI5vr/FLPE1s4CK/uL9u+Y8smlkOmCtylA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790612419;
	bh=xT01kovJXgUr/XCY3RQUU4yHSh8EcUdI26w0rMXZO+4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jrHnY2EZJei4S/JJFw9EMcjzcVLjKygIvG7d9bZRsHO5LdlBNXvQXGg4xn9dysd7t
	 xTRSrq63jOdl+Cfd4Xtb8WUW0Eo0vKOCGzZS2xxqg/BWogyKVxKIGOSn+VgwpK+23E
	 z6Vp1OGQSwEBNYt8hoA0sQlY3vlEM7M9R3m5l5MaiJ3RExC2G5tJ6jj9a0SnhdKETh
	 fg4rIRbAa4Clt5bz0v+xFlmi0KGiYrFJjr5Ojt/jH8c2QcHzf8sAaKy+6pCtrVevCV
	 7EnzovERpOkSQrn2EGRbtCHZk5sT+t5MhVu8L8yS+mQjrEcISePXqImnhWR7Jtt/7N
	 ggTs49eemeC8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82010606C2;
	Mon, 28 Sep 2026 16:20:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A96A3A0
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 16:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7019780DE3
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 16:20:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SOn5NRoQvlnZ for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 16:20:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 57F0E80DDF
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:30::f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790612416;
 b=svatKlrP4++tNR+e+7SjX4EsyYKU1ecP5CxvIkqyJ2AxEOKBmxxxqEKEzSWC3SeiFeow
 qHQR34sEo4hr9wsE2hJM2ryiaXjHPNlARU8wgVKna13ru//VsKPFANB0M9y2d/Lwuaz2+
 AcA5JN/LSEoQNd4WHZuhOKOgB00NrYBQ4kcG6oCGoC8yBov7UYWD31DJYb5bBImKaV0h2
 cyRXvc//hvBFUBO8nHU9ZpyRFhFqzaVxSjhzKp0VV78rMwMVR3+f6ncmrvNVimuBCh6ml
 6/4SRIKtyBiURNt0So27VTvpPEqd3CnjvZlYsyGipOJs8xueCnR+MYYRq5i18bCYWsA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790612416;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Bdj8VCCgkmcw3HHSuZTbxNrIkGlWmxHsWpAwKZ39zH8=;
 b=joobTiwNaTgJmZYt8uMIFJtdv2jhvidJXKIFsADr5CsvTDHGw3TDpxmlc4nTr2qaay2y
 UdWSivhk6L5Ay3Hxn33edXEHirQVwh7FcDumkaX+0Xtny4rKDvuB0ikNXzCJnxJd8+KwX
 cFtzBJjr+QfIVKl80RtQK4Gcye5LdfpCbZlD8zzxQvGgdj3TqQlyCZPjzXdxtAxxekZix
 lgbxZGp/ZE13BEQTG/LcnzHVfufMLcXGWlgJe5H7Wzw1WqZ2cCY1XzCMGfe2DzrKTWZs8
 j6phfrQAjiQKpOqftMTFzlKyOK0n4d1ji0RMQ4oaElGqQBLbH00ExDSrFWBwg/g4ong==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=amarulasolutions.com; 
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=B8vWiTZn; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:30::f;
 helo=mail-wr2-x0f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=B8vWiTZn
Received: from mail-wr2-x0f.google.com (mail-wr2-x0f.google.com
 [IPv6:2a00:1450:4864:30::f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 57F0E80DDF
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 16:20:15 +0000 (UTC)
Received: by mail-wr2-x0f.google.com with SMTP id
 ffacd0b85a97d-48881a62e09so1898892f8f.2
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 09:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1790612414; x=1791217214;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Bdj8VCCgkmcw3HHSuZTbxNrIkGlWmxHsWpAwKZ39zH8=;
 b=B8vWiTZnGsDsv3mhrbt2E5xsrEDntWIjdZP5dZifInuRkMG6YPOmCsGN/+nFmJwJDm
 Q7L9EQOac/E51B/krg6HMefZO5I86mQwwgJpHo4L+6mIGo4pTNFydt/oz4rBLpwn6QIP
 R1XodIVZwAB9tm/w0yLZt8ZTlTjW6Ym/8SCkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790612414; x=1791217214;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Bdj8VCCgkmcw3HHSuZTbxNrIkGlWmxHsWpAwKZ39zH8=;
 b=ji0PH6l73uOZ1aKDNlL52dxF0uOu2BNj+GuUBxyDWHhhDK2rYp0tWPd4wuilBgAUSN
 IuLfWRV5p+YmJgfK6CsVUIwKwiC3PdzRyjYQlcRqpl1jKBtx5WcHBj95ioEbhDWnAYwM
 XLY3ndqB9+gGckvorD/Guz2dsUq2R5N1ho8dFnVvEwPLAGL3DNqFMiLhegli33sAzcUi
 quHr/dYd7IeiyupPDDApTfpCPVyqAJjzpjY3wHIkv/WnGNrFNGaTw3Np1zzVGs+y3p64
 thHJ+1ZfFepJ2bpS9FUm4su8Tj4EqB1tPXWHf2/J6fTGTEejKNvjOJshr+HSVz0QD4Sb
 0eUg==
X-Gm-Message-State: AFuF++mKJEAJ00Xa3I3+jLQcHZo2RHutVQ7r/SHgqyQ1ragBEw6D36Hv
 aYvYax5jrEF+kZpFXBp9bjLB2eXEIE2ceZBFEoQMtc+OytxIwvL/spyg460xpRfl+yWVzbYUc5T
 cJ9aFV3E=
X-Gm-Gg: AYBFou3aNuNrTDJMlZ9wf7pJZGAVPvohlz+DI/Tgz/mME8oP8WPCytedIMyzXsnaMfs
 0TChZL7Jsmr1C//MYNP1Q8TMm3Rp5o8L0BcD6pIB6slmSwk3omDCjaQmgIZLLADRUiOzWsHXtQC
 Pf+lqO2lz+M7Mp2cTVUZt1kxzCYlPxcbFbc+iMeiTPDfcnCSUfW54hChyej1JSnnVLCxIyTCUq9
 a90W2t7aUHthWFflfT0oUcLVAT4+H5BYw4ns8IFvR8uNnbfoU83mgiy7Arcvd0ZJfWVw3KQHVB/
 qjEkO/sX07PJHWS4uKbMoF8LYER5OkuzVgK8szLcNlDpj/eXQo/v6T4cax4nhAzf/MTEeIfEB8p
 X9fQewoQm8rDFcb2N1L9iQFun7AYHDj46984QrCvPswR6APqScRVJs4JbawrAjHsQzLZdgAEb2h
 GM10NkfgFRhLuTfKqb7VSGbgaP4WxSlY9hYQOoMUEhFEuuvX5m+zaM5QcDLx8Gaih/Yr6v7+v9s
 57fZ0pb05PMfleeBCPb5wAgWAqwR3ZhGbwnLYtD0/XkU7JDk7YkBY2sVpR+kKov7d9WjUP0Hqtr
 D9U/e9H3eNiAuMr2vBdlUulCPILZZfZaTsUV0CA9nhy2a2f6MD870PEJ1Hc+sV9o7g+Mf6Y=
X-Received: by 2002:a05:600c:83c5:b0:499:bf0e:95c8 with SMTP id
 5b1f17b1804b1-49fe66c8623mr228515115e9.1.1790612413921; 
 Mon, 28 Sep 2026 09:20:13 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a355d96sm30608019f8f.17.2026.09.28.09.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2026 09:20:13 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 28 Sep 2026 18:20:09 +0200
Message-ID: <20260928162009.3463944-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/atf: bump to version 0.26
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/freebsd/atf/releases/tag/atf-0.26

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/atf/atf.hash | 2 +-
 package/atf/atf.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/atf/atf.hash b/package/atf/atf.hash
index f979b8b0521c..ac6fbcd3b1b9 100644
--- a/package/atf/atf.hash
+++ b/package/atf/atf.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a52be96b5565733e71df8d0ecc8a4255a495e45183de7e3657491e0a8069423f  atf-0.25.tar.gz
+sha256  bae70930bef565faacb95b10e5673601df0d7f25db720cc735060d115c92ee73  atf-0.26.tar.gz
 sha256  2a15172ddf6386297734c9800c899e6e8dc16c5a03931dcf95a9ab321a24cfe4  COPYING
diff --git a/package/atf/atf.mk b/package/atf/atf.mk
index a49d32692da6..8db1f92d5904 100644
--- a/package/atf/atf.mk
+++ b/package/atf/atf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATF_VERSION = 0.25
+ATF_VERSION = 0.26
 ATF_SITE = https://github.com/freebsd/atf/releases/download/atf-$(ATF_VERSION)
 ATF_INSTALL_STAGING = YES
 ATF_LICENSE = BSD-2-Clause, BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
