Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B8F606A324
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 14:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dgID0D6N;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=UZGvY7WK
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49BCF80C26;
	Wed, 28 Oct 2026 14:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QXQJCZ3fGd2h; Wed, 28 Oct 2026 14:23:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 99CC980A66
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793197421;
	b=YiifMyvKTCS0hTD0cSVCFiFJtchW3bbnue0zwceeYSlGX9t4iLyWfXJdVtZPxhSGQSC/
	 AH2HvNz3W8j0D4dufSZMkwStJZR/bRX+YVRsgXC3YlXxCYu1Eis4/LJ+omATvUUKHM7Dg
	 G6WQ4aDXAbSBxc021yFW+xq4CXDUOGf3qZp0tFQ6beo34/joQP9YUnwwOEZAu92eVFHzS
	 nfHp0zylrZLi6DsOtXVNEc+kBpKOHf1J5Ks9sDOfuVV5fgUwKlO8TCv8KpFmcrUfLXq5w
	 MiFyLT+BaZdfCY8puAVGJfY7vxa9e6zVn0bvDDabzpTm3w03G5dlgQVlVdhVlL3UrMQ==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793197421;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Errors-To:Sender;
	bh=vaaAwXaHMHPJvlZ1zbXhUBgRqH3LoRjtT0pg4BVH1LQ=;
	b=E5AadGgwtsPJmiMKD3bmsVpsol03izOPHn9OOPJn9y05FxKuhgi4BEyYCn59d1vBnLEF
	 SmGPM/Hk0fso0KHMEBerLP+Cp2GmrpbWzE111MOgUnGfB8a4QrtZ4JAt66vSYhDxwu5zf
	 A8waypz83+Q9hA40qhSwuYpUy3t+cfvTScVhNZPOi/D6/7bQCJ2gizTSQuOj1t+8fjwCE
	 /fSyn3cikAQgORhg5cmeJAQAYwoFXT2cn7WxSpUv6uzZ+nnj1Qlgc62iVSZR5/2FTAJTX
	 oIYCBch7Th1KNAlgrVqDYZDGsVXFeoUcQVwJy9j0KkAAluqkdyP7JIRFpjCFKd3Lc5g==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; 
	dmarc=pass header.from=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=UZGvY7WK;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793197421;
	bh=vaaAwXaHMHPJvlZ1zbXhUBgRqH3LoRjtT0pg4BVH1LQ=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dgID0D6NlqxBfrF7CjGTMdbSqLPyuUBYZS4ahLS3hXaFCDrcEItPqyYHQrddzRGyC
	 UBahv2ZvkxIY1G/HJ/DJdge8Hev7UR1TQUVjGZzFkzrEUi8Yc7+ugQ2bA6KjE5+XNz
	 nNUOJw8RRGZhNcrtabg0RNr1zAdJGGaQVTLfIR5p/pO4Bn4g7NAk8s9ZVJyXNmdf+M
	 uHPitGgstNxRY7AZdD+b/J/ThQ5DAwcY2RGZl5p9cZbMNFjvYyt4WE/ys2eoopsUkc
	 SzC904+V8XcTF9KRQ+F3gtQOgc3xJY6ZIiAtWzxxO0ppECvWcnJlFlDURcLJqHxeWS
	 GiA8GwKICMCRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99CC980A66;
	Wed, 28 Oct 2026 14:23:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 360DC9F8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26FDA80AE7
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 97GWPZT83uZM for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 14:23:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8A29480AE6
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a00:1450:4864:20::633"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1793197415;
 b=Mjy1j3l6O6mCQrw6JPq5Weh5oHWXAT+8GjiMkzETZw2J3VfSEFVNaOjEYQDaEMvtrKq9
 7T0QuTHh6IPDefg+Ox8KWffGk+OHK01fUflmWKxAVYDqwZSsTjFaH6mFpnW+eruRE9hyf
 oRtrwwnrcOXM4n5OpnehEhIS5ChictpA3hd+Q5nnKghfhxFmtgjfwybXHKeMrrp9hdy4Z
 2LNEeDVT7M5kD3uqxW0txH+JJEDFjK61fHde+5gUhw5VwgqiMAnj67qY1CF9jK0J04I+T
 RAnifmnQfFUNnJp6nyKzym42gFasN8qxekEcWhwunPtPvrvgsklNxN61TZKlFKeBYGQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793197415;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type;
 bh=DHEcQH3FZFNi7+SXSO4XybpFOMG/Q0m2/rxw567l7f0=;
 b=VRh3UUXx/7rrPRsywEs9wbLTfmq3cbTmsibdbm/ooOcusf6zrzaVmDeRZRsRCJ/KEDZP
 WYcc9HIwnWlsVvQx/tzo/jXYOcbDotYs782fRZEJl1yI2UciSky3fhBg9LnT5M4fNhsJs
 /iDOh3JnV2zd5OQq1iFiRWjqPwZPKlhZQ9lVqYGj3k44OH7ZUC6rL5q7ybfXVbS9nusT9
 bUSFprKFOTM5DuKcAFBiurTD52Suq0pWtYnvZSivEJSF8TLYxD/0IGq7YF8DpJOCzaUny
 DPPdFJIVJWNaQkO/mKGPk2CYL+doSnkn++arzwg2oJ7XdRyM2Vw74/yZmg7fRPnBxCA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=UZGvY7WK; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a00:1450:4864:20::633"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=UZGvY7WK
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A29480AE6
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:23:34 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-c3fae9338f0so10760366b.2
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 07:23:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793197412; cv=none;
 d=google.com; s=arc-20260327;
 b=aBYcJiwa2JRnegFill4kn2nS+q59knUV3x6vZMt4Pbt4LSY6Ynp4DLHyyn/TOGex7p
 8GbrWgM+CgZxxiUWZ6kVW7T2aSHhLvvvWj/6e/XevFVBlEbaalefJncC9fwP8njLMNSf
 iztAIB0WcMYYxCWSvAWAv/ZO26vq9dRKVhgwc9vZIR51yVChWXP28Kcbf/Z0oDmBhfh9
 9aK0828ai5cAJexWTGU1ou2zp4ru2uH+q0sAKAMWxgzp0dZx0z4z8FmO+YMGB4gw6luK
 acx9rm5uPlwOuTLBhR5b3mV2PzKNalsbWzLKgO/HRjvZXKRs1wDSrcBrGSOuKaz2dQQi
 oKoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=DHEcQH3FZFNi7+SXSO4XybpFOMG/Q0m2/rxw567l7f0=;
 fh=jGdNlI+UTCyOBF3CZii9CCFUvUnkjay+sQ3+cznx4ow=;
 b=sI7DY5ogzr5suWsvcWvsG7vJrYYvPtDLqAIkqbXExskJ3BtqqcLDcQrtEE6T/7NztJ
 7mTK/pPgZTSB/i4OPeGBTKnG6Ne48QUhUC7YRgZidI0Tu7s/dEUlM1zliIPhuX3EQiGH
 Ygd8Da+spXaKfMugLuRZlG2F3/GhkBpzrJyFm00wjb0ZXl4sNDSl8F1/cTiN+ZsydjlX
 NUrDtVYxLZgJxMsPWJ7YlmL3il76Q/9WUB7AiYskDwpFPr3CCfYzgDtCKVDQGtPgHBIT
 w0BNWcBwAbr2auKLeUZW0z4vhLCGe4ODHs6PP6KOdvYJt4gvbYV1Xt1HKG9Ww58TyTod
 Mjfw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1793197412; x=1793802212;
 darn=buildroot.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=DHEcQH3FZFNi7+SXSO4XybpFOMG/Q0m2/rxw567l7f0=;
 b=UZGvY7WKWFjo8CdF3GKBODqUerUl6s0MTT1z/gcnPd9t4rX+ZMHtESzfjvh0eKRqD9
 FXfRis8qhfeb8SLO/kkzrFAc0kKKFnlCnBRGwYH/BToJXRnuf3PF5pi5NjQukmnFwhRb
 fgGD/aHRYDHT91F5sl4fqDDiKqkILwP2wiVKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793197412; x=1793802212;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=DHEcQH3FZFNi7+SXSO4XybpFOMG/Q0m2/rxw567l7f0=;
 b=IYQPOJxe1UOU1ckJOFAp/UQrkKbalpTt5pQiP9Mlqec+IWTAo0KBCC+yoTdnbQULhX
 xugexXvpenU+s8Dct4JN3euqUxaPdIYAsdxZQHqTYy5UbtelYoJ5YTquWzCdg4RJa7eE
 Gjxm+INE0Qbjr5wWFuPdf7uqV2KHOVt+XrWIQnM6uxMMlv4GI7hYqL4wFpLRUXSD8ukb
 /9xIBd+YXYOyyoqq/ADcV4NnO2I+NnNfYHjzm5lIHqxzqUkbtxZdrEnHOADK//2sx/ll
 mq+xrRTZEFt1FcA6XG0xS9Ct0ANEBPAQBEo8A5oFN0k2tTaSnpPW5W1P5vhWujNUeSM5
 uzfQ==
X-Gm-Message-State: AFq9FYKnbh7Aa5mhlwqYhTsutzRr4+FkPFyirWtRWZtQsDqouV1sRgjb
 Nt5UkaVpC/XwJCobSjK9SlFY/PBm0eIVmEUt00rFxICy0g6MNGeZ7mtRfF0Y7fdHe+sRVP/IbeR
 77RIkPxDlSGAarvkL0cSIjfWi4bezJDPa5TBu0WF/Y1mvo0hklxWOUcAcwA==
X-Gm-Gg: AYBFou206z/NWHamuIaQyIqCa47TDmZUd0rdOKm/bbcdD2girGjgs5rDpYnoVBdpVcN
 GvRouzhOHADD/VqwrHiT2sR+X28IfhT1aQdPx4ZMBwFEHGkhbXwsQmtZ4lF5BMKcawah7XWBRJp
 7QEIVuoHRD/31xkZ6Qe2DhT8DsgxbnElKy24R9rXcVV7Eh2Xs6A2Sxggc7lS3ZZhVvxRP5KndRG
 YWUnF6wXIq08yBsAhKzmhXQ9ZE1fjFYX5HWxHOEU9H/kYwwdI+eqmXcNWw4jsNMiHEt8to3+e60
 xD5zvhvHJ6gBx2508ecegwLG5lBsbLOp5vmLCv5ApO5ydg+LqtEf7whIbpDIMTbtYOfr6blthhD
 VGFL5IkgyTW5PNabXAsCs2kzBh49uD2ODqDE1aHlPRmFGjXuKOIny33DCeU+wHN68uYm08cDx2n
 3UIVxGkv4YXkQGeFHHoQRHdO7yrA==
X-Received: by 2002:a17:906:9986:b0:c46:b5a7:5b29 with SMTP id
 a640c23a62f3a-c49bde9c83amr235410366b.2.1793197411752; Wed, 28 Oct 2026
 07:23:31 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261028113331.2960539-1-adam.duskett@amarulasolutions.com>
 <20261028113331.2960539-5-adam.duskett@amarulasolutions.com>
In-Reply-To: <20261028113331.2960539-5-adam.duskett@amarulasolutions.com>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Wed, 28 Oct 2026 15:23:19 +0100
X-Gm-Features: AclHuK-YLCCIiLtav9WS5_G__Ziw6P18OIWwALq15wAdveF9I9MytzpXa7h296s
Message-ID: <CAHDQB6M=NLp-fe6o-ae3s6MTks-E5GnON_Sj4x-=oTjssixaXA@mail.gmail.com>
To: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH v3 5/6] package/mender: bump to version 5.2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: multipart/mixed; boundary="===============1071990264458479025=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,MIME_HTML_MOSTLY,NUMERIC_HTTP_ADDR,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1071990264458479025==
Content-Type: multipart/alternative; boundary="000000000000bd7f29065ee74ee8"

--000000000000bd7f29065ee74ee8
Content-Type: text/plain; charset="UTF-8"

All;

This was tested against libopenssl 4.0.2 using Bernd's patch here:
https://patchwork.buildroot.org/project/buildroot/patch/20261011130058.3443432-53-bernd@kuhls.net/

With a boost update patches applied from this series:
https://patchwork.buildroot.org/project/buildroot/list/?series=1112&archive=both&state=*

Testing went as follows:
  - make mender_x86_64_efi_defconfig
  - Add openssh to the image
  - Boot using the following command:

```
qemu-system-x86_64 \
    -enable-kvm \
    -display gtk,gl=on,show-cursor=on \
    -m 512M \
    -M q35,accel=kvm \
    -cpu host \
    -netdev
bridge,br=virbr0,id=net0,helper="/usr/libexec/qemu-bridge-helper" \
    -device virtio-net-pci,netdev=net0 \
    -net user \
    -drive file=output/images/disk.img,if=virtio,format=raw \
    -bios /usr/share/edk2/ovmf/OVMF_CODE.fd
```

Modify the ServerURL entry in /etc/mender/mender.conf to point to my local
mender server with
the address of "https://192.168.178.243"

Replace /etc/mender/server.crt with my local development certificate.

The qemu device appears properly on my local testing server and I am able
to push updates
to the running virtual image.




On Wed, 28 Oct 2026 at 12:33, Adam Duskett <
adam.duskett@amarulasolutions.com> wrote:

