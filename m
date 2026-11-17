Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE55E606A335
	for <buildroot@archiver.kernel.org>; Tue, 17 Nov 2026 20:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kwOXzjXY
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87125408F3;
	Tue, 17 Nov 2026 20:07:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FX7vHHu6SoU2; Tue, 17 Nov 2026 20:07:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A2962408EE
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794946050;
	b=GN0h0XCxCazNxNBepMdRQkT3InkgVVFapiZ1y+46vDEs1b6w5JrnyLsGKRFd23NOYfZD
	 bPdmkd8JFsBHxwRStDO839dgee4JsTJtrNo9WiGNZFcgMzTqdVRV6x8I6AmeOVoxhj5KY
	 0RHrt3d6QfwuBK3pfnbNg+ftmk+esXg4qOw4yrTBTHssZZO2q6ZsqdYEpN9H87h7TfLql
	 3UF4SkU6ToJFMJHKIO0TH2Ahl+sbNMQJoLTs9/u2OtxlFHMosbKQZ39KpRaLL7NkDmftO
	 c77q13PCKESJvqXvzcVhwK2ogOK+VSQq2j3YFBh49UPvQlbxmOO/qUKHPnehLNwHgRg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794946050;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HC9JMvf59+RPk/vy3vIfBCB5QlQ8oXyw0fUZAo1RaTk=;
	b=hiWQSo4spOyT5RsPaajK2rpSWY+WBCFEicCYaRMgDtfQi8EeoC5+J4ZVIFGw7Wvu9iNk
	 dbmqg07P4VGK3MU70nDONu+kCaYn5Sb4cUIBtsaFRTlZEjy5ZrA5i7ncDD/2zmr2kQrSa
	 I0BB98E4uL6qfMr+IIaetJ/ageIEZOYwahlfgHcOuSuKM/a/WEO0xsiXBltuznDoZg7ox
	 fpdZ2pnhW2LUaJsuSd1lI/aY9ueKDmJoP1jWCEOw2RtqBvq1iqiNW/H/x/YTVssRp5NDA
	 XOzIxKfVSFLTmSNng7iTG7JZU3AbJ19Pz8tWzurmnmh0kpJ+KZjNiSLu4oYaGIn1img==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794946050;
	bh=HC9JMvf59+RPk/vy3vIfBCB5QlQ8oXyw0fUZAo1RaTk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=kwOXzjXYjOGBa+Vp6b+T6+Q+o9VYTOda79Y2QgDtE0Ypg/FGb+pgyGmyTvQvNCQ5P
	 fRC6XGs7KKJP87LVhsmgePAUkUxOqFWM4wdgJtRS9igQLUO9PFXpEn0To6oa4bwcm+
	 GqcAP3VmOBqXHwh8Ivzzd2JiR3FIBNTYR1+DC9C/LCoeXfTIwns1aFR7eYbEec35Ao
	 HqJURdBXgDgl+pOXsuUrdgqUuiknCMRJw6VEW3PHGfeVVlL1D9FlhaDqOm+uivNMgh
	 PPSTy54LEmA4QoXBQIAPU2tii2TQcf6yGB0LY4VJSrbTvXfnnOaFZo+yqTSoHmOipY
	 c2DIri7v+dzWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2962408EE;
	Tue, 17 Nov 2026 20:07:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 13B51A0E
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 20:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE90160739
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 20:07:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eNrmJsNMMdiP for <buildroot@buildroot.org>;
 Tue, 17 Nov 2026 20:07:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C43A0605EC
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C43A0605EC
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 20:07:27 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6b587538a37so411673a12.2
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 12:07:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794946045; x=1795550845;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Pe2lE27bNc+H6UtE90525Oa7OqYyVjkOPbIlz7kAJKk=;
 b=ZrGEjpchmMKM/STgthhzy3Bugk+QkdzLgxe5xgYfuh+rLm0cwNokEKt8SJDBEhe6Pq
 EJ+a4DkKw4KEJP/jbhda9lkRnVhLhaxZ8RDv3Jawh1/rh/BeDNC1wX7YP1rHymtrg+Dv
 k98asphUMZsLA8Gp6aPJvllHJxPjmiropQISVN2FmSbEO1Wjmovc1C/PIHrI9LQz7xjc
 ip9a7sZlmLNmJIFbQZiV56Z/XzxS4Eqw+SNaCM7vSl2QAx52zpIhnFT4QbgvKpuX5ivb
 uRRmtIE1XpaK55LkvCkWBAIrw2fu+jXelQuHy3qa1aOmwE7ycEMdwJzvxYW4cjsuuVI9
 5TQg==
