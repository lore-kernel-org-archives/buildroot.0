Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D75F606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ER2z/mOZ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 468CC60650;
	Fri, 30 Oct 2026 14:09:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NJ0b4YlzQP74; Fri, 30 Oct 2026 14:09:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 87AA560ACF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369362;
	b=TTXUrHQe71fxxRZF/FTLpLVRpcv2CD776giaNzf/o81K+DmLcB2GIsrsxvUrfueRgQon
	 gKJtcGmpvyroEZkTV9mL0QP7Y6WHiLcgyyJcq5WTOJWGHMS3dav/Oj6Wgvvy1qtvxn0DG
	 UV6kVQCF6r6cyVOEBcEyiljky41b2lkaejAbsgO5rOdHimFLp8eGNFxw4mm3kHUH9Zcin
	 srbKCN8g6z/P2Zafnkvlaf+FIaA7hlhaLLkK6PIWZIxvSXvkCVUIEK6yxwTVO5WN+31wd
	 j95lshE4u7DKAwyrkPb4iflJwszYqlQNnLHoImG9D2cV7ZoCWDrhcz9s5l4WQ8VSVQg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369362;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 To:References:Content-Language:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=9r7ADrhCqdtr7lakZSfv6kX1cWXZVWFxYR+SOLvlSnI=;
	b=mYpDD40ywvg2Fj1oXxMrwLpvWJyXAXga3aJ2kn4x7EBv9azQazeODrtoPuRHuIWQRYTY
	 6XnAywIQc4BBhdL0zlbUvHH4GTk4gDhTrz2fvaL7a3qUQsWXVHwj2ELW0GlzjK/J1xjiN
	 b8ag4Fw4xEuVl9TnhguLggxa4/9BTPXzrRbP2jdC5gD/iKiLKyZMt7B3PD7cW8DVpMdwa
	 q/Nuzv6Hretex3fZAniQNOKNGoWM4Paq4QFRD/qpR6vqt8OC1hMwc+Un18Yy3b04S5qpr
	 K4ce+xhsD+nv1p5PlLtjmS85IFh+sf6M+8nB9f/mSueY32Sw717wW5qzGINbM3co4Lg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369362;
	bh=9r7ADrhCqdtr7lakZSfv6kX1cWXZVWFxYR+SOLvlSnI=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=ER2z/mOZ6Hx9WnNnvdhj01EY527UdgXmH1Wtle2KmXEfs0tQhO1rPc6jP35+26E/1
	 LktiAfZfGtT6bIAFW+McV1svFsJFlnBid36EprMg/jSNMRGvHBDoQZxNuuAG7syjS5
	 bVnCFLpyXlos1SHGuMj6Hf+cDe0nDNNuiuEOXDtGJWOxqnzydTudc70HUd/WTF1KBH
	 LiufFnP9cP4Jh+NTe9DB1DOWfzCG/+JmqU7BsDmrPe6hqnRLRP60rZEYcipB0illTY
	 EhTUTu2Y9aoJHUG2h6MgHJ3mNt19zQoqI/P+NGiWxjjOLfL+E/mvnih2sS+s0i8nLa
	 UKeNwUZV907CA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87AA560ACF;
	Fri, 30 Oct 2026 14:09:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A039D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E33680E33
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:09:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iqe3SMjpAvrd for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:09:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 74FDE807A1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369357;
 b=tQoRRmp6FUuWlHvx09ltMXc6zhZ3KnwX4TncGLQAt1iVpphNQIkI799QBppy3BKmD0nB
 XRH2nRTgmFVw/K7kHcgb+P0o55d9av1/7/MmVWZiXuApaqVQWwaEx3xEhr9ntr4UMHbl7
 kNsHk6E92VqUBNz7C0nroezR3yEDtnnTZv/HC0VpUTkNXxD+uxCjLGjIrZwYL50BS/eOz
 FGdv2+HvC05mLUlh8aA54+e3dXAjkQEnEKF83XqlERNmyS8TmSCxNE/ecaXeN8dFUU2wE
 O5Yg3CTE8Fx4GOIVfOjJ7KyTiCTGvkrjEzTXK3Dfe7SiQ1YB2/1EjEz85jXTTRRzVtg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369357;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding;
 bh=YWR+iJKUZK+kmRRnulrGieFGJNqbv+MaE1Y5KDfibnk=;
 b=MpmS2Qj2lh4V4EgDVr4ycbFmLsD5VH9zlB6HzNA8/ospLEr7ms0eJa+v4NjAaamhntI5
 KB9xd12718kqD70Gk/mzIMLdOuuo1NcqQ2oYVxnbdy6NjNP8qDtm7APxefkqtqNfex9rd
 JrD+vzqGbfmlE+RtkZc6+FnSLclx4aqID88luDmabGP9lVOXhidGiDehbtpQaHzQpR0hv
 tTCVpVUU9gn8ZOSLMGFNGkp91g45J91Rofn9R7HThRa1+d8qgvicrztr80uffrgcLaEja
 wglMqgVX9j5z3+vinhaPi4JpH5mDgMhkyxhWcLc6lIsWUdaw+zXw4t7XBrnrwFKHO1w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=K1lDp2Uv; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74FDE807A1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:09:16 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso7690905e9.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 07:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793369355; x=1793974155;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YWR+iJKUZK+kmRRnulrGieFGJNqbv+MaE1Y5KDfibnk=;
 b=nK4om1shE7CFAaRndA2EmJBj4lrd8vLPGHis1z4n/NJV+K5sWzz+H3KO31TjoH5EB7
 XmJ6rkRFi8H/RE3QVZ6b0gSdg3W5v79Zt915nsonjJDCihRciQ1el9ZHbqKUbjeS93hW
 mOMZT4Oji0dc6JIUjk72f7wlzGw4IpgJMwRqKtuHKjn9GqEI6Iekk9nPFOblCj0vqnGs
 uewCoLgwjZ92kf1p4ydq97m2iRCyUQFWKB+PKQMADozGnSrPJkHce48x0yaFdd3NakTc
 9VpGCzdeAGlgkvGNczqH5V6poQA4N1SEFN8WO+DFDUti6Dmi3PDHSL0dFI7qxVwil/bx
 BJ2g==
