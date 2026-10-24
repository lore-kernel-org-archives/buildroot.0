Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755D6606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 19:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Nv/1DGNa;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F04UEp/Y
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 533A940574;
	Sat, 24 Oct 2026 19:04:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k_6r4seN8a4W; Sat, 24 Oct 2026 19:04:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5F4C54057A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792868670;
	b=V3llRCNn7IPAlZ1DdSlg0EO++RS3IQ3SpqbuL5zlPPyyetkpFPw8o1HlKu/9ZA2wY5Kk
	 MCc/dYsOXE8YN+l8OptaboQ7PEcONxR5iZ5qVe9kzp/mgl2A/z7eQ7YkY6AwUh2vFWE/m
	 8HK/66cOckXHjFdrh3N2n7YVQdFiIhnqMtHAk/6Ut0QxQVHLWydmHaWy097f4Px+NdjWd
	 gzYPbUmupcDw5Qv1cGKWiJg6N/IvNDzPRWTLWBVDhfHevuvJF125lh899Tzborsr6INGX
	 ch6fXSytZO1dOfAhV26t+rXRoKHvXk/IBgRvcoTBM/+48Z8fLVcSAqXgFK0wTvR8Urw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792868670;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=0UAhmYLYL7nVwuvlIhTjt418mQzx64hYyRBz7PmshXg=;
	b=EZ/kLa+cQ9HU055//2ZvXh/4R9cX0sFBb8Zqy5oiVjThVGbELlmnCMoyTKEvZ3WaqqdB
	 /IYTsZDGJGa1OTnvFE/V2eKkaHrBlU8KhRoK75B7fHIaP6fjjy7ntSnmeG/+4/+p3CJRt
	 356LgOIN+RvUfCLx+Wtx0KNwTqSGCqUjMMc8FCWiZ05LCDs+K95po88W/mczea33wSujD
	 ShE3e5s6wuWisLD7XG2Dv5ZyuWXD6LzZoLrIBpgPGECVgdbVn8cAlAH/gB4cqVTo8HOIj
	 D3SFYGU8xgNPrRYlgnA8egZtChX+hLamjG9edmuU3AZOPh85SypcXbTU/IiE2vJf2fA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792868670;
	bh=0UAhmYLYL7nVwuvlIhTjt418mQzx64hYyRBz7PmshXg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Nv/1DGNag/nzNRhdXa0L5kJ3a7idNcbavzlHfEDhKnvW5yT6RBZg1X3V79U9zQEsb
	 ycZerpYekWaJRzw9a6gia9cVgXOjOs8rAsL94AvFS0quv+tHsbSWiGX+4W9DUkIdhV
	 shKDKv/iu/5iG747PdMIrBNIhe+IAoZou84XqXF30hip7lmZLe+ExoDcsVelPJlM79
	 fdug2wUOlGfMbACZv0o8QhRYFf6qbCiOOp9NmNa82a0FKOqlYZnLnh5bm9EPwQtB8z
	 OpCR/Jc2lQMpEu+Y6Ak1rOx58yfdalU3uFgdo4F5EhSsLr0FzAKdiw90pe/B82H73w
	 zw9WNb0pNqTmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F4C54057A;
	Sat, 24 Oct 2026 19:04:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B6DFA43
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A879E60628
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:04:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nlmjU6detJWI for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 19:04:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B886460619
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792868668;
 b=ml7ohz0DAsYKDY35vPgUjZUW+for5cvmo1CdFlijwLhWYOxlcr/Hp04Mvw5RAZ/5NtC2
 xGRP4X0GimXv5OF/WwXVNunwEDcIqJHjZ0yUyvA3PMrfCxDhtpoPvai9SWQu7BQ9mlHkB
 t6ahhlfy++nWv5MYRZUlDBKBO10ytXqiiR6a8MNu17z1+DLJD2F4wIvrnPIi+HeMjkS5X
 mniqlrg/eqzP759paHkOsJG6ixSrDPU5VMuseQlUUCR4j5lGnfpSjHgym8BIhWMG4AFbL
 qihemot+iPQ98W7BYX6So3JDOG/60LJe+t15WE5wvB7bQ0PwP/iNssxTPoifo5oqOTA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792868668;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Xvur9ZOwNSNgbKFkbOBnbMaWSnDSdtSKBPdSxU6f9Ok=;
 b=qUA2ZZNgoJZiw3LBm89t0D6+aa0+gyZPktm1Gl83fEKq3m9fdptctZF1FkRl+jm1LSt6
 RV2UFk7BoTD+WTa0BBm0rOmKSSBTUT2ZJ2Y+EpRX87dYO1JPbUGZvwqDUfmyPi2xcfbIh
 rql4Wvcv0HjWPwQQNYl3qzszbpXDrM+hEZiBWPYvQxggwL8pXYJTXmObpqZzBCZTqPwHq
 7TUlzEXGo0WiLcwAodPyLWbE0LZ6Q/pl6c4f3wvx+A7lyy1ehUUXmG7U8ZNSXpRic41Fj
 b8BpRaT+AdEnqvIgJrZyDiDAQWthc1MfjBqrtmn2FGEkSqCa62ekYri3eVcAy0hboLA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="F04UEp/Y"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=F04UEp/Y
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B886460619
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:04:28 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-843cf077f10so2060477a34.1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 12:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792868667; x=1793473467; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Xvur9ZOwNSNgbKFkbOBnbMaWSnDSdtSKBPdSxU6f9Ok=;
 b=F04UEp/YFYFHoTCSmhDgIK4m/w6JP5ooVbsmdDZvvArnpcKCNXrwN4h9iBdLlJSe9p
 cqve1mLXqLOkccdEA8xi+v/s8qYiJbAJ2mOtUPK5kVcAx4bfZA580JSrEEBOGw84zuDi
 DW0crI/C+oni6iTUinmpHWorRa6LUtXgPLSE1HBg5AU695azkDPLC7hemoOO0Sgg+yR7
 kkWmWzjEJD5vW+DNmHGAE0qFJm64iaXhBz93xVi2zb28qcGdQwcB+MsUZEfXj77q2yaq
 zQv71EbHYIfAFNVnzWqh+cmCSSeLAloiuSbfsrHKOT3fQ/iAh3Y607A80HQxczYOz//E
 LZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792868667; x=1793473467;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Xvur9ZOwNSNgbKFkbOBnbMaWSnDSdtSKBPdSxU6f9Ok=;
 b=XlOwTplsIp7v9SKtPNrOlaWd3UjVljlsiRelsfCe0CJPkG05s974XCp6TP5qQ0lmAd
 v9qY2VF/A03liBoMtLIjv6+kNQMSBK5tpB7OU21UHppT3k2p19MIDJosiUw4O+30/wga
 yot1N18NfIWx2F9RSozvirgftQE7ecSTQy/UEj1vAZfvjZ/XC+GYpF0pyOlbPyAFIZev
 3SSSxLvTT8e2woacbNACz7SSw8dKXbB5aGMHB5yZXCazJXA399tCjqnP8e1X+ZnFKRaX
 xAz/rEZrEbcCp5w9Zr3RfMg06IVdhGx7eDplasH+azX3UjPdTWdye2AnSupRwUWQ9qEd
 snDA==
