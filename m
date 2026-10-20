Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A04606A31B
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 14:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BJdLXhUL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=arofeU6I
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4493880DEC;
	Tue, 20 Oct 2026 14:38:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g4gD-khszeR9; Tue, 20 Oct 2026 14:38:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6953780B7D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792507129;
	b=DWxsKYjHPXdZXjwEhafQvAo8bV2jWmZKSpO6RyHdPceUjT+i/SmzJxGUWN70T4aSFIZA
	 6huuFFiZq0XEGncSDbJ99JUlzR0b579fPtsqGhd9N0A40tGxdNPOK3vnW5bj1/C/l8gnu
	 D/i+7d39chXdYJMR+QVD1s/ReSCi1fUwCz2rWlbbpfOvGljdDyrj4Gjc1QJddh9LXlCQ+
	 AdEG3cppjUlKIUkZPPzDYmEGnCM1FwUaT3jHsUz+ZVZbK8vxBxdqcHljnjinNQZDh71k+
	 Tzc4GK72T7hqGlbOkw36hprAwIDGEsf74LMl6w5i1MEoyyoFfnAAXv4aAg7H7O8Y8zg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792507129;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:From:To:
	 In-Reply-To:References:Organization:Date:MIME-Version:User-Agent:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Errors-To:Sender;
	bh=DuywQANsaUKIjJyS8Rz3t3PVZO3BjSVufoh/Tl8FKmI=;
	b=KdV9eMLFmaVzNsfPn3lVYjSXptFJOimeQmLLb7B6B+agsD3YmBDAvSG2r2Zpwv025jQh
	 0yrdNYh7elOS62nnd9YJSf4skK1At3hxl43eeECPtnq8aXZWRJ1OvlhRfb2xm/X9u4Woq
	 g0vGOKlb+GmuDvJ4eD86C+M5FexGvu3qJ9SnAYlE1Jr6gKW84xKXji4HQkRtoKa+pMc1F
	 dkSiuqenJk4klkespDFltbsfNc6pswJOzKgmArsPSb2orIT4S+H7JRYP2IjQ4CnZB2b2r
	 ahyz8Adc4sBQTqAOu7FiNvb96FVJ2JbMHTJd7g1PALBI8f7aUexZ2TaIV7UksNGzoHA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792507129;
	bh=DuywQANsaUKIjJyS8Rz3t3PVZO3BjSVufoh/Tl8FKmI=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BJdLXhULGpwD8cls7qAIjXlJlIwGGy7sdksts8XJ75+e88TqSx4dMo+2bY8twy6kw
	 S9zE0w4rDhESysf6WEaGB6oNsplaBT8GB57U0TIJPqw/Qhi2D3uQcJY6HqY9EnE8Aq
	 1w3iFqsb6D6Ihqt51TQoeN2E2B0H5XNOy5G4v+349wUw0BgHQ+uf+3xfE9a86mX8gV
	 +YDjwVlmuE719N0BUJ42wmeac8ZcgDPTtoZwjht/t0r0yh5xXJwzBKbb+AVGO4U6nZ
	 e22Cdpir+sS1aK4bSb2VHki6zyNGvOsmmEXuYN/DtYAGLyRYqzz8CAKaYnUt+aQPps
	 wuQAk8SEqJJPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6953780B7D;
	Tue, 20 Oct 2026 14:38:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10CBC1E9
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 14:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E68E4052F
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 14:38:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SBv9maR-kgHd for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 14:38:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 146944050E
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::232"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792507127;
 b=JG/AQWpd+ZRtctbmx1ga+qixmQFzOPw5g2J8KvzWqxzJ5Q9S8CG3OCGit304V20h5/Vq
 /tuiHPMn5gQnJclEchVoHLJMLfltIW0F6jpbXoQ2Z4xMg+BWGLTAAKnhaokff4eqAtUiq
 GAVZxQD6cKdBAb1aTacJVx9nF7fXxgHa71CGXyWqGz1JrUHDmZsZAED5IPtoa/sgB6sr7
 AGRboHy1wvkOhphZHkmC8vaqupaYmxpn6bd7g5VL+bE1YnRwgIZaxv4rrS7zm1SToeBAo
 5qzZHa47odTtVnFhuAgph7rrNvN79nGD88npdmXK/675bQxnIFH5+5jf5FuBA4wfCLg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792507127;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 Message-ID:Subject:From:To:In-Reply-To:References:Organization:
 Content-Type:Date:MIME-Version:User-Agent;
 bh=wYKZbxkmk1q3B0P4LDfhvg/qHFTOT2Hy5dmcY+/5xos=;
 b=B/LC8niY/cR1vGpHgHmtvLt54w/zEpGAPek9XmrehxC91BozLLKVtbj7xsaRoUrX7TBQ
 CVWXkgZ2gZY9JSLrZ7VCzdbFIfa7OjTr5jvMnaELvBAVlz4plzvKXYqEiv+hLK0BjcFj3
 NTxEqqDUs7a9xGDLPMAMpb0UngPBoYXPdYkFwa5v1YpkMsV91+TSND2fa4t1JYJH9BBgN
 EPDV7hixIXehYFXjI0tNXEXnQHfcAw++PIZSlHNRDv0nKmv/GuYWfFzRrCX44vT50Ql8Z
 DlvR9puXYNBs9OCHSo/ilERv3Za6dRuiAApihVCvLTPGu1k5jMYDjKHtkySPXQyAdiw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=arofeU6I; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::232"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=arofeU6I
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 146944050E
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 14:38:46 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-3ab53a99771so4647161fa.3
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 07:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792507124; x=1793111924; darn=buildroot.org;
 h=user-agent:mime-version:date:content-type:organization:references
 :in-reply-to:to:from:subject:message-id:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wYKZbxkmk1q3B0P4LDfhvg/qHFTOT2Hy5dmcY+/5xos=;
 b=arofeU6ILNMhvdQwsQMDsh3ANIArD5M01iK4kCPgqLdMyTGKpdkHDFPMcndwD/1Ray
 WNDRovHGuRzN9eXqthh1LnLLUNfGX7fbWyUOfwlg1Op8SPTjQvz69gBPKnXRkByhqVAf
 RxCJeCONpyQI2eEon+KQK9nuDrLfNRUfppdYGBY/S0gQ7ukYQkRFe3Setr97nhQpLQsw
 IrP/ZW5+77k/D/fpf3WVD8c7m27d9Hj/wxLeagAbkFPADUgwDg6nbb1h3DEXZ9KR1fM3
 wWavNLStLDacM/5hU7MmgasejWiLkhvw/JIXwz6Om4vFyrdk4I4/nUDV0wLAAjOlWL72
 y6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792507124; x=1793111924;
 h=user-agent:mime-version:date:content-type:organization:references
 :in-reply-to:to:from:subject:message-id:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=wYKZbxkmk1q3B0P4LDfhvg/qHFTOT2Hy5dmcY+/5xos=;
 b=ocQrNDeGjxJRaZQ7oOq6qB3mltBHB8tJtQvk7mEBA5/BUdtrHNxf0EuZ3AuZRZDrvo
 1hIUPtwiQVoM+P72RJxlFSWNebFeQAezLxCX4LRzfTzmWJ8MaRQYrAfHx7OB/LnNI5GA
 eS8r99sFveM9SNqlM6ieCQ4PnNseGDl1oSY7Aq90hFIdr3M9IUYvym6bLAOu7ENyan7x
 XFeZbabYbZgfeM8qAaUz9CS5P5lOBmXjZP3V1uppRhC/NGmwi5oKA5cXr7/FnuEY5b9o
 F5KVZzr6M2f5ll9U7ll+Ub6gQHaKtLqJssByKwkO7v4yq3NNE2mfUQdeKAnO1WTwXt8b
 mvLg==
