Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C1B606A68D
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 19:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=I85MPYFy
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B4E9605EE;
	Sun, 22 Nov 2026 19:34:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u179yRO4y9Dp; Sun, 22 Nov 2026 19:34:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8841D60611
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795376059;
	b=pXm+mglWQreliSW4HotyyDZViQP05OOfVz4DqAb4SIKDPCoUvFknxl/xnorPBYH+Kocp
	 lER8kzBQsGARhMckT2GNi/PTz+8v0KqNfVlbSFyI8ekK+st/Sg1d2Tm+ZbSfy/S/3PNcf
	 lSVxhuHtE9WkJ/P8t25gG4ft4Xj9KFi1VxfELQqcxVkNckwT73G1tJCmeshSvJgn0zkdu
	 WMQCrTKbpyecrA0Jkt4j/kU8Hfew2mbv/wohZMkX2UMPpknrB+m5jxavF8TLKaa2C1BPB
	 cFa82R4VmQqIOouEWyVVaY1uAdBp2GixekwjWLdbcx61rSv+g8dnMFd/RAuh18Zb8Rg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795376059;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CtvxUDWKWnsyrKFnKaTf4xS8l+AcJIHJlq530rTavjo=;
	b=MGWRItcqIhAlPguqJ1fQejPaaPQwkGEMF71Kb49W2uzFBNoczGwAWnfGRZsIo7pi5Yet
	 AEwMyt6eD0KjG0g+f1cgop/U0Ubtkif0T2LeShAYVmfHiZ3XCueG7m2bMMH4g7UCACVMN
	 kgdRQ2eyfCyVeUtq14M3gGm9na+Kbcp4tCPEp/f2UCiW7OYBT0oLkj7fSWI04YyaKUhi0
	 ByPaLtF5GbSloZLbZMgR5Z8kxeTl6AsBPaBLt4YV+L9H8oP/VrIOGC7/kxxGmrvGDbSvx
	 PXxiwsilHTa+ye/pKgCyg7/E4jrqmdfN3/lg7s/Q1LkCe79Grb0s5EZpmYNEUUEN79Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795376059;
	bh=CtvxUDWKWnsyrKFnKaTf4xS8l+AcJIHJlq530rTavjo=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=I85MPYFysd+p8Nj0VLgtw1nuqn8SvPgCfaJKqbz398b0jLA//ViOSzvNa7eVtC8Bf
	 HgLPqXPvmewalDUpTCkpuoTFOxUaERRgs6gu5X+vnMK3Auiw5lQo49qPM3FjWd+1/E
	 kS6xvdGFATxzHRDr2PyHaIu+LLmdKKkQeX2MS8To8v/LJGU9Zryn9XifOCdUwnfmuO
	 Rl+UJc+qHPekbkXSxbXDJU9T0Tl1xzja4kFRy2g8AX+T//V4QeryErfDK8bAE60jsW
	 hHDGoaCyl8rJqePQTW6hBds7PklB5Q/nXuVrMSxbrcU7vu4sYSzuIKJ9V2zWTVjbCk
	 MAMIe/oQDhehg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8841D60611;
	Sun, 22 Nov 2026 19:34:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C7223310
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 19:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B02DE60611
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 19:34:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vlles2t5zqEZ for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 19:34:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8A099605EE
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A099605EE
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 19:34:16 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-c50a4a2132cso360734566b.3
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 11:34:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795376054; x=1795980854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=30XvgY0OoiQBEs3SpDWTkPFswb0LREU8aT5KY2FqQLI=;
 b=JiyhLfce7LuBxE53pnDqhwMuvMucy+9DZe1ovxb5wYxAcqt+EuQK3MXXVFdUQOhdek
 qB4medtxBIg3xGHa3JEJPcuApZVjNuau96HyR/+kiNF8lvjgvqekub5PJEXr2uAlojzT
 PVDvB4nMWUxt5WxJQ3mo1yuMIzVej20XzPehFE5rSW7rwFtOg5iqSZeA3Fb73BJOEdFQ
 QBqbA4q5QvRjhBTtPRuV7mDAIfXW3ykPPdNByVn5I/guZiTZ27V5JSaqvdNHwwcf/00Y
 bWwweFK+686EwwW62iU7oGvJRZaVQPTwwPcFtCCb8FCtDd6uXpLECRBZ4PWksS7oS6+k
 i0fA==
X-Forwarded-Encrypted: i=1;
 AL+hErFXAQVpbi3zeEFHJqz06WRzPCvbRzCeKnC6wcZuuWpnqWSBSwI4kiB/dxYBXx8u7Bnqy4zugkp61yw=@buildroot.org
X-Gm-Message-State: APuU4Z8xl8NArMebgZAouzfznUdOK9eCzwGpjdR7CYKecPJp7rndiDCx
 RaMMpyMgcDqKlZwYuuFYCz1UIGPqZEo/FdoVCgzxEKAeXGLAWKrSdluh
