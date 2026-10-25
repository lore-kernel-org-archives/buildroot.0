Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD76606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 21:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KsCiQvP2;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ry9EeEm/
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D286760617;
	Sun, 25 Oct 2026 21:38:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0TS0Rnz7o_hA; Sun, 25 Oct 2026 21:38:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DEB326060E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792964294;
	b=oyOQDdNu10PRCb4Q4XtHa8gwKroUBMqjNUSv1b9IxxtPWyBlXkz7ObnunzFRbYKTMRQI
	 J4gdFFF6MbFyoFkMyY3t/+r83CcGIYxGzuA48Gp2YWMCpEx2saGIr97viLOb3X9dDl7cA
	 fJRFnBh6ZuYSY7bLa5hElQFRqiiwbU0Nu6XyfXbl/bfCsbNX4iMEpcI3Z6JSNT7mFzy4Q
	 BWvDrmFSuaOhXHir7Ln66a3ZIP+PrQKAJtnpzlSAdtwMY+oCbpSUyf0FQMsyu+pZxTIIR
	 r717B3/w2Ef1W9vhXYzEh6WCT2J0/tjGZ9xJRJGHBLlGAiZafSp969LUkk2IZcVRcVw==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792964294;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=ZOxFS+/Xoyve/vLysmLf6uFz8btZ79xJ0std1Pjvm4Y=;
	b=nGkllJJZyY9Erg1Ot6Nb+cgRRp90mRFvlOSWz5eh5I7/DlL8TmapEp3M8NVW6qvQc8VN
	 OC9C9fJFl+UIYGg7g8SAPj4kv5sMkFCMIXXwY5rHa1t/zF2oAqbecxdp5Jg0ccl71x++4
	 Ky8S/btsxDNKVoxZRUYfuKlOB/aXIKVA6HoPzBZnR1jp9yRjoiyFyL2MJXOFD1R9K7SfB
	 C4zz3E8+EitQUkrpK627Yyw//w0tKM1/krNaqDpN1520KUYpCrhgoUodZ1k5jau5q96sr
	 X/p6JM2FauqWkbDEMUaA6T6vfioN5AVM7ERHfQ2EevGaWVDpf5hlvD+9WgT9Yxb/RgA==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Ry9EeEm/";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792964294;
	bh=ZOxFS+/Xoyve/vLysmLf6uFz8btZ79xJ0std1Pjvm4Y=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KsCiQvP2qspdqeAsOMLwc37DvijVwpaQhZaXqKRngn4vlAvB0kNOD0RtIH+/Fzc7l
	 Mav7HmKWZ5Id4yOq01DWd46SJI+VxGXscIKToCCXwskq8sBvRtmmHTKUWp49pFzcGx
	 pYRYz/xZRG+0WcYI3BSqhorSIm9fc1UCKqhTY/JpiR7OJjo0tTYTm48jy9u2HmXDk+
	 bmTVC4Q4P6Snory/OtkPlvKcjdBzAoOYXxacvK4nzEwZcu+9qxIpVM56gbOXaQNz19
	 fDnQzvv8CG/FjLyA5YthPWW4y0MX8S/KTra/X/JlZ6D7x3/+0Y0uBgU/D/icEAkg82
	 or2cSWutkl2iQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEB326060E;
	Sun, 25 Oct 2026 21:38:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 02D2C4D1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCD1260612
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:38:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l_b99rpv-SJn for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 21:38:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D5F896060E
Authentication-Results: smtp3.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::e31"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792964292;
 b=QU17IhnO4QtOhsm7GqMtoBGrygV4DGDKkvaKKm2vZs3N6XmKphOO73HUKGufIhf/VuXc
 4VXPiS/ueIdgTSZoqRvOecBITKvxBmua1ER9lQwZmdkeHRrRhgbt2B/6tAiNvLwHkmfCi
 LdvmY0HTL0KoCUQmlRPUhww0IDIzeCYVWklAxGraJTEj8KcX1zGMQQXRodhcivQJyG3Vv
 1DoJRQ5KZLFQ8c1u43l/w9L8PQ0ADi7oWxsOzXX5tPKLP0gYd/F8V76fmURGJwV2GkDDH
 E9L+ldZXHbB1yDLF1e6R6ndx/AjM5pfuRdokKXqIuLub/itKhCGYwUq5fO5riwtYHhg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792964292;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=eJlOWvblE5TeZw9HgJ3DlTSrBHWUQUR7jZU5FZQGlrc=;
 b=ItmaWiQ4AesP9KWBJ8L0N31aJDDSqcsnFS9+z2OYJLFg4c5NIRLjcNRpAC0Hpi12ipfA
 E1ZOZvV61vADiNK94KCuGWENU0qHPrx5kfw322uMJsVPXEH8qkIs9Z5VREKlAA7QdPtB0
 FLgnC9XitNap3wKoZwBNirb3gN286Ax6F7VvR0PjivAq/fVBezGsM9FFygpRDPcinskeq
 j7wWw77rOJlDxI/Rs2a9YHhkBdhB+ILcqER8hznTwrGVwKcWWip/X6RkS6hbUnfIZzOy/
 8FJJMoqM7FZ//VVcBIClVpNG/2T2VNVY6THN7aZRKGE1BW4vvyyVYY50wgE6Jw3wUnA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="Ry9EeEm/"; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::e31"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e31; helo=mail-vs1-xe31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Ry9EeEm/
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D5F896060E
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:38:11 +0000 (UTC)
Received: by mail-vs1-xe31.google.com with SMTP id
 ada2fe7eead31-7cc81984fceso639431137.0
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 14:38:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792964290; cv=none;
 d=google.com; s=arc-20260327;
 b=FIdEUbed6iN8btqUipSUZYjukLPWXRW+yucXkmwBxZR1Ou5oYVYwRdCDAJca0X1M+n
 rUDg3w+HzyLDPneK4Zs30PWVBP70CAWaokUmTxEPNNX1tJXiSiFmS3Nmby5A1zXfYiLm
 M0QYlyPiMFMTkdWa/xS08Qv7b9J0/l1klYB28MBz4L+UwWHfidD+LRdFpGd7Phm9RmnY
 TaIRCODfHomUoukNI7Bz5MZ9/7heNcS0Kd1LJvneArur6/owIq/Me2l50cNjwCnNY93o
 TwLJBKO6eTQXJbNILVR+s8xBh26rOb/Ha7JsEPVHmnSh5sqgl9t3O3AXMOc7UX0Yyc6z
 VGAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=eJlOWvblE5TeZw9HgJ3DlTSrBHWUQUR7jZU5FZQGlrc=;
 fh=tCtZaDUGNWDAqkPIqjWN/gzDp7C+gGnCgNQZmLz7NOo=;
 b=oWwoxJ6foXxGnfyakKp8MCC0e/7bP9pPfwigUenozG0/KqgfH4uZHwlNqF5x41RqHk
 MDUSzTuRUAdCHc5zjX/+OYbokvKXEG644yHTY9nnITTwr4EawElRoTwT4A2xho7TAj6q
 bwP5VXmRDgGXpsgByphGRyjk9hVwSKbc1dpIs9qZAzoqodIUVCjC8JXPy5xH2n0FzuHJ
 EyOL3YonEFvKsGmresQP3VkToFtA/GX2eOG1taVE0s+8n+zzYmhA71zmVHfxULH42A4r
 mYkLpiYx6nHwVO3vXTD+MYc3uqgbt+s5Pp00N2ewM6MgRXj+XRmig/LJiML+RVY+OSab
 qeew==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792964290; x=1793569090; darn=buildroot.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=eJlOWvblE5TeZw9HgJ3DlTSrBHWUQUR7jZU5FZQGlrc=;
 b=Ry9EeEm/6pcAZd51t0AW/+acEAYhVjLpbkOh+ptFps6Yxf9DeeZbr+xQZed1OmCzVE
 e9FYRzZ5Eg5MINgyAVbSJwy+wuPnC9c5QlIpUOgTMaE7cLzH7F2UR2RRM8J5UwJ5GkME
 2klYsjel7HhJMsrKO/YL2XJWGLY193xJEA++2dUf4btLmeFO/dv2TQe/CQMQftXgs7sm
 SchlytnSuGGDq7c0Q4lTJcDzfJFvVTvTLnbYKCZqqkB58uUM02ox3msFTx1CMogEHX8f
 /0eaD/wFM6n3MI3t35CLV+TMqRbNwc7h43IZHEbjHbjBwoV19S1dkDFnCEtq/gdShVQe
 rp8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792964290; x=1793569090;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=eJlOWvblE5TeZw9HgJ3DlTSrBHWUQUR7jZU5FZQGlrc=;
 b=DjLyD4JisWSNMZXecrM3uQqHu7iJeQDGI5a0ca8/T+9lRKFUKdoBeHy4SquAmO4Ni+
 50ZIKaGLe54TVR49EH7BYGiIadir6xOujXZgKW9zJ+Ms8C0hozhq0pJDpuIVsUXqss9o
 DAsTIIHl1AI3+08+eCyEXRQ9QAJetVAn6dIwQIvhTLnuxNyf8BWoGaQtlsVJAO2k7G+f
 OgvBoH9Tre4wlQnhdAgIqLbjVASKLaOMBjE814dEzEv8HMaxJmSrNmYYw+57XLerYoZ8
 5j2W9KtkfWp6rGg3qmViKOOX8VA3Ccq+omzE0sVEhfBQaZfMS+Gb604dY2XbojXFQgEa
 NBAw==
