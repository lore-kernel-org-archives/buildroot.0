Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C74C606A31E
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 16:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LNSR0F0Q;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=XTCxiFKa
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E583280AED;
	Wed, 25 Nov 2026 16:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SbsvRJpt4ubw; Wed, 25 Nov 2026 16:14:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DFD0080C0C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795623270;
	b=TclJNSxtjyUdAWgn2GYXjWoNmcUUESCc1JRGBjHl/eRSqWATvimYSthRxxq8j2aorHaD
	 a+k4UxWP3fpBqO7M+EL0uKGFa2xw2llxo3KbCmdT0T44mH/brcileULwfO4ltpS/dqzyR
	 y0QwUZcu8ghKvnhHOybbUv6Pizr27sw0//I+JxxhHWdkbz+29sIpMQdWTFGy9HcHuRVgR
	 bnBMYqTvvF0fkAM3JyreuxacZHegn157qKDmuSO9FBhKCm1a6IyUinIphHuPXSkcjv0JR
	 PQASBccDGTSmtD+DhPDH1trVWdLwp6lz0ZF43ss55hv7RQru278FfVmte+tu+qBnpgQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795623270;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=DRMfUTbMRUuNNFl2px9gvdo5TyCvF1AXb1R7rS0k2yE=;
	b=V5CAizxrciro2B2CTpKhDhDpsLOQfJFmczFuLzoIA5k5bR0cQZHT6QmfgDwEJrpdBQc0
	 MzJNz8c+yMkKFDXkUPE/qnz2OLQ1qHPLBd1ys2UlN5TBVyKC0sGG1+/1csU/kMy9jmOD/
	 ID7l1j5XGTYeCC6GvCznhrwWpKObmmTNX34OOutJz9l6NPm1Fc9Bq1hZgl/qM2cPRAnvd
	 kNkwoY7PY8ivNbfIOICWcWFbF2j9dHYduLQpdDDg7mnYlRbS0TTZnjQAK9IwFkCdk18Sn
	 LMKyq3Nk+UdHX+QLkJqUOQwHRu4u6qgzM7749rYA9Nua7fahgH1fvMPG76Gdq5UyUIQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795623270;
	bh=DRMfUTbMRUuNNFl2px9gvdo5TyCvF1AXb1R7rS0k2yE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LNSR0F0QwORna770di3Yl5lHBNTMyKpQfQRJU+G96eJHKNf7B4KpWu03hj0PW+6FT
	 tzjFP8jiwfUAELGAvoWGj0ghSrnPlgvw30wpzzR6Fe1q2h7AwZBHBZTUWs/aIdMtjk
	 0/UMWqYtcAsU8jnxBy8yxI2nu9OneHbAq6kLq36xFaSaH5Ac/kah66gWx66i800Z+I
	 dE+xS3da3mfpDx34XsiDs5rxVDdIe8tOfhGW27+N8G9+J4R3Jon+8Mb4oXnJD5j6Vy
	 15guOKMQSqWFfm+X3B7UxCArfwMS/VqsGHdXZlEyHQapEgR1RAf1r2dnPiYbwZLsSv
	 brBA9H58GNUTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFD0080C0C;
	Wed, 25 Nov 2026 16:14:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6664C1C9
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60B72405B7
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bOy7LSmgQle8 for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 16:14:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0492F40505
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=XTCxiFKa
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0492F40505
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:14:26 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a1fbd52ab6so40693105e9.0
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 08:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795623264; x=1796228064;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=e0/sJNItq1Z6Y4IgJvjUOVlkF44BwYAUFumgmop9BqY=;
 b=XTCxiFKasNcR1Pam8fSJcMOIUpHOO4ZsLHzF0q7iqPmPvzxQoxzBJfXI5/ni7kONNh
 aM8HIwyZBwx1RlHAf8iEp2b73BEDt6o/8yOYw3wCTF3dwwcKB+zzTW/Em5Vmmif+ewuf
 FY27SiAp+M2ff2fikAlRRoFc4WD8sdQljMAzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795623264; x=1796228064;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=e0/sJNItq1Z6Y4IgJvjUOVlkF44BwYAUFumgmop9BqY=;
 b=cR++DkDj57oTBYcVHxvUaoNHjY/EeSugjbbA7JPAXJ5Cx+LKdaY1vbMDR1fnUI5uFX
 lFpi+OkXDOyvz5qowtdGuvS0MC+3C67ysjYRPkQiJtRTI4BnLhgPqliofF8wLN/Xv5vS
 ILdza6+e0CBjGOoz+XiYofhqoLD8eiNRC5b2QJyioHamiQHejtdSm5saGt7k0NZz44wA
 B4mK/7UKMMrAjNNT2BQfbcCHg7gOwT98q0picmGa7+ALBRyFLmUCLshdBpKuch3FWHiE
 7oG2C40inYwHoC4xwDErL9ZqTwYuw2TVOnr+6gD68l8Wtp7jqb6pcxH58rRBEOEh+naF
 yq4A==
X-Gm-Message-State: APuU4Z/X7U197FVPo2EDi7M8Lib1LpyogRpxC2rFGoNVRJYg70NQv9dm
 gPC3Z8OL+Mvt/VeGP9FO8u0IB9NPJGgPcXgLu5I6Zw2b6ZYXYEEJ8kf3zIEC5l0d3fgc18YKfuz
 AvSPw
