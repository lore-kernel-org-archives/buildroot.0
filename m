Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDD8CA5FE2
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C34760650;
	Sat,  3 Oct 2026 01:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rb87fMZDFXls; Sat,  3 Oct 2026 01:48:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 271BA60666
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790992127;
	b=nr0gtcHBUYQIiiF128kKrUJTvn0cHGdaGE0uS3W+/fY/gWqEeBSdMsEzitMmYJ00shdw
	 O4gEA3zOVb4dAB/6Wf8H/qHMd5R2vgp07fup4pbSrEWpMSeHqjrfjVlHNSYmqOx4p+UQu
	 TCesFXEB1LObvGyRZec1ZbdTKJNOWZgz5lFDE5A7vJo5FtBfJ2Byry2K4xkoTO83ekaVf
	 lUDdu57BRXTaF4Y4I+vn0JV+r/l4Sn4joObDZifVGS3MLtze9ny+c/oFnyO8nB5aa13w/
	 2t0dsIj8Z0UZF7TWnJivtn2PClTDduolDQiAgzyrYNvs5emidHU+2GBCsXM2OCoKoDQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790992127;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=cvV+Bv7l/WpwjWA1wHZPp16hLDfr3k1BLvKeIovukXM=;
	b=W5EyjUHOE9Op8h0XfTW8Jei56u5HGQ2sK4dVjjCa4rXyIYZgNSnS2q0kyg7QYwzMTSza
	 a3lWJBL9LGNkWUijdoiQlIvA1BXkUm4JHLbe3Fpc7hBNPdSNib2xZAbsHN+2yhNpLVViH
	 0WER/XWn8K+Cx2AmerQaphtNnSQ1DJyUMfJOOWd2JvrdlrYKiJJhZXQYHRu5HsRW1/fi9
	 vt1pDy3dx72Z6LqrKBODmgQK4S+5drLPhkFL+5PlB8wegDDgZEsCu3Pp6njA3D4syqvYE
	 Za+qUiZYYVXQ3Ot7LDNRUCgK+mSqo+W5e8hCsXqiExHt+z83r5FwI6FV4dMLxudqftQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790992127;
	bh=cvV+Bv7l/WpwjWA1wHZPp16hLDfr3k1BLvKeIovukXM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=cGfeioV7pxPtjo85V8JFyHoPotTrVRprKGXmvL8cDLhKtY4uThhaTkspIW5hUW9XC
	 LdcfA4P819JFaFPcpTvhi7ChbucISJNDc6r+RzhxL1uwQ7WX1tZrMQlP/PlXpvaVpU
	 pOQvNM03FC/9C6jXPCPGxYLDteQD/oCYz53DnbfTkGZofBB53Ln/qmQClvwxIPbbcq
	 1zyM53K4qWRWMFA9fT6su2wTpLXI5rQ45XKdlxMh132XFpQ8HnT7X8R8YDoiSKaeD2
	 QswVpgAfbeOX9LomS1i48FYqEJN5l30KPbfXM1zkb3gyxfaczcKAm3hl15rsFLLh+Z
	 iR9v+JOzcNrvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 271BA60666;
	Sat,  3 Oct 2026 01:48:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AC3C31D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EBB3400C8
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:48:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gH9uS168uvJW for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:48:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A6515400C5
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790992124;
 b=OQaPNC9TIYmWiAd94+p2YfdWvYY2pp7S6AN0wNSlStqy/vAaojL/RR6GzKeMTuz9TMgR
 pLvS7/oeJB9m2ruAncAd2fiJeOC/fI/GEA5GvXrr2tSo/rSzDNm3Bkyk3OjwhNg2aagOs
 ZRpNyX1XMkjA85qecx/8ge6HCHBbB91gJsXOkh7p77Effq5Hyyt8QM9cTW7jXeT6XRCq8
 m/ff7/rpxjyw8Njz0mv4xyCiqPO2BqFe7AHfKPxxfVDq0nSjtOubw6MTHEoBL86TA3qI1
 J2SP3PMYnh3eS/NWYhClvwuHQS1WrP1f5fboQL1o7lVOd+ugd+MaX/MBz2oIQBCLQEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790992124;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=G97CNzFIVZ1QnhSsDhyP6G8CxIauCFXpN2eAiEk7TN4=;
 b=hdq7/uuhOJWY+IKGzpMk4zbDLgHXa0Pcg4T4rUo2Lw2LY1yBwr96w2qjaLX07a372uO4
 woo9fEMwClCOq5ECyxAptu2K5m/GyUk73T+IoV15+aGv2PYopzTBG7wb0+3nqTC/jHJb8
 edqKGtb7AUxD8clP0YOIQRpQ7b9RQd0+wdsSFHv+3HEHhZM2SfzY2TjIsTZmUQj9fB4HS
 nbDuKbFJcRU/yXh1KOdv4sXQl0XuEe2e3R3Lbx1YyEx1hjiJqG5hY4xiDfeHvzArcrFRA
 FBBjIeqi8t52nde155A3a/jVNLNIfWXwHcI7NvhpTWMV8Job/0cwbazTdL7mu5Z3HYQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=HGeV32i4; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2b; helo=mail-oo2-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=HGeV32i4
