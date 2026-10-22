Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F98C606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=G8iFMgWx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=PjmM120X
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EA8F812A3;
	Thu, 22 Oct 2026 21:24:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eaYePuxy-1HH; Thu, 22 Oct 2026 21:24:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7640A81134
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792704274;
	b=Yc3jrEDINGP+DgYcT32JK010cw95kKKlWUURD316ZDGg7s0oJ8jFM1PRYX+GY17/kiFf
	 217AGsvmhqlN1z1DErwWYvO6p/iEMvLmXw2lU/3Zn0h6f2nl22T9Mqp2SuqCbARlScL9/
	 G8xuW/J9qfDduDJljMV2RFtxj8PNktwQUUDgjYJ8PQ0NsWeF5O62tD5NZwA6B4aQXUhGC
	 RkY/WaZ9LtLmhca6TLuDDbbK3nOeLMb8ql5w8pfp/iKMyJwVDP50yklkNoeEK+llFwIU3
	 y/jS9MSKEpSIQHVoNVJzzIlteiM2SsWWYBvqDjERb59iYsOkDaTCBeNfiXNjNAd8cFQ==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792704274;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:To:Cc:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ccnYymUv+tmZI18oRIOfecSYwfPjlq/o6trG92aZEC4=;
	b=DCHHx/4+RUnFSfd2CIkDUU4TZ7Rt8WeLVtG8hc+ctOiyYDKD2zeqyomx24QVp2GdI7tq
	 tdUvFUeF7wpTVNIoZ1np5CzgmMUjEppKrbrMzFJ4/tMuIM24c+7+sM3/FcO0nLB1ktg7+
	 owmY/S6QnuPhfYmDW3LLtcTLnmYvJQzJYO9+itbZ9fiApXE66b6jyJl2/TCalCG2PNDEl
	 vWc+DM72/EIKZzwVwHZCMJyhMU1wNTXWxlopVuxLKfP/tdmPRyQennV6oXqi5bFS6XlLE
	 Ey1X+w+KRlyMzSj4/2qIyxy4EEG8ewfZ7RG7bCp7OJSMa0ny3fUlRF4BO2+4IRqN97A==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792704274;
	bh=ccnYymUv+tmZI18oRIOfecSYwfPjlq/o6trG92aZEC4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G8iFMgWx1f8npmT1hX73lg/aS5NYGtnAkHQkOzcYG4IOCV1eOFN17AgzD0n0e0hnM
	 T2uExge5rO2qk2RHAx9cH3DWXGyGE0zxSlY2f83bRTA60/vgJekqIHL8wsZNXr0NPj
	 o6/9tVVsRmZwfC05BtuPyITzYiA6FrZ2LLS+RH9umSutouZ0ushf2gOIIjNxd/XGBd
	 zFFhI14oAXs+R44WiiIx2WKNdy1dZtN22eam7jZPULyN8aURLc1B/1VmEC6pHox9qF
	 WaXJUGywGmP+a7QdSgqbnVKHMSHGxZexI0JxWqIg9+lvDp8g92evHw80h4WIKYPOb6
	 6BeFLq78dwisg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7640A81134;
	Thu, 22 Oct 2026 21:24:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B9F10356
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB83F4098D
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:24:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qqD7TJszfQ_s for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:24:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 40A314096D
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::1229"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792704271;
 b=hwAmN/iCS+0CCYnLP+ow8YA695qPJKd/yN2Ul6oGbJOBzh4ihnflIsT7J6ewx2nvotLb
 Mfv2Dk0tm5GnWzmL6P+gB80+5cQ4EOU0/NX2m3xvgOmDyUpfEBEDNw7ArTnPBsV5bgVK2
 3pOPLcBFP7PEUSZstXwMmx4qQ3cbpsQZzIdU936IEcA11CQyrjcKd9f7sAAW2lzkbGTU5
 Kxn0vsJdForSceGZrA+PVgqX+I4/3aLBhimpxSckt/W23F7V4Ps8O+C0eHsrIfAl488dJ
 pAfCzbmlF6gt49fWhoqWdvL8oI+tYywjHX11PJZItngmxlE4PsKFjfB+wkZ9cmD2uGg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792704271;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
 bh=MS24npZn5VTxLsWFNPLwF6ybHmTHS2rSpLoV+qB3qQc=;
 b=POpx45Y2qYCrtbW7VDtqZAo36s2zN2TiFDkcVzP5qWTG7rSMc49pvfHs0cW4tFTtr1TL
 mkVJBvW9XJri9J9itZjsmqhiVg/F+98HQ1PdZ7GPdOIG2ZgDlyobudinPL9rJpc/ZB4Hk
 foMQfcAGGSpCee+4PTvU5fqot4HtnQ+5CbfAyyDpZgK1cmlAkkaBNPQGSgwxmsri1cgog
 gfKWKI7HjZmnAwlCyb5p1wekXX/xRUW1TFue0W6meqGrYt28gudRIiifafigcSjobQiyK
 VcNZ5Fg21S3z9Su08e5kw5oajF1hmE+j7NZD+LcYHPiLTFa9BZEemvO2nf/yWwcBF8g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
 dmarc=none header.from=j-ernberg.se;
 dkim=pass header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=PjmM120X; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::1229"
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1229; helo=mail-dl1-x1229.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=j-ernberg.se
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=PjmM120X
Received: from mail-dl1-x1229.google.com (mail-dl1-x1229.google.com
 [IPv6:2607:f8b0:4864:20::1229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40A314096D
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:24:30 +0000 (UTC)
Received: by mail-dl1-x1229.google.com with SMTP id
 a92af1059eb24-16079d54c17so504485c88.0
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 14:24:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792704270; cv=none;
 d=google.com; s=arc-20260327;
 b=lTB7amn60vI4D5L67682hiyBHClkVBpxCw2JUhofiQ2ikClMVaLFky1GXfApJ7h1mN
 +BZ4JpGM+IyUup+G6qOJkNdXflLyLSmcoT0rywyLvYrmWiWMRq/JDjcekEobgQzyupRW
 uTykq/PgO2poY3YEkXuRG3DDNBTEyEL2rFseBmOcj2e9jL/G0w7kaFBPFztbzSWVoJYW
 Ob42VCnPoGfGfk2W8x+ox0Bizmg9W1qpEzB0w5b4kymzAzxt7J1qEJ+uR0sklRkVmbA7
 GcS5aScNoakZmZQPzhn5nuKwRUNW/NKITkfE7SkzmhGsAQ7CTQ3KVgWgVLQraoOcKhm/
 o7JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=MS24npZn5VTxLsWFNPLwF6ybHmTHS2rSpLoV+qB3qQc=;
 fh=8sjXXvKGwfJNJLC8hRQyN169zYGK57/USKXNDY0ijdE=;
 b=M8VdLGU6zGJ1KzrLMOxCDZ2iGxS51umBBvi0lhi9FpwWMFSa5YXcexfGLqeFlCB1WB
 C6SZ8zZ/Up/a+bnK5U/v1dL/3XAtWCQ7l671APCqfCocZxVGkk9r9cTvuOgWOONt2CiI
 uDldYmw0f8Ns+W5+sPB8bI1+mJrCWLaZ68Xq3sKQdhB+fgKQ0bL2qZKIyjHobavuJTGJ
 JtknwBK/elf9xERksfijRtQEt2h2tjrIvBFsS4TuMkQorG/4S28MTRL971gvLHs70Ci7
 z4+xZJc31C9FZUD/tHQpirW3ze/rHsSkPSWS7VObHMd2ATzxM/JAe0p1MA9XbBUkhgzY
 +y0A==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1792704270; x=1793309070;
 darn=buildroot.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=MS24npZn5VTxLsWFNPLwF6ybHmTHS2rSpLoV+qB3qQc=;
 b=PjmM120XdYU/oFGHT22UHqPHGAOsm5xbB3ibloXcjnUprKXjau+q07H0sogCJ0egoA
 5rxqOFQ5Y2z3SiH2pczgpXhwI+lTv/pi5Y1sKFp2iKqCmY3FvlQJOti3U0d/p1ariHaT
 dm/WC0nGwRU9e29RkEFFh1BGq5ZOgFLagohi7b6tAVAgGfpVk8QduPQLYj7L1stYWqTT
 D4VcvCmtB9tVufUFEKug4Lt6pxvTpSzKc1rBtu15MyxlPHVtHjstxI7YgiaDFGgb8oqU
 MTY5aseUKVkvzb7HuBeWqThkwURvz8KVfQEtDnhLjwYt/PW9OYycDWPnIhkOXJwjjV8e
 05bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792704270; x=1793309070;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=MS24npZn5VTxLsWFNPLwF6ybHmTHS2rSpLoV+qB3qQc=;
 b=xqUU1Rl03eWWN50OKh8h1WmUzKW8CGMMum6ospvkZT0ormuIo5EhzWBqF1r2Y0CFLV
 YuEZuHl8627d5X8GbJYcpKS8vEQToo3/Bf1haYLa+IojckrjsQ+bkpSyDADGzGD2t7bT
 0gS7AejiJe/VCI2iBjngHgK1e0Zrcrc+Sw/xylvALs1d3KcoxBgPH0BZPTbr/HuLocZ4
 lNWhOJL4POUUv7HTXnUFODT0sUX0yUYbGx1XnL2xuh9GxjOa1z+GrIK8aNqkH28wXKWG
 mkuzcYqgnEFB+DqPa6g4vnlUQOJCTs4ABcbSqh4gesUuyH59HJRgjXmrSSBR1Ib0JmMi
 biaA==
X-Forwarded-Encrypted: i=1;
 AKwUvBz+orsbTXhsDTtdpNxSYozXcjjIBNAHsWpFo7LB9wFIRWE26gG3BkohliGM/wmx9tU8erNr90U32es=@buildroot.org
X-Gm-Message-State: AFq9FYKHSiZ9kKGijcIQwYbag+2lVLIQtJb/x9lPLaS2Jj1oI0onCfCt
 uMvFx9JYkr2Mdw03Obub/vMtoeepkHYoDCylfpSDk6vswf7bTsl6F6ZdOS68Mq+6F17M3GXgHWX
 ENBKFZ2pOJlyne8Mczgg5cAuorlSTKqQpLWk8xkf8Mw==
X-Gm-Gg: AYBFou1OWtgyRQC8GkdQUaadwnRxrJBYCu2VEXvMCwk5bg9b1iUK3NAx1vHJg1FuH0H
 MfltV4jgjF8prpKmMD/MggTU9sQlqnxNyQH/hjGzl8TooVhUhtTEP6Ey8Te3drnDjoOpIGCVSLi
 +iMGjGIrNF9VFrXYmNdBfBs+XSE7ke2dgpS0/3j85ZD0FvEam3FJCKd93Vr5CVu3Kv9srVCfEOk
 vne8GblsSqkRIth4fDhE6WXIZ2OQIBvJgxY3edPveALyAyGSVcI6ZfX+89ijnVdxJQ21ODE21U1
 F+UuJGj6G/XhmCr83kiIxe8fTPSeKZ13RIqSCKwY/BcvP+NafdrtGjcVF3S/GlSiuCqI5KpeVEY
 ScGrrO03gx3yQT+E4rZngMtNxmjuIXcYkblox67lk/oNHjnI071sOqOkyfu/MI8MTBhUc81EXk9
 AC3cJ5IeI11LFADY0ZCcH/cg==
X-Received: by 2002:a05:7022:7e0e:b0:144:c112:5f24 with SMTP id
 a92af1059eb24-195c1c6b9d3mr558045c88.25.1792704269385; Thu, 22 Oct 2026
 14:24:29 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261018160651.349981-1-j@j-ernberg.se>
 <atUtmzafWnVtVm-t@windsurf>
 <atWwZGNSjbN0GrwD@landeda> <atXItOiRRP2j79zR@windsurf>
 <atXov2HEcIiVzCAU@landeda> <atYLM_NKiCwSpJSU@windsurf>
In-Reply-To: <atYLM_NKiCwSpJSU@windsurf>
From: John Ernberg <j@j-ernberg.se>
Date: Thu, 22 Oct 2026 23:24:18 +0200
X-Gm-Features: AclHuK8iFQCo9Y3A6BDZVaLcEPBea2hWnT6uR697E2KMr6oWyRepuc-LO9yt1k4
Message-ID: <CAAHg4Zh+asqbkBTqtoaaZgRTgWn0YxUp0CnLfxD84vYwPNvetg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org, 
 Adam Ford <aford173@gmail.com>, Bernd Kuhls <bernd@kuhls.net>, 
 Joseph Kogut <joseph.kogut@gmail.com>, Romain Naour <romain.naour@gmail.com>
Subject: Re: [Buildroot] [RFC PATCH] package: {libgl, libglvnd,
 mesa3d}: Propagate libglvnd GL provider to libgl dependencies
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgVGhvbWFzLAoKT24gTW9uLCBPY3QgMTksIDIwMjYgYXQgMjoyM+KAr1BNIFRob21hcyBQZXRh
enpvbmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBP
Y3QgMTksIDIwMjYgYXQgMTE6NTQ6MDdBTSArMDIwMCwgWWFubiBFLiBNT1JJTiB3cm90ZToKPiA+
IFRob21hcywgQWxsLAo+ID4KPiA+IE9uIDIwMjYtMTAtMTkgMDk6NDAgKzAyMDAsIFRob21hcyBQ
ZXRhenpvbmkgc3Bha2UgdGh1c2x5Ogo+ID4gPiBPbiBNb24sIE9jdCAxOSwgMjAyNiBhdCAwNzo1
Mzo0MEFNICswMjAwLCBZYW5uIEUuIE1PUklOIHdyb3RlOgo+ID4gPiBZZXMsIGJlY2F1c2Ugcmln
aHQgbm93IHdlIGhhdmU6Cj4gPiA+ICAgICAgICAgW0dMLXVzaW5nIHBhY2thZ2VdIC0+IGxpYmds
IC0+IGxpYmdsdm5kCj4gPiA+IEFuZCBzZXBhcmF0ZWx5Cj4gPiA+ICAgICAgICAgbWVzYTNkIC0+
IGxpYmdsdm5kCj4gPiA+IHdoaWNoIG1lYW5zIHRoYXQgW0dMLXVzaW5nIHBhY2thZ2VdIGNhbiBi
ZSBidWlsdCBiZWZvcmUgbWVzYTNkLCBleGNlcHQKPiA+ID4gdGhhdCBsaWJnbHZuZCBkb2Vzbid0
IHByb3ZpZGUgKmFsbCogd2hhdCBpcyBuZWVkZWQgdG8gYWN0IGFzIGEgR0wKPiA+ID4gcHJvdmlk
ZXIsIGZvciBleGFtcGxlIGl0IGRvZXNuJ3QgcHJvdmlkZSBkcmkucGMuCj4gPiBbLS1TTklQLS1d
Cj4gPiA+ID4gSSB3b25kZXIgaWYgc2hvdWxkIGZ1cnRoZXIgaGF2ZSB0aGlzOgo+ID4gPiA+ICAg
ICBbR0wtdXNpbmcgcGFja2FnZV0gLT4gbGliZ2wgICAgIC0+ICAgICBsaWJnbHZuZAo+ID4gPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwtPiBtZXNhM2QgLS8KPiA+ID4gSSdtIGFm
cmFpZCBJIGRvbid0IHVuZGVyc3RhbmQgeW91ciBkaWFncmFtcyA6LS8KPiA+Cj4gPiAqIGxpYmds
IGRlcGVuZHMgb24gbGliZ2x2bmQKPiA+ICogbGliZ2wgZGVwZW5kcyBvbiBhbGwgYWN0dWFsIEdM
IHByb3ZpZGVycyAobGlrZSBtZXNhM2QpCj4gPiAqIGFjdHVhbCBHTCBwcm92aWRlcnMgKGxpa2Ug
bWVzYTNkKSBkZXBlbmQgb24gbGliZ2x2bmQKPgo+IEJ1dCB3aGF0IGFyZSB5b3UgZGVzY3JpYmlu
ZyBoZXJlPyBIb3cgaXQgX3Nob3VsZF8gd29yaywgb3IgaG93IGl0Cj4gd29ya3MgX3RvZGF5Xz8K
Pgo+IEJlY2F1c2UgdG9kYXkgdGhlIHBhcnQ6Cj4KPiAqIGxpYmdsIGRlcGVuZHMgb24gYWxsIGFj
dHVhbCBHTCBwcm92aWRlcnMgKGxpa2UgbWVzYTNkKQo+Cj4gaXMgbm90IHRoZXJlLCBhbmQgdGhh
dCdzIHByZWNpc2VseSB0aGUgcHJvYmxlbS4KPgo+IFRoYXQgYmVpbmcgc2FpZDogaXQgaXMgb2Rk
IGZvciBtZXNhM2QgdG8gcHJvdmlkZSBkcmkucGMuIFRoaXMgbWVhbnMKPiB0aGF0IGlmIHlvdSBo
YXZlIG11bHRpcGxlIE9wZW5HTCBwcm92aWRlcnMuLi4gdGhleSB3b3VsZCBhbGwgcHJvdmlkZQo+
IHRoZWlyIG93biBkcmkucGMsIG92ZXJyaWRkaW5nIGVhY2ggb3RoZXI/Cj4KPiA+ID4gPiAuLi4g
ZXZlbiB0aG91Z2ggdGhlIGxpYmdsIC0+IG1lc2EzZCB3b3VsZCBiZSBoZXJlIGp1c3QgdG8gZW5z
dXJlIGJ1aWxkCj4gPiA+ID4gb3JkZXJpbmcsIGFuZCB0aGVyZSB3b3VsZCBiZSBub3RoaW5nIGZy
b20gbWVzYTNkIHRoYXQgdGhlIFtHTC11c2luZwo+ID4gPiA+IHBhY2thZ2VdIHdvdWxkIHVzZSBh
dCBidWlsZCB0aW1lIGluIHByYWN0aWNlLiBJIHRoaW5rLi4uCj4gPiA+IEFuZCB0aGF0J3Mgd2hl
cmUgeW91J3JlIG5vdCBjb3JyZWN0LCBhbmQgdGhhdCdzIHRoZSB3aG9sZSBwb2ludCBvZgo+ID4g
PiBKb2huJ3MgcGF0Y2ggaW4gdGhlIGZpcnN0IHBsYWNlLiBDaGVjayBvdXQgaGlzIGNvbW1pdCBs
b2cgZm9yIGRldGFpbHMuCj4gPgo+ID4gU29ycnksIEkgZG9uJ3QgaGF2ZSB0aGUgdGhyZWFkIGhp
c3RvcnkgaGVyZTsgb25seSBkaWdlc3Qtc3Vic2NyaWJlZC4KPgo+IFdlbGNvbWUgdG8gdGhlIHdv
cmxkIG9mIGxvcmUvbGVpIDotKQo+Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290
LzIwMjYxMDE4MTYwNjUxLjM0OTk4MS0xLWpAai1lcm5iZXJnLnNlLwo+Cj4gPiBJSVJDLCBvbmUg
b2YgdGhlIHJlYXNvbiB0byBidW1wIHRoZSBudmlkaWEtZHJpdmVyIGJhY2sgYXQgdGhlIHRpbWUs
Cj4gPiBiZXNpZGVzIHRoZSBidW1wIGl0c2VsZiwgd2FzIHRoYXQgdGhlIG5ld2VyIGRyaXZlciB3
YXMgZ2x2bmQtYXdhcmUuCj4gPiBCdXQgdGhpcyBoYXMgc3RhbGxlZC4KPiA+Cj4gPiBBbHNvLCBl
dmVudHVhbGx5LCB0aGVyZSBhcmUgdHJpY2tzIHRvIGFjdHVhbGx5IGhhdmUgbXVsdGlwbGUgR0wK
PiA+IHByb3ZpZGVycywgd2hlbiBvbmUgdXNlcyBicjItZXh0ZXJuYWwgdHJlZXMsIHNvIGV2ZW4g
aWYgR0wgcHJvdmlkZXJzCj4gPiBidW5kbGVkIGluIEJ1aWxkcm9vdCBkbyBub3QgcGxheSBuaWNl
IHdpdGggZ2x2bmQsIGl0IGRvZXMgbm90IG1lYW4KPiA+IG91dC1vZi10cmVlIHByb3ZpZGVycyBj
YW4ndCB1c2UgaXQuLi4KPiA+Cj4gPiA+IEVzc2VudGlhbGx5LCBJJ20gdHJ5aW5nIHRvIGZpZ3Vy
ZSBvdXQgd2hldGhlciB3ZSBzaG91bGQ6Cj4gPiA+ICgxKSBGaXggdGhpcyBsaWJnbHZuZCBpc3N1
ZSBieSBhZGRpbmcgbW9yZSBjb21wbGV4aXR5Cj4gPiA+IG9yCj4gPiA+ICgyKSBSZS1zaW1wbGlm
eSBldmVyeXRoaW5nIGJ5IGRyb3BwaW5nIGxpYmdsdm5kIGVudGlyZWx5Cj4gPgo+ID4gV2VsbCwg
bm8gbG9uZ2VyIG15IGNhbGwgdG8gbWFrZSBhbnltb3JlLiBJIHdhcyBqdXN0IHByb3ZpZGluZyBh
Cj4gPiByZWNvbGxlY3Rpb24gb2Ygd2hhdCBJIHJlbWVtYmVyZWQgZnJvbSBiYWNrIHRoZW4uCj4K
PiBJbmRlZWQsIGJ1dCBJIHdhbnRlZCB0byBzZWUgaWYgdGhlcmUgd2FzIGFueXRoaW5nIEkgd2Fz
IG1pc3NpbmcuCj4KPiBPbiBteSBzaWRlLCBJIGJlbGlldmUgSSB3b3VsZCBiZSBpbiBmYXZvciBv
ZiAoMiksIGkuZSBkcm9wcGluZwo+IGxpYmdsdm5kLgo+CgpJIHdhcyBkcmFnZ2luZyBteSBmZWVk
IGEgbGl0dGxlIGJpdCB0byBzZWUgaWYgWWFubiBoYWQgbW9yZSB0byBhZGQgdG8KdGhlIGRpc2N1
c3Npb24uCgpJJ2xsIHdoaXAgdXAgYSByZW1vdmFsIGluIHRoZSBuZXh0IGNvdXBsZSBvZiBkYXlz
LgoKQmVzdCByZWdhcmRzIC8vIEpvaG4gRXJuYmVyZwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