> Starting with Mender version 4, the program is rewritten from Go to C++
> using
> CMake.
>
> The current package provided by Buildroot is 3.5.3, which is quite old,
> having
> been released on 12/6/2024. Since then, several changes have occurred,
> necessitating a substantially large patch with many changes all at once.
>
> The following is a list of changes:
>
> MAJOR:
>   - Mender is now a C++ project
>   - Mender depends on systemd
>   - Drops sysvinit support
>   - Mender is split into two binaries:
>       - mender-authd
>       - mender-updated
>
> MINOR:
>
>   - Drop the 0001-openssl-v4-update.patch.
>   - Add 0001-src-common-crypto-platform-openssl-crypto.cpp-fix-bu.patch
>     Which allowd building without OpenSSL engine support.
>
>     This patch is tested against OpenSSL 4.0.2 which is not yet applied
>     to the master branch.
>
>   - The following busyboxy options are required by the rootfs module and
> are
>     enabled by default:
>     - flock
>     - stat
>     - stat_format
>     - sync_fancy
>     - wget
>     - wget_https
>     - wget_openssl
>       Note: While sync_fancy isn't strictly necessary, enabling this
> feature
>             prevents several messages about sync ignoring all arguments.
>
>   - New dependencies are as follows:
>     - boost
>     - dbus
>     - libarchive
>     - libglib2
>     - lmdb
>     - openssl
>     - systemd
>     - yaml-cpp
>
> The configs/mender_x86_64_efi_defconfig file is updated to
> use systemd by default.
>
> Mender is configured with -DBUILD_SHARED_LIBS=OFF as the bundled
> libyaml and tiny-process-library .so files are not installed when
> -DBUILD_SHARED_LIBS=ON is selected.
>
> The support/testing/tests/package/test_mender.py is updated:
>   - Uses systemd
>   - Bumped kernel version to 6.18.59
>   - Adds a simple network as mender-authd requires network-online.target
>   - Drops sysvinit tests
>
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
> v2 -> v3:
>   - Removed documentation update (see first patch in this series)
>   - Use an external toolchain for mender_x86_64_efi_defconfig [Thomas]
>   - Dropped jq selection for mender_x86_64_efi_defconfig [Thomas]
>   - Dropped yaml-cpp selection (bundled and linked statically in mender
> source code)
>   - Cleaned up various make commands [Thomas]
>   - Removed kernel fragment used during debugging [Thomas]
>   - Add 0001-src-common-crypto-platform-openssl-crypto.cpp-fix-bu.patch
> [Thomas]
>
>  board/mender/x86_64/linux.config              |  11 +
>  configs/mender_x86_64_efi_defconfig           |   7 +-
>  package/mender/0001-openssl-v4-update.patch   | 191 ------------------
>  ...o-platform-openssl-crypto.cpp-fix-bu.patch |  69 +++++++
>  package/mender/Config.in                      |  39 ++--
>  package/mender/S42mender                      |  44 ----
>  package/mender/mender-client.service          |  13 --
>  package/mender/mender.hash                    |  52 ++---
>  package/mender/mender.mk                      | 146 ++++++-------
>  package/mender/server.crt                     |  22 --
>  support/testing/tests/package/test_mender.py  |  96 ++++-----
>  11 files changed, 249 insertions(+), 441 deletions(-)
>  delete mode 100644 package/mender/0001-openssl-v4-update.patch
>  create mode 100644
> package/mender/0001-src-common-crypto-platform-openssl-crypto.cpp-fix-bu.patch
>  delete mode 100644 package/mender/S42mender
>  delete mode 100644 package/mender/mender-client.service
>  delete mode 100644 package/mender/server.crt
>
> diff --git a/board/mender/x86_64/linux.config
> b/board/mender/x86_64/linux.config
> index b758c6d45a..f980ec39ab 100644
> --- a/board/mender/x86_64/linux.config
> +++ b/board/mender/x86_64/linux.config
> @@ -1,4 +1,8 @@
>  CONFIG_SYSVIPC=y
> +CONFIG_CGROUPS=y
> +CONFIG_CGROUP_SCHED=y
> +CONFIG_CFS_BANDWIDTH=y
> +CONFIG_USER_NS=y
>  CONFIG_SMP=y
>  CONFIG_HYPERVISOR_GUEST=y
>  CONFIG_PARAVIRT=y
> @@ -15,18 +19,22 @@ CONFIG_NETFILTER_XTABLES_LEGACY=y
>  CONFIG_IP_NF_IPTABLES_LEGACY=y
>  CONFIG_IP_NF_IPTABLES=y
>  CONFIG_IP_NF_FILTER=y
> +CONFIG_NET_SCHED=y
> +CONFIG_NET_SCH_FQ_CODEL=y
>  CONFIG_CFG80211=m
>  CONFIG_CFG80211_WEXT=y
>  CONFIG_MAC80211=m
>  CONFIG_PCI=y
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
> +CONFIG_DMI_SYSFS=y
>  CONFIG_VIRTIO_BLK=y
>  CONFIG_BLK_DEV_SD=y
>  CONFIG_SCSI_VIRTIO=y
>  CONFIG_ATA=y
>  CONFIG_NETDEVICES=y
>  CONFIG_VIRTIO_NET=y
> +CONFIG_E1000E=y
>  CONFIG_ATH9K=m
>  CONFIG_ATH9K_HTC=m
>  CONFIG_CARL9170=m
> @@ -57,8 +65,11 @@ CONFIG_VIRTIO_INPUT=y
>  CONFIG_VIRTIO_MMIO=y
>  CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
>  CONFIG_EXT4_FS=y
> +CONFIG_AUTOFS_FS=y
>  CONFIG_FUSE_FS=y
>  CONFIG_VFAT_FS=y
> +CONFIG_TMPFS=y
> +CONFIG_TMPFS_POSIX_ACL=y
>  CONFIG_SQUASHFS=y
>  CONFIG_NLS_CODEPAGE_437=y
>  CONFIG_NLS_ISO8859_1=y
> diff --git a/configs/mender_x86_64_efi_defconfig
> b/configs/mender_x86_64_efi_defconfig
> index f10a461770..9cd68e5f62 100644
> --- a/configs/mender_x86_64_efi_defconfig
> +++ b/configs/mender_x86_64_efi_defconfig
> @@ -1,7 +1,6 @@
>  BR2_x86_64=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
> -BR2_INIT_SYSV=y
> -BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_INIT_SYSTEMD=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
>  BR2_ROOTFS_OVERLAY="board/mender/x86_64/overlay"
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/mender/x86_64/post-build.sh"
> @@ -42,7 +41,7 @@ BR2_PACKAGE_MENDER_GRUBENV=y
>
>  BR2_PACKAGE_MENDER_GRUBENV_DEFINES="board/mender/x86_64/mender_grubenv_defines"
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
> -BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
> +BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_TARGET_GRUB2=y
>  BR2_TARGET_GRUB2_X86_64_EFI=y
> diff --git a/package/mender/0001-openssl-v4-update.patch
> b/package/mender/0001-openssl-v4-update.patch
> deleted file mode 100644
> index 65443614d5..0000000000
> --- a/package/mender/0001-openssl-v4-update.patch
> +++ /dev/null
> @@ -1,191 +0,0 @@
> -Description: Fix build compatibility with OpenSSL 4.0
> - Include <openssl/x509v3.h> in hostname.c and hostname.go before checking
> - #ifndef X509_CHECK_FLAG_ALWAYS_CHECK_SUBJECT, preventing fallback to
> - legacy OpenSSL < 1.0.2 code that attempts to directly access opaque
> - ASN1_STRING fields.
> - Also add preprocessor guards around deprecated protocol methods
> - (SSLv3_method, TLSv1_method, TLSv1_1_method, TLSv1_2_method) in shim.c
> - and ENGINE functions (ENGINE_by_id, ENGINE_init, ENGINE_free,
> - ENGINE_finish, ENGINE_load_private_key, ENGINE_load_builtin_engines)
> - in shim.c, shim.h, engine.go, key.go to prevent implicit declaration
> - and undefined reference errors when building against OpenSSL 4.0.
> -Author: Frank Heimes <frank.heimes@canonical.com>
> -
> -Downloaded from Ubuntu:
> -
> https://git.launchpad.net/ubuntu/+source/golang-github-mendersoftware-openssl/tree/debian/patches/0004-openssl-v4-update.patch?h=applied/ubuntu/stonking-devel
> -
> -Upstream: not applicable, upstream moved to c++ in newer versions
> -
> -[Bernd: rebased for vendored download by buildroot infra]
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> -
> -diff -uNr mender-3.5.3.orig/vendor/
> github.com/mendersoftware/openssl/engine.go mender-3.5.3/vendor/
> github.com/mendersoftware/openssl/engine.go
> ---- mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/engine.go
>      2024-05-24 12:07:27.000000000 +0200
> -+++ mender-3.5.3/vendor/github.com/mendersoftware/openssl/engine.go
> 2026-09-20 18:37:50.270612314 +0200
> -@@ -15,6 +15,7 @@
> - package openssl
> -
> - /*
> -+#include "shim.h"
> - #include "openssl/engine.h"
> - */
> - import "C"
> -@@ -33,18 +34,18 @@
> -       cname := C.CString(name)
> -       defer C.free(unsafe.Pointer(cname))
> -       e := &Engine{
> --              e: C.ENGINE_by_id(cname),
> -+              e: C.X_ENGINE_by_id(cname),
> -       }
> -       if e.e == nil {
> -               return nil, fmt.Errorf("engine %s missing", name)
> -       }
> --      if C.ENGINE_init(e.e) == 0 {
> --              C.ENGINE_free(e.e)
> -+      if C.X_ENGINE_init(e.e) == 0 {
> -+              C.X_ENGINE_free(e.e)
> -               return nil, fmt.Errorf("engine %s not initialized", name)
> -       }
> -       runtime.SetFinalizer(e, func(e *Engine) {
> --              C.ENGINE_finish(e.e)
> --              C.ENGINE_free(e.e)
> -+              C.X_ENGINE_finish(e.e)
> -+              C.X_ENGINE_free(e.e)
> -       })
> -       return e, nil
> - }
> -diff -uNr mender-3.5.3.orig/vendor/
> github.com/mendersoftware/openssl/hostname.c mender-3.5.3/vendor/
> github.com/mendersoftware/openssl/hostname.c
> ---- mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/hostname.c
>     2024-05-24 12:07:27.000000000 +0200
> -+++ mender-3.5.3/vendor/github.com/mendersoftware/openssl/hostname.c
>  2026-09-20 18:32:37.854514981 +0200
> -@@ -6,6 +6,7 @@
> -  */
> -
> - #include <openssl/x509.h>
> -+#include <openssl/x509v3.h>
> -
> - #ifndef X509_CHECK_FLAG_ALWAYS_CHECK_SUBJECT
> -
> -diff -uNr mender-3.5.3.orig/vendor/
> github.com/mendersoftware/openssl/key.go mender-3.5.3/vendor/
> github.com/mendersoftware/openssl/key.go
> ---- mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/key.go
> 2024-05-24 12:07:27.000000000 +0200
> -+++ mender-3.5.3/vendor/github.com/mendersoftware/openssl/key.go
>  2026-09-20 18:38:13.462370202 +0200
> -@@ -303,7 +303,7 @@
> -       keyID := C.CString(id)
> -       defer C.free(unsafe.Pointer(keyID))
> -
> --      key := C.ENGINE_load_private_key(e.e, keyID, nil, nil)
> -+      key := C.X_ENGINE_load_private_key(e.e, keyID, nil, nil)
> -       if key == nil {
> -               return nil, errors.New("cannot load private key,
> ENGINE_load_private_key error")
> -       }
> -diff -uNr mender-3.5.3.orig/vendor/
> github.com/mendersoftware/openssl/shim.c mender-3.5.3/vendor/
> github.com/mendersoftware/openssl/shim.c
> ---- mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/shim.c
> 2024-05-24 12:07:27.000000000 +0200
> -+++ mender-3.5.3/vendor/github.com/mendersoftware/openssl/shim.c
>  2026-09-20 18:36:02.855038372 +0200
> -@@ -382,7 +382,9 @@
> -       int rc = 0;
> -
> -       OPENSSL_config(NULL);
> -+#if OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_ENGINE)
> -       ENGINE_load_builtin_engines();
> -+#endif
> -       SSL_load_error_strings();
> -       SSL_library_init();
> -       OpenSSL_add_all_algorithms();
> -@@ -403,6 +405,46 @@
> -       return 0;
> - }
> -
> -+ENGINE *X_ENGINE_by_id(const char *id) {
> -+#if OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_ENGINE)
> -+      return ENGINE_by_id(id);
> -+#else
> -+      return NULL;
> -+#endif
> -+}
> -+
> -+int X_ENGINE_init(ENGINE *e) {
> -+#if OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_ENGINE)
> -+      return ENGINE_init(e);
> -+#else
> -+      return 0;
> -+#endif
> -+}
> -+
> -+int X_ENGINE_free(ENGINE *e) {
> -+#if OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_ENGINE)
> -+      return ENGINE_free(e);
> -+#else
> -+      return 0;
> -+#endif
> -+}
> -+
> -+int X_ENGINE_finish(ENGINE *e) {
> -+#if OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_ENGINE)
> -+      return ENGINE_finish(e);
> -+#else
> -+      return 0;
> -+#endif
> -+}
> -+
> -+EVP_PKEY *X_ENGINE_load_private_key(ENGINE *e, const char *key_id,
> UI_METHOD *ui_method, void *callback_data) {
> -+#if OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_ENGINE)
> -+      return ENGINE_load_private_key(e, key_id, ui_method,
> callback_data);
> -+#else
> -+      return NULL;
> -+#endif
> -+}
> -+
> - void * X_OPENSSL_malloc(size_t size) {
> -       return OPENSSL_malloc(size);
> - }
> -@@ -480,7 +522,7 @@
> - }
> -
> - const SSL_METHOD *X_SSLv3_method() {
> --#ifndef OPENSSL_NO_SSL3_METHOD
> -+#if OPENSSL_VERSION_NUMBER < 0x40000000L &&
> !defined(OPENSSL_NO_SSL3_METHOD) && !defined(OPENSSL_NO_DEPRECATED_1_1_0)
> && !defined(OPENSSL_NO_DEPRECATED_3_0)
> -       return SSLv3_method();
> - #else
> -       return NULL;
> -@@ -488,11 +530,15 @@
> - }
> -
> - const SSL_METHOD *X_TLSv1_method() {
> -+#if OPENSSL_VERSION_NUMBER < 0x40000000L &&
> !defined(OPENSSL_NO_TLS1_METHOD) && !defined(OPENSSL_NO_DEPRECATED_1_1_0)
> && !defined(OPENSSL_NO_DEPRECATED_3_0)
> -       return TLSv1_method();
> -+#else
> -+      return NULL;
> -+#endif
> - }
> -
> - const SSL_METHOD *X_TLSv1_1_method() {
> --#if defined(TLS1_1_VERSION) && !defined(OPENSSL_SYSNAME_MACOSX)
> -+#if OPENSSL_VERSION_NUMBER < 0x40000000L && defined(TLS1_1_VERSION) &&
> !defined(OPENSSL_SYSNAME_MACOSX) && !defined(OPENSSL_NO_TLS1_1_METHOD) &&
> !defined(OPENSSL_NO_DEPRECATED_1_1_0) && !defined(OPENSSL_NO_DEPRECATED_3_0)
> -       return TLSv1_1_method();
> - #else
> -       return NULL;
> -@@ -500,7 +546,7 @@
> - }
> -
> - const SSL_METHOD *X_TLSv1_2_method() {
> --#if defined(TLS1_2_VERSION) && !defined(OPENSSL_SYSNAME_MACOSX)
> -+#if OPENSSL_VERSION_NUMBER < 0x40000000L && defined(TLS1_2_VERSION) &&
> !defined(OPENSSL_SYSNAME_MACOSX) && !defined(OPENSSL_NO_TLS1_2_METHOD) &&
> !defined(OPENSSL_NO_DEPRECATED_1_1_0) && !defined(OPENSSL_NO_DEPRECATED_3_0)
> -       return TLSv1_2_method();
> - #else
> -       return NULL;
> -diff -uNr mender-3.5.3.orig/vendor/
> github.com/mendersoftware/openssl/shim.h mender-3.5.3/vendor/
> github.com/mendersoftware/openssl/shim.h
> ---- mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/shim.h
> 2024-05-24 12:07:27.000000000 +0200
> -+++ mender-3.5.3/vendor/github.com/mendersoftware/openssl/shim.h
>  2026-09-20 18:38:33.117854985 +0200
> -@@ -40,6 +40,13 @@
> - /* shim  methods */
> - extern int X_shim_init();
> -
> -+/* Engine methods */
> -+extern ENGINE *X_ENGINE_by_id(const char *id);
> -+extern int X_ENGINE_init(ENGINE *e);
> -+extern int X_ENGINE_free(ENGINE *e);
> -+extern int X_ENGINE_finish(ENGINE *e);
> -+extern EVP_PKEY *X_ENGINE_load_private_key(ENGINE *e, const char
> *key_id, UI_METHOD *ui_method, void *callback_data);
> -+
> - /* Library methods */
> - extern void X_OPENSSL_free(void *ref);
> - extern void *X_OPENSSL_malloc(size_t size);
> diff --git
> a/package/mender/0001-src-common-crypto-platform-openssl-crypto.cpp-fix-bu.patch
> b/package/mender/0001-src-common-crypto-platform-openssl-crypto.cpp-fix-bu.patch
> new file mode 100644
> index 0000000000..e596f1b5f3
> --- /dev/null
> +++
> b/package/mender/0001-src-common-crypto-platform-openssl-crypto.cpp-fix-bu.patch
> @@ -0,0 +1,69 @@
> +From dcc218c6857e080e760b4a9c04acc79390151eb3 Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <adam.duskett@amarulasolutions.com>
> +Date: Wed, 28 Oct 2026 12:07:07 +0100
> +Subject: [PATCH] src/common/crypto/platform/openssl/crypto.cpp: fix build
> + without engine support
> +
> +OpenSSL 4.0 removed ENGINE support entirely and always defines
> +OPENSSL_NO_ENGINE. Its engine.h still declares the ENGINE_* functions
> +for source compatibility, but only provides stub definitions when
> +OPENSSL_ENGINE_STUBS is defined, so linking mender-auth fails with:
> +
> +  undefined reference to `ENGINE_by_id'
> +  undefined reference to `ENGINE_free'
> +  undefined reference to `ENGINE_init'
> +  undefined reference to `ENGINE_load_builtin_engines'
> +  undefined reference to `ENGINE_load_private_key'
> +
> +The same happens with OpenSSL 3.x configured with no-engine.
> +
> +Guard the ENGINE calls with OPENSSL_NO_ENGINE, and return an error
> +from LoadFromHSMEngine() when an SSL engine is configured but not
> +available.
> +
> +Upstream: https://github.com/mendersoftware/mender/pull/2037
> +Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> +---
> + src/common/crypto/platform/openssl/crypto.cpp | 9 +++++++++
> + 1 file changed, 9 insertions(+)
> +
> +diff --git a/src/common/crypto/platform/openssl/crypto.cpp
> b/src/common/crypto/platform/openssl/crypto.cpp
> +index b31e6c8..5f6a4b9 100644
> +--- a/src/common/crypto/platform/openssl/crypto.cpp
> ++++ b/src/common/crypto/platform/openssl/crypto.cpp
> +@@ -103,9 +103,11 @@ auto bn_free = [](BIGNUM *bn) {
> +       }
> + };
> + auto engine_free_func = [](ENGINE *e) {
> ++#ifndef OPENSSL_NO_ENGINE
> +       if (e) {
> +               ENGINE_free(e);
> +       }
> ++#endif // OPENSSL_NO_ENGINE
> + };
> +
> + auto password_callback = [](char *buf, int size, int rwflag, void *u) {
> +@@ -153,6 +155,12 @@ string GetOpenSSLErrorMessage() {
> + }
> +
> + ExpectedPrivateKey LoadFromHSMEngine(const Args &args) {
> ++#ifdef OPENSSL_NO_ENGINE
> ++      return expected::unexpected(MakeError(
> ++              SetupError,
> ++              "Failed to get the " + args.ssl_engine
> ++                      + " engine. OpenSSL was built without engine
> support"));
> ++#else
> +       log::Trace("Loading the private key from HSM");
> +
> +       ENGINE_load_builtin_engines();
> +@@ -190,6 +198,7 @@ ExpectedPrivateKey LoadFromHSMEngine(const Args
> &args) {
> +       auto handle = unique_ptr<OpenSSLResourceHandle, void
> (*)(OpenSSLResourceHandle *)>(
> +               new OpenSSLResourceHandle {std::move(engine)},
> resource_handle_free_func);
> +       return std::make_unique<PrivateKey>(std::move(private_key),
> std::move(handle));
> ++#endif // OPENSSL_NO_ENGINE
> + }
> +
> + #ifdef MENDER_CRYPTO_OPENSSL_LEGACY
> +--
> +2.56.0
> +
> diff --git a/package/mender/Config.in b/package/mender/Config.in
> index c9b9d0b757..8f16e2312f 100644
> --- a/package/mender/Config.in
> +++ b/package/mender/Config.in
> @@ -1,9 +1,20 @@
>  config BR2_PACKAGE_MENDER
>         bool "mender"
> -       depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> -       depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> -       depends on BR2_TOOLCHAIN_HAS_THREADS
> -       select BR2_PACKAGE_HOST_GO
> +       depends on BR2_INSTALL_LIBSTDCPP
> +       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # (bundled yaml-cpp)
> +       depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # boost-log
> +       depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS #
> boost-log
> +       depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-log
> +       depends on BR2_USE_MMU # libglib2
> +       depends on BR2_USE_WCHAR # boost, libarchive, libglib2
> +       depends on BR2_PACKAGE_SYSTEMD
> +       select BR2_PACKAGE_BOOST
> +       select BR2_PACKAGE_BOOST_FILESYSTEM
> +       select BR2_PACKAGE_BOOST_LOG
> +       select BR2_PACKAGE_CA_CERTIFICATES
> +       select BR2_PACKAGE_LIBARCHIVE
> +       select BR2_PACKAGE_LIBGLIB2
> +       select BR2_PACKAGE_LMDB
>         select BR2_PACKAGE_OPENSSL
>         select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
>         select BR2_PACKAGE_LIBOPENSSL_ENGINES
> @@ -21,16 +32,13 @@ config BR2_PACKAGE_MENDER
>             - uboot-tools must be selected.
>             - fw_printenv must be functional on the device.
>           The Mender Uboot patches are at:
> -         https://github.com/mendersoftware/meta-mender/
> +
> https://github.com/mendersoftware/meta-mender/tree/master/meta-mender-core/recipes-bsp/u-boot/patches
>
>           For more information on Manual U-Boot integration, see:
> -
> https://docs.mender.io/2.6/system-updates-yocto-project/board-integration/bootloader-support/u-boot/manual-u-boot-integration
> +
> https://docs.mender.io/3.4/system-updates-yocto-project/board-integration/bootloader-support/u-boot/manual-u-boot-integration
>
>           For systems using Grub2 as the bootloader:
>             - Mender depends on the mender-grubenv package.
> -           - The mender-grubenv package provides a fw_printenv script,
> -             which is not compatible with the uboot-tools fw_printenv
> -             script.
>
>           The mender project recommends using uboot to load Grub2 as a
>           secondary bootloader whenever possible. Using Grub2 as a
> @@ -39,7 +47,12 @@ config BR2_PACKAGE_MENDER
>
>           https://github.com/mendersoftware/mender
>
> -comment "mender needs a toolchain w/ threads"
> -       depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> -       depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> -       depends on !BR2_TOOLCHAIN_HAS_THREADS
> +comment "mender needs systemd"
> +       depends on !BR2_PACKAGE_SYSTEMD
> +
> +comment "mender needs a toolchain w/ C++, NPTL, wchar, not affected by
> GCC bug 64735"
> +       depends on BR2_USE_MMU
> +       depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
> +       depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> +       depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> +               !BR2_TOOLCHAIN_HAS_THREADS_NPTL
> diff --git a/package/mender/S42mender b/package/mender/S42mender
> deleted file mode 100644
> index 70116ed4eb..0000000000
> --- a/package/mender/S42mender
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -#!/bin/sh
> -#
> -# Starts mender service.
> -#
> -DAEMON="mender"
> -DAEMON_PATH="/usr/bin/mender"
> -PIDFILE="/var/run/${DAEMON}.pid"
> -DAEMON_ARGS="daemon"
> -
> -start() {
> -       printf "Starting mender service: "
> -       umask 077
> -       start-stop-daemon -bmSqp "$PIDFILE" -x ${DAEMON_PATH} --
> ${DAEMON_ARGS}
> -       status=$?
> -       [ "${status}" = 0 ] && echo "OK" || echo "FAIL"
> -}
> -
> -stop() {
> -       printf "Stopping mender service: "
> -       start-stop-daemon -Kqp "$PIDFILE"
> -       status=$?
> -       [ "${status}" = 0 ] && echo "OK" || echo "FAIL"
> -}
> -restart() {
> -       stop
> -       start
> -}
> -
> -case "$1" in
> -       start)
> -               start
> -               ;;
> -       stop)
> -               stop
> -               ;;
> -       restart|reload)
> -               restart
> -               ;;
> -       *)
> -               echo "Usage: $0 {start|stop|reload|restart}"
> -               exit 1
> -esac
> -
> -exit $?
> diff --git a/package/mender/mender-client.service
> b/package/mender/mender-client.service
> deleted file mode 100644
> index 47e439993c..0000000000
> --- a/package/mender/mender-client.service
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -[Unit]
> -Description=Mender OTA update service
> -After=systemd-resolved.service
> -
> -[Service]
> -Type=idle
> -User=root
> -Group=root
> -ExecStart=/usr/bin/mender daemon
> -Restart=on-abort
> -
> -[Install]
> -WantedBy=multi-user.target
> diff --git a/package/mender/mender.hash b/package/mender/mender.hash
> index 17fe08c827..1aa8fb63bd 100644
> --- a/package/mender/mender.hash
> +++ b/package/mender/mender.hash
> @@ -1,47 +1,27 @@
>  # Locally computed:
> -sha256  35e369759b8d4f012153e538b5daf1e0cebe842205811e708332c5a092270ac5
> mender-3.5.3-go2.tar.gz
> +sha256  436ae559358f29c672b98ca77b953936ba6ef51455466fb5ed0ced7ae77fc226
> mender-5.2.0.tar.gz
> +sha256  4d3409e4f8f7f3b9de5da7fee7c03e36a2381a02b2e318702485fc993a735cc9
> LIC_FILES_CHKSUM.sha256
>
>  # Vendor licenses
>  # Generated with sed '/^[A-Za-z0-9_]/s/^/sha256  /'
> LIC_FILES_CHKSUM.sha256
>
>  # Apache-2.0 license.
> -sha256  d0f406b04e7901e6b4076bdf5fd20f9d7f04fc41681069fd8954413ac6295688
> LICENSE
> -sha256  52b2497ce07650b825015e80ca7a5d40c360c04c530234ca6d950b0f98bca23a
> vendor/github.com/mendersoftware/mender-artifact/LICENSE
> -sha256 <http://github.com/mendersoftware/mender-artifact/LICENSE-sha256>
> 73ba74dfaa520b49a401b5d21459a8523a146f3b7518a833eea5efa85130bf68  vendor/
> github.com/mendersoftware/openssl/LICENSE
> -sha256 <http://github.com/mendersoftware/openssl/LICENSE-sha256>
> cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/
> github.com/minio/sha256-simd/LICENSE
> -sha256 <http://github.com/minio/sha256-simd/LICENSE-sha256>
> 8f5d89b47d7a05a199b77b7e0f362dad391d451ebda4ef48ba11c50c071564c7  vendor/
> github.com/mendersoftware/progressbar/LICENSE
> +sha256 <http://github.com/mendersoftware/progressbar/LICENSE+sha256>
> d7e8fd4ad05371007d60285c309ba7a7ce3e61029b843f949fbb9ec79dc9eb47  LICENSE
>  #
> -# BSD 2 Clause license.
> -sha256  8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86
> vendor/github.com/pkg/errors/LICENSE
> -sha256 <http://github.com/pkg/errors/LICENSE-sha256>
> e4646a82a976369d7ae8f6ed5c11d35dc0af18433a8ccc24c85b459ad8b95128  vendor/
> github.com/godbus/dbus/LICENSE
> -sha256 <http://github.com/godbus/dbus/LICENSE-sha256>
> 2be1b548b0387ca8948e1bb9434e709126904d15f622cc2d0d8e7f186e4d122d  vendor/
> github.com/gorilla/websocket/LICENSE
> +# MIT clause license
> +sha256  d64d1b4d948aa7751cfb613c02dc246aab7b358d760053e6580f01affe946906
> src/common/vendor/json/LICENSE.MIT
> +sha256  7920c8620b1e073a79a667c44f9149c25724eb9f0f6b220b3c8d9564e2d40a43
> src/common/vendor/json/docs/mkdocs/docs/home/license.md
> +sha256  2aefa40fa7e1c0fab18fbad5b15b02406eea1399d3cca42cc1012b65b4a56f74
> src/common/vendor/tiny-process-library/LICENSE
> +sha256  aa6fcc27be034e41e21dd832f9175bfe694a48491d9e14ff0fa278e19ad14f1b
> src/common/vendor/yaml-cpp/LICENSE
>  #
> -# BSD 3 Clause license.
> -sha256  0d9e582ee4bff57bf1189c9e514e6da7ce277f9cd3bc2d488b22fbb39a6d87cf
> vendor/github.com/klauspost/compress/LICENSE
> -sha256 <http://github.com/klauspost/compress/LICENSE-sha256>
> 2eb550be6801c1ea434feba53bf6d12e7c71c90253e0a9de4a4f46cf88b56477  vendor/
> github.com/pmezard/go-difflib/LICENSE
> -sha256 <http://github.com/pmezard/go-difflib/LICENSE-sha256>
> 2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/
> golang.org/x/sys/LICENSE
> -sha256 <http://golang.org/x/sys/LICENSE-sha256>
> 0634b008cee55ca01f0888d2f5aba2d34e66c3f52c31a4e16a5d5d33d0c2a03e  vendor/
> github.com/bmatsuo/lmdb-go/LICENSE.md
> -sha256 <http://github.com/bmatsuo/lmdb-go/LICENSE.md-sha256>
> 87640bc4df2ceb1559f268a3db1ba859ab780f7ba5b1b4545173d4680a3d918b  vendor/
> github.com/remyoudompheng/go-liblzma/LICENSE
> -sha256 <http://github.com/remyoudompheng/go-liblzma/LICENSE-sha256>
> 2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/
> golang.org/x/term/LICENSE
> +# UNLICENSE
> +sha256  7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c
> src/common/vendor/lmdbxx/UNLICENSE
>  #
> -# ISC license.
> -sha256  1b93a317849ee09d3d7e4f1d20c2b78ddb230b4becb12d7c224c927b9d470251
> vendor/github.com/davecgh/go-spew/LICENSE
> +# CC0 1.0 Universal
> +sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499
> src/common/vendor/expected/COPYING
>  #
> -# MIT license.
> -sha256  6d2de1cde19c4d2bd8bcd9aaa1d581f4cfa3db9cf71896140330eaa2f2687685
> vendor/github.com/klauspost/pgzip/LICENSE
> -sha256 <http://github.com/klauspost/pgzip/LICENSE-sha256>
> f69f157b0be75da373605dbc8bbf142e8924ee82d8f44f11bcaf351335bf98cf  vendor/
> github.com/klauspost/compress/internal/snapref/LICENSE
> -sha256
> <http://github.com/klauspost/compress/internal/snapref/LICENSE-sha256>
> f566a9f97bacdaf00d9f21dd991e81dc11201c4e016c86b470799429a1c9a79c  vendor/
> github.com/klauspost/compress/zstd/internal/xxhash/LICENSE.txt
> -sha256  5d966570d7a442d4e969892860a914e542c97f262c873baee8f0aa48e1f40212
> vendor/github.com/klauspost/cpuid/v2/LICENSE
> -sha256 <http://github.com/klauspost/cpuid/v2/LICENSE-sha256>
> 51a0c9ec7f8b7634181b8d4c03e5b5d204ac21d6e72f46c313973424664b2e6b  vendor/
> github.com/sirupsen/logrus/LICENSE
> -sha256 <http://github.com/sirupsen/logrus/LICENSE-sha256>
> f8e536c1c7b695810427095dc85f5f80d44ff7c10535e8a9486cf393e2599189  vendor/
> github.com/stretchr/testify/LICENSE
> -sha256 <http://github.com/stretchr/testify/LICENSE-sha256>
> ffa15bdce332058a03a1d923910864fb6e58bf6df66a0e3914284725b327183e  vendor/
> github.com/ungerik/go-sysfs/LICENSE
> -sha256 <http://github.com/ungerik/go-sysfs/LICENSE-sha256>
> da277af11b85227490377fbcac6afccc68be560c4fff36ac05ca62de55345fd7  vendor/
> github.com/urfave/cli/v2/LICENSE
> -sha256 <http://github.com/urfave/cli/v2/LICENSE-sha256>
> b2663894033a05fd80261176cd8da1d72546e25842d5c1abcc852ca23b6b61b0  vendor/
> github.com/stretchr/objx/LICENSE
> -sha256 <http://github.com/stretchr/objx/LICENSE-sha256>
> d18f6323b71b0b768bb5e9616e36da390fbd39369a81807cca352de4e4e6aa0b  vendor/
> gopkg.in/yaml.v3/LICENSE
> -sha256 <http://gopkg.in/yaml.v3/LICENSE-sha256>
> 08eab1118c80885fa1fa6a6dd7303f65a379fcb3733e063d20d1bbc2c76e6fa1  vendor/
> github.com/mattn/go-isatty/LICENSE
> +# Boost Software License
> +sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566
> src/common/vendor/optional-lite/LICENSE.txt
>  #
> -# OpenLDAP Public License
> -sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569
> vendor/github.com/bmatsuo/lmdb-go/LICENSE.mdb.md
> -
> -# sha256 of all the vendor licenses combined
> -sha256  86407bd98d5ea7fb0f09ab771c3333e975d06565b809a2dd95f864dc1e3a09b3
> LIC_FILES_CHKSUM.sha256
> +# BSD-3
> +sha256  9702de7e4117a8e2b20dafab11ffda58c198aede066406496bef670d40a22138
> src/common/vendor/yaml-cpp/test/googletest-1.16.0/LICENSE
> diff --git a/package/mender/mender.mk b/package/mender/mender.mk
> index 76dc28d547..e20fec8aa9 100644
> --- a/package/mender/mender.mk
> +++ b/package/mender/mender.mk
> @@ -4,107 +4,107 @@
>  #
>
>  ################################################################################
>
> -MENDER_VERSION = 3.5.3
> -MENDER_SITE = $(call github,mendersoftware,mender,$(MENDER_VERSION))
> -MENDER_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT,
> OLDAP-2.8
> +MENDER_VERSION = 5.2.0
> +MENDER_SITE =
> https://github.com/mendersoftware/mender/releases/download/$(MENDER_VERSION)
> +MENDER_LICENSE = Apache-2.0, BSL-1.0, BSD-3-Clause, CC0-1.0, MIT,
> Unlicense
>  MENDER_CPE_ID_VENDOR = northern.tech
> -# CVE-2024-46948 only affects mender-server
> -MENDER_IGNORE_CVES = CVE-2024-46948
>
>  # Vendor license paths generated with:
>  #    awk '{print $2}' LIC_FILES_CHKSUM.sha256 | grep vendor
>  MENDER_LICENSE_FILES = \
>         LICENSE \
>         LIC_FILES_CHKSUM.sha256 \
> -       vendor/github.com/mendersoftware/mender-artifact/LICENSE \
> -       vendor/github.com/mendersoftware/openssl/LICENSE \
> -       vendor/github.com/minio/sha256-simd/LICENSE \
> -       vendor/github.com/mendersoftware/progressbar/LICENSE \
> -       vendor/github.com/pkg/errors/LICENSE \
> -       vendor/github.com/godbus/dbus/LICENSE \
> -       vendor/github.com/gorilla/websocket/LICENSE \
> -       vendor/github.com/klauspost/compress/LICENSE \
> -       vendor/github.com/pmezard/go-difflib/LICENSE \
> -       vendor/golang.org/x/sys/LICENSE \
> -       vendor/github.com/bmatsuo/lmdb-go/LICENSE.md \
> -       vendor/github.com/remyoudompheng/go-liblzma/LICENSE \
> -       vendor/golang.org/x/term/LICENSE \
> -       vendor/github.com/davecgh/go-spew/LICENSE \
> -       vendor/github.com/klauspost/pgzip/LICENSE \
> -       vendor/github.com/klauspost/compress/internal/snapref/LICENSE \
> -       vendor/
> github.com/klauspost/compress/zstd/internal/xxhash/LICENSE.txt \
> -       vendor/github.com/klauspost/cpuid/v2/LICENSE \
> -       vendor/github.com/sirupsen/logrus/LICENSE \
> -       vendor/github.com/stretchr/testify/LICENSE \
> -       vendor/github.com/ungerik/go-sysfs/LICENSE \
> -       vendor/github.com/urfave/cli/v2/LICENSE \
> -       vendor/github.com/stretchr/objx/LICENSE \
> -       vendor/gopkg.in/yaml.v3/LICENSE \
> -       vendor/github.com/mattn/go-isatty/LICENSE \
> -       vendor/github.com/bmatsuo/lmdb-go/LICENSE.mdb.md
> -
> -MENDER_DEPENDENCIES = host-pkgconf openssl
> -
> -MENDER_LDFLAGS = -X
> github.com/mendersoftware/mender/conf.Version=$(MENDER_VERSION)
> -
> -MENDER_UPDATE_MODULES_FILES = directory single-file
> +       src/common/vendor/json/LICENSE.MIT \
> +       src/common/vendor/json/docs/mkdocs/docs/home/license.md \
> +       src/common/vendor/tiny-process-library/LICENSE \
> +       src/common/vendor/yaml-cpp/LICENSE \
> +       src/common/vendor/lmdbxx/UNLICENSE \
> +       src/common/vendor/expected/COPYING \
> +       src/common/vendor/optional-lite/LICENSE.txt \
> +       src/common/vendor/yaml-cpp/test/googletest-1.16.0/LICENSE
> +
> +MENDER_DEPENDENCIES += \
> +       host-pkgconf \
> +       boost \
> +       dbus \
> +       libarchive \
> +       libglib2 \
> +       lmdb \
> +       openssl \
> +       systemd
> +
> +MENDER_INSTALL_TARGET_OPTS = \
> +       install-bin \
> +       install-dbus \
> +       install-dbus-service-files \
> +       install-identity-scripts \
> +       install-inventory-network-scripts \
> +       install-inventory-scripts \
> +       install-modules \
> +       install-rootfs-image-module \
> +       install-systemd
>
>  define MENDER_INSTALL_CONFIG_FILES
> -       $(INSTALL) -d -m 755 $(TARGET_DIR)/etc/mender/scripts
> -       echo -n "3" > $(TARGET_DIR)/etc/mender/scripts/version
> -
>         $(INSTALL) -D -m 0644 $(MENDER_PKGDIR)/mender.conf \
>                 $(TARGET_DIR)/etc/mender/mender.conf
> -       $(INSTALL) -D -m 0644 $(MENDER_PKGDIR)/server.crt \
> -               $(TARGET_DIR)/etc/mender/server.crt
>
> -       $(INSTALL) -D -m 0755 $(@D)/support/mender-device-identity \
> -
>  $(TARGET_DIR)/usr/share/mender/identity/mender-device-identity
> -       $(foreach f,bootloader-integration hostinfo network os
> rootfs-type, \
> -               $(INSTALL) -D -m 0755 $(@D)/support/mender-inventory-$(f) \
> -
>  $(TARGET_DIR)/usr/share/mender/inventory/mender-inventory-$(f)
> -       )
> +       $(INSTALL) -D -m 0644 $(@D)/support/demo.crt \
> +               $(TARGET_DIR)/etc/mender/server.crt
>
>         $(INSTALL) -D -m 0755 $(MENDER_PKGDIR)/device_type \
>                         $(TARGET_DIR)/etc/mender/device_type
>
> -       mkdir -p $(TARGET_DIR)/var/lib/mender
> -       $(foreach f,$(MENDER_UPDATE_MODULES_FILES), \
> -               $(INSTALL) -D -m 0755 $(@D)/support/modules/$(notdir $(f))
> \
> -                       $(TARGET_DIR)/usr/share/mender/modules/v3/$(notdir
> $(f))
> -       )
> +       mkdir -p $(TARGET_DIR)/var/lib
>  endef
> -
>  MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_CONFIG_FILES
>
> +# The vendored tiny-process-library and yaml-cpp are built as part of
> +# mender but never installed, so always link them statically.
> +MENDER_CONF_OPTS += \
> +       -DBUILD_SHARED_LIBS=OFF \
> +       -DMENDER_EMBED_MENDER_AUTH=OFF \
> +       -DMENDER_USE_DBUS=ON \
> +       -DMENDER_VERSION=$(MENDER_VERSION)
> +
> +ifeq ($(BR2_PACKAGE_GZIP),y)
> +MENDER_DEPENDENCIES += gzip
> +MENDER_CONF_OPTS += -DMENDER_ARTIFACT_GZIP_COMPRESSION=ON
> +else
> +MENDER_CONF_OPTS += -DMENDER_ARTIFACT_GZIP_COMPRESSION=OFF
> +endif
> +
>  ifeq ($(BR2_PACKAGE_XZ),y)
>  MENDER_DEPENDENCIES += xz
> +MENDER_CONF_OPTS += -DMENDER_ARTIFACT_LZMA_COMPRESSION=ON
>  else
> -MENDER_TAGS += nolzma
> +MENDER_CONF_OPTS += -DMENDER_ARTIFACT_LZMA_COMPRESSION=OFF
>  endif
>
> -ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_LIBGLIB2),yy)
> -MENDER_DEPENDENCIES += libglib2
> -define MENDER_INSTALL_DBUS_AUTHENTICATION_MANAGER_CONF
> -       $(INSTALL) -D -m 0755
> $(@D)/support/dbus/io.mender.AuthenticationManager.conf \
> -
>  $(TARGET_DIR)/etc/dbus-1/system.d/io.mender.AuthenticationManager.conf
> -
> -       $(INSTALL) -D -m 0755
> $(@D)/support/dbus/io.mender.UpdateManager.conf \
> -
>  $(TARGET_DIR)/etc/dbus-1/system.d/io.mender.UpdateManager.conf
> -endef
> -MENDER_POST_INSTALL_TARGET_HOOKS +=
> MENDER_INSTALL_DBUS_AUTHENTICATION_MANAGER_CONF
> +ifeq ($(BR2_PACKAGE_ZSTD),y)
> +MENDER_DEPENDENCIES += zstd
> +MENDER_CONF_OPTS += -DMENDER_ARTIFACT_ZSTD_COMPRESSION=ON
>  else
> -MENDER_TAGS += nodbus
> +MENDER_CONF_OPTS += -DMENDER_ARTIFACT_ZSTD_COMPRESSION=OFF
>  endif
>
> -define MENDER_INSTALL_INIT_SYSTEMD
> -       $(INSTALL) -D -m 0644 $(MENDER_PKGDIR)/mender-client.service \
> -               $(TARGET_DIR)/usr/lib/systemd/system/mender-client.service
> +define MENDER_INSTALL_MODULES_GEN
> +       $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) install-modules-gen
> +endef
> +MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_MODULES_GEN
> +
> +define MENDER_INSTALL_TARGET_CMDS
> +       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR)
> $(MENDER_INSTALL_TARGET_OPTS)
>  endef
>
> -define MENDER_INSTALL_INIT_SYSV
> -       $(INSTALL) -D -m 755 $(MENDER_PKGDIR)/S42mender \
> -               $(TARGET_DIR)/etc/init.d/S42mender
> +# Needed for rootfs-image-module
> +define  MENDER_BUSYBOX_CONFIG_FIXUPS
> +       $(call KCONFIG_ENABLE_OPT,CONFIG_FLOCK)
> +       $(call KCONFIG_ENABLE_OPT,CONFIG_STAT)
> +       $(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_STAT_FORMAT)
> +       $(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_SYNC_FANCY)
> +       $(call KCONFIG_ENABLE_OPT,CONFIG_WGET)
> +       $(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_WGET_HTTPS)
> +       $(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_WGET_OPENSSL)
>  endef
>
> -$(eval $(golang-package))
> +$(eval $(cmake-package))
> diff --git a/package/mender/server.crt b/package/mender/server.crt
> deleted file mode 100644
> index 79a57e15e7..0000000000
> --- a/package/mender/server.crt
> +++ /dev/null
> @@ -1,22 +0,0 @@
> ------BEGIN CERTIFICATE-----
> -MIIBfTCCASOgAwIBAgIJAJOS76a0qWuZMAoGCCqGSM49BAMCMBsxGTAXBgNVBAMM
> -EGRvY2tlci5tZW5kZXIuaW8wHhcNMTYxMjE0MTk1MjQ2WhcNMjYxMjEyMTk1MjQ2
> -WjAbMRkwFwYDVQQDDBBkb2NrZXIubWVuZGVyLmlvMFkwEwYHKoZIzj0CAQYIKoZI
> -zj0DAQcDQgAE7AVYis6MWGPGQYU1/tlLEnskRifDIhvkRb8Y4nQPekRkLkiBYYT3
> -iJ46wHrnejbHaLstU9GRdKWOmOuU6HGdO6NQME4wHQYDVR0OBBYEFGOIU4q++Vz8
> -9HuT1jg9V+wFeJcyMB8GA1UdIwQYMBaAFGOIU4q++Vz89HuT1jg9V+wFeJcyMAwG
> -A1UdEwQFMAMBAf8wCgYIKoZIzj0EAwIDSAAwRQIhAPLnEeWPNeN7eDCEYRitBfyO
> -X1yf2kzOm4ohBE5GY9gzAiBCq7HOSkzQDkelmQCCCpGXf/UwYNgQJjSoeGfk0j1a
> -TQ==
> ------END CERTIFICATE-----
> ------BEGIN CERTIFICATE-----
> -MIIBhDCCASmgAwIBAgIJALQrf4QDot4IMAoGCCqGSM49BAMCMB4xHDAaBgNVBAMM
> -E3MzLmRvY2tlci5tZW5kZXIuaW8wHhcNMTYxMjE0MTk1MjQ2WhcNMjYxMjEyMTk1
> -MjQ2WjAeMRwwGgYDVQQDDBNzMy5kb2NrZXIubWVuZGVyLmlvMFkwEwYHKoZIzj0C
> -AQYIKoZIzj0DAQcDQgAEEc/Y3T+l3DvINePkpvVZORMIdHVs29jgsl48ia7z/NRX
> -HlKtKxVGJyFN5Y7sBZeLgBYH3F4Bo3KfmxI7ad0tI6NQME4wHQYDVR0OBBYEFIUm
> -cip00QZYpe4ULflbGNJan+Y9MB8GA1UdIwQYMBaAFIUmcip00QZYpe4ULflbGNJa
> -n+Y9MAwGA1UdEwQFMAMBAf8wCgYIKoZIzj0EAwIDSQAwRgIhANHij9VZBDHOUPaC
> -pFiagnWnYL2HBR72W1xTKQbrLLTXAiEAvpwA4HzSnGmLd3010+jqQuMRHArN5WaX
> -h0fy7niBbIQ=
> ------END CERTIFICATE-----
> diff --git a/support/testing/tests/package/test_mender.py
> b/support/testing/tests/package/test_mender.py
> index 14440c9527..44196d6a96 100644
> --- a/support/testing/tests/package/test_mender.py
> +++ b/support/testing/tests/package/test_mender.py
> @@ -3,45 +3,69 @@ import os
>  import infra.basetest
>
>
> +# gitlab-runner: large
>  class TestMenderInfra(infra.basetest.BRTest):
> -    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> -             """
> -             BR2_PACKAGE_MENDER=y
> -             BR2_PACKAGE_HOST_MENDER_ARTIFACT=y
> -             BR2_TARGET_ROOTFS_CPIO=y
> -             BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
> -             BR2_ROOTFS_OVERLAY="{}"
> -             """.format(
> -
>  infra.filepath("tests/package/test_mender/post-build.sh"),
> -                 # overlay to add a fake 'fw_printenv', used by Mender
> -
>  infra.filepath("tests/package/test_mender/rootfs-overlay"))
> +    # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it does
> +    # not include BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
> +    # needed by mender. This config also uses an ext4 rootfs as
> +    # the default 128MB is too small for an image with mender and systemd.
> +    config = \
> +        """
> +        BR2_x86_64=y
> +        BR2_x86_corei7=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE=y
> +        BR2_INIT_SYSTEMD=y
> +        BR2_SYSTEM_DHCP="eth0"
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.59"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/mender/x86_64/linux.config"
> +        BR2_PACKAGE_MENDER=y
> +        BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
> +        BR2_ROOTFS_OVERLAY="{}"
> +        BR2_PACKAGE_HOST_MENDER_ARTIFACT=y
> +        BR2_TARGET_ROOTFS_EXT2=y
> +        BR2_TARGET_ROOTFS_EXT2_4=y
> +        BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """.format(
> +           infra.filepath("tests/package/test_mender/post-build.sh"),
> +           # overlay to add a fake 'fw_printenv', used by Mender
> +           infra.filepath("tests/package/test_mender/rootfs-overlay"))
>
>      def base_test_run(self):
> -        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> -        self.emulator.boot(arch="armv5", kernel="builtin",
> -                           options=["-initrd", cpio_file])
> +        drive = os.path.join(self.builddir, "images", "rootfs.ext4")
> +        kern = os.path.join(self.builddir, "images", "bzImage")
> +        self.emulator.boot(arch="x86_64",
> +                           kernel=kern,
> +                           kernel_cmdline=["root=/dev/vda console=ttyS0
> net.ifnames=0"],
> +                           options=["-cpu", "Nehalem",
> +                                    "-m", "256M",
> +                                    "-net", "nic,model=virtio",
> +                                    "-net", "user",
> +                                    "-drive",
> f"file={drive},if=virtio,format=raw"])
>          self.emulator.login()
>
>      def run_mender_test(self):
> -        self.assertRunOk("ps aux | egrep [m]ender")
> +
> +        # mender-authd requires systemd-resolved.service to be up,
> +        # so wait for eth0 to get its DHCP address before querying.
> +        cmd = "while ! ifconfig eth0 | grep -q 'inet addr'; do sleep 1;
> done"
> +        self.assertRunOk(cmd, timeout=30)
> +
> +        output, _ = self.emulator.run("systemctl is-active
> mender-updated")
> +        self.assertEqual(output[0], "active")
>
>          # Check if a simple Mender command is correctly executed
> -        self.assertRunOk("mender -log-level debug show-artifact")
> -        self.assertRunOk("mender -log-level debug show-artifact | grep
> 'RUNTIME_TEST_ARTIFACT_NAME'")
> -        cmd = "mender show-artifact 2>&1 | grep -i 'err'"  # Check if no
> 'error' among the traces
> +        self.assertRunOk("mender-update --log-level debug show-artifact")
> +        self.assertRunOk("mender-update --log-level debug show-artifact |
> grep 'RUNTIME_TEST_ARTIFACT_NAME'")
> +        cmd = "mender-update show-artifact 2>&1 | grep -i 'err'"  # Check
> if no 'error' among the traces
>          _, exit_code = self.emulator.run(cmd)
>          self.assertEqual(exit_code, 1)
>
>
> -class TestMenderRW(TestMenderInfra):
> -    def test_run(self):
> -        TestMenderInfra.base_test_run(self)
> -
> -        # Check if the Daemon is running
> -        self.assertRunOk("ls /var/run/mender.pid")
> -        self.run_mender_test()
> -
> -
>  class TestMenderRO(TestMenderInfra):
>      config = \
>          """
> @@ -51,22 +75,4 @@ class TestMenderRO(TestMenderInfra):
>
>      def test_run(self):
>          TestMenderInfra.base_test_run(self)
> -
> -        # Check if the Daemon is running
> -        self.assertRunOk("ls /var/run/mender.pid")
> -        self.run_mender_test()
> -
> -
> -# gitlab-runner: large
> -class TestMenderSystemd(TestMenderInfra):
> -    config = \
> -        """
> -        {}
> -        BR2_INIT_SYSTEMD=y
> -        """.format(TestMenderInfra.config)
> -
> -    def test_run(self):
> -        TestMenderInfra.base_test_run(self)
> -        output, _ = self.emulator.run("systemctl is-active mender-client")
> -        self.assertEqual(output[0], "active")
>          self.run_mender_test()
> --
> 2.56.0
>
>

--000000000000bd7f29065ee74ee8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>All;</div><div><br></div><div>This was tested against=
 libopenssl 4.0.2 using Bernd&#39;s patch here:</div><div><a href=3D"https:=
//patchwork.buildroot.org/project/buildroot/patch/20261011130058.3443432-53=
-bernd@kuhls.net/">https://patchwork.buildroot.org/project/buildroot/patch/=
20261011130058.3443432-53-bernd@kuhls.net/</a></div><div><br></div><div>Wit=
h a boost update patches applied from this series:</div><div><a href=3D"htt=
ps://patchwork.buildroot.org/project/buildroot/list/?series=3D1112&amp;arch=
ive=3Dboth&amp;state=3D*">https://patchwork.buildroot.org/project/buildroot=
/list/?series=3D1112&amp;archive=3Dboth&amp;state=3D*</a></div><div><br></d=
iv><div>Testing went as follows:</div><div>=C2=A0 - make mender_x86_64_efi_=
defconfig</div><div>=C2=A0 - Add openssh to the image</div><div>=C2=A0 - Bo=
ot using the following command:</div><div><br></div><div>```</div><div>qemu=
-system-x86_64 \<br>=C2=A0 =C2=A0 -enable-kvm \<br>=C2=A0 =C2=A0 -display g=
tk,gl=3Don,show-cursor=3Don \<br>=C2=A0 =C2=A0 -m 512M \<br>=C2=A0 =C2=A0 -=
M q35,accel=3Dkvm \<br>=C2=A0 =C2=A0 -cpu host \<br>=C2=A0 =C2=A0 -netdev b=
ridge,br=3Dvirbr0,id=3Dnet0,helper=3D&quot;/usr/libexec/qemu-bridge-helper&=
quot; \<br>=C2=A0 =C2=A0 -device virtio-net-pci,netdev=3Dnet0 \<br>=C2=A0 =
=C2=A0 -net user \<br>=C2=A0 =C2=A0 -drive file=3Doutput/images/disk.img,if=
=3Dvirtio,format=3Draw \<br>=C2=A0 =C2=A0 -bios /usr/share/edk2/ovmf/OVMF_C=
ODE.fd</div><div>```</div><div><br></div><div>Modify the ServerURL entry in=
 /etc/mender/mender.conf to point to my local mender server with</div><div>=
the address of &quot;<a href=3D"https://192.168.178.243">https://192.168.17=
8.243</a>&quot;</div><div><br></div><div>Replace=C2=A0/etc/mender/server.cr=
t with my local development certificate.</div><div><br></div><div>The qemu =
device appears properly on my local testing server and I am able to push up=
dates</div><div>to the running virtual image.</div><div><br></div><div><br>=
</div><br></div><br><div class=3D"gmail_quote gmail_quote_container"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Wed, 28 Oct 2026 at 12:33, Adam Duskett =
&lt;<a href=3D"mailto:adam.duskett@amarulasolutions.com">adam.duskett@amaru=
lasolutions.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Starting with Mender version 4, the program is rewritten fro=
m Go to C++ using<br>
CMake.<br>
<br>
The current package provided by Buildroot is 3.5.3, which is quite old, hav=
ing<br>
been released on 12/6/2024. Since then, several changes have occurred,<br>
necessitating a substantially large patch with many changes all at once.<br=
>
<br>
The following is a list of changes:<br>
<br>
MAJOR:<br>
=C2=A0 - Mender is now a C++ project<br>
=C2=A0 - Mender depends on systemd<br>
=C2=A0 - Drops sysvinit support<br>
=C2=A0 - Mender is split into two binaries:<br>
=C2=A0 =C2=A0 =C2=A0 - mender-authd<br>
=C2=A0 =C2=A0 =C2=A0 - mender-updated<br>
<br>
MINOR:<br>
<br>
=C2=A0 - Drop the 0001-openssl-v4-update.patch.<br>
=C2=A0 - Add 0001-src-common-crypto-platform-openssl-crypto.cpp-fix-bu.patc=
h<br>
=C2=A0 =C2=A0 Which allowd building without OpenSSL engine support.<br>
<br>
=C2=A0 =C2=A0 This patch is tested against OpenSSL 4.0.2 which is not yet a=
pplied<br>
=C2=A0 =C2=A0 to the master branch.<br>
<br>
=C2=A0 - The following busyboxy options are required by the rootfs module a=
nd are<br>
=C2=A0 =C2=A0 enabled by default:<br>
=C2=A0 =C2=A0 - flock<br>
=C2=A0 =C2=A0 - stat<br>
=C2=A0 =C2=A0 - stat_format<br>
=C2=A0 =C2=A0 - sync_fancy<br>
=C2=A0 =C2=A0 - wget<br>
=C2=A0 =C2=A0 - wget_https<br>
=C2=A0 =C2=A0 - wget_openssl<br>
=C2=A0 =C2=A0 =C2=A0 Note: While sync_fancy isn&#39;t strictly necessary, e=
nabling this feature<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prevents several messages about s=
ync ignoring all arguments.<br>
<br>
=C2=A0 - New dependencies are as follows:<br>
=C2=A0 =C2=A0 - boost<br>
=C2=A0 =C2=A0 - dbus<br>
=C2=A0 =C2=A0 - libarchive<br>
=C2=A0 =C2=A0 - libglib2<br>
=C2=A0 =C2=A0 - lmdb<br>
=C2=A0 =C2=A0 - openssl<br>
=C2=A0 =C2=A0 - systemd<br>
=C2=A0 =C2=A0 - yaml-cpp<br>
<br>
The configs/mender_x86_64_efi_defconfig file is updated to<br>
use systemd by default.<br>
<br>
Mender is configured with -DBUILD_SHARED_LIBS=3DOFF as the bundled<br>
libyaml and tiny-process-library .so files are not installed when<br>
-DBUILD_SHARED_LIBS=3DON is selected.<br>
<br>
The support/testing/tests/package/test_mender.py is updated:<br>
=C2=A0 - Uses systemd<br>
=C2=A0 - Bumped kernel version to 6.18.59<br>
=C2=A0 - Adds a simple network as mender-authd requires network-online.targ=
et<br>
=C2=A0 - Drops sysvinit tests<br>
<br>
Signed-off-by: Adam Duskett &lt;<a href=3D"mailto:adam.duskett@amarulasolut=
ions.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a>&gt;<br>
---<br>
v2 -&gt; v3:<br>
=C2=A0 - Removed documentation update (see first patch in this series)<br>
=C2=A0 - Use an external toolchain for mender_x86_64_efi_defconfig [Thomas]=
<br>
=C2=A0 - Dropped jq selection for mender_x86_64_efi_defconfig [Thomas]<br>
=C2=A0 - Dropped yaml-cpp selection (bundled and linked statically in mende=
r source code)<br>
=C2=A0 - Cleaned up various make commands [Thomas]<br>
=C2=A0 - Removed kernel fragment used during debugging [Thomas]<br>
=C2=A0 - Add 0001-src-common-crypto-platform-openssl-crypto.cpp-fix-bu.patc=
h [Thomas]<br>
<br>
=C2=A0board/mender/x86_64/linux.config=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 11 +<br>
=C2=A0configs/mender_x86_64_efi_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A07 +-<br>
=C2=A0package/mender/0001-openssl-v4-update.patch=C2=A0 =C2=A0| 191 -------=
-----------<br>
=C2=A0...o-platform-openssl-crypto.cpp-fix-bu.patch |=C2=A0 69 +++++++<br>
=C2=A0package/mender/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 39 ++--<br>
=C2=A0package/mender/S42mender=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 44 ----<br>
=C2=A0package/mender/mender-client.service=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 13 --<br>
=C2=A0package/mender/mender.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 52 ++---<br>
=C2=A0package/mender/<a href=3D"http://mender.mk" rel=3D"noreferrer" target=
=3D"_blank">mender.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 146 ++++++-------<br>
=C2=A0package/mender/server.crt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 22 --<br>
=C2=A0support/testing/tests/package/test_mender.py=C2=A0 |=C2=A0 96 ++++---=
--<br>
=C2=A011 files changed, 249 insertions(+), 441 deletions(-)<br>
=C2=A0delete mode 100644 package/mender/0001-openssl-v4-update.patch<br>
=C2=A0create mode 100644 package/mender/0001-src-common-crypto-platform-ope=
nssl-crypto.cpp-fix-bu.patch<br>
=C2=A0delete mode 100644 package/mender/S42mender<br>
=C2=A0delete mode 100644 package/mender/mender-client.service<br>
=C2=A0delete mode 100644 package/mender/server.crt<br>
<br>
diff --git a/board/mender/x86_64/linux.config b/board/mender/x86_64/linux.c=
onfig<br>
index b758c6d45a..f980ec39ab 100644<br>
--- a/board/mender/x86_64/linux.config<br>
+++ b/board/mender/x86_64/linux.config<br>
@@ -1,4 +1,8 @@<br>
=C2=A0CONFIG_SYSVIPC=3Dy<br>
+CONFIG_CGROUPS=3Dy<br>
+CONFIG_CGROUP_SCHED=3Dy<br>
+CONFIG_CFS_BANDWIDTH=3Dy<br>
+CONFIG_USER_NS=3Dy<br>
=C2=A0CONFIG_SMP=3Dy<br>
=C2=A0CONFIG_HYPERVISOR_GUEST=3Dy<br>
=C2=A0CONFIG_PARAVIRT=3Dy<br>
@@ -15,18 +19,22 @@ CONFIG_NETFILTER_XTABLES_LEGACY=3Dy<br>
=C2=A0CONFIG_IP_NF_IPTABLES_LEGACY=3Dy<br>
=C2=A0CONFIG_IP_NF_IPTABLES=3Dy<br>
=C2=A0CONFIG_IP_NF_FILTER=3Dy<br>
+CONFIG_NET_SCHED=3Dy<br>
+CONFIG_NET_SCH_FQ_CODEL=3Dy<br>
=C2=A0CONFIG_CFG80211=3Dm<br>
=C2=A0CONFIG_CFG80211_WEXT=3Dy<br>
=C2=A0CONFIG_MAC80211=3Dm<br>
=C2=A0CONFIG_PCI=3Dy<br>
=C2=A0CONFIG_DEVTMPFS=3Dy<br>
=C2=A0CONFIG_DEVTMPFS_MOUNT=3Dy<br>
+CONFIG_DMI_SYSFS=3Dy<br>
=C2=A0CONFIG_VIRTIO_BLK=3Dy<br>
=C2=A0CONFIG_BLK_DEV_SD=3Dy<br>
=C2=A0CONFIG_SCSI_VIRTIO=3Dy<br>
=C2=A0CONFIG_ATA=3Dy<br>
=C2=A0CONFIG_NETDEVICES=3Dy<br>
=C2=A0CONFIG_VIRTIO_NET=3Dy<br>
+CONFIG_E1000E=3Dy<br>
=C2=A0CONFIG_ATH9K=3Dm<br>
=C2=A0CONFIG_ATH9K_HTC=3Dm<br>
=C2=A0CONFIG_CARL9170=3Dm<br>
@@ -57,8 +65,11 @@ CONFIG_VIRTIO_INPUT=3Dy<br>
=C2=A0CONFIG_VIRTIO_MMIO=3Dy<br>
=C2=A0CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=3Dy<br>
=C2=A0CONFIG_EXT4_FS=3Dy<br>
+CONFIG_AUTOFS_FS=3Dy<br>
=C2=A0CONFIG_FUSE_FS=3Dy<br>
=C2=A0CONFIG_VFAT_FS=3Dy<br>
+CONFIG_TMPFS=3Dy<br>
+CONFIG_TMPFS_POSIX_ACL=3Dy<br>
=C2=A0CONFIG_SQUASHFS=3Dy<br>
=C2=A0CONFIG_NLS_CODEPAGE_437=3Dy<br>
=C2=A0CONFIG_NLS_ISO8859_1=3Dy<br>
diff --git a/configs/mender_x86_64_efi_defconfig b/configs/mender_x86_64_ef=
i_defconfig<br>
index f10a461770..9cd68e5f62 100644<br>
--- a/configs/mender_x86_64_efi_defconfig<br>
+++ b/configs/mender_x86_64_efi_defconfig<br>
@@ -1,7 +1,6 @@<br>
=C2=A0BR2_x86_64=3Dy<br>
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=3Dy<br>
-BR2_INIT_SYSV=3Dy<br>
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=3Dy<br>
+BR2_TOOLCHAIN_EXTERNAL=3Dy<br>
+BR2_INIT_SYSTEMD=3Dy<br>
=C2=A0BR2_TARGET_GENERIC_GETTY_PORT=3D&quot;ttyS0&quot;<br>
=C2=A0BR2_ROOTFS_OVERLAY=3D&quot;board/mender/x86_64/overlay&quot;<br>
=C2=A0BR2_ROOTFS_POST_BUILD_SCRIPT=3D&quot;board/mender/x86_64/post-build.s=
h&quot;<br>
@@ -42,7 +41,7 @@ BR2_PACKAGE_MENDER_GRUBENV=3Dy<br>
=C2=A0BR2_PACKAGE_MENDER_GRUBENV_DEFINES=3D&quot;board/mender/x86_64/mender=
_grubenv_defines&quot;<br>
=C2=A0BR2_TARGET_ROOTFS_EXT2=3Dy<br>
=C2=A0BR2_TARGET_ROOTFS_EXT2_4=3Dy<br>
-BR2_TARGET_ROOTFS_EXT2_SIZE=3D&quot;128M&quot;<br>
+BR2_TARGET_ROOTFS_EXT2_SIZE=3D&quot;256M&quot;<br>
=C2=A0# BR2_TARGET_ROOTFS_TAR is not set<br>
=C2=A0BR2_TARGET_GRUB2=3Dy<br>
=C2=A0BR2_TARGET_GRUB2_X86_64_EFI=3Dy<br>
diff --git a/package/mender/0001-openssl-v4-update.patch b/package/mender/0=
001-openssl-v4-update.patch<br>
deleted file mode 100644<br>
index 65443614d5..0000000000<br>
--- a/package/mender/0001-openssl-v4-update.patch<br>
+++ /dev/null<br>
@@ -1,191 +0,0 @@<br>
-Description: Fix build compatibility with OpenSSL 4.0<br>
- Include &lt;openssl/x509v3.h&gt; in hostname.c and hostname.go before che=
cking<br>
- #ifndef X509_CHECK_FLAG_ALWAYS_CHECK_SUBJECT, preventing fallback to<br>
- legacy OpenSSL &lt; 1.0.2 code that attempts to directly access opaque<br=
>
- ASN1_STRING fields.<br>
- Also add preprocessor guards around deprecated protocol methods<br>
- (SSLv3_method, TLSv1_method, TLSv1_1_method, TLSv1_2_method) in shim.c<br=
>
- and ENGINE functions (ENGINE_by_id, ENGINE_init, ENGINE_free,<br>
- ENGINE_finish, ENGINE_load_private_key, ENGINE_load_builtin_engines)<br>
- in shim.c, shim.h, engine.go, key.go to prevent implicit declaration<br>
- and undefined reference errors when building against OpenSSL 4.0.<br>
-Author: Frank Heimes &lt;<a href=3D"mailto:frank.heimes@canonical.com" tar=
get=3D"_blank">frank.heimes@canonical.com</a>&gt;<br>
-<br>
-Downloaded from Ubuntu:<br>
-<a href=3D"https://git.launchpad.net/ubuntu/+source/golang-github-menderso=
ftware-openssl/tree/debian/patches/0004-openssl-v4-update.patch?h=3Dapplied=
/ubuntu/stonking-devel" rel=3D"noreferrer" target=3D"_blank">https://git.la=
unchpad.net/ubuntu/+source/golang-github-mendersoftware-openssl/tree/debian=
/patches/0004-openssl-v4-update.patch?h=3Dapplied/ubuntu/stonking-devel</a>=
<br>
-<br>
-Upstream: not applicable, upstream moved to c++ in newer versions<br>
-<br>
-[Bernd: rebased for vendored download by buildroot infra]<br>
-Signed-off-by: Bernd Kuhls &lt;<a href=3D"mailto:bernd@kuhls.net" target=
=3D"_blank">bernd@kuhls.net</a>&gt;<br>
-<br>
-diff -uNr mender-3.5.3.orig/vendor/<a href=3D"http://github.com/mendersoft=
ware/openssl/engine.go" rel=3D"noreferrer" target=3D"_blank">github.com/men=
dersoftware/openssl/engine.go</a> mender-3.5.3/vendor/<a href=3D"http://git=
hub.com/mendersoftware/openssl/engine.go" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/mendersoftware/openssl/engine.go</a><br>
---- mender-3.5.3.orig/vendor/<a href=3D"http://github.com/mendersoftware/o=
penssl/engine.go" rel=3D"noreferrer" target=3D"_blank">github.com/mendersof=
tware/openssl/engine.go</a>=C2=A0 =C2=A0 =C2=A0 =C2=A02024-05-24 12:07:27.0=
00000000 +0200<br>
-+++ mender-3.5.3/vendor/<a href=3D"http://github.com/mendersoftware/openss=
l/engine.go" rel=3D"noreferrer" target=3D"_blank">github.com/mendersoftware=
/openssl/engine.go</a>=C2=A0 =C2=A0 2026-09-20 18:37:50.270612314 +0200<br>
-@@ -15,6 +15,7 @@<br>
- package openssl<br>
- <br>
- /*<br>
-+#include &quot;shim.h&quot;<br>
- #include &quot;openssl/engine.h&quot;<br>
- */<br>
- import &quot;C&quot;<br>
-@@ -33,18 +34,18 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cname :=3D C.CString(name)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0defer C.free(unsafe.Pointer(cname))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0e :=3D &amp;Engine{<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e: C.ENGINE_by_id(cname)=
,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e: C.X_ENGINE_by_id(cnam=
e),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if e.e =3D=3D nil {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nil, fmt.Err=
orf(&quot;engine %s missing&quot;, name)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 if C.ENGINE_init(e.e) =3D=3D 0 {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 C.ENGINE_free(e.e)<br>
-+=C2=A0 =C2=A0 =C2=A0 if C.X_ENGINE_init(e.e) =3D=3D 0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 C.X_ENGINE_free(e.e)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nil, fmt.Err=
orf(&quot;engine %s not initialized&quot;, name)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0runtime.SetFinalizer(e, func(e *Engine) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 C.ENGINE_finish(e.e)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 C.ENGINE_free(e.e)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 C.X_ENGINE_finish(e.e)<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 C.X_ENGINE_free(e.e)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0})<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return e, nil<br>
- }<br>
-diff -uNr mender-3.5.3.orig/vendor/<a href=3D"http://github.com/mendersoft=
ware/openssl/hostname.c" rel=3D"noreferrer" target=3D"_blank">github.com/me=
ndersoftware/openssl/hostname.c</a> mender-3.5.3/vendor/<a href=3D"http://g=
ithub.com/mendersoftware/openssl/hostname.c" rel=3D"noreferrer" target=3D"_=
blank">github.com/mendersoftware/openssl/hostname.c</a><br>
---- mender-3.5.3.orig/vendor/<a href=3D"http://github.com/mendersoftware/o=
penssl/hostname.c" rel=3D"noreferrer" target=3D"_blank">github.com/menderso=
ftware/openssl/hostname.c</a>=C2=A0 =C2=A0 =C2=A0 2024-05-24 12:07:27.00000=
0000 +0200<br>
-+++ mender-3.5.3/vendor/<a href=3D"http://github.com/mendersoftware/openss=
l/hostname.c" rel=3D"noreferrer" target=3D"_blank">github.com/mendersoftwar=
e/openssl/hostname.c</a>=C2=A0 =C2=A02026-09-20 18:32:37.854514981 +0200<br=
>
-@@ -6,6 +6,7 @@<br>
-=C2=A0 */<br>
- <br>
- #include &lt;openssl/x509.h&gt;<br>
-+#include &lt;openssl/x509v3.h&gt;<br>
- <br>
- #ifndef X509_CHECK_FLAG_ALWAYS_CHECK_SUBJECT<br>
- <br>
-diff -uNr mender-3.5.3.orig/vendor/<a href=3D"http://github.com/mendersoft=
ware/openssl/key.go" rel=3D"noreferrer" target=3D"_blank">github.com/mender=
software/openssl/key.go</a> mender-3.5.3/vendor/<a href=3D"http://github.co=
m/mendersoftware/openssl/key.go" rel=3D"noreferrer" target=3D"_blank">githu=
b.com/mendersoftware/openssl/key.go</a><br>
---- mender-3.5.3.orig/vendor/<a href=3D"http://github.com/mendersoftware/o=
penssl/key.go" rel=3D"noreferrer" target=3D"_blank">github.com/mendersoftwa=
re/openssl/key.go</a>=C2=A0 2024-05-24 12:07:27.000000000 +0200<br>
-+++ mender-3.5.3/vendor/<a href=3D"http://github.com/mendersoftware/openss=
l/key.go" rel=3D"noreferrer" target=3D"_blank">github.com/mendersoftware/op=
enssl/key.go</a>=C2=A0 =C2=A0 =C2=A0 =C2=A02026-09-20 18:38:13.462370202 +0=
200<br>
-@@ -303,7 +303,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0keyID :=3D C.CString(id)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0defer C.free(unsafe.Pointer(keyID))<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 key :=3D C.ENGINE_load_private_key(e.e, keyID, nil, =
nil)<br>
-+=C2=A0 =C2=A0 =C2=A0 key :=3D C.X_ENGINE_load_private_key(e.e, keyID, nil=
, nil)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if key =3D=3D nil {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nil, errors.=
New(&quot;cannot load private key, ENGINE_load_private_key error&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-diff -uNr mender-3.5.3.orig/vendor/<a href=3D"http://github.com/mendersoft=
ware/openssl/shim.c" rel=3D"noreferrer" target=3D"_blank">github.com/mender=
software/openssl/shim.c</a> mender-3.5.3/vendor/<a href=3D"http://github.co=
m/mendersoftware/openssl/shim.c" rel=3D"noreferrer" target=3D"_blank">githu=
b.com/mendersoftware/openssl/shim.c</a><br>
---- mender-3.5.3.orig/vendor/<a href=3D"http://github.com/mendersoftware/o=
penssl/shim.c" rel=3D"noreferrer" target=3D"_blank">github.com/mendersoftwa=
re/openssl/shim.c</a>=C2=A0 2024-05-24 12:07:27.000000000 +0200<br>
-+++ mender-3.5.3/vendor/<a href=3D"http://github.com/mendersoftware/openss=
l/shim.c" rel=3D"noreferrer" target=3D"_blank">github.com/mendersoftware/op=
enssl/shim.c</a>=C2=A0 =C2=A0 =C2=A0 =C2=A02026-09-20 18:36:02.855038372 +0=
200<br>
-@@ -382,7 +382,9 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int rc =3D 0;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0OPENSSL_config(NULL);<br>
-+#if OPENSSL_VERSION_NUMBER &lt; 0x40000000L &amp;&amp; !defined(OPENSSL_N=
O_ENGINE)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ENGINE_load_builtin_engines();<br>
-+#endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0SSL_load_error_strings();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0SSL_library_init();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0OpenSSL_add_all_algorithms();<br>
-@@ -403,6 +405,46 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
- }<br>
- <br>
-+ENGINE *X_ENGINE_by_id(const char *id) {<br>
-+#if OPENSSL_VERSION_NUMBER &lt; 0x40000000L &amp;&amp; !defined(OPENSSL_N=
O_ENGINE)<br>
-+=C2=A0 =C2=A0 =C2=A0 return ENGINE_by_id(id);<br>
-+#else<br>
-+=C2=A0 =C2=A0 =C2=A0 return NULL;<br>
-+#endif<br>
-+}<br>
-+<br>
-+int X_ENGINE_init(ENGINE *e) {<br>
-+#if OPENSSL_VERSION_NUMBER &lt; 0x40000000L &amp;&amp; !defined(OPENSSL_N=
O_ENGINE)<br>
-+=C2=A0 =C2=A0 =C2=A0 return ENGINE_init(e);<br>
-+#else<br>
-+=C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+#endif<br>
-+}<br>
-+<br>
-+int X_ENGINE_free(ENGINE *e) {<br>
-+#if OPENSSL_VERSION_NUMBER &lt; 0x40000000L &amp;&amp; !defined(OPENSSL_N=
O_ENGINE)<br>
-+=C2=A0 =C2=A0 =C2=A0 return ENGINE_free(e);<br>
-+#else<br>
-+=C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+#endif<br>
-+}<br>
-+<br>
-+int X_ENGINE_finish(ENGINE *e) {<br>
-+#if OPENSSL_VERSION_NUMBER &lt; 0x40000000L &amp;&amp; !defined(OPENSSL_N=
O_ENGINE)<br>
-+=C2=A0 =C2=A0 =C2=A0 return ENGINE_finish(e);<br>
-+#else<br>
-+=C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+#endif<br>
-+}<br>
-+<br>
-+EVP_PKEY *X_ENGINE_load_private_key(ENGINE *e, const char *key_id, UI_MET=
HOD *ui_method, void *callback_data) {<br>
-+#if OPENSSL_VERSION_NUMBER &lt; 0x40000000L &amp;&amp; !defined(OPENSSL_N=
O_ENGINE)<br>
-+=C2=A0 =C2=A0 =C2=A0 return ENGINE_load_private_key(e, key_id, ui_method,=
 callback_data);<br>
-+#else<br>
-+=C2=A0 =C2=A0 =C2=A0 return NULL;<br>
-+#endif<br>
-+}<br>
-+<br>
- void * X_OPENSSL_malloc(size_t size) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return OPENSSL_malloc(size);<br>
- }<br>
-@@ -480,7 +522,7 @@<br>
- }<br>
- <br>
- const SSL_METHOD *X_SSLv3_method() {<br>
--#ifndef OPENSSL_NO_SSL3_METHOD<br>
-+#if OPENSSL_VERSION_NUMBER &lt; 0x40000000L &amp;&amp; !defined(OPENSSL_N=
O_SSL3_METHOD) &amp;&amp; !defined(OPENSSL_NO_DEPRECATED_1_1_0) &amp;&amp; =
!defined(OPENSSL_NO_DEPRECATED_3_0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return SSLv3_method();<br>
- #else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
-@@ -488,11 +530,15 @@<br>
- }<br>
- <br>
- const SSL_METHOD *X_TLSv1_method() {<br>
-+#if OPENSSL_VERSION_NUMBER &lt; 0x40000000L &amp;&amp; !defined(OPENSSL_N=
O_TLS1_METHOD) &amp;&amp; !defined(OPENSSL_NO_DEPRECATED_1_1_0) &amp;&amp; =
!defined(OPENSSL_NO_DEPRECATED_3_0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return TLSv1_method();<br>
-+#else<br>
-+=C2=A0 =C2=A0 =C2=A0 return NULL;<br>
-+#endif<br>
- }<br>
- <br>
- const SSL_METHOD *X_TLSv1_1_method() {<br>
--#if defined(TLS1_1_VERSION) &amp;&amp; !defined(OPENSSL_SYSNAME_MACOSX)<b=
r>
-+#if OPENSSL_VERSION_NUMBER &lt; 0x40000000L &amp;&amp; defined(TLS1_1_VER=
SION) &amp;&amp; !defined(OPENSSL_SYSNAME_MACOSX) &amp;&amp; !defined(OPENS=
SL_NO_TLS1_1_METHOD) &amp;&amp; !defined(OPENSSL_NO_DEPRECATED_1_1_0) &amp;=
&amp; !defined(OPENSSL_NO_DEPRECATED_3_0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return TLSv1_1_method();<br>
- #else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
-@@ -500,7 +546,7 @@<br>
- }<br>
- <br>
- const SSL_METHOD *X_TLSv1_2_method() {<br>
--#if defined(TLS1_2_VERSION) &amp;&amp; !defined(OPENSSL_SYSNAME_MACOSX)<b=
r>
-+#if OPENSSL_VERSION_NUMBER &lt; 0x40000000L &amp;&amp; defined(TLS1_2_VER=
SION) &amp;&amp; !defined(OPENSSL_SYSNAME_MACOSX) &amp;&amp; !defined(OPENS=
SL_NO_TLS1_2_METHOD) &amp;&amp; !defined(OPENSSL_NO_DEPRECATED_1_1_0) &amp;=
&amp; !defined(OPENSSL_NO_DEPRECATED_3_0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return TLSv1_2_method();<br>
- #else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
-diff -uNr mender-3.5.3.orig/vendor/<a href=3D"http://github.com/mendersoft=
ware/openssl/shim.h" rel=3D"noreferrer" target=3D"_blank">github.com/mender=
software/openssl/shim.h</a> mender-3.5.3/vendor/<a href=3D"http://github.co=
m/mendersoftware/openssl/shim.h" rel=3D"noreferrer" target=3D"_blank">githu=
b.com/mendersoftware/openssl/shim.h</a><br>
---- mender-3.5.3.orig/vendor/<a href=3D"http://github.com/mendersoftware/o=
penssl/shim.h" rel=3D"noreferrer" target=3D"_blank">github.com/mendersoftwa=
re/openssl/shim.h</a>=C2=A0 2024-05-24 12:07:27.000000000 +0200<br>
-+++ mender-3.5.3/vendor/<a href=3D"http://github.com/mendersoftware/openss=
l/shim.h" rel=3D"noreferrer" target=3D"_blank">github.com/mendersoftware/op=
enssl/shim.h</a>=C2=A0 =C2=A0 =C2=A0 =C2=A02026-09-20 18:38:33.117854985 +0=
200<br>
-@@ -40,6 +40,13 @@<br>
- /* shim=C2=A0 methods */<br>
- extern int X_shim_init();<br>
- <br>
-+/* Engine methods */<br>
-+extern ENGINE *X_ENGINE_by_id(const char *id);<br>
-+extern int X_ENGINE_init(ENGINE *e);<br>
-+extern int X_ENGINE_free(ENGINE *e);<br>
-+extern int X_ENGINE_finish(ENGINE *e);<br>
-+extern EVP_PKEY *X_ENGINE_load_private_key(ENGINE *e, const char *key_id,=
 UI_METHOD *ui_method, void *callback_data);<br>
-+<br>
- /* Library methods */<br>
- extern void X_OPENSSL_free(void *ref);<br>
- extern void *X_OPENSSL_malloc(size_t size);<br>
diff --git a/package/mender/0001-src-common-crypto-platform-openssl-crypto.=
cpp-fix-bu.patch b/package/mender/0001-src-common-crypto-platform-openssl-c=
rypto.cpp-fix-bu.patch<br>
new file mode 100644<br>
index 0000000000..e596f1b5f3<br>
--- /dev/null<br>
+++ b/package/mender/0001-src-common-crypto-platform-openssl-crypto.cpp-fix=
-bu.patch<br>
@@ -0,0 +1,69 @@<br>
+From dcc218c6857e080e760b4a9c04acc79390151eb3 Mon Sep 17 00:00:00 2001<br>
+From: Adam Duskett &lt;<a href=3D"mailto:adam.duskett@amarulasolutions.com=
" target=3D"_blank">adam.duskett@amarulasolutions.com</a>&gt;<br>
+Date: Wed, 28 Oct 2026 12:07:07 +0100<br>
+Subject: [PATCH] src/common/crypto/platform/openssl/crypto.cpp: fix build<=
br>
+ without engine support<br>
+<br>
+OpenSSL 4.0 removed ENGINE support entirely and always defines<br>
+OPENSSL_NO_ENGINE. Its engine.h still declares the ENGINE_* functions<br>
+for source compatibility, but only provides stub definitions when<br>
+OPENSSL_ENGINE_STUBS is defined, so linking mender-auth fails with:<br>
+<br>
+=C2=A0 undefined reference to `ENGINE_by_id&#39;<br>
+=C2=A0 undefined reference to `ENGINE_free&#39;<br>
+=C2=A0 undefined reference to `ENGINE_init&#39;<br>
+=C2=A0 undefined reference to `ENGINE_load_builtin_engines&#39;<br>
+=C2=A0 undefined reference to `ENGINE_load_private_key&#39;<br>
+<br>
+The same happens with OpenSSL 3.x configured with no-engine.<br>
+<br>
+Guard the ENGINE calls with OPENSSL_NO_ENGINE, and return an error<br>
+from LoadFromHSMEngine() when an SSL engine is configured but not<br>
+available.<br>
+<br>
+Upstream: <a href=3D"https://github.com/mendersoftware/mender/pull/2037" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/mendersoftware/mende=
r/pull/2037</a><br>
+Signed-off-by: Adam Duskett &lt;<a href=3D"mailto:adam.duskett@amarulasolu=
tions.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a>&gt;<br>
+---<br>
+ src/common/crypto/platform/openssl/crypto.cpp | 9 +++++++++<br>
+ 1 file changed, 9 insertions(+)<br>
+<br>
+diff --git a/src/common/crypto/platform/openssl/crypto.cpp b/src/common/cr=
ypto/platform/openssl/crypto.cpp<br>
+index b31e6c8..5f6a4b9 100644<br>
+--- a/src/common/crypto/platform/openssl/crypto.cpp<br>
++++ b/src/common/crypto/platform/openssl/crypto.cpp<br>
+@@ -103,9 +103,11 @@ auto bn_free =3D [](BIGNUM *bn) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ };<br>
+ auto engine_free_func =3D [](ENGINE *e) {<br>
++#ifndef OPENSSL_NO_ENGINE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (e) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ENGINE_free(e);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++#endif // OPENSSL_NO_ENGINE<br>
+ };<br>
+ <br>
+ auto password_callback =3D [](char *buf, int size, int rwflag, void *u) {=
<br>
+@@ -153,6 +155,12 @@ string GetOpenSSLErrorMessage() {<br>
+ }<br>
+ <br>
+ ExpectedPrivateKey LoadFromHSMEngine(const Args &amp;args) {<br>
++#ifdef OPENSSL_NO_ENGINE<br>
++=C2=A0 =C2=A0 =C2=A0 return expected::unexpected(MakeError(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SetupError,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Failed to get the =
&quot; + args.ssl_engine<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 + &quot; engine. OpenSSL was built without engine support&quot;));<br>
++#else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0log::Trace(&quot;Loading the private key from H=
SM&quot;);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ENGINE_load_builtin_engines();<br>
+@@ -190,6 +198,7 @@ ExpectedPrivateKey LoadFromHSMEngine(const Args &amp;a=
rgs) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0auto handle =3D unique_ptr&lt;OpenSSLResourceHa=
ndle, void (*)(OpenSSLResourceHandle *)&gt;(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new OpenSSLResource=
Handle {std::move(engine)}, resource_handle_free_func);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return std::make_unique&lt;PrivateKey&gt;(std::=
move(private_key), std::move(handle));<br>
++#endif // OPENSSL_NO_ENGINE<br>
+ }<br>
+ <br>
+ #ifdef MENDER_CRYPTO_OPENSSL_LEGACY<br>
+-- <br>
+2.56.0<br>
+<br>
diff --git a/package/mender/Config.in b/package/mender/Config.in<br>
index c9b9d0b757..8f16e2312f 100644<br>
--- a/package/mender/Config.in<br>
+++ b/package/mender/Config.in<br>
@@ -1,9 +1,20 @@<br>
=C2=A0config BR2_PACKAGE_MENDER<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;mender&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPP=
ORTS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKI=
NG_SUPPORTS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HOST_GO<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_INSTALL_LIBSTDCPP<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # (bu=
ndled yaml-cpp)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # boo=
st-log<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFR=
EE_ATOMIC_INTS # boost-log<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # b=
oost-log<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU # libglib2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_WCHAR # boost, libarchive, l=
ibglib2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_SYSTEMD<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_BOOST<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_BOOST_FILESYSTEM<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_BOOST_LOG<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_CA_CERTIFICATES<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBARCHIVE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBGLIB2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LMDB<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_OPENSSL<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_LIBOPENSSL_ENGINES<br>
@@ -21,16 +32,13 @@ config BR2_PACKAGE_MENDER<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - uboot-tools must be selected.<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - fw_printenv must be functional =
on the device.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The Mender Uboot patches are at:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/mendersoft=
ware/meta-mender/" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
mendersoftware/meta-mender/</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/mendersoft=
ware/meta-mender/tree/master/meta-mender-core/recipes-bsp/u-boot/patches" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/mendersoftware/meta-=
mender/tree/master/meta-mender-core/recipes-bsp/u-boot/patches</a><br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 For more information on Manual U-Boot in=
tegration, see:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://docs.mender.io/2.6/sy=
stem-updates-yocto-project/board-integration/bootloader-support/u-boot/manu=
al-u-boot-integration" rel=3D"noreferrer" target=3D"_blank">https://docs.me=
nder.io/2.6/system-updates-yocto-project/board-integration/bootloader-suppo=
rt/u-boot/manual-u-boot-integration</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://docs.mender.io/3.4/sy=
stem-updates-yocto-project/board-integration/bootloader-support/u-boot/manu=
al-u-boot-integration" rel=3D"noreferrer" target=3D"_blank">https://docs.me=
nder.io/3.4/system-updates-yocto-project/board-integration/bootloader-suppo=
rt/u-boot/manual-u-boot-integration</a><br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 For systems using Grub2 as the bootloade=
r:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Mender depends on the mender-gr=
ubenv package.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- The mender-grubenv package prov=
ides a fw_printenv script,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0which is not compatible wi=
th the uboot-tools fw_printenv<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0script.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The mender project recommends using uboo=
t to load Grub2 as a<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 secondary bootloader whenever possible. =
Using Grub2 as a<br>
@@ -39,7 +47,12 @@ config BR2_PACKAGE_MENDER<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://github.com/mendersoft=
ware/mender" rel=3D"noreferrer" target=3D"_blank">https://github.com/mender=
software/mender</a><br>
<br>
-comment &quot;mender needs a toolchain w/ threads&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPP=
ORTS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKI=
NG_SUPPORTS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_TOOLCHAIN_HAS_THREADS<br>
+comment &quot;mender needs systemd&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_PACKAGE_SYSTEMD<br>
+<br>
+comment &quot;mender needs a toolchain w/ C++, NPTL, wchar, not affected b=
y GCC bug 64735&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFR=
EE_ATOMIC_INTS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_W=
CHAR || \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!BR2_TOOLCHAIN_HAS_=
THREADS_NPTL<br>
diff --git a/package/mender/S42mender b/package/mender/S42mender<br>
deleted file mode 100644<br>
index 70116ed4eb..0000000000<br>
--- a/package/mender/S42mender<br>
+++ /dev/null<br>
@@ -1,44 +0,0 @@<br>
-#!/bin/sh<br>
-#<br>
-# Starts mender service.<br>
-#<br>
-DAEMON=3D&quot;mender&quot;<br>
-DAEMON_PATH=3D&quot;/usr/bin/mender&quot;<br>
-PIDFILE=3D&quot;/var/run/${DAEMON}.pid&quot;<br>
-DAEMON_ARGS=3D&quot;daemon&quot;<br>
-<br>
-start() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0printf &quot;Starting mender service: &quot;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0umask 077<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0start-stop-daemon -bmSqp &quot;$PIDFILE&quot; -=
x ${DAEMON_PATH} -- ${DAEMON_ARGS}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0status=3D$?<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[ &quot;${status}&quot; =3D 0 ] &amp;&amp; echo=
 &quot;OK&quot; || echo &quot;FAIL&quot;<br>