Received: from mail-oo2-x2b.google.com (mail-oo2-x2b.google.com
 [IPv6:2607:f8b0:4864:31::2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6515400C5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:48:44 +0000 (UTC)
Received: by mail-oo2-x2b.google.com with SMTP id
 46e09a7af769-8243e4db9dbso60267a34.1
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790992123; x=1791596923; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=G97CNzFIVZ1QnhSsDhyP6G8CxIauCFXpN2eAiEk7TN4=;
 b=HGeV32i4lLFMcGU4F+q8g6hSXjNWCQqBCpeKJGH5c8DZP1lJsqqyKM4SRaRlt61PEL
 oJlPuO6DPO+hQAp0Y/xtW7xP4aO8xZVu17Arl1fd5rvi4vDhjqz3dVm0FWdVeFibcAxh
 BLr+KbzY8zZe6T9XvshC3D3VX+bHRupCdbGlihB0/IhCTH0chQodIozbNL6mbglZ16TL
 kgN+8Vms6K/sbCN5RL3SmP2hg7/Ueqz3rOS699Mk/ov1KgewfKkc73dNrbEnKDW591g5
 DSHbr5FWtfwriNmGO28ODUP0TJ7ujp0W97Vf2Q6N8B1V8ax80qEm0M58rxJRd4r+D5DO
 wORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790992123; x=1791596923;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=G97CNzFIVZ1QnhSsDhyP6G8CxIauCFXpN2eAiEk7TN4=;
 b=egqTIH+orcgZUGd4IrAijRZeiPsPTbend/wjnctIU3O4PERcuLHgcILqW4opnxTU4V
 jgiM4PoVTTOWwKiubBlQaGADrDB5+zzczl2U7G5979Wk2O132pqVtE9NfhuFA7HdPoys
 g349Y2+uisHko3/h6oA3JHTMj+4hbSC6p4ER3nuBqeDS/x8J3VJVY1RY0bBW+6f93YAV
 5ByV8d5By1ohpPsCPlDtlo3T3/tgRpWfuchSZD3sGeNrFbxjCVFPJVQ/0pnmYmuy4MtF
 kGrp7fgfCip49kgB4jGjNNclNFtswPeWSbyahTjV9dUBmw9C+DJeS3n/z3k4/7qDZxsc
 6alA==
X-Gm-Message-State: AFuF++kuULADkxDI4cOGIH2SJAs84CXNyTyMv9h02mrvvimdFfPcQCH9
 KZzwb9liEDK7S9qhF+dJQq8FlwPSGXiHPubXsxvxwWeXbM1kXKF2Hfw24XFydg==
X-Gm-Gg: AYBFou3PNhogCvKdOUxKm0oUjGFZ1z4YI3w567voNjnS1M3jOL0qhHDhJjX6C7ksU7k
 Lmdfsaf2UAYeqH2ZOOJw0TFz0TPAfyxwndFMR3xXJSvoKTNpaU1E/PbJGdv49vOuO5LYs4bIb3g
 YTQhPtojaVJj7Z9XqRvr3MbUwc5zqeqpX5isxb/LfoHrGYM5aj1MsVR+wr2IQxlUbNngezJr75t
 ecxaw65x8xDlPAiZ8snJ3pveKqcIM0WS4KE3LlxXTdGPyXnl7dnBuiW4tM21567Wkt23T5qXtjK
 +I25CZaXIlyIZD3eCNHDz5QpVTSYdEYihBc7ix7iMd4WIjm9nCGkf/A8ku402i1yIk9Aldl38GL
 Qa2G9L/oCJO89jQIgTp20lXhMguDA3uftMtNlNxM1zdEpI+6xIno9H08sqyKgMeyIDGF/LvD6Dw
 c03b2S97szJAE+dW4TptLq+7X9ShLp5vbUgWv2JSnlZ8ViYBFT0ywrWfO9Cg+M3Iuvh2fcuTVVk
 BwJO8+72n33+WPDA5lKPyjndN23t5aGBVq4QNqUZURvnX3nWpsKked+2L3jfwx524A+YYTHogSf
 ft3jw5wd3T0xvEhbk07Gm1m9y0uSW2+TfqLc9iVXtk3BAimF7uH9FgadR7p7Ln13ouk/8frEs0l
 4i/17eFWKR3DlvvQuSMbuYBbHrl9Zt8zdNzi5BetEFAM=
X-Received: by 2002:a05:6871:331b:b0:46a:183b:abd6 with SMTP id
 586e51a60fabf-49e15c63391mr3631940fac.16.1790992123109; 
 Fri, 02 Oct 2026 18:48:43 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-49e16e577c0sm3990524fac.10.2026.10.02.18.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:48:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:48:22 -0600
Message-ID: <20261003014837.403895-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-dictdiffer: bump to version
 0.10.0
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

Switch to the hatchling build backend and add host-python-hatch-vcs
dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-dictdiffer/python-dictdiffer.hash | 4 ++--
 package/python-dictdiffer/python-dictdiffer.mk   | 9 ++++-----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/python-dictdiffer/python-dictdiffer.hash b/package/python-dictdiffer/python-dictdiffer.hash
index 4984595346..81db815d10 100644
--- a/package/python-dictdiffer/python-dictdiffer.hash
+++ b/package/python-dictdiffer/python-dictdiffer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dictdiffer/json
-md5  524b353b969300d4dc6aa6720c953657  dictdiffer-0.9.0.tar.gz
-sha256  17bacf5fbfe613ccf1b6d512bd766e6b21fb798822a133aa86098b8ac9997578  dictdiffer-0.9.0.tar.gz
+md5  0395b09a297b76172bd55da70dbf033c  dictdiffer-0.10.0.tar.gz
+sha256  0b912acf663949d73b820d3ed59362140a188ab742c94efe13c762dbd24cbbd3  dictdiffer-0.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  1f9e05b3b9a6fad24cc67455578bcdfd3e89b09a25c45369a5254203bbe2bdd3  LICENSE
diff --git a/package/python-dictdiffer/python-dictdiffer.mk b/package/python-dictdiffer/python-dictdiffer.mk
index 569f923a9a..e81617356b 100644
--- a/package/python-dictdiffer/python-dictdiffer.mk
+++ b/package/python-dictdiffer/python-dictdiffer.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-PYTHON_DICTDIFFER_VERSION = 0.9.0
+PYTHON_DICTDIFFER_VERSION = 0.10.0
 PYTHON_DICTDIFFER_SOURCE = dictdiffer-$(PYTHON_DICTDIFFER_VERSION).tar.gz
-PYTHON_DICTDIFFER_SITE = https://files.pythonhosted.org/packages/61/7b/35cbccb7effc5d7e40f4c55e2b79399e1853041997fcda15c9ff160abba0
-PYTHON_DICTDIFFER_SETUP_TYPE = setuptools
+PYTHON_DICTDIFFER_SITE = https://files.pythonhosted.org/packages/0c/31/84b2b2113c2c972431582bffd74f0d04b5efd9126538127b766275580950
+PYTHON_DICTDIFFER_SETUP_TYPE = hatch
 PYTHON_DICTDIFFER_LICENSE = MIT
 PYTHON_DICTDIFFER_LICENSE_FILES = LICENSE
-PYTHON_DICTDIFFER_DEPENDENCIES = host-python-setuptools-scm
-PYTHON_DICTDIFFER_BUILD_OPTS = --skip-dependency-check
+PYTHON_DICTDIFFER_DEPENDENCIES = host-python-hatch-vcs
 
 $(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