X-Forwarded-Encrypted: i=1;
 AKwUvBy4pWdA/POoGguF6eHh8J7ANUvIq1rdUbwnODXfNMYCSt3iy/wEzY0UMQ2qNjiTJjPMwEPAz5IrBwI=@buildroot.org
X-Gm-Message-State: AFq9FYKaGEFercwn7QusYCq1wV9rFjwVgw35dzfskaoomv736B6vJOEK
 QmglN8O0fZmjw3No5yeAWZz0o27vol90PJGMgEWrwjVN9Ea3s/bhQ32t
X-Gm-Gg: AYBFou2NJuEoXcT9l+a2s+vwU07s/6a+4+LU4j0yCZ4HlgezV62Z2wNcf/MIMJivpNZ
 GPlI2bHrtEh90UtFMpjr115yscpOEqiOTqe+F91RP/3oXXGC6Bdk6L7TQBICM5bRPh1gymeU5W5
 bN0t8QmCHwfbjIFOHDnhcqFTyUdAVcEJj+db08JXgd1spzSuzOl8ZDCa75I7u5Adfm4Lv52M+2L
 HvoeT0xamcEug1dOd6+23kwcf7nNUX6kf+8DifRrRrx+uX2s8jBAXBqSq5663TA/jfrHfH4g6QA
 S2RfzhcRkkz5/4TKMvhX6lQ+LYf/KsWxpe8R3bofuJllNig23kSkU3jHDPBbA40RoflusmIuEbY
 DCv0oyL6KW3zNEyU2gnXAtN94cZ6261ZMbQpSLBVGvGxS4dfxBZG5QYIh4TU4KxwZzw7uBEC3lw
 W1f9CHYSG+c6YHBs9vFBnq7XDRobulcttsH5EWC0NhNJbed75gumbOxkVO0VYWkvd/WrrXldP27
 w6QmMhQkpwrCnADkUMrEvPpJD2QBJs+1iIgvEQsRFaE8vY=