-}<br>
-<br>
-stop() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0printf &quot;Stopping mender service: &quot;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0start-stop-daemon -Kqp &quot;$PIDFILE&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0status=3D$?<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[ &quot;${status}&quot; =3D 0 ] &amp;&amp; echo=
 &quot;OK&quot; || echo &quot;FAIL&quot;<br>
-}<br>
-restart() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0stop<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0start<br>
-}<br>
-<br>
-case &quot;$1&quot; in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0start)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0start<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0stop)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stop<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0restart|reload)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0restart<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0*)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Usage: $=
0 {start|stop|reload|restart}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
-esac<br>
-<br>
-exit $?<br>
diff --git a/package/mender/mender-client.service b/package/mender/mender-c=
lient.service<br>
deleted file mode 100644<br>
index 47e439993c..0000000000<br>
--- a/package/mender/mender-client.service<br>
+++ /dev/null<br>
@@ -1,13 +0,0 @@<br>
-[Unit]<br>
-Description=3DMender OTA update service<br>
-After=3Dsystemd-resolved.service<br>
-<br>
-[Service]<br>
-Type=3Didle<br>
-User=3Droot<br>
-Group=3Droot<br>
-ExecStart=3D/usr/bin/mender daemon<br>
-Restart=3Don-abort<br>
-<br>
-[Install]<br>
-WantedBy=3Dmulti-user.target<br>
diff --git a/package/mender/mender.hash b/package/mender/mender.hash<br>
index 17fe08c827..1aa8fb63bd 100644<br>
--- a/package/mender/mender.hash<br>
+++ b/package/mender/mender.hash<br>
@@ -1,47 +1,27 @@<br>
=C2=A0# Locally computed:<br>
-sha256=C2=A0 35e369759b8d4f012153e538b5daf1e0cebe842205811e708332c5a092270=
ac5=C2=A0 mender-3.5.3-go2.tar.gz<br>
+sha256=C2=A0 436ae559358f29c672b98ca77b953936ba6ef51455466fb5ed0ced7ae77fc=
226=C2=A0 mender-5.2.0.tar.gz<br>
+sha256=C2=A0 4d3409e4f8f7f3b9de5da7fee7c03e36a2381a02b2e318702485fc993a735=
cc9=C2=A0 LIC_FILES_CHKSUM.sha256<br>
<br>
=C2=A0# Vendor licenses<br>
=C2=A0# Generated with sed &#39;/^[A-Za-z0-9_]/s/^/sha256=C2=A0 /&#39; LIC_=
FILES_CHKSUM.sha256<br>
<br>
=C2=A0# Apache-2.0 license.<br>
-sha256=C2=A0 d0f406b04e7901e6b4076bdf5fd20f9d7f04fc41681069fd8954413ac6295=
688=C2=A0 LICENSE<br>
-sha256=C2=A0 52b2497ce07650b825015e80ca7a5d40c360c04c530234ca6d950b0f98bca=
23a=C2=A0 vendor/<a href=3D"http://github.com/mendersoftware/mender-artifac=
t/LICENSE-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/mendersof=
tware/mender-artifact/LICENSE<br>
-sha256</a>=C2=A0 73ba74dfaa520b49a401b5d21459a8523a146f3b7518a833eea5efa85=
130bf68=C2=A0 vendor/<a href=3D"http://github.com/mendersoftware/openssl/LI=
CENSE-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/mendersoftwar=
e/openssl/LICENSE<br>
-sha256</a>=C2=A0 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417b=
c523d30=C2=A0 vendor/<a href=3D"http://github.com/minio/sha256-simd/LICENSE=
-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/minio/sha256-simd/=
LICENSE<br>
-sha256</a>=C2=A0 8f5d89b47d7a05a199b77b7e0f362dad391d451ebda4ef48ba11c50c0=
71564c7=C2=A0 vendor/<a href=3D"http://github.com/mendersoftware/progressba=
r/LICENSE+sha256" rel=3D"noreferrer" target=3D"_blank">github.com/mendersof=
tware/progressbar/LICENSE<br>
+sha256</a>=C2=A0 d7e8fd4ad05371007d60285c309ba7a7ce3e61029b843f949fbb9ec79=
dc9eb47=C2=A0 LICENSE<br>
=C2=A0#<br>
-# BSD 2 Clause license.<br>
-sha256=C2=A0 8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7de=
e86=C2=A0 vendor/<a href=3D"http://github.com/pkg/errors/LICENSE-sha256" re=
l=3D"noreferrer" target=3D"_blank">github.com/pkg/errors/LICENSE<br>
-sha256</a>=C2=A0 e4646a82a976369d7ae8f6ed5c11d35dc0af18433a8ccc24c85b459ad=
8b95128=C2=A0 vendor/<a href=3D"http://github.com/godbus/dbus/LICENSE-sha25=
6" rel=3D"noreferrer" target=3D"_blank">github.com/godbus/dbus/LICENSE<br>
-sha256</a>=C2=A0 2be1b548b0387ca8948e1bb9434e709126904d15f622cc2d0d8e7f186=
e4d122d=C2=A0 vendor/<a href=3D"http://github.com/gorilla/websocket/LICENSE=
" rel=3D"noreferrer" target=3D"_blank">github.com/gorilla/websocket/LICENSE=
</a><br>
+# MIT clause license<br>
+sha256=C2=A0 d64d1b4d948aa7751cfb613c02dc246aab7b358d760053e6580f01affe946=
906=C2=A0 src/common/vendor/json/LICENSE.MIT<br>
+sha256=C2=A0 7920c8620b1e073a79a667c44f9149c25724eb9f0f6b220b3c8d9564e2d40=
a43=C2=A0 src/common/vendor/json/docs/mkdocs/docs/home/license.md<br>
+sha256=C2=A0 2aefa40fa7e1c0fab18fbad5b15b02406eea1399d3cca42cc1012b65b4a56=
f74=C2=A0 src/common/vendor/tiny-process-library/LICENSE<br>
+sha256=C2=A0 aa6fcc27be034e41e21dd832f9175bfe694a48491d9e14ff0fa278e19ad14=
f1b=C2=A0 src/common/vendor/yaml-cpp/LICENSE<br>
=C2=A0#<br>
-# BSD 3 Clause license.<br>
-sha256=C2=A0 0d9e582ee4bff57bf1189c9e514e6da7ce277f9cd3bc2d488b22fbb39a6d8=
7cf=C2=A0 vendor/<a href=3D"http://github.com/klauspost/compress/LICENSE-sh=
a256" rel=3D"noreferrer" target=3D"_blank">github.com/klauspost/compress/LI=
CENSE<br>
-sha256</a>=C2=A0 2eb550be6801c1ea434feba53bf6d12e7c71c90253e0a9de4a4f46cf8=
8b56477=C2=A0 vendor/<a href=3D"http://github.com/pmezard/go-difflib/LICENS=
E-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/pmezard/go-diffli=
b/LICENSE<br>
-sha256</a>=C2=A0 2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b203=
0cbc067=C2=A0 vendor/<a href=3D"http://golang.org/x/sys/LICENSE-sha256" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/sys/LICENSE<br>
-sha256</a>=C2=A0 0634b008cee55ca01f0888d2f5aba2d34e66c3f52c31a4e16a5d5d33d=
0c2a03e=C2=A0 vendor/<a href=3D"http://github.com/bmatsuo/lmdb-go/LICENSE.m=
d-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/bmatsuo/lmdb-go/L=
ICENSE.md<br>
-sha256</a>=C2=A0 87640bc4df2ceb1559f268a3db1ba859ab780f7ba5b1b4545173d4680=
a3d918b=C2=A0 vendor/<a href=3D"http://github.com/remyoudompheng/go-liblzma=
/LICENSE-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/remyoudomp=
heng/go-liblzma/LICENSE<br>
-sha256</a>=C2=A0 2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b203=
0cbc067=C2=A0 vendor/<a href=3D"http://golang.org/x/term/LICENSE" rel=3D"no=
referrer" target=3D"_blank">golang.org/x/term/LICENSE</a><br>
+# UNLICENSE<br>
+sha256=C2=A0 7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e=
85c=C2=A0 src/common/vendor/lmdbxx/UNLICENSE<br>
=C2=A0#<br>
-# ISC license.<br>
-sha256=C2=A0 1b93a317849ee09d3d7e4f1d20c2b78ddb230b4becb12d7c224c927b9d470=
251=C2=A0 vendor/<a href=3D"http://github.com/davecgh/go-spew/LICENSE" rel=
=3D"noreferrer" target=3D"_blank">github.com/davecgh/go-spew/LICENSE</a><br=
>
+# CC0 1.0 Universal<br>
+sha256=C2=A0 a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0=
499=C2=A0 src/common/vendor/expected/COPYING<br>
=C2=A0#<br>
-# MIT license.<br>
-sha256=C2=A0 6d2de1cde19c4d2bd8bcd9aaa1d581f4cfa3db9cf71896140330eaa2f2687=
685=C2=A0 vendor/<a href=3D"http://github.com/klauspost/pgzip/LICENSE-sha25=
6" rel=3D"noreferrer" target=3D"_blank">github.com/klauspost/pgzip/LICENSE<=
br>
-sha256</a>=C2=A0 f69f157b0be75da373605dbc8bbf142e8924ee82d8f44f11bcaf35133=
5bf98cf=C2=A0 vendor/<a href=3D"http://github.com/klauspost/compress/intern=
al/snapref/LICENSE-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/=
klauspost/compress/internal/snapref/LICENSE<br>
-sha256</a>=C2=A0 f566a9f97bacdaf00d9f21dd991e81dc11201c4e016c86b470799429a=
1c9a79c=C2=A0 vendor/<a href=3D"http://github.com/klauspost/compress/zstd/i=
nternal/xxhash/LICENSE.txt" rel=3D"noreferrer" target=3D"_blank">github.com=
/klauspost/compress/zstd/internal/xxhash/LICENSE.txt</a><br>
-sha256=C2=A0 5d966570d7a442d4e969892860a914e542c97f262c873baee8f0aa48e1f40=
212=C2=A0 vendor/<a href=3D"http://github.com/klauspost/cpuid/v2/LICENSE-sh=
a256" rel=3D"noreferrer" target=3D"_blank">github.com/klauspost/cpuid/v2/LI=
CENSE<br>
-sha256</a>=C2=A0 51a0c9ec7f8b7634181b8d4c03e5b5d204ac21d6e72f46c3139734246=
64b2e6b=C2=A0 vendor/<a href=3D"http://github.com/sirupsen/logrus/LICENSE-s=
ha256" rel=3D"noreferrer" target=3D"_blank">github.com/sirupsen/logrus/LICE=
NSE<br>
-sha256</a>=C2=A0 f8e536c1c7b695810427095dc85f5f80d44ff7c10535e8a9486cf393e=
2599189=C2=A0 vendor/<a href=3D"http://github.com/stretchr/testify/LICENSE-=
sha256" rel=3D"noreferrer" target=3D"_blank">github.com/stretchr/testify/LI=
CENSE<br>
-sha256</a>=C2=A0 ffa15bdce332058a03a1d923910864fb6e58bf6df66a0e3914284725b=
327183e=C2=A0 vendor/<a href=3D"http://github.com/ungerik/go-sysfs/LICENSE-=
sha256" rel=3D"noreferrer" target=3D"_blank">github.com/ungerik/go-sysfs/LI=
CENSE<br>
-sha256</a>=C2=A0 da277af11b85227490377fbcac6afccc68be560c4fff36ac05ca62de5=
5345fd7=C2=A0 vendor/<a href=3D"http://github.com/urfave/cli/v2/LICENSE-sha=
256" rel=3D"noreferrer" target=3D"_blank">github.com/urfave/cli/v2/LICENSE<=
br>
-sha256</a>=C2=A0 b2663894033a05fd80261176cd8da1d72546e25842d5c1abcc852ca23=
b6b61b0=C2=A0 vendor/<a href=3D"http://github.com/stretchr/objx/LICENSE-sha=
256" rel=3D"noreferrer" target=3D"_blank">github.com/stretchr/objx/LICENSE<=
br>
-sha256</a>=C2=A0 d18f6323b71b0b768bb5e9616e36da390fbd39369a81807cca352de4e=
4e6aa0b=C2=A0 vendor/<a href=3D"http://gopkg.in/yaml.v3/LICENSE-sha256" rel=
=3D"noreferrer" target=3D"_blank">gopkg.in/yaml.v3/LICENSE<br>
-sha256</a>=C2=A0 08eab1118c80885fa1fa6a6dd7303f65a379fcb3733e063d20d1bbc2c=
76e6fa1=C2=A0 vendor/<a href=3D"http://github.com/mattn/go-isatty/LICENSE" =
rel=3D"noreferrer" target=3D"_blank">github.com/mattn/go-isatty/LICENSE</a>=
<br>
+# Boost Software License<br>
+sha256=C2=A0 c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad=
566=C2=A0 src/common/vendor/optional-lite/LICENSE.txt<br>
=C2=A0#<br>
-# OpenLDAP Public License<br>
-sha256=C2=A0 310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e=
569=C2=A0 vendor/<a href=3D"http://github.com/bmatsuo/lmdb-go/LICENSE.mdb.m=
d" rel=3D"noreferrer" target=3D"_blank">github.com/bmatsuo/lmdb-go/LICENSE.=
mdb.md</a><br>
-<br>
-# sha256 of all the vendor licenses combined<br>
-sha256=C2=A0 86407bd98d5ea7fb0f09ab771c3333e975d06565b809a2dd95f864dc1e3a0=
9b3=C2=A0 LIC_FILES_CHKSUM.sha256<br>
+# BSD-3<br>
+sha256=C2=A0 9702de7e4117a8e2b20dafab11ffda58c198aede066406496bef670d40a22=
138=C2=A0 src/common/vendor/yaml-cpp/test/googletest-1.16.0/LICENSE<br>
diff --git a/package/mender/<a href=3D"http://mender.mk" rel=3D"noreferrer"=
 target=3D"_blank">mender.mk</a> b/package/mender/<a href=3D"http://mender.=