X-Gm-Message-State: AFq9FYKUo1+Ny2CwYnjCv1JEY7Uc8DokDmZdGRL8ShiBNRRrJaC0+yp/
 wB2pvxzJ+IEf8EnUTpD8TSTw6EfH6u+OHbRj5I5LOA/AyYcLhrhhiKmqujrdBfyp
X-Gm-Gg: AYBFou3Rtdn7t2LjFtX4lGUuzlbg6gdwIeJHXteyIf0xsTTs2pKBP6HXSMTPYuzYabF
 cJDTgvk7C/WkHNasz4G2LDn9R86iu3a9dmaMGsQ6RgEeKhIi6tIqW5Nf3mHvMjv6aunhFnhvlDr
 Y8FnAroxTwZZehfruyWWqbI3lmIax29pA122/IZH0qUwQPM3AhO0gDYRwF+kR2+7rShAfmmnw8I
 f/GAg0m6tiAxqN8TnVKz19JnyZfujdPBaG2GkP/jpk/c6Bu0mFJOS8xR2ooaC3cBxp3+YyHwEaa
 E4Tvppi+HSfvPjaQlOccoZ9RBKjZ0W4Ha+ofzX2jn+8hznN0l4OJcKSfHxvHaBxjrXrSUoTen2G
 NSzKu69k1Vh7x5BqacEBJduJ9zuVKYD1sgDaqF4THKdJHZaeGd1Mp9T+TY37vtVD8GBtYHQMv2N
 hnTpDCMteLkrBvjABP7tTy45dyL1XMyNYW+L/zloezzzToZHgw9mjrKzV7Bb/N3CzmUPHItpb3b
 XQr2v9crBsZ8hU5CAStyzTr52rzK38SqGWCoIXvGVslYmIw0LainrOjRZOwvw9TsGb65HSo8Voq
 Y6iEIDDjwGzfLvR8ed4633kiBAZdV3F3qsTGiHNGusEIw/JNuqqRrzk7Oaz4esG7m5HPhFw4krm
 wMQwAlc6KLiW76RdV92YQa5lMjAxXdgzjmJv7bpAXQzeGZSwdfdUA1govh6Wv04k9NarWfHk1Vf
 SX9Z36yMjFpAg/Ujrh8EZyxBuV