X-Forwarded-Encrypted: i=1;
 AKwUvBztdQ3RdPfbGh0l6i2yinILCVPOVJoF/g2H+VfUNB/IzBJqhFTt1CGAoqi6YxHrjrijss8+7z5IHLA=@buildroot.org
X-Gm-Message-State: AFq9FYKTxW0m3QF2rFqfWlc3CJB9gbcoiE4kpW9NA3BEio8LpgSP7kId
 Em3dEWJcdxinsgKOLK8IduDM69SJgmXUfL2yIVRU7KyHBk28Xjoa2K2y76tVqH6lVKTeokfPERH
 vq86CBOc=
X-Gm-Gg: AYBFou2GO8BENQ8BbLEfIC+D2+wanVwXpjj6OjV/G4Iow0OyIZcA9emDIcTUUgU59Ac
 LwVZVrayWbzAqLGmBR7W/SOibiJubnxASyV4uuLDukexnHY2OeFLptMdoFx2S7OOI1J/jLnHDLo
 uWssSxbepDK818tbTfr7JkBldHVCbkpG8clET3yMhoIAbq7A8hDUerc6tn5urizCtDh64cmc9c5
 c8DYBPTlSJc6cuypiKcE29F+J2TgIxwcApGaYO9HnsOTDg9EbMPXH/IfGyh1yU5b6dq6aKddbFz
 ArbDOhCS9I1mlHs1XpymJMJC9ih32yJbGGeVTxyRqYsjbdKc0kFmsyZWvmq7vvwlsWBwFzLN+UJ
 sznUgYZ6jF5HXdSm0xOQ+PKd4jFcwJS5XNdpBx0MnpcFHQzDFRyT4/oh549gG5HsM5/JI2HC0z7
 pF0oQpwK01vaPqXhhzpjMci8lRymytPbxVSfPhBLnzqkP1oC+Dj1bsIoczDU6Jhe8IZZEghs/ix
 ub+GNOXGmdXyymYfhMX+bLtH+jSwxKZjgzH3YELlYXzRQtUmFFm87nccPECm9nX9zdtGHCvPl2P
 bVWQDCW++zTPETjdzYLE250Ozmoy4D2s+Jf9Mt2o06lP9bKCkwHerX/h0VoU8Cu7yHbWwE2Kc7c
 =
X-Received: by 2002:a05:600c:46ce:b0:4a6:7d6:821f with SMTP id
 5b1f17b1804b1-4ac189928e9mr54061125e9.29.1793369354908; 
 Fri, 30 Oct 2026 07:09:14 -0700 (PDT)
Received: from [10.42.0.118] (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf60f1076sm66520565e9.6.2026.10.30.07.09.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2026 07:09:14 -0700 (PDT)
Message-ID: <123ede9f-2534-48bc-b46b-95cbb069f532@mind.be>
Date: Fri, 30 Oct 2026 15:09:14 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vincent Fazio <vfazio@xes-inc.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20261005154047.413898-2-raphael.melotte@mind.be>
 <20261028161447.330533-1-raphael.melotte@mind.be>
 <20261028161447.330533-2-raphael.melotte@mind.be>
 <BN0P110MB1609B62896FCDB1B0B31BDD99F6DA@BN0P110MB1609.NAMP110.PROD.OUTLOOK.COM>
Content-Language: en-US
In-Reply-To: <BN0P110MB1609B62896FCDB1B0B31BDD99F6DA@BN0P110MB1609.NAMP110.PROD.OUTLOOK.COM>
Subject: Re: [Buildroot] [PATCH v3 2/2] package/mupdf,
 python-pymupdf: bump to versions 1.28.5 and 2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgVmluY2VudCwKCk9uIDEwLzMwLzI2IDI6NDcgUE0sIFZpbmNlbnQgRmF6aW8gd3JvdGU6Cj4g
SSByYW4gdGhlIGJ1aWxkIGFuZCBQeU11UERGIHVuaXQgdGVzdCBvbiBtYXN0ZXIgYW5kIG9uIHRv
cCBvZiBCZXJuZCdzIFB5dGhvbiAzLjE1LjIgcGF0Y2ggYW5kIGNhbiBjb25maXJtIHRoZXkgYm90
aCBwYXNzLgo+IAo+IFRlc3RlZC1ieTogVmluY2VudCBGYXppbyA8dmZhemlvQHhlcy1pbmMuY29t
PgoKR29vZCB0byBrbm93LCB0aGFua3MgZm9yIHRlc3RpbmcgaXQhCgoKUmFwaGHDq2wKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
