Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86B4606A324
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 22:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=k+iblhtr
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B95D040519;
	Mon,  2 Nov 2026 22:49:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8MgJXytfrEbI; Mon,  2 Nov 2026 22:49:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C11AB40514
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793659773;
	b=baDn/whio6LaR//HyJFBW5iZfuP1S532kCuM06mf3KMxIgXJa1KzrB3VbluYlEuW5tV4
	 KSMKCSTZX6UNdzrDNbrpNw7p3jsXGqb13cy0Wou5zdVjgz0vTBX7uL3okDn/x4L4rSroo
	 JLhsHbZsc5i1hylS/Z0FXUCJvTewIl71eFud8+VYf9a8pZogbErG9YMHSr9ZwZxJFWVCd
	 6hJGXt7rkugWLJnqdhg1UNUrkFDjqD3jwCuo+fGujQGjzsVOPM1lnCsf0DiMIRSelIv2Z
	 W+T+pfVke6yBf/AnilWUG867Pvt95yhR9OnHaPiRciagnDSAH8Sy6Lxyn8tYr6fJLQw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793659773;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QKwPdXW4A77S4+oDN8OkzSVav+Da9qEwlLLcoOymc+Y=;
	b=CfLj3AmRxgr8r9djKkRgHxi/rG7x6iJaJ9Jsjd7aL+PQNEKWEYuY2pcn/dvUFv3aTIzd
	 fybsAI21VZorenD3oOJe/k9pw1G8OdsZPTHe2pdeq/EQTERy4ES5zzP+zZvytgPjJu4TG
	 u7X1/hfBtzKQMHOES+1xYjsO4dru7ArPGGox1u5ZN/XGy1lFCSatjBVUvQ+/0OFVglKzJ
	 /jnZzGJWP7ael2QQHTLWovkZKQIO8MIwFti2DY56gSlpXx/Z7OKqCh6b4Ks8yPN1vsVwi
	 AGlBEg1g6ZJjmtgO9iAlFMl0HJaHXCa7Wj9PvNns0Oqjws0XcEfX+8LAUVBzMJ+nGLg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=none header.from=telaak.dev;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793659773;
	bh=QKwPdXW4A77S4+oDN8OkzSVav+Da9qEwlLLcoOymc+Y=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=k+iblhtryG0zbqSyRLbEXL/belJQTAFQgzWgBCKN2C2PMdsy6Sej+VN5tD0EQtmNn
	 SXaNbQBdr57Wxufn1ZsD5Pdx/ZSfx17OTaEEv15RvT5IzxT1DwPOhNrrs0xq9YPL5K
	 8GyDkEfAJFPkCQy4fQyBEhIjp9eD1bgpGGXTHJtj/NMts5aGq/p31AkmiB91gsLHVQ
	 fT6LsdRTqfFYE/KZQSUOIPjZjQOSy8GcrFj2rs59NhJ4HA8mjK/Wm0ufLYJRZWWofx
	 m2lO6y5va2i+H3RElQf5p+u420GxsdPJK24ce0YUe04aOkVfOBiH1mpJ9U17I0Swpi
	 JDEg8FPU93gEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C11AB40514;
	Mon,  2 Nov 2026 22:49:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A89D2A8
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 22:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C7E240514
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 22:49:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V-Ixt1dJIgp3 for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 22:49:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1D78540512
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793659771;
 b=Fm2PjuTTHhPgOpqPSg9UUHVjCv0aniCZJsnr0kSK/ma2UpPdMCdDUIkrekOlIJkL4fvl
 hcMoYRWl+FpvMPjMp53gSy8YJ+umjy3aq38TKVDkSbsTOPa3sN9fzUh/zwWmYCtdDk50C
 KuR3zE8u4ubIpKCotvawVnLKf1CUAyXELJm2YijuhpJETTEAcX3L4FXFKG+Ox3BGkEWCa
 woLDWBBMowKhnZYOysOCY3ahRQw8bAzMnA05sBYaZLW+ocvv7ogCf0YdCdL0X0cabRR6Z
 Xc3uZbY3iDBz/X5zF2vPx48ySWWzAKB4q62j9Bn4rDTRz/7DPegfs7OEtspY2csaZuQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793659771;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
 X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=IhjWO6+iiY4odP+FGUvQR1opMM8N+R6DPD5LRTSpyrw=;
 b=Vm6tpf4Nye9PdpgbhSKN8nGkm3rZoartBaI42XZN0IWBP/g7dq76UwGp8OYS8wm0ESje
 KIpuf60VA0+g7BK4kmlkV4+wUHEEf3KVvC2WbX3aIYWXI592wFcQoWoTpa3RH6hFuSiOO
 wQ1v6TfwkoCxqq6M+8CHzN4luO6khJD0zeB9MhXqRUy4D1bT1cQGNlOqES6/Fu/35f1EP
 CZERtqeEfYxAuSADRRZ+zoWTzV883w4wLlaFrZSu9Ec2BdUFUOFTap26mOKMkLEoRrCfs
 D8+FgPnjOjHtMoBdMMhOnbbpmbne2iRuHFgCEINv3YyQOkiZHJB0Ndf2V6Zd9MQEL/A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=telaak.dev;
 arc=none smtp.remote-ip=209.85.128.172
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.172;
 helo=mail-yw1-f172.google.com; envelope-from=jttelaak04@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=telaak.dev
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D78540512
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 22:49:28 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-8b0a28a720aso34721647b3.2
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 14:49:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793659768; x=1794264568;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IhjWO6+iiY4odP+FGUvQR1opMM8N+R6DPD5LRTSpyrw=;
 b=N8hRCJbROKqy0m479+/22VBoAnBGASnKQYLUZFzYxCCMVNSmmzVGqX8SA66Mr1S9QM
 MtcI01ppRS8JZw49RQgOBor7m/QnolalRv6lg3b8W3jv3gqLzONAva8C7eLqAEG3/DAR
 wLr3orXY6WRDjO8fMzUxvxa6UVEGMLF60hCUqwV2WrAEgumvq5UKmsIFplXGjtnqO3L5
 dFVMLwFyMv8/m6jCTR1u6rXx9fvnIeES6tl3IT9D2isQRaRozybIubyaQRYqzUO4UHED
 mN82/LggrMEFpsa+EF0mutOa5lXcqaRjPZTqmH2saO8Raw3PZkDPoAEqekWKv492ecKW
 ML/A==