X-Received: by 2002:a05:651c:150a:b0:3a6:47b8:ca8e with SMTP id
 38308e7fff4ca-3ab292a7b56mr24131031fa.22.1792507123840; 
 Tue, 20 Oct 2026 07:38:43 -0700 (PDT)
Received: from [172.20.10.2] (host-95-193-34-153.mobileonline.telia.com.
 [95.193.34.153]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3ab395ccaacsm20685091fa.27.2026.10.20.07.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 07:38:41 -0700 (PDT)
Message-ID: <f1d8180348d4dd29527aeacf0767c48a936b28c5.camel@gmail.com>
From: Joachim Wiberg <troglobit@gmail.com>
To: Yegor Yefremov <yegorslists@googlemail.com>, buildroot@buildroot.org
In-Reply-To: <20261020135300.3973040-1-yegorslists@googlemail.com>
References: <20261020135300.3973040-1-yegorslists@googlemail.com>
Organization: wires.se
Date: Tue, 20 Oct 2026 16:38:40 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.52.3-0ubuntu1.1 
Subject: Re: [Buildroot] [PATCH] package/mg: needs a toolchain with wchar
 support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6267897425458588491=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============6267897425458588491==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-xHzeG0+rtREhMokDXwNJ"


--=-xHzeG0+rtREhMokDXwNJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-10-20 at 15:53 +0200, Yegor Yefremov wrote:
> Since version 4.2, mg uses iswalnum() from <wctype.h> to tell whether
> a UTF-8 character is part of a word (upstream commit ee22ef729b16
> "Tell UTF-8 words by their Unicode class"). This breaks the build with
> toolchains that lack wide character support, such as uClibc without
> WCHAR:
>=20
> utf8.c:23:10: fatal error: wctype.h: No such file or directory
> =C2=A0=C2=A0 23 | #include <wctype.h>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ^~~~~~~~~~
>=20
> Add a dependency on BR2_USE_WCHAR, together with the matching comment.

Thank you Yegor, my bad!

I'll upstream a configure check for wctype.h so we can drop this
restriction in Buildroot in a future update.

Best regards
 /Joachim


--=-xHzeG0+rtREhMokDXwNJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEShHhOTSGNO9JnOys7Kgmo3tsdAkFAmrXfO8ACgkQ7Kgmo3ts
dAlbLg//a2E40QNTnf3hDC556Yuo2RtIaa/eHHT7uyHfVXzLpuEr6eHaia3m7Xev
uoftBTVBhAUmW8U+9ydfXnHh52PAGu3efOeJPAaWIuZdD5odsFlE5/G3d7LpRYag
UULHfeKwpaSCVjLq6bNrEwdgvgTpIsYjR02srwmZSgK7unbGiblObAxy77gPk+8k
2bGn6SI1/XNLAhxpWSJVue/2hVr3MeQGnWiYaL6gFXvnVFmjENhydVgJm1f58HO/
Q1gdT5PzzyFmR1tk4nu0Fz4gv3yNePX0VQAGY+NxWpLEjga31q2deKKaGFeqMT4Y
YlZQ2P06YjbNTfAAn90iMP7ZJZ4yTfAnVMuRMFpFdVFnXhEZJc2HRl1Fo7JmhWHh
z8Fj1uS91ga8nBqE0WrDnWXgeEAdXF9nXJF/JUtp+2uTvprOBpjH4UcKnn4dNwlJ
ZbaJOaMLwvrMgtWOHmSsPnMyL+T2H52xZ1uPQZKDJbTkdf4bOMgFmk9XQsRzMRkm
p+6n2CaWFwu1b6P88WTFPA8DRB00nQAGk2n/mm1cGWbnkgj9GoKiFkVICP8Zg/C4
5LeVJUQxEricxQ0QARsSA/rIYl41N15HVKSPLhPdBrcDRZFQPuCS7ClQgpE9t3Bs
H5Pxyju/+TYZbkWYMomQw/mmSmyPZ+ugiMRXyCTsK/pepBO1AE4=
=ZJ9u
-----END PGP SIGNATURE-----

--=-xHzeG0+rtREhMokDXwNJ--

--===============6267897425458588491==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6267897425458588491==--