mk" rel=3D"noreferrer" target=3D"_blank">mender.mk</a><br>
index 76dc28d547..e20fec8aa9 100644<br>
--- a/package/mender/<a href=3D"http://mender.mk" rel=3D"noreferrer" target=
=3D"_blank">mender.mk</a><br>
+++ b/package/mender/<a href=3D"http://mender.mk" rel=3D"noreferrer" target=
=3D"_blank">mender.mk</a><br>
@@ -4,107 +4,107 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-MENDER_VERSION =3D 3.5.3<br>
-MENDER_SITE =3D $(call github,mendersoftware,mender,$(MENDER_VERSION))<br>
-MENDER_LICENSE =3D Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, OLDAP=
-2.8<br>
+MENDER_VERSION =3D 5.2.0<br>
+MENDER_SITE =3D <a href=3D"https://github.com/mendersoftware/mender/releas=
es/download/$(MENDER_VERSION)" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/mendersoftware/mender/releases/download/$(MENDER_VERSION)</a><b=
r>
+MENDER_LICENSE =3D Apache-2.0, BSL-1.0, BSD-3-Clause, CC0-1.0, MIT, Unlice=
nse<br>
=C2=A0MENDER_CPE_ID_VENDOR =3D northern.tech<br>
-# CVE-2024-46948 only affects mender-server<br>
-MENDER_IGNORE_CVES =3D CVE-2024-46948<br>
<br>
=C2=A0# Vendor license paths generated with:<br>
=C2=A0#=C2=A0 =C2=A0 awk &#39;{print $2}&#39; LIC_FILES_CHKSUM.sha256 | gre=
p vendor<br>
=C2=A0MENDER_LICENSE_FILES =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 LICENSE \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIC_FILES_CHKSUM.sha256 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/mendersoftw=
are/mender-artifact/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.co=
m/mendersoftware/mender-artifact/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/mendersoftw=
are/openssl/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/mender=
software/openssl/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/minio/sha25=
6-simd/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/minio/sha25=
6-simd/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/mendersoftw=
are/progressbar/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/me=
ndersoftware/progressbar/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/pkg/errors/=
LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/pkg/errors/LICENSE=
</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/godbus/dbus=
/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/godbus/dbus/LICEN=
SE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/gorilla/web=
socket/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/gorilla/web=
socket/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/klauspost/c=
ompress/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/klauspost/=
compress/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/pmezard/go-=
difflib/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/pmezard/go=
-difflib/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://golang.org/x/sys/LICEN=
SE" rel=3D"noreferrer" target=3D"_blank">golang.org/x/sys/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/bmatsuo/lmd=
b-go/LICENSE.md" rel=3D"noreferrer" target=3D"_blank">github.com/bmatsuo/lm=
db-go/LICENSE.md</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/remyoudomph=
eng/go-liblzma/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/rem=
youdompheng/go-liblzma/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://golang.org/x/term/LICE=
NSE" rel=3D"noreferrer" target=3D"_blank">golang.org/x/term/LICENSE</a> \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/davecgh/go-=
spew/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/davecgh/go-sp=
ew/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/klauspost/p=
gzip/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/klauspost/pgz=
ip/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/klauspost/c=
ompress/internal/snapref/LICENSE" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/klauspost/compress/internal/snapref/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/klauspost/c=
ompress/zstd/internal/xxhash/LICENSE.txt" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/klauspost/compress/zstd/internal/xxhash/LICENSE.txt</a> \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/klauspost/c=
puid/v2/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/klauspost/=
cpuid/v2/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/sirupsen/lo=
grus/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/sirupsen/logr=
us/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/stretchr/te=
stify/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/stretchr/tes=
tify/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/ungerik/go-=
sysfs/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/ungerik/go-s=
ysfs/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/urfave/cli/=
v2/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/urfave/cli/v2/L=
ICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/stretchr/ob=
jx/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/stretchr/objx/L=
ICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://gopkg.in/yaml.v3/LICEN=
SE" rel=3D"noreferrer" target=3D"_blank">gopkg.in/yaml.v3/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/mattn/go-is=
atty/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/mattn/go-isat=
ty/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/bmatsuo/lmd=
b-go/LICENSE.mdb.md" rel=3D"noreferrer" target=3D"_blank">github.com/bmatsu=
o/lmdb-go/LICENSE.mdb.md</a><br>
-<br>
-MENDER_DEPENDENCIES =3D host-pkgconf openssl<br>
-<br>
-MENDER_LDFLAGS =3D -X <a href=3D"http://github.com/mendersoftware/mender/c=
onf.Version=3D$(MENDER_VERSION)" rel=3D"noreferrer" target=3D"_blank">githu=
b.com/mendersoftware/mender/conf.Version=3D$(MENDER_VERSION)</a><br>
-<br>
-MENDER_UPDATE_MODULES_FILES =3D directory single-file<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0src/common/vendor/json/LICENSE.MIT \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0src/common/vendor/json/docs/mkdocs/docs/home/li=
cense.md \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0src/common/vendor/tiny-process-library/LICENSE =
\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0src/common/vendor/yaml-cpp/LICENSE \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0src/common/vendor/lmdbxx/UNLICENSE \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0src/common/vendor/expected/COPYING \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0src/common/vendor/optional-lite/LICENSE.txt \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0src/common/vendor/yaml-cpp/test/googletest-1.16=
.0/LICENSE<br>
+<br>
+MENDER_DEPENDENCIES +=3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0host-pkgconf \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0boost \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dbus \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0libarchive \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0libglib2 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lmdb \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0openssl \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0systemd<br>
+<br>
+MENDER_INSTALL_TARGET_OPTS =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install-bin \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install-dbus \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install-dbus-service-files \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install-identity-scripts \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install-inventory-network-scripts \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install-inventory-scripts \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install-modules \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install-rootfs-image-module \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install-systemd<br>
<br>
=C2=A0define MENDER_INSTALL_CONFIG_FILES<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/mender/s=
cripts<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo -n &quot;3&quot; &gt; $(TARGET_DIR)/etc/me=
nder/scripts/version<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INSTALL) -D -m 0644 $(MENDER_PKGDIR)/mender.c=
onf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TARGET_DIR)/etc/m=
ender/mender.conf<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 0644 $(MENDER_PKGDIR)/server.c=
rt \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/etc/m=
ender/server.crt<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 0755 $(@D)/support/mender-devi=
ce-identity \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/usr/s=
hare/mender/identity/mender-device-identity<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(foreach f,bootloader-integration hostinfo net=
work os rootfs-type, \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 07=
55 $(@D)/support/mender-inventory-$(f) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0$(TARGET_DIR)/usr/share/mender/inventory/mender-inventory-$(f)<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 0644 $(@D)/support/demo.crt \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/etc/m=
ender/server.crt<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INSTALL) -D -m 0755 $(MENDER_PKGDIR)/device_t=
ype \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 $(TARGET_DIR)/etc/mender/device_type<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p $(TARGET_DIR)/var/lib/mender<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(foreach f,$(MENDER_UPDATE_MODULES_FILES), \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 07=
55 $(@D)/support/modules/$(notdir $(f)) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0$(TARGET_DIR)/usr/share/mender/modules/v3/$(notdir $(f))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p $(TARGET_DIR)/var/lib<br>
=C2=A0endef<br>
-<br>
=C2=A0MENDER_POST_INSTALL_TARGET_HOOKS +=3D MENDER_INSTALL_CONFIG_FILES<br>
<br>
+# The vendored tiny-process-library and yaml-cpp are built as part of<br>
+# mender but never installed, so always link them statically.<br>
+MENDER_CONF_OPTS +=3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DBUILD_SHARED_LIBS=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DMENDER_EMBED_MENDER_AUTH=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DMENDER_USE_DBUS=3DON \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DMENDER_VERSION=3D$(MENDER_VERSION)<br>
+<br>
+ifeq ($(BR2_PACKAGE_GZIP),y)<br>
+MENDER_DEPENDENCIES +=3D gzip<br>
+MENDER_CONF_OPTS +=3D -DMENDER_ARTIFACT_GZIP_COMPRESSION=3DON<br>
+else<br>
+MENDER_CONF_OPTS +=3D -DMENDER_ARTIFACT_GZIP_COMPRESSION=3DOFF<br>
+endif<br>
+<br>
=C2=A0ifeq ($(BR2_PACKAGE_XZ),y)<br>
=C2=A0MENDER_DEPENDENCIES +=3D xz<br>
+MENDER_CONF_OPTS +=3D -DMENDER_ARTIFACT_LZMA_COMPRESSION=3DON<br>
=C2=A0else<br>
-MENDER_TAGS +=3D nolzma<br>
+MENDER_CONF_OPTS +=3D -DMENDER_ARTIFACT_LZMA_COMPRESSION=3DOFF<br>
=C2=A0endif<br>
<br>
-ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_LIBGLIB2),yy)<br>
-MENDER_DEPENDENCIES +=3D libglib2<br>
-define MENDER_INSTALL_DBUS_AUTHENTICATION_MANAGER_CONF<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 0755 $(@D)/support/dbus/io.men=
der.AuthenticationManager.conf \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/etc/d=
bus-1/system.d/io.mender.AuthenticationManager.conf<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 0755 $(@D)/support/dbus/io.men=
der.UpdateManager.conf \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/etc/d=
bus-1/system.d/io.mender.UpdateManager.conf<br>
-endef<br>
-MENDER_POST_INSTALL_TARGET_HOOKS +=3D MENDER_INSTALL_DBUS_AUTHENTICATION_M=
ANAGER_CONF<br>
+ifeq ($(BR2_PACKAGE_ZSTD),y)<br>
+MENDER_DEPENDENCIES +=3D zstd<br>
+MENDER_CONF_OPTS +=3D -DMENDER_ARTIFACT_ZSTD_COMPRESSION=3DON<br>
=C2=A0else<br>
-MENDER_TAGS +=3D nodbus<br>
+MENDER_CONF_OPTS +=3D -DMENDER_ARTIFACT_ZSTD_COMPRESSION=3DOFF<br>
=C2=A0endif<br>
<br>
-define MENDER_INSTALL_INIT_SYSTEMD<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 0644 $(MENDER_PKGDIR)/mender-c=
lient.service \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/usr/l=
ib/systemd/system/mender-client.service<br>
+define MENDER_INSTALL_MODULES_GEN<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE) -C $(@D) DESTDIR=3D$(HOST_DIR) install-=
modules-gen<br>
+endef<br>
+MENDER_POST_INSTALL_TARGET_HOOKS +=3D MENDER_INSTALL_MODULES_GEN<br>
+<br>
+define MENDER_INSTALL_TARGET_CMDS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=3D$=
(TARGET_DIR) $(MENDER_INSTALL_TARGET_OPTS)<br>
=C2=A0endef<br>
<br>
-define MENDER_INSTALL_INIT_SYSV<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 755 $(MENDER_PKGDIR)/S42mender=
 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/etc/i=