X-Gm-Message-State: AFq9FYICBohatgj8hvnKYC07zegb5gQytg9xn8SIclOOY+wvBtoMkmao
 wp0lQvQw0/iYzndvDkfXMhUS0QoJI7oePJjuYxGso3u3erG9bht5nbFb9rQCdfBYW2vAWXOrNux
 GbdoRHsmtc4IL1n7BpYK+G+sxcgSWSj0=
X-Gm-Gg: AYBFou1ApPprDNhsZOYVa+sGEOGMs/HGuXdKj0tDfDkeC9l0MbWKJSUiY4TQUW/9xJA
 Hu+thzVqD2o4BesKm1fgaQj8pu6zvl9CYBKaIIcCKhd4C6c/jykoxdfeM/HHw6wx/55ornLlNbU
 DpIyEWfvvcdHIN6TSxOah4o6TKkl1pottuy6azbruAL+30z/mTB/aCgoRZd9HMMaorRQVckJA/k
 6YVuLPPyK3NieR6UU5qnLbEaQFd40L136dtWwS429LZvWEweXCeoC05p02ogQesbX9CzMYkJ/ng
 W2o6hHwLYGJXlPfinBZxQ2CwSPF8xlnu0t+sRy12ifKoxWg+0MALrFl9Lw8raJSF/AzBD6CCLcB
 sq494vyyV+4MFZJbhaiZ0X0QircOJQ+lB7di8mqvyMMoZZj86YDbgQnryLUgcQsRHdhWUQjqZia
 LAqjEUvfFD6kAC1v5OhMSVlHY/z3jQGA2cHJTbWi6xEmolOFezp7U0jufA4oQNvIP0Zu7cc+3ni
 e+8zhRgHIMeclePC9KZoaxtgCYEoQ==
