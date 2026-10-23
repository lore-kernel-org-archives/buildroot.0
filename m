Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8771D606A32D
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 11:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Tw9k1U8+
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DDC081201;
	Fri, 23 Oct 2026 11:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wTp2szIcNAm4; Fri, 23 Oct 2026 11:02:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 618B5811C1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792753345;
	b=g4fDY9Zn5p9wErsIfdXBiJSef+2HhPad3Ie+HZ0M9bAQyqvQ/FQTWQvY5xrSCdv22JVc
	 zupMzENyJ645YinUA9a6uG29UbZsgljr+1Mp6+HTJ2OmFqLSAqX4W4XVS1F20SAxdL+xY
	 OX1KU2t197TLPFSsKZGZCGKmkdkpHdVQPbbkBalN5kL8BiODKJXwlxAzhGeXyJaJ9eicA
	 +Rb4FSoNKp767wmi/Y8ieNSInXL4p51eZUQrF5T+L+4FCZqv5a4IZF0t6AfySLwIoLno7
	 G9kUMXNH7p6NzFWIIW1/m/UbRPDMFqmSwjxmSyJLwjSPQD1gJ34IGhP+PkuIngnHNtA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792753345;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=G4crc+Km4zvWMdxHYMlOs5BPajBPGjA5XxkF94EnWlQ=;
	b=OjT9LGCpKt+mJDsLmv8c6onALB/fK4tY7ioqRgWejKg9S+PQ8I12++MRqgwWjDIFboe2
	 XQ4CDlfJ9FmLoVESlXC035tj52X0nEQ02szFyQCGdR04CyL3ZdHflicuWpeKi2+bEwqjP
	 KFStjGzthssFNR+eSs3PTFbY5/CbYLpuAU6qOCWsrW4BxP+WR+145g0PJMuKPO6TUvugV
	 llAagPWw7+UCLXTfza8qrUNNBRk4teYGKdbM7qXr9D7SHRe/4astXFzT+jA2mZNa1Cy7j
	 LP6FTCCtx0EDZioBe9lkig3S+0aRVSot26di6j8OIDW8inyP9XI+CbIhTfeO4oSojpA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792753345;
	bh=G4crc+Km4zvWMdxHYMlOs5BPajBPGjA5XxkF94EnWlQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Tw9k1U8+YQUoLlwOk7mS8wrV+1kegp53uvH4jFS8YLzZBpPHc+AReuveQpNtaxGE7
	 EOgg97h9+ys5xbvwPjTk3DnYR8iZA2h4/VXrYTuFcbFoZnuosUw84uJHhuWTe9qZY0
	 X25kwoz8ybkz/gRBxvQo9GqZSfy+rGOoO+jHE0+gh1DTaGwT1GXE6EgipZ9/zwwJhK
	 VVYite1eGL0Ec9Oc8oSjos51jjpyu0dazo1akRzZ5MpXSRzkxRj+gL+QE2Rge0GZwu
	 7NfOo+89i/yVp0gQC649D1XZFnIWWndTQmylTBjSt3vhkZweB3SMmTE39VwvhuqG4x
	 sFZkPzvqSf3JA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 618B5811C1;
	Fri, 23 Oct 2026 11:02:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DB163AF
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AED940099
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ec3rdsOyCbGE for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 11:02:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A5EDE4008A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792753343;
 b=MmFbnvcUqEOQ8XJIthZc0YB8nEjpzyJZJdOA4Q9frTXBvKn4xHxjII5AU9JF4a68RylS
 KKKEjADe3/Oq2VjXqf9TrXR0ca32Rkv6jy6N8ebUP9O4u7hcxNvubEtjBjbbHEYS1ab1a
 fYf1nCSItXer4kU8md0mnLzYPG0blE/edO7US61hm6iJmPXwxu6VJAp3KzGZa4Bkyey+a
 ffAq8TMS/oyOA4jrP8RU8o6+T9MXjQkU8hAA99ahXNjj0ajoZDfjdJULNh+kwCV5xma5J
 19c0Mg47s7zlW5Of8zuDNWa338C0/+Hd5euGfwQyJp8VMhPgoNgbddeLCmzgPn9qH8g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792753343;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Rxq3dYHSdWeYgWjYrnb6r47hc6n/CMQiFRqR5f5oz4A=;
 b=hIaZKZrrymBjroGsm5RtD6op7OF73Tec0gPpL1PrbF27XCsKKzoGGoeU34ecgfFsxIPE
 IUvFhbK6U7nayMKSqrG3cqdmbwle1IH0El+Kz8GdKwBgybDEvIJAU6SeZJGu+/furbbht
 pVqNUMcKPesM9nKSkddt7KL7viW1WlDw3dya9TZvY9p/GCYUrcYngHS0ncu+OLsI8u7bB
 j6B7H8HqLwXJINt97z7dPLNHJVW3DFwykahZr2JZs0zfeayJbGK0HKEm5MED/wwL7v+gz
 OKo+8KYxX7GUmgyPwtR7BUl/TSamyhlKDZPd459a/Va1yrScnC6R8LCZz9ewqTX4y/A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=CFnfXXDg; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5EDE4008A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:02:22 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-c2afa22e1dcso104739366b.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 04:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792753340; x=1793358140;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Rxq3dYHSdWeYgWjYrnb6r47hc6n/CMQiFRqR5f5oz4A=;
 b=HKRiQP8dhhPOBRaKGS7cdPWNbEKYkIxGjcBw5H7eJ8iHUlMOdD3FIgV3zuizuHjX3E
 bAZZvyy4hniZ2kaGyiuy8cFk5rXFCP3w2bEK9gtIhMaNvEMEP6MxaJofDYjx3cRMKRyZ
 6fT5qDdGV5uq8UjGF7PzkqrfJGp0bXqjG2D4een6rTa3b4BhPqu++s2YebyEf1e14IMW
 mZdb+w+sQmXt9zgj5A0Ey8AWvjBt60B291eY2LUvt+KoQpGE8apj23vQhnHyL5uQle8I
 UTpXStGCmaxrTpCzffLW1KjiXbyRHSHf42UnWk/I4k6yTs29KNoXO7INjdc/iovRQAPE
 ewRQ==