X-Gm-Gg: AZFdTZfcUUXj2vZsDfRh6xdiV62SjnRP0VgTe5pz+ATwudmLdBPH0t8I7xZIdNlzWK1
 0PjmZgkiifOwph0w8K7Pe2Rgn4Etw2EuOnit5nNYCDorxoZOIoo49a0mahZjPsERNDvNhVd3gJV
 DllNjz3d9P4GBnntYWKOqIdC454rWsxRdJwxjRuPEuRLA6tYKEBGHXAVy1ZO+l3TBVHevAmzJaq
 pBCjI7Lm2i4Wh9OmucQr+xFew9TxowAdD2CKxiF/LPAlizmmDjZ3lNQduD67v9xJMSiNaHR4V1f
 5hyE6B6C9LEpiFeasqB4zvxX4lj2+cG0Yo62Wmb2EJUpNg28xpJH9zApQ+7A+RzkvfS+dAxPytV
 577ZlOvIliTyc9iPtCb0C6iVTZv2vlGaYxxJlFpkQvCXEYycKsQIiF6KSSWDHkFnkU6iXViXx4G
 EdJ93xsPXmr9T/a0oxchLxL4RpzR8pIAzXQQ2IkELl8t2DL33i2XCvSLQvo/1hYab3+T8tvBesW
 OAURQzZuqUx4bM12q9tEe0/NA5rQX6hGggvpTYZBgfGoVyhovQlUA3faDTNWv71Ua6mJ/0pOH/5
 s+iG2orvgxYCwL/lzjCxW53h7Qc2+Na1JKh5BBhsWcFpDrFWC1cMQn+oVGP2wNRkwnkcBzvHDjF
 TPwqFVnHsYUj0Yf0/fo0EJXfXxW+pCb1RE05pRL5/hgsp3QnW2RluAkZ0SVl0UK5NmE2aWqFA5v
 OkMCzKZpkEzNJe4OFq7oaEsw==
X-Received: by 2002:a05:600d:1c:b0:4bb:9dbd:feb7 with SMTP id
 5b1f17b1804b1-4bb9dbdff35mr128322105e9.9.1795623264321; 
 Wed, 25 Nov 2026 08:14:24 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb88402ce9sm430741055e9.0.2026.11.25.08.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 08:14:22 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 25 Nov 2026 17:13:59 +0100
Message-ID: <20261125161404.859000-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v7 0/5] package: add CANopenterm and dependencies
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds CANopenterm and the packages required to build it.

canopenterm was build-tested with `utils/test-pkg -a` (26 toolchains
built, 6 skipped), isocline also on its own. CANopenTerm 2.04 was
run from the console on the STM32MP257F-EV1 board.

Changes in v7:
- Rebase on current master.
- Drop "package/sdl3: fix build on PowerPC with uClibc", the fix is
  included in SDL 3.4.16.
- package/isocline: bump to version 1.1.0. It provides its own install
  rules and always builds a shared library, hence the dependency on
  dynamic library support.
- package/canvenient: point the Upstream tag of the patch to the merged
  commit.
- package/canopenterm: bump to version 2.04 and drop the fake
  CMAKE_BUILD_TYPE, no longer needed with the upstream install rules.

v6: https://lore.kernel.org/buildroot/20260824063843.839745-1-dario.binacchi@amarulasolutions.com

Dario Binacchi (5):
  package/sdl3: disable m68k builds
  package/pocketpy: link with libatomic
  package/isocline: new package
  package/canvenient: new package
  package/canopenterm: new package

 DEVELOPERS                                    |  3 +
 package/Config.in                             |  3 +
 package/canopenterm/Config.in                 | 27 +++++++++
 package/canopenterm/canopenterm.hash          |  3 +
 package/canopenterm/canopenterm.mk            | 23 ++++++++
 .../canvenient/0001-Fix-build-with-musl.patch | 43 +++++++++++++++
 package/canvenient/Config.in                  | 13 +++++
 package/canvenient/canvenient.hash            |  3 +
 package/canvenient/canvenient.mk              | 14 +++++
 ...nly-require-CXX-compiler-when-needed.patch | 55 +++++++++++++++++++
 package/isocline/Config.in                    | 13 +++++
 package/isocline/isocline.hash                |  3 +
 package/isocline/isocline.mk                  | 14 +++++
 package/pocketpy/pocketpy.mk                  |  8 +++
 package/sdl3/Config.in                        |  8 +++
 15 files changed, 233 insertions(+)
 create mode 100644 package/canopenterm/Config.in
 create mode 100644 package/canopenterm/canopenterm.hash
 create mode 100644 package/canopenterm/canopenterm.mk
 create mode 100644 package/canvenient/0001-Fix-build-with-musl.patch
 create mode 100644 package/canvenient/Config.in
 create mode 100644 package/canvenient/canvenient.hash
 create mode 100644 package/canvenient/canvenient.mk
 create mode 100644 package/isocline/0001-Only-require-CXX-compiler-when-needed.patch
 create mode 100644 package/isocline/Config.in
 create mode 100644 package/isocline/isocline.hash
 create mode 100644 package/isocline/isocline.mk

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
