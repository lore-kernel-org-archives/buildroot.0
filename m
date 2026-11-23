Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97AD606A31A
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 17:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Aqsdyyzg;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Z2FoKJ68
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3BE460711;
	Mon, 23 Nov 2026 17:13:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0iehM8DWHyy0; Mon, 23 Nov 2026 17:12:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B084260640
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795453979;
	b=JvMxgl4RhyPy1VjODNYTzRPF8YltiZ1cM2w1hupCH+ZZcNOF8mcm5b7GXK2NWi0ByV5t
	 zNiiNSJK2GJwPsgpUoE3+kHncMNJ/upXyAqqkDdyiMJP6PEhQsfXvxHEgcLFBRTQvvOeM
	 nEI48NQ3H+d/4tRxVv478vyQ3agFMuZE4iG8VC+BZw8v4W9j5uXQoBWhYLn4SKcJiV73T
	 BGze87T5EtCRTqJdadE5HLyMepziRtD6nvoYlpSy7Io/+lkztQntBsTHDwvQwF94D3vcO
	 g5n9jkQEHbpfMGs1OglKGmhDE7VkPL/QBq+bxhlL+h8TIvUj4hgqSm7biaEwNh5JFZg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795453979;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=lvwwkl8K/wDOSC4/5uE0wuLcsbk2ve4NvskfpJ0ybSo=;
	b=mqv3G3GBdqsEMDuwE/rEDH8DPU6fTaVDIa2tYJAx80kA4oUL0EVXGLq1+y8bB10JRbXF
	 EY5K+FC3ws6yRwuAzVGKQ7NFprJSSkIsWxvhHjOsBs7Fg9VWVd6YYL+UiS4kiOPY+9Ujp
	 4Ay+DTbwrmogRUDv3ptYHbBBppplcMducKa9NGw80ZHF3hoA8e4/pbgiqo4j3w9Ar2fYp
	 /O7PRZ1Uy+57fkcwk1mSWGwOPQCNPnV12D8qtiLd+3nWSaJf7plmtP6c3fv5q8mmk84ST
	 luMGYHmXg4KKo2+B85eITtPMByB4EqPvo5dKwvyCRehYG3HZJjSySHmbhorGQcUoShA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Z2FoKJ68;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795453979;
	bh=lvwwkl8K/wDOSC4/5uE0wuLcsbk2ve4NvskfpJ0ybSo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Aqsdyyzgh0AtHV+cy0JAKbPOVDvOC2KWLHpLmVog1eeqTk3PcmmABkRHRndQaU6SI
	 W4PDDQHspNV4DMj2AebmjTafLP05J2T/eDjWuiseaMGb65xOiS7UrTZU6Espv7vOd6
	 XbgDMUAzm3D29RJS5IqLcdh4dF/UvARwMVq3roFpNTsTsXq877iXE2COZ3zLMujo7q
	 c8Vne0mutV5pztDLXNs8Ubap3ht55JkixvtPa0dnvOHGAnOsanDnF/Z9Vck938mSKQ
	 4/HcnoXEmhWrvDrTmGa7xWC+JGbeQ0y86W4LMnbOmF+meIdV+2TpUu12hAAfDvywpW
	 XzegaWLmJflwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B084260640;
	Mon, 23 Nov 2026 17:12:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 64D97759
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44D4B60640
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:12:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQ7wz-TrK9Jj for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 17:12:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 09011605F7
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Z2FoKJ68
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09011605F7
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:12:56 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-49412eb1474so2277935f8f.3
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795453975; x=1796058775;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=jq5yknV5oPAm2+dKuaAf+Dgl/XCl/P5LtBukAshOCuk=;
 b=Z2FoKJ68QreFXM63kNYK+ZuDoQGwlu34UhiodUPgxZOqPQjSzVE5v29Qx/xBUV+soV
 s3YXDWH8MtECV+LiQjGl3DxZyiG2q06E11dA0w5J9nURT4FF9aR3BuZoEZHjRrzFobfU
 ikBRd/AxFdnKCSENQtEYRohDFGLge72zdgE40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795453975; x=1796058775;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jq5yknV5oPAm2+dKuaAf+Dgl/XCl/P5LtBukAshOCuk=;
 b=NdqHMrI8HJXa/TPvyPNwRtjW5B1Pwh6qEyxK+QufLTGWqwUshh9EguyeR1zlmI8PHt
 1trHeC1G0E+1oqqi/eGTaK9pjdspFcn2sSaN5w4xMjBVPsOfi4VjFx8+s+8ZPnYdzX40
 +IEKPmncKGInoS1ffvxUqpJ68iQtyjWE264Wyeg3gRYq9/uq5Q3CTVw452UKSIekwYAA
 4eioognwo9vI6RaP0a7/uU/JAQQrXSBuB7WmAuIZ4aW5fspfmxbrxuM7FMtw0eKbG7Rr
 dt3wHV8CoF+18DwrymvJXtWjnJrjmDXHL9t9HO/bE84ASTh692BgCKiQsO3aEUverMBT
 WwXQ==