X-Gm-Message-State: AFq9FYJ6d1qI9lt46wARV3xpO9tkbTyyV6znrSmnnbu4GVPyRGS4XunV
 UWkOUIvyhMFeJmcUjxndHNsYh/hjBJe5d3Xqjkxt4a5HwckYQfltm84288JYWQ==
X-Gm-Gg: AYBFou20vGkx/NC4Rh6l/PJn0nrSgLPIPaaYZV1yNqpukYVjIkmaQPl5CLdioDJPafc
 QMUIYyaUO1DvUJWuRao5yxxPFsniRYSy7Ta1giq5hSDBSGvOrBakZWp6gysj6DiNUj+5+k1Oon6
 aBcceXUoVw+e0YBfc5rG7QaiwzZc+fwXZiCFIYvqHt7uW29AbM1VyCQYjvbI6sFOMcIfHrh60Nl
 5fZtxH3ue2pktqbBJUQojMIS+X1Ikk0toX4dQIBVCsCxVnSAgNu8ERa8aLmH8v8sNKkBiM6mOUX
 yqRy0HryPzq9TXnOIkkq1K9Q867r0sAyjxp4XEkkCIns/znhunvcYHRhqOh9hNUg9H5rb6AaEVY
 ZYt7ipWqz5lR20OPUCYzas9nucgh8tq1k2rg7h5ErS1AzpFBXxRS/qXAYRu9MXDoCQ54PcjpyaC
 IcALDAHbszIOBHVm7mWCc0WJv/0n7CHF1rsvaplgWydkVzqCx5oNd+XcWmfFI99/tpZOI/bi1sj
 PU1mqj4jE9Q8pgjnnzaNzjfkw+w/KEE0a0wPNu/ApwUh2rk+b6vywfos1azwfOwCTnuGefzyYm1
 AE96csWc4sKK9QpDyS0yFkKhIANyBaaZ+eQ=
X-Received: by 2002:a17:906:1d01:b0:c2d:bae5:27d9 with SMTP id
 a640c23a62f3a-c46a92bae28mr188100166b.46.1792753339891; 
 Fri, 23 Oct 2026 04:02:19 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46a5cadf3csm89381466b.54.2026.10.23.04.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 04:02:18 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 13:02:16 +0200
Message-Id: <20261023110216.1414214-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/avrdude: fix readline dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

avrdude automatically detects and links against readline when it finds
libreadline in the sysroot (find_library(HAVE_LIBREADLINE ...) in
CMakeLists.txt; AC_CHECK_LIB([readline], [readline]) with the former
autotools build system), and there is no option to disable it.

Buildroot never declared this dependency, so the result depended on
whether readline happened to be built before avrdude. Even worse, some
external toolchains (e.g. the Bootlin ones) ship libreadline in their
sysroot. In that case avrdude ends up linked against it without
BR2_PACKAGE_READLINE being enabled:

  $ readelf -d target/usr/bin/avrdude | grep readline
   0x0000000000000001 (NEEDED)    Shared library: [libreadline.so.8]

but libreadline is not installed to the target, so avrdude fails to
run.

Add readline to the dependencies when it is enabled, and otherwise
pass -DHAVE_LIBREADLINE=OFF, so that find_library() skips the search
and readline support is disabled.

This issue has been present since commit dc776f0d0546 ("avrdude: new
package"), as avrdude has always detected readline automatically. It
therefore affects 2014.02 and later, including all maintained
branches.

Fixes: dc776f0d0546900b22d1552f3e522be2080016c6 ("avrdude: new package")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/avrdude/avrdude.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index 8f451a7fdb..6d9ffe8625 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -29,4 +29,10 @@ ifeq ($(BR2_PACKAGE_HIDAPI),y)
 AVRDUDE_DEPENDENCIES += hidapi
 endif
 
+ifeq ($(BR2_PACKAGE_READLINE),y)
+AVRDUDE_DEPENDENCIES += readline
+else
+AVRDUDE_CONF_OPTS += -DHAVE_LIBREADLINE=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
