Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA54606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 22:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jCpuTidu
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C118640ABB;
	Fri, 23 Oct 2026 22:58:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l7NoEeXHC1Ij; Fri, 23 Oct 2026 22:58:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B824440ACA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792796280;
	b=Mc61uWj0NE9AWsczlYfVbNzSpJ2u9+siq22+IvoAF3HW3UAEqqyVXu0PemHYPuVLlI+z
	 dp/pcyYxoyK9LJTz2tONbjtjda9BpJrP/pCFiD4r/0PnZFxhL9rDk4I0hQlEVZKutpUxb
	 +nQlHMFAO2RxNN6RWqTn9jjC1LqPz9xhQ3ZxR5OXrQ1o4vnc7HEljL61l2UGG+yaSegTg
	 HeTp6OJ5Su+LCv7lLHUY3+Rzx4T4qTAl/DcvuALVuVXR7CSks8oCdsMGrrprmA9/FnROx
	 GGGaAGUJmBfgvK/CyRp6kuQZ8pxAf3tsGvNKCOpIfCZc5EBt/2PtlgJxu1gI2cAua9Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792796280;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=GbnX7DSP0exwDPcDVN+655Kn6pUjmtA/18mKQn386Sw=;
	b=hrWtXsuZH6/NXGEqHBetHDw3Guw3Ka+2isyjR48glS956mshXQy8ReGLGy4AMTD4qmZ5
	 KNttegQ1Pr3PWTqOXoyX039dR6bTG8+AMejp0x/BLeT9xJa+vKTPEuHEP3xzx/FKqLpwM
	 D9v3m9WFHQV13HjOls1My0VnExVO+K0Sm+02IbShJbVqyNGOJKvKZwkFL+pvzwQSTo8nn
	 qg1jaazP7Ti8S7SYl93XRTw17TbzduqkPmWZqHoD3J8iHx4MjsCQWa7/2tUEl9gyYhS7m
	 UwGDiTttifnSPPuNCbkDbTuUscEpiuvzvUEDLez2/v30Nhd7XWuLq/8EAo19yZC4RgA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792796280;
	bh=GbnX7DSP0exwDPcDVN+655Kn6pUjmtA/18mKQn386Sw=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=jCpuTiduxom3BoTYIyAHSIvtlKYo6vIhtWM8Nxj3EiSrXdp8O+9UqC4MRhdwa8qD6
	 iOH0/Dqr6odFSKgv9tHPEFEQDVZfWe5Ma2pR4sVk2qLxAF4emd1SMb3MiGsGdxFRaK
	 cnY6SyuT1Eu85I2dTLaK1xGKCUFBqI0MiSPD81dnt03Gt+fkjCu4P8U7i8BG92F/zn
	 S7tqO5T57cDNKxD0aa84nwLAAmSa8QZCV304M8wjZcERMdnZVQqz9HNg20Ragyq5ne
	 jTwcBm0i2vqILoPkTdx0tPpaO+BbSW0Y7YL0l+CQZxaTKVeTolAGU4ksOG5trw2A5C
	 UkjxC3s60441Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B824440ACA;
	Fri, 23 Oct 2026 22:58:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D64A3C4
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 22:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4375A40488
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 22:57:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oSxEfYWPYzwj for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 22:57:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 49A8D4016D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792796277;
 b=fGXyctpaUSc3G5ryDrwYBG1LPgbf5A5JGjg67UCBGG5YAD864Qy74M2NaOvn4jes0Q59
 BE+IK1yZlTwnDedCzAhqtwGEUzTqW8BqAUk+fJX0ZukEQItx2Buus72E5H8fPnwr5SC13
 /LVl8f2QKsGooHjJHYAkix5OKJSgfY2mT65GE6WKatS02X33e0RLFuj6hr1CeXsKZpP21
 gjtSHpU1m76TqLfeqW6NqBdoLgheidA7nPBBCIpbak9pD939wZgBdVNX0qYR88DOeQ3oW
 WLvs9Vxo+2TETjfstm6cCAXueNpGw+aD9Snh9B4VisUt3vtzvg53CRbm6Qs9ty87XEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792796277;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=GKYvTgryOHN6ajtqSQHC3YiDELGERd+KwftJNMmZJUA=;
 b=jaqJgOrBDx/Neh74GFINqO3Cvnvs7qk7a679uQX9xammqsANT1uKkpCgyH3MsCfeLYTK
 74ScLiMjLu6OPwwyqZ9Xg85M2/mF+TGhPGY6ijSa/HFvtmhJmIeqVtLlrrJHWaR5jVTHV
 FPZHY9EvulNXEHTnAdcOKbrY8wtNMIFyA3ojo07Eq6ymUgiNw644W1FI+M00ra7gtnMlc
 veiCenIR4eMOuM5A3dIMcJg3ej+vM5Ybo885b0vEwFMu20p4wmy8STuXs/O/vSz5543h7
 cQAOMqTKd5Xt+9pFxu13zYGm5Z/euYU7qEzTMlMHAzpcmVZjNsJVQeb2uQPCaKwhprQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=MSLRC8U1; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 49A8D4016D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 22:57:56 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-c2e8c710847so177593966b.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 15:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792796275; x=1793401075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=GKYvTgryOHN6ajtqSQHC3YiDELGERd+KwftJNMmZJUA=;
 b=w/VFQbv4OXU2LGdIG+usPFz2C88K/jKrjb3JjhBRAHM02Yn+punRhZ0gP9ucG2Imnb
 oKoM6X4W4X8a7QwhrPu5D9q8ywhDINsDYiD7wQcrl01h/FTiU+d583fSpBZ3S86KLz8x
 D3WC1dQ52BuGhvI+Ql9pMiJnaP/GOTjNmk97ifAxWctPKG4lzMRGgLVv/v8IY+F2rM+X
 +q/acS6OXJPALoW6rPcV/XGEpE09zTh4oF1LNqkNJFaqTM6kRPPhqVTkDhH/NvaTNfZ6
 uGRPnrFUjA+VYX8zPwumBgXKx++qZAJdim+ApQzKmTSMMgEMI58StOZL+fCR9syW3Egl
 mPTA==