X-Received: by 2002:a05:6102:2b83:b0:7cb:bbcc:e52 with SMTP id
 ada2fe7eead31-7ce5c6cc021mr1374074137.0.1792964290194; Sun, 25 Oct 2026
 14:38:10 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023074432.947659-1-yegorslists@googlemail.com>
In-Reply-To: <20261023074432.947659-1-yegorslists@googlemail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 25 Oct 2026 15:37:59 -0600
X-Gm-Features: AclHuK9lmgjQhmxbIaolfKuFm7_QAA1_u6EQUj0Wapqer5OMqLJ_yeFPweLdnBk
Message-ID: <CADvTj4rE1i=jV_Dc0AyCRi5c_7v=p8-4mEC4giRCysBkqBTQqg@mail.gmail.com>
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, 
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Subject: Re: [Buildroot] [PATCH] package/python-remi: fix build when
 setuptools_scm is installed
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBPY3QgMjMsIDIwMjYgYXQgMTo0NOKAr0FNIFllZ29yIFllZnJlbW92Cjx5ZWdvcnNs
aXN0c0Bnb29nbGVtYWlsLmNvbT4gd3JvdGU6Cj4KPiBweXRob24tcmVtaSBmYWlscyB0byBidWls
ZCB3aGVuIGhvc3QtcHl0aG9uLXNldHVwdG9vbHMtc2NtIGhhcyBiZWVuCj4gYnVpbHQgYmVmb3Jl
IGl0Ogo+Cj4gICBGaWxlICIuLi4vc2V0dXB0b29sc19zY20vX2ludGVncmF0aW9uL3NldHVwdG9v
bHMucHkiLCBsaW5lIDE3NCwgaW4gZ2V0X2tleXdvcmRfb3ZlcnJpZGVzCj4gICAgIGFzc2VydCBp
c2luc3RhbmNlKHZhbHVlLCBkaWN0KSwgInZlcnNpb25fa2V5d29yZCBleHBlY3RzIGEgZGljdCBv
ciBUcnVlIgo+ICAgQXNzZXJ0aW9uRXJyb3I6IHZlcnNpb25fa2V5d29yZCBleHBlY3RzIGEgZGlj
dCBvciBUcnVlCj4KPiByZW1pJ3Mgc2V0dXAucHkgZmlyc3QgY2FsbHMgc2V0dXAoKSB3aXRoIHNl
dHVwX3JlcXVpcmVzPVsnc2V0dXB0b29sc19zY20nXS4KPiBXaXRoIGEgUEVQIDUxNyBidWlsZCwg
c2V0dXB0b29scycgYnVpbGRfbWV0YSBiYWNrZW5kIGFsd2F5cyByYWlzZXMKPiBTZXR1cFJlcXVp
cmVtZW50c0Vycm9yIGZvciBpdCwgc28gdGhlIGJhcmUgZXhjZXB0IGZhbGxiYWNrIGlzIGFsd2F5
cwo+IHVzZWQsIHdoaWNoIGNhbGxzIHNldHVwKCkgYWdhaW4gd2l0aCB1c2Vfc2NtX3ZlcnNpb249
RmFsc2UuIElmCj4gc2V0dXB0b29sc19zY20gaXMgaW5zdGFsbGVkLCBpdHMgdXNlX3NjbV92ZXJz
aW9uIGtleXdvcmQgaGFuZGxlciBzdGlsbAo+IHJ1bnMsIGFuZCBzaW5jZSBzZXR1cHRvb2xzX3Nj
bSA4LjAgaXQgcmVqZWN0cyBGYWxzZS4KPgo+IEFkZCBhIHBhdGNoLCBzdWJtaXR0ZWQgdXBzdHJl
YW0sIHRoYXQgcmVtb3ZlcyB0aGUgdXNlX3NjbV92ZXJzaW9uCj4ga2V5d29yZCBpbiB0aGUgZmFs
bGJhY2sgaW5zdGVhZCwgc28gdGhlIHN0YXRpYyB2ZXJzaW9uIGlzIHVzZWQgd2hldGhlcgo+IHNl
dHVwdG9vbHNfc2NtIGlzIGluc3RhbGxlZCBvciBub3QuCgpUaGlzIHNlZW1zIGZpbmUgYXMgYSB3
b3JrYXJvdW5kIGJ1dCBwcm9iYWJseSBpc24ndCB3aGF0IHVwc3RyZWFtIHdvdWxkCmFjdHVhbGx5
IHdhbnQgYXMgYSBwcm9wZXIgZml4LgoKPgo+IFRoaXMgaXNzdWUgaGFzIGJlZW4gcHJlc2VudCBz
aW5jZSBjb21taXQgODkzN2RiOGRkNTk1Cj4gKCJwYWNrYWdlL3BrZy1weXRob24ubWs6IG1pZ3Jh
dGUgc2V0dXB0b29scyB0byBwZXA1MTciKTogYmVmb3JlIGl0LAo+IHNldHVwLnB5IHdhcyBydW4g
ZGlyZWN0bHkgYW5kIHRoZSBmaXJzdCBzZXR1cCgpIGNhbGwgc3VjY2VlZGVkIHdoZW4KPiBzZXR1
cHRvb2xzX3NjbSB3YXMgaW5zdGFsbGVkLiBDb21iaW5lZCB3aXRoIHNldHVwdG9vbHNfc2NtID49
IDguMAo+IChidW1wZWQgaW4gMjAyNC4wMiksIGl0IHRoZXJlZm9yZSBhZmZlY3RzIDIwMjQuMDUg
YW5kIGxhdGVyLCBpbmNsdWRpbmcKPiBhbGwgbWFpbnRhaW5lZCBicmFuY2hlcy4KPgo+IEZpeGVz
Ogo+IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9jZjE5ODVjMDA4YzBh
ZjZhMGEyZGMwOGY5OGFlNDI2YjNiMTc4NzRiCj4KPiBGaXhlczogODkzN2RiOGRkNTk1ZTA5ODg3
NTFlNWRiYjU2OGU4NzBiMDdiMzljYyAoInBhY2thZ2UvcGtnLXB5dGhvbi5tazogbWlncmF0ZSBz
ZXR1cHRvb2xzIHRvIHBlcDUxNyIpCj4gQXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1ZGUtb3B1cy01
LTUKPiBTaWduZWQtb2ZmLWJ5OiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFp
bC5jb20+ClJldmlld2VkLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWls
LmNvbT4KPiAtLS0KPiAgLi4uZHJvcC11c2Vfc2NtX3ZlcnNpb24taW4tdGhlLWZhbGxiYWNrLnBh
dGNoIHwgNDMgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNDMgaW5zZXJ0
aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tcmVtaS8wMDAxLXNl
dHVwLnB5LWRyb3AtdXNlX3NjbV92ZXJzaW9uLWluLXRoZS1mYWxsYmFjay5wYXRjaAo+Cj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXJlbWkvMDAwMS1zZXR1cC5weS1kcm9wLXVzZV9zY21f
dmVyc2lvbi1pbi10aGUtZmFsbGJhY2sucGF0Y2ggYi9wYWNrYWdlL3B5dGhvbi1yZW1pLzAwMDEt
c2V0dXAucHktZHJvcC11c2Vfc2NtX3ZlcnNpb24taW4tdGhlLWZhbGxiYWNrLnBhdGNoCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi42NzE5MGE0NTE5Cj4gLS0tIC9k
ZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLXJlbWkvMDAwMS1zZXR1cC5weS1kcm9wLXVz
ZV9zY21fdmVyc2lvbi1pbi10aGUtZmFsbGJhY2sucGF0Y2gKPiBAQCAtMCwwICsxLDQzIEBACj4g
K0Zyb20gYzY1M2FiMjRlMzZlZjZjNDE5MGU3MGUwNjRlODEwMjQwMTI0NzQyOCBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2ds
ZW1haWwuY29tPgo+ICtEYXRlOiBGcmksIDIzIE9jdCAyMDI2IDA2OjA4OjQxICswMjAwCj4gK1N1
YmplY3Q6IFtQQVRDSF0gc2V0dXAucHk6IGRyb3AgdXNlX3NjbV92ZXJzaW9uIGluIHRoZSBmYWxs
YmFjawo+ICsKPiArVGhlIGZhbGxiYWNrIHNldHVwKCkgY2FsbCBzZXRzIHVzZV9zY21fdmVyc2lv
biB0byBGYWxzZS4gQnV0IHdoZW4KPiArc2V0dXB0b29sc19zY20gaXMgaW5zdGFsbGVkLCBpdHMg
dXNlX3NjbV92ZXJzaW9uIGtleXdvcmQgaGFuZGxlciBpcwo+ICtzdGlsbCBpbnZva2VkLCBhbmQg
c2luY2Ugc2V0dXB0b29sc19zY20gOC4wIGl0IG9ubHkgYWNjZXB0cyBUcnVlLCBhCj4gK2RpY3Qg
b3IgYSBjYWxsYWJsZToKPiArCj4gKyAgRmlsZSAiLi4uL3NldHVwdG9vbHNfc2NtL19pbnRlZ3Jh
dGlvbi9zZXR1cHRvb2xzLnB5IiwgbGluZSAxNzQsIGluIGdldF9rZXl3b3JkX292ZXJyaWRlcwo+
ICsgICAgYXNzZXJ0IGlzaW5zdGFuY2UodmFsdWUsIGRpY3QpLCAidmVyc2lvbl9rZXl3b3JkIGV4
cGVjdHMgYSBkaWN0IG9yIFRydWUiCj4gKyAgQXNzZXJ0aW9uRXJyb3I6IHZlcnNpb25fa2V5d29y
ZCBleHBlY3RzIGEgZGljdCBvciBUcnVlCj4gKwo+ICtUaGUgZmFsbGJhY2sgaXMgYWx3YXlzIHRh
a2VuIHdoZW4gYnVpbGRpbmcgdGhyb3VnaCBhIFBFUCA1MTcgZnJvbnRlbmQKPiArc3VjaCBhcyBw
eXBhL2J1aWxkLCBiZWNhdXNlIHNldHVwdG9vbHMnIGJ1aWxkX21ldGEgYmFja2VuZCByYWlzZXMK
PiArU2V0dXBSZXF1aXJlbWVudHNFcnJvciBmb3IgdGhlIHNldHVwX3JlcXVpcmVzIGVudHJ5LiBT
byByZW1pIGNhbid0IGJlCj4gK2J1aWx0IHdoZW5ldmVyIHNldHVwdG9vbHNfc2NtIGlzIGluc3Rh
bGxlZCBpbiB0aGUgYnVpbGQgZW52aXJvbm1lbnQuCj4gKwo+ICtSZW1vdmUgdGhlIGtleXdvcmQg
aW5zdGVhZCwgc28gdGhhdCB0aGUgc3RhdGljIHZlcnNpb24gaXMgdXNlZC4KPiArCj4gK1Vwc3Ry
ZWFtOiBodHRwczovL2dpdGh1Yi5jb20vcmF3cHl0aG9uL3JlbWkvcHVsbC81NTQKPiArQXNzaXN0
ZWQtYnk6IENsYXVkZTpjbGF1ZGUtb3B1cy01LTUKPiArU2lnbmVkLW9mZi1ieTogWWVnb3IgWWVm
cmVtb3YgPHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29tPgo+ICstLS0KPiArIHNldHVwLnB5IHwg
MiArLQo+ICsgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4g
Kwo+ICtkaWZmIC0tZ2l0IGEvc2V0dXAucHkgYi9zZXR1cC5weQo+ICtpbmRleCBmZmNkYTlhLi4x
YWJjMjdkIDEwMDY0NAo+ICstLS0gYS9zZXR1cC5weQo+ICsrKysgYi9zZXR1cC5weQo+ICtAQCAt
MjYsNiArMjYsNiBAQCB0cnk6Cj4gKyAgICAgc2V0dXAoKipwYXJhbXMpCj4gKyBleGNlcHQ6Cj4g
KyAgICAgZGVsIHBhcmFtc1snc2V0dXBfcmVxdWlyZXMnXQo+ICstICAgIHBhcmFtc1sndXNlX3Nj
bV92ZXJzaW9uJ10gPSBGYWxzZQo+ICsrICAgIGRlbCBwYXJhbXNbJ3VzZV9zY21fdmVyc2lvbidd
Cj4gKyAgICAgcGFyYW1zWyd2ZXJzaW9uJ10gPSAnMjAyMi43LjI3Jwo+ICsgICAgIHNldHVwKCoq
cGFyYW1zKQo+ICstLQo+ICsyLjM0LjEKPiArCj4gLS0KPiAyLjM0LjEKPgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