X-Gm-Gg: AZFdTZc/KYTzw2Y20YXNPVQjAPLmaJtzLUjq/VdCIZHcTUlUqwJ5zX8w94AnLdVXrnX
 v69bSqfUfJUqMoMnZeiHWb66Vj390hAAVtG5UyCcSko8yRsiZNF5OYT5Kxg04U2KQX4IPvGrFLK
 x7jNeydS2w04F4Y3Hm2YzcFNNCCh4IXLVJ81u8l5yftOxU+hzJ/VF+MV4j29i2TjY/qepFRr9ih
 bYKtxwxXMvMqSJOk8flcXFO2NUanHWJcFNgzreaM2+bOPw+rJbD/5g61vqbPfyMx4d4HMyjPKNB
 gz6fxV1juPpbe3hhpwBsG8WZkWaCjm1IGrwOAMoT5DVALXmKgwSNdZJ/LhC9eo6by3lh8+CxIIN
 vFVgZDvDMKeE6JkPKarkkCbwf7PnVD0rLS/z5a62kPb/cKDIn+oyzMmDL6MZtyVAALnKBM1fizW
 sytsk+QVk9M8KRAr8n6hvlJ3RAiO6rmb3S+vJpiDQSlPqAFeOIoXJwpqhh3Ct+AwXvVivt5PDwc
 1JiQbxL6J5VzszTA/XT/IIwbbQaHrf2WrIZ0Imi9I7Pupz/so6jZdqJmL1uP0OzE3apv8BhgsTh
 799aVW1iKRPL7xY90+6QlmtAAnDrktxBkqZPt913ajzQc3aRX4d2tEJy6GQwuqdeoSPusHKoaBZ
 ihEm/hAIN
X-Received: by 2002:a17:906:911:b0:c40:b477:dfa0 with SMTP id
 a640c23a62f3a-c513aac2ebcmr646991066b.18.1795376054175; 
 Sun, 22 Nov 2026 11:34:14 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513afc2d97sm339853866b.59.2026.11.22.11.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2026 11:34:13 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 22 Nov 2026 20:34:13 +0100
Message-Id: <20261122193413.3006816-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261122143921.3636064-1-bernd@kuhls.net>
References: <20261122143921.3636064-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v4 1/1] package/fontconfig: security bump
 version to 2.18.4
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
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Bernd,

On Sun, Nov 22, 2026 at 3:39 PM Bernd Kuhls <bernd@kuhls.net> wrote:
> Due to upstream commit
> https://gitlab.freedesktop.org/fontconfig/fontconfig/-/commit/7643efb77552076b035d3eb506ca836ed4764ca5
> added in version 2.18.0 fontconfig now uses locale_t which adds a
> dependency to BR2_ENABLE_LOCALE and wchar that needs to be propagated
> to its reverse dependencies.

I ran allyespackageconfig with an internal uClibc-ng toolchain without
locale on top of this patch, and checked all packages that select
fontconfig directly or through other packages. Two reverse dependencies
are still missing:

> diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
> [...]
>  config BR2_PACKAGE_LIBGTK4_X11
>  	bool "X11 GDK backend"
>  	default y
>  	depends on BR2_PACKAGE_XORG7
>  	depends on BR2_PACKAGE_HAS_LIBGL
> +	depends on BR2_ENABLE_LOCALE # fontconfig

BR2_PACKAGE_LIBGTK4 itself unconditionally selects cairo and pango:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_CAIRO
  Depends on [n]: BR2_ENABLE_LOCALE [=n]
  Selected by [y]:
  - BR2_PACKAGE_LIBGTK4 [=y] && BR2_USE_WCHAR [=y] && ...

(and the same for BR2_PACKAGE_PANGO). So the dependency belongs on
BR2_PACKAGE_LIBGTK4 and its toolchain comment; the X11 one and its
comment are then redundant. Nothing selects libgtk4, so it doesn't need
to be propagated any further.

The second one is wireshark: the patch adds the locale dependency to
BR2_PACKAGE_QT5BASE_FONTCONFIG, but BR2_PACKAGE_WIRESHARK_GUI selects it
without that dependency:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_QT5BASE_FONTCONFIG
  Depends on [n]: BR2_PACKAGE_QT5 [=y] && BR2_PACKAGE_QT5BASE [=y] && BR2_PACKAGE_QT5BASE_GUI [=y] && BR2_ENABLE_LOCALE [=n]
  Selected by [y]:
  - BR2_PACKAGE_WIRESHARK_GUI [=y] && BR2_PACKAGE_WIRESHARK [=y] && ...

The other QT5BASE_FONTCONFIG selectors (gnuradio QT GUI,
python-matplotlib Qt, qt5webengine) already require glibc or musl, so
they are fine.

Otherwise the patch looks good to me: check-package is clean, the hash
matches the upstream .sha256sum, and 2.18.4 indeed calls newlocale()
and uselocale() unconditionally (src/fccompat.c).

Best regards,
Yegor
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