X-Received: by 2002:a05:6830:4c0d:b0:822:b69c:ff69 with SMTP id
 46e09a7af769-850fe9d0eddmr1975057a34.21.1792868667417; 
 Sat, 24 Oct 2026 12:04:27 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-850f8458d8esm2984375a34.1.2026.10.24.12.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2026 12:04:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 13:04:15 -0600
Message-ID: <20261024190415.2070548-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-wcwidth: bump to version
 0.9.4
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-wcwidth/python-wcwidth.hash | 4 ++--
 package/python-wcwidth/python-wcwidth.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wcwidth/python-wcwidth.hash b/package/python-wcwidth/python-wcwidth.hash
index ecf1ce3d7c..b35c57931e 100644
--- a/package/python-wcwidth/python-wcwidth.hash
+++ b/package/python-wcwidth/python-wcwidth.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wcwidth/json
-md5  5679851d1447f3c3690cf67e09300c3d  wcwidth-0.9.3.tar.gz
-sha256  dfe7cfbd4cb59db9fe0931bd6091ab4a95b3acc5d56bfb50fa9fef0ccba5dc5c  wcwidth-0.9.3.tar.gz
+md5  51b77cd684d54bb58d330043f428987e  wcwidth-0.9.4.tar.gz
+sha256  fd8d57d3cdfe570e3265c8fab1885c24e34ef40889c0759c0c304a19e9835954  wcwidth-0.9.4.tar.gz
 # Locally computed sha256 checksums
 sha256  70b98a95a2144eb70af8017fa8c6d95ce247e40867436e8bc649e137fe13d21a  LICENSE
diff --git a/package/python-wcwidth/python-wcwidth.mk b/package/python-wcwidth/python-wcwidth.mk
index 60914a4855..b0e828604e 100644
--- a/package/python-wcwidth/python-wcwidth.mk
+++ b/package/python-wcwidth/python-wcwidth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WCWIDTH_VERSION = 0.9.3
+PYTHON_WCWIDTH_VERSION = 0.9.4
 PYTHON_WCWIDTH_SOURCE = wcwidth-$(PYTHON_WCWIDTH_VERSION).tar.gz
-PYTHON_WCWIDTH_SITE = https://files.pythonhosted.org/packages/69/4a/82d61476a1ccc20d43d0805724c5de4baa4971131a8db1816705ef53fe16
+PYTHON_WCWIDTH_SITE = https://files.pythonhosted.org/packages/ea/01/e5ac23733628a6bbb91913a765fcf55ee8070d8d991bc88fdaaf805052c7
 PYTHON_WCWIDTH_SETUP_TYPE = setuptools
 PYTHON_WCWIDTH_LICENSE = MIT
 PYTHON_WCWIDTH_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