X-Gm-Message-State: APuU4Z/bT3AomG4uZORzf91FxF4ClW2juzJ+ETJ+zRXBCBoEYKMnZF0v
 dm+6RDDRUNYCSyltsfdLt9+k1mlNhToOej4XnvA5+3kOgJN/JiCFHUsY6lvVNg==
X-Gm-Gg: AYBFou2YJyvPDlzi96P4fpo4R17u1gDb7RuLHxsNEEDOOibY8iiBSIffh7Tjd3KQaTj
 /7tTLAog0l7vxL40t/VeglnsX1+hen1pQyKYq1cqUF6yH5ot3qEE129ZWA38ge6O5n7lWFSjjSe
 jcKxdlBQcSKnycJJpVYmSC4Ge4xmJF5ubJclwyXqZNcdaWQORVBBdPfzh02DUsFqjeCclBzekPF
 upNo11nSONgMWWSkY0khI3XFdJSIr8e93GO9/FfxgF0ce4LbubEUpvMuma+6Xs4k033FCzFKWMQ
 RD+IwB41MVHSi3EeVGiFMTJ+9Rt17cabhRPP42EDNx/LaGZs+tMhD/oBnNXhW7b/VEZrn4dxo7P
 WPcqvlNh1F7vAOtqgnBIf/gq9EDa3g7vN0JcekzyJGYlDPVymfsSd22uL4L2zMNoCXO9zXflhaz
 XTWOJIu+zvEAIkO3PFCb3jlrrNA+fCb03kH1raGOZh/qnaG3Mxjor+OCZnd6C9ZY8O5/4BFBxJD
 LnYnXGeXZQAkeUj+OBzyZdfqJm/KKohI93EmIqxkNJCFdKkCkJ9ZKmX5TUqsz6PUqBKizYzli6g
 aWVqlo8WWpm8hRsHcbO0vxLoWCckEltppiDL0JWEMqKd6ykLbI9uheT8Ffxo8TG1OJ8Mh1BS7Xu
 kQkby7U4w
X-Received: by 2002:a17:907:9448:b0:c40:231:6eab with SMTP id
 a640c23a62f3a-c510e19cd03mr31503766b.16.1794946045406; 
 Tue, 17 Nov 2026 12:07:25 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c510cb7db2csm17115266b.83.2026.11.17.12.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2026 12:07:24 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 17 Nov 2026 21:07:24 +0100
Message-Id: <20261117200724.3199105-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/go: cgo linking on riscv64 needs the
 lp64d ABI
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
Cc: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Building balena-engine for riscv64 with the lp64 ABI fails at link
time:

  ld: /tmp/go-link-3269995158/go.o: can't link double-float modules with soft-float modules
  ld: failed to merge target specific data of file /tmp/go-link-3269995158/go.o

The same happens with lp64f ("can't link double-float modules with
single-float modules").

The Go linker always marks riscv64 objects as using the lp64d ABI
(ehdr.Flags = 0x4 in cmd/link/internal/ld/elf.go). Packages with cgo
code are linked externally, so the C toolchain must use the same ABI.
Programs without C code are linked internally by Go and are not
affected.

Make BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS depend on
BR2_RISCV_ABI_LP64D on riscv. Packages that need cgo can then no longer
be selected with the lp64 or lp64f ABIs, and the remaining Go packages
are built with CGO_ENABLED=0.

This issue has been present since commit 8a1158f89f15 ("package/go:
add support for riscv64 architecture"), which enabled Go for riscv64
without restricting cgo to the lp64d ABI. It therefore affects 2022.05
and later, including all maintained branches.

Fixes:
https://autobuild.buildroot.org/results/4c70d9294c31ba4d0bcc84829f8ff7294e03e3dc

Fixes: 8a1158f89f15fbb7448f39a118e4882bd1b44c81 ("package/go: add support for riscv64 architecture")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/go/Config.in.host | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 47c7e5d075..875eecab85 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -31,6 +31,9 @@ config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	# Go doesn't support CGO linking on MIPS64x platforms
 	# See: https://github.com/karalabe/xgo/issues/46
 	depends on !BR2_mips64 && !BR2_mips64el
+	# Go objects for riscv64 always use the lp64d ABI, which can't
+	# be linked with objects using another floating-point ABI
+	depends on !BR2_riscv || BR2_RISCV_ABI_LP64D
 	# go uses dlfcn.h + cgo for its plugin module
 	depends on !BR2_STATIC_LIBS
 	# cgo supports uses threads
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