X-Gm-Message-State: APuU4Z/Et6YzOGFTwcy8kW8p3iqIiTABY4K+nGz6gEfZ57ABbgNGpONZ
 1FVVT7Rsxcfa6siVDR5Pifx/nOS7BoozGRm30ZNfAIaKxcgTYxEnnEOSJNc8R4FSzqU=
X-Gm-Gg: AYBFou3NJJ1fuC8GvK9EaEd4TSGnoAHhVuq0AC8tsKNopTatr4447SE9qDNrOlsndtc
 ZapfqdatSLSNo5i09QO/CDa8wavRdPvSk4PkxLPTbr32Y3MUNPR9ViTKUDlcAcrg4brf4da+rIU
 lR9zaNtJxbb9kMespjX2UaVgg8JGopRg3bNkhbpr+uriYsncvwu/GQtHnrNlFruLuLoigBdclyR
 SgZ5GGK3NhVHpgiHJbHABPDvrKFntAh+9IjdH3STt8mMlPQJ/WAIhH7YTgrNo5mi5/89DqutxpY
 44CCsn6d5l2tm3EapshH6ATw81a6kIsbStmuuVx6X3XgwoJ9j4QGX/7BJ1FG8tTHM5yGuWTKpQV
 F3XRlCoXo19kWJRbeSe2YzvHEPvUFTn2p4Z71YpOASN/Fx//mGpONsJ3g4DKghFE41RDaWatamP
 rl+HXpZ7C7dRJ1nDgtUu+IvRs5Wt/m8vppuM99ZPUGwf8FsV55dUR8cY/5oLpVkNwUhuMiORyK1
 SUg+J1+wGUkjhHrSdwEwC26/G+ivk/4wvDN9Ufiqd7gfrCONFOxY8/ep5ujrmQwrL7b1fRwy96c
 Yt4NrSGxBvInEq10DzxbbzBm/+4fFgQrQfOeRWvIW02QCHpHA0tb91VKnwOs1fL5zTpG4+N0ucb
 zyeLwi7JN/wY0ViUm3rseTmWU1kcMDAc=
X-Received: by 2002:a05:690c:f05:b0:897:73ed:dd25 with SMTP id
 00721157ae682-8b2b67095afmr86603617b3.27.1793659767546; 
 Mon, 02 Nov 2026 14:49:27 -0800 (PST)
Received: from localhost.localdomain ([71.68.170.161])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b2b71641aasm61638357b3.25.2026.11.02.14.49.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 02 Nov 2026 14:49:27 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon,  2 Nov 2026 17:49:13 -0500
Message-ID: <20261102224915.69302-1-joseph@telaak.dev>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/2] package/wpewebkit: WPE Platform support
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
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

WPE WebKit 2.50 contains the newer WPE Platform API, but Buildroot
only builds the libwpe API. This series makes the libxkbcommon
dependency explicit (patch 1) and adds options for WPE Platform and
its DRM and Wayland platforms (patch 2).

Adrian, I have added you in Cc because your 2024 series "wpewebkit: do
not depend on wpebackend-fdo" touches the same WPEWEBKIT_DEPENDENCIES
line. Patch 1 is what that change needs on the libxkbcommon side.

Tested with utils/test-pkg, one toolchain per configuration:
 - WPE Platform, headless only (glibc)
 - DRM platform (musl, eudev)
 - Wayland platform (glibc)
 - WPE Platform disabled
 - DRM and Wayland platforms with libmanette (glibc, systemd)

At runtime, on x86_64 with musl, a WPEView on the DRM platform renders
and page-flips through Mesa's i915 driver on an Intel GMA 3150. With
WPE Platform disabled, an existing i386 libwpe setup with a vendor WPE
backend runs as before.

While testing I found that wpewebkit fails to configure when
BR2_PACKAGE_SYSPROF is enabled: sysprof is built with
-Dinstall-static=false, so libsysprof-capture-4 is never installed.
That happens on master without this series, so I left sysprof out of
the last configuration above.

Joseph Telaak (2):
  package/wpewebkit: add missing libxkbcommon dependency
  package/wpewebkit: add WPE Platform options

 package/wpewebkit/Config.in    | 39 ++++++++++++++++++++++++++++++++++
 package/wpewebkit/wpewebkit.mk | 26 ++++++++++++++++++++++-
 2 files changed, 64 insertions(+), 1 deletion(-)

-- 
2.50.1 (Apple Git-155)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