X-Gm-Message-State: APuU4Z84DYzHq6ztmr/MfRl6yjQXf5UnhN4UbFIQ6v8jxzBhMZnutvtU
 DJ51KfNuDHckhtwt2m77Tvujc6jIEnIOOsa+j35A0ZRusFXyffO+ocKCeBqIhbDsCVbND1Wm64M
 J2hGt
X-Gm-Gg: AZFdTZdigL5suw3dW02TA7M94ySSnwNuRBgVKDkS5VnseWnNZUj3OocpQ+YC0DPZ7hd
 WxOctbmDbGbusV187uFcd2MEwTjY7yid6JdnEvR2HtuvPlGQMpi995GBWS0SI/djHxJLyvzZqIk
 G458y4I5V2OlNQuBBCvwkuzZ1GOJX+g5RgeVMEhgtsdxWFiyVTs49vINwocVA3qS0a+e2vYLtqY
 LVDz3beuVcjgixqhpAWztx4aHdvDNn7EWfi5r+RVUOYZNI4XjnpAmZc8nmC2s+Q+cR4OK8V6rYo
 Un04V+2x1D1GZACzTR4JvRbAz5Uc6HOaLgjuEfzPAyzUFSJ1pwhsGuePFhQFP11ucVbLAl2IYqR
 0tkRr3WmyvgZ0ofLr9d1+qWxYkf8xw/4G4drPuySOI2zi7WRMok8bQzoKpOzTnpzZ5hr/8eUCjN
 by/QEGxHRnzOLdfxOYohdRBQvSCboaqDr9ml0uZ1wJRMlaWWj1HHd8K+nBYP5IEjPtODTHj0wkS
 TdFU7NECNhz2znk3LswSK9dNCLzZLy0Wuddn8FH9SoeAHqWP/+3TMYwGYxjtjA0HZpFIl5IaAVq
 cJKzMiOy7xJqbqQCQiRXD29S9qDHbeHwFWtH7pNK0tgvKrOicjpYYikZdGTMJiZDQKJttANG6Cj
 /fLpuJIoIywMZVuTmnQHDJU3xeM6iG81DkL7Jg8VkQ4q92gFfLgTyH3YciyjUKMd0u1XDG2W2Q8
 YsilEO7IY/3yEUbA3l0I/aubLFkQ==
X-Received: by 2002:a05:6000:46cb:b0:48e:5db7:fd6c with SMTP id
 ffacd0b85a97d-4abad6a441fmr16404607f8f.4.1795453974735; 
 Mon, 23 Nov 2026 09:12:54 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab69bf680fsm26509798f8f.14.2026.11.23.09.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 09:12:54 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Mon, 23 Nov 2026 18:12:47 +0100
Message-ID: <20261123171247.1062347-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/inih: bump to version 63
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Release notes:
https://github.com/benhoyt/inih/releases/tag/r63

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/inih/inih.hash | 2 +-
 package/inih/inih.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/inih/inih.hash b/package/inih/inih.hash
index 78366d64c120..3d53665db22a 100644
--- a/package/inih/inih.hash
+++ b/package/inih/inih.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9c15fa751bb8093d042dae1b9f125eb45198c32c6704cd5481ccde460d4f8151  inih-62.tar.gz
+sha256  5d7967de62c5bfdc4f9f5ab06ce44c9e498bae021c7dac5792c0696e76aa9963  inih-63.tar.gz
 sha256  9ae3b39e83e9158e44b67733baa3bb2d84e80efdcfb14a5820210a42c7abdf7f  LICENSE.txt
diff --git a/package/inih/inih.mk b/package/inih/inih.mk
index c4a897604b4a..51275c176dc8 100644
--- a/package/inih/inih.mk
+++ b/package/inih/inih.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INIH_VERSION = 62
+INIH_VERSION = 63
 INIH_SITE = $(call github,benhoyt,inih,r$(INIH_VERSION))
 INIH_INSTALL_STAGING = YES
 INIH_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