X-Gm-Message-State: AFq9FYIS/nQE6+NNDC62KzTQXzDce3h8hfAxBOSN47Pdtl+CAoG7fSwq
 JhSrnfxOojt+GqufWc/fTFhVVFOSNuEPhpZhT6+hhvCaK7QlyihJi0T7OuhnGw==
X-Gm-Gg: AYBFou3manTgfDYR937e3RcKqf+1f2IgpWWM6YJidKIVwtP2jirXl4xXw4177EIe+zI
 R98X0BXG2x7+FMiXbntL3MkMMf76mPCZeLADyrGtSD+P8luuLb5TjOKTb3s9Ii5mKClEN8PKQnB
 D/gySL0nt626Q+SXxw6C/TxGnFF0o5B8hOyl+ksGmMIQTZ9MCVxcVf4/mTUQ9ceRFnYxgqbV10I
 y/RboZzIYd4NVjjBTEkOe8wJehtmnMDoWvgqQuPwRz7tjzBW/i5ZZoQgZgaEM+DJ4AjYwvvo1vz
 F4DbeQJBzDBOuB5x4oTDRcNmzUERCkqxJRrHbOnq9SXreETPzeeKC+9PSxivHKaoIkqysje82a9
 QQW19eQ3ynsOWevKzo+CtEE9T1PubEBPjJT2F6BQa7ErueasvhwgkSqJhbuKk9aE3VCHTF+gM6/
 iV30Wqj/IUIJ/OcqPnGLk2yzAuTjS7FAuoC+6LkW5+nlhUmoA/JjnSPjB+BGSnf7xiPtDETZ9QQ
 6OQU2Mlq5C4kzPVwSQrCQ5f490HbOKUFA/R6cs0Ohx4Vz+hrMOZgPftpwhYdf8fjKEvRPX4lvBy
 P+afvHr2dUq7574ef49nFWO/b3lDA8/nGc7t
X-Received: by 2002:a17:906:7954:b0:c46:8c2b:8f7e with SMTP id
 a640c23a62f3a-c46bd953e38mr44795666b.0.1792796274396; 
 Fri, 23 Oct 2026 15:57:54 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd34fe2dsm17340666b.1.2026.10.23.15.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 15:57:53 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 00:57:51 +0200
Message-Id: <20261023225751.2614512-2-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023225751.2614512-1-yegorslists@googlemail.com>
References: <20261023110216.1414214-1-yegorslists@googlemail.com>
 <20261023225751.2614512-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/2] package/avrdude: fix libserialport
 dependency
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since version 8.0, avrdude automatically detects and links against
libserialport when it finds it in the sysroot
(find_library(HAVE_LIBSERIALPORT ...) in CMakeLists.txt), and there is
no option to disable it.

Buildroot doesn't declare this dependency, so whether avrdude gets
libserialport support depends on the build order. With
BR2_PACKAGE_LIBSERIALPORT=y, building avrdude before libserialport
gives:

  HAVE_LIBSERIALPORT:FILEPATH=HAVE_LIBSERIALPORT-NOTFOUND

while building libserialport first links avrdude against it. This
makes the build non-reproducible.

Add libserialport to the dependencies when it is enabled, and
otherwise pass -DHAVE_LIBSERIALPORT=OFF, so that find_library() skips
the search and libserialport support is disabled.

This issue has been present since commit 0e16ff09e953
("package/avrdude: bump to version 8.0"), as avrdude 8.0 added
libserialport detection. It therefore affects 2025.05 and later.

Fixes: 0e16ff09e9538d46c9726f8998080d55dfa5d41f ("package/avrdude: bump to version 8.0")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
  - new patch

 package/avrdude/avrdude.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index 476f031c99..fbad44a191 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -25,6 +25,12 @@ else ifeq ($(BR2_PACKAGE_LIBFTDI),y)
 AVRDUDE_DEPENDENCIES += libftdi
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSERIALPORT),y)
+AVRDUDE_DEPENDENCIES += libserialport
+else
+AVRDUDE_CONF_OPTS += -DHAVE_LIBSERIALPORT=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_HIDAPI),y)
 AVRDUDE_DEPENDENCIES += hidapi
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