nit.d/S42mender<br>
+# Needed for rootfs-image-module<br>
+define=C2=A0 MENDER_BUSYBOX_CONFIG_FIXUPS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_FLOCK)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_STAT)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_STAT_F=
ORMAT)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_SYNC_F=
ANCY)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_WGET)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_WGET_H=
TTPS)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_WGET_O=
PENSSL)<br>
=C2=A0endef<br>
<br>
-$(eval $(golang-package))<br>
+$(eval $(cmake-package))<br>
diff --git a/package/mender/server.crt b/package/mender/server.crt<br>
deleted file mode 100644<br>
index 79a57e15e7..0000000000<br>
--- a/package/mender/server.crt<br>
+++ /dev/null<br>
@@ -1,22 +0,0 @@<br>
------BEGIN CERTIFICATE-----<br>
-MIIBfTCCASOgAwIBAgIJAJOS76a0qWuZMAoGCCqGSM49BAMCMBsxGTAXBgNVBAMM<br>
-EGRvY2tlci5tZW5kZXIuaW8wHhcNMTYxMjE0MTk1MjQ2WhcNMjYxMjEyMTk1MjQ2<br>
-WjAbMRkwFwYDVQQDDBBkb2NrZXIubWVuZGVyLmlvMFkwEwYHKoZIzj0CAQYIKoZI<br>
-zj0DAQcDQgAE7AVYis6MWGPGQYU1/tlLEnskRifDIhvkRb8Y4nQPekRkLkiBYYT3<br>
-iJ46wHrnejbHaLstU9GRdKWOmOuU6HGdO6NQME4wHQYDVR0OBBYEFGOIU4q++Vz8<br>
-9HuT1jg9V+wFeJcyMB8GA1UdIwQYMBaAFGOIU4q++Vz89HuT1jg9V+wFeJcyMAwG<br>
-A1UdEwQFMAMBAf8wCgYIKoZIzj0EAwIDSAAwRQIhAPLnEeWPNeN7eDCEYRitBfyO<br>
-X1yf2kzOm4ohBE5GY9gzAiBCq7HOSkzQDkelmQCCCpGXf/UwYNgQJjSoeGfk0j1a<br>
-TQ=3D=3D<br>
------END CERTIFICATE-----<br>
------BEGIN CERTIFICATE-----<br>
-MIIBhDCCASmgAwIBAgIJALQrf4QDot4IMAoGCCqGSM49BAMCMB4xHDAaBgNVBAMM<br>
-E3MzLmRvY2tlci5tZW5kZXIuaW8wHhcNMTYxMjE0MTk1MjQ2WhcNMjYxMjEyMTk1<br>
-MjQ2WjAeMRwwGgYDVQQDDBNzMy5kb2NrZXIubWVuZGVyLmlvMFkwEwYHKoZIzj0C<br>
-AQYIKoZIzj0DAQcDQgAEEc/Y3T+l3DvINePkpvVZORMIdHVs29jgsl48ia7z/NRX<br>
-HlKtKxVGJyFN5Y7sBZeLgBYH3F4Bo3KfmxI7ad0tI6NQME4wHQYDVR0OBBYEFIUm<br>
-cip00QZYpe4ULflbGNJan+Y9MB8GA1UdIwQYMBaAFIUmcip00QZYpe4ULflbGNJa<br>
-n+Y9MAwGA1UdEwQFMAMBAf8wCgYIKoZIzj0EAwIDSQAwRgIhANHij9VZBDHOUPaC<br>
-pFiagnWnYL2HBR72W1xTKQbrLLTXAiEAvpwA4HzSnGmLd3010+jqQuMRHArN5WaX<br>
-h0fy7niBbIQ=3D<br>
------END CERTIFICATE-----<br>
diff --git a/support/testing/tests/package/test_mender.py b/support/testing=
/tests/package/test_mender.py<br>
index 14440c9527..44196d6a96 100644<br>
--- a/support/testing/tests/package/test_mender.py<br>
+++ b/support/testing/tests/package/test_mender.py<br>
@@ -3,45 +3,69 @@ import os<br>
=C2=A0import infra.basetest<br>
<br>
<br>
+# gitlab-runner: large<br>
=C2=A0class TestMenderInfra(infra.basetest.BRTest):<br>
-=C2=A0 =C2=A0 config =3D infra.basetest.BASIC_TOOLCHAIN_CONFIG + \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_PACKAGE_MENDER=3Dy<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_PACKAGE_HOST_MENDER_AR=
TIFACT=3Dy<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_TARGET_ROOTFS_CPIO=3Dy=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_ROOTFS_POST_BUILD_SCRI=
PT=3D&quot;{}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_ROOTFS_OVERLAY=3D&quot=
;{}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;.format(=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0infra.filepa=
th(&quot;tests/package/test_mender/post-build.sh&quot;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# overlay to=
 add a fake &#39;fw_printenv&#39;, used by Mender<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0infra.filepa=
th(&quot;tests/package/test_mender/rootfs-overlay&quot;))<br>
+=C2=A0 =C2=A0 # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it=
 does<br>
+=C2=A0 =C2=A0 # not include BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_=
INTS<br>
+=C2=A0 =C2=A0 # needed by mender. This config also uses an ext4 rootfs as<=
br>
+=C2=A0 =C2=A0 # the default 128MB is too small for an image with mender an=
d systemd.<br>
+=C2=A0 =C2=A0 config =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_x86_64=3Dy<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_x86_corei7=3Dy<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_TOOLCHAIN_EXTERNAL=3Dy<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_=
GLIBC_STABLE=3Dy<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_INIT_SYSTEMD=3Dy<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_SYSTEM_DHCP=3D&quot;eth0&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_LINUX_KERNEL=3Dy<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;=
6.18.59&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;bo=
ard/mender/x86_64/linux.config&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_PACKAGE_MENDER=3Dy<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_ROOTFS_POST_BUILD_SCRIPT=3D&quot;{}&quot;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_ROOTFS_OVERLAY=3D&quot;{}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_PACKAGE_HOST_MENDER_ARTIFACT=3Dy<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_TARGET_ROOTFS_EXT2=3Dy<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_TARGET_ROOTFS_EXT2_4=3Dy<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_TARGET_ROOTFS_EXT2_SIZE=3D&quot;256M&quot;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # BR2_TARGET_ROOTFS_TAR is not set<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;.format(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0infra.filepath(&quot;tests/packag=
e/test_mender/post-build.sh&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# overlay to add a fake &#39;fw_p=
rintenv&#39;, used by Mender<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0infra.filepath(&quot;tests/packag=
e/test_mender/rootfs-overlay&quot;))<br>
<br>
=C2=A0 =C2=A0 =C2=A0def base_test_run(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpio_file =3D os.path.join(self.builddir, &quo=
t;images&quot;, &quot;rootfs.cpio&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.emulator.boot(arch=3D&quot;armv5&quot;, k=
ernel=3D&quot;builtin&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0options=3D[&quot;-initrd&quot;, cpio_file])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 drive =3D os.path.join(self.builddir, &quot;im=
ages&quot;, &quot;rootfs.ext4&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kern =3D os.path.join(self.builddir, &quot;ima=
ges&quot;, &quot;bzImage&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.emulator.boot(arch=3D&quot;x86_64&quot;,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0kernel=3Dkern,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0kernel_cmdline=3D[&quot;root=3D/dev/vda console=3Dt=
tyS0 net.ifnames=3D0&quot;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0options=3D[&quot;-cpu&quot;, &quot;Nehalem&quot;,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-m&quot;, &quot;=
256M&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-net&quot;, &quo=
t;nic,model=3Dvirtio&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-net&quot;, &quo=
t;user&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-drive&quot;, f&=
quot;file=3D{drive},if=3Dvirtio,format=3Draw&quot;])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.emulator.login()<br>
<br>
=C2=A0 =C2=A0 =C2=A0def run_mender_test(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRunOk(&quot;ps aux | egrep [m]ender=
&quot;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # mender-authd requires systemd-resolved.servi=
ce to be up,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # so wait for eth0 to get its DHCP address bef=
ore querying.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;while ! ifconfig eth0 | grep -q =
&#39;inet addr&#39;; do sleep 1; done&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRunOk(cmd, timeout=3D30)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 output, _ =3D self.emulator.run(&quot;systemct=
l is-active mender-updated&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(output[0], &quot;active&quot;=
)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Check if a simple Mender command is cor=
rectly executed<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRunOk(&quot;mender -log-level debug=
 show-artifact&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRunOk(&quot;mender -log-level debug=
 show-artifact | grep &#39;RUNTIME_TEST_ARTIFACT_NAME&#39;&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;mender show-artifact 2&gt;&amp;1=
 | grep -i &#39;err&#39;&quot;=C2=A0 # Check if no &#39;error&#39; among th=
e traces<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRunOk(&quot;mender-update --log-lev=
el debug show-artifact&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRunOk(&quot;mender-update --log-lev=
el debug show-artifact | grep &#39;RUNTIME_TEST_ARTIFACT_NAME&#39;&quot;)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;mender-update show-artifact 2&gt=
;&amp;1 | grep -i &#39;err&#39;&quot;=C2=A0 # Check if no &#39;error&#39; a=
mong the traces<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_, exit_code =3D self.emulator.run(cmd)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(exit_code, 1)<br>
<br>
<br>
-class TestMenderRW(TestMenderInfra):<br>
-=C2=A0 =C2=A0 def test_run(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TestMenderInfra.base_test_run(self)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check if the Daemon is running<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRunOk(&quot;ls /var/run/mender.pid&=
quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.run_mender_test()<br>
-<br>
-<br>
=C2=A0class TestMenderRO(TestMenderInfra):<br>
=C2=A0 =C2=A0 =C2=A0config =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
@@ -51,22 +75,4 @@ class TestMenderRO(TestMenderInfra):<br>
<br>
=C2=A0 =C2=A0 =C2=A0def test_run(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TestMenderInfra.base_test_run(self)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check if the Daemon is running<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRunOk(&quot;ls /var/run/mender.pid&=
quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.run_mender_test()<br>
-<br>
-<br>
-# gitlab-runner: large<br>
-class TestMenderSystemd(TestMenderInfra):<br>
-=C2=A0 =C2=A0 config =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 {}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_INIT_SYSTEMD=3Dy<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;.format(TestMenderInfra.conf=
ig)<br>
-<br>
-=C2=A0 =C2=A0 def test_run(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TestMenderInfra.base_test_run(self)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 output, _ =3D self.emulator.run(&quot;systemct=
l is-active mender-client&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(output[0], &quot;active&quot;=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.run_mender_test()<br>
-- <br>
2.56.0<br>
<br>
</blockquote></div>

--000000000000bd7f29065ee74ee8--

--===============1071990264458479025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1071990264458479025==--
